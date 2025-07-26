use std::fs;
use std::process::Command;
use std::path::Path;
use std::collections::HashSet;

fn main() {
    let args: Vec<String> = std::env::args().collect();
    
    match args.len() {
        1 => show_menu(),
        2 => {
            let command = &args[1];
            match command.as_str() {
                "list" => list_exercises(),
                "watch" => watch_mode(),
                "hint" => show_general_hint(),
                "reset" => reset_progress(),
                "progress" => show_progress(),
                _ => {
                    check_exercise(command);
                }
            }
        }
        3 => {
            if args[1] == "hint" {
                show_hint(&args[2]);
            } else {
                show_usage();
            }
        }
        _ => show_usage(),
    }
}

fn show_menu() {
    println!("🏃‍♂️ Welcome to Movelings!");
    println!("=======================");
    println!();
    println!("💡 Commands:");
    println!("  cargo run <exercise>     - Check specific exercise");
    println!("  cargo run list          - List all exercises");
    println!("  cargo run progress      - Show detailed progress");
    println!("  cargo run hint <exercise> - Get hint for exercise");
    println!("  cargo run reset         - Reset progress");
    println!("  cargo run watch         - Watch mode (auto-check on save)");
    println!();
    
    let exercises = get_exercises();
    let completed = load_completed_exercises();
    
    println!("📚 Quick overview:");
    println!("  Total exercises: {}", exercises.len());
    println!("  Completed: {}", completed.len());
    println!("  Remaining: {}", exercises.len() - completed.len());
    
    if !completed.is_empty() {
        println!("  Progress: {:.1}%", (completed.len() as f64 / exercises.len() as f64) * 100.0);
    }
    
    println!();
    println!("🚀 Start with: cargo run 00_intro");
    println!("📋 To see all exercises: cargo run list");
}

fn list_exercises() {
    let exercises = get_exercises();
    let completed = load_completed_exercises();
    
    println!("📚 Available exercises:");
    
    for (i, exercise) in exercises.iter().enumerate() {
        let icon = if completed.contains(exercise) { "✅" } else { "📝" };
        println!("  {}. {} {} (run 'cargo run {}' to test)", i + 1, icon, exercise, exercise);
    }
    
    println!();
    println!("📊 Progress: {}/{} completed ({:.1}%)", 
             completed.len(), 
             exercises.len(), 
             (completed.len() as f64 / exercises.len() as f64) * 100.0);
    println!("💡 Icons: ✅ = Completed, 📝 = Not completed yet");
    println!("💡 To get hints: cargo run hint <exercise_name>");
}

fn get_exercises() -> Vec<String> {
    let mut exercises = Vec::new();
    if let Ok(entries) = fs::read_dir("exercises") {
        for entry in entries {
            if let Ok(entry) = entry {
                if entry.path().is_dir() {
                    exercises.push(entry.file_name().to_string_lossy().to_string());
                }
            }
        }
    }
    exercises.sort();
    exercises
}

fn check_exercise(name: &str) -> bool {
    let exercise_path = format!("exercises/{}", name);
    if !Path::new(&exercise_path).exists() {
        println!("❌ Exercise '{}' not found!", name);
        println!("Run 'cargo run list' to see available exercises.");
        return false;
    }
    
    println!("🔍 Checking exercise: {}", name);
    println!("📁 Path: {}", exercise_path);
    
    println!("⏳ Running tests... (this may take a moment)");
    
    let output = Command::new("sui")
        .args(&["move", "test"])
        .current_dir(&exercise_path)
        .output();
    
    match output {
        Ok(output) => {
            if output.status.success() {
                println!("✅ Exercise '{}' completed successfully!", name);
                
                // 保存完成记录
                save_completed_exercise(name);
                
                println!("🎉 Great job! Try the next exercise.");
                suggest_next_exercise(name);
                true
            } else {
                println!("❌ Exercise '{}' failed:", name);
                let stderr = String::from_utf8_lossy(&output.stderr);
                let stdout = String::from_utf8_lossy(&output.stdout);
                
                if !stderr.is_empty() {
                    println!("\n📋 Error output:");
                    println!("{}", stderr);
                }
                if !stdout.is_empty() {
                    println!("\n📋 Test output:");
                    println!("{}", stdout);
                }
                
                show_hint(name);
                false
            }
        }
        Err(e) => {
            println!("❌ Failed to run sui command: {}", e);
            println!("💡 Make sure Sui CLI is installed and in your PATH");
            println!("💡 You can also try running 'sui move test' manually in the exercise directory");
            false
        }
    }
}

fn suggest_next_exercise(current: &str) {
    let exercises = get_exercises();
    let completed = load_completed_exercises();
    
    if let Some(pos) = exercises.iter().position(|x| x == current) {
        if pos + 1 < exercises.len() {
            println!("➡️  Next exercise: cargo run {}", exercises[pos + 1]);
        } else {
            println!("🎊 Congratulations! You've completed all exercises!");
            println!("🏆 Final progress: {}/{} exercises completed!", completed.len(), exercises.len());
        }
    }
}

fn load_completed_exercises() -> HashSet<String> {
    let mut completed = HashSet::new();
    if let Ok(content) = fs::read_to_string(".movelings_progress") {
        for line in content.lines() {
            let line = line.trim();
            if !line.is_empty() {
                completed.insert(line.to_string());
            }
        }
    }
    completed
}

fn save_completed_exercise(exercise: &str) {
    let mut completed = load_completed_exercises();
    if completed.insert(exercise.to_string()) {
        // 只有当这是新完成的练习时才保存
        save_progress(&completed);
        println!("💾 Progress saved!");
    }
}

fn save_progress(completed: &HashSet<String>) {
    let mut exercises: Vec<String> = completed.iter().cloned().collect();
    exercises.sort(); // 保持有序
    
    if let Err(e) = fs::write(".movelings_progress", exercises.join("\n")) {
        eprintln!("⚠️  Warning: Failed to save progress: {}", e);
    }
}

fn reset_progress() {
    if Path::new(".movelings_progress").exists() {
        match fs::remove_file(".movelings_progress") {
            Ok(_) => println!("🔄 Progress reset successfully!"),
            Err(e) => println!("❌ Failed to reset progress: {}", e),
        }
    } else {
        println!("ℹ️  No progress file found, nothing to reset.");
    }
}

fn show_progress() {
    let exercises = get_exercises();
    let completed = load_completed_exercises();
    
    println!("📊 Detailed Progress Report");
    println!("==========================");
    println!();
    
    if exercises.is_empty() {
        println!("No exercises found!");
        return;
    }
    
    println!("📚 Exercise Status:");
    for (i, exercise) in exercises.iter().enumerate() {
        let status = if completed.contains(exercise) {
            "✅ Completed"
        } else {
            "📝 Not completed"
        };
        println!("  {}. {} - {}", i + 1, exercise, status);
    }
    
    println!();
    println!("📈 Statistics:");
    println!("  Total exercises: {}", exercises.len());
    println!("  Completed: {}", completed.len());
    println!("  Remaining: {}", exercises.len() - completed.len());
    println!("  Progress: {:.1}%", (completed.len() as f64 / exercises.len() as f64) * 100.0);
    
    if completed.len() == exercises.len() {
        println!();
        println!("🎉 Congratulations! You've completed all exercises!");
    } else if let Some(next) = exercises.iter().find(|ex| !completed.contains(*ex)) {
        println!();
        println!("➡️  Next exercise to try: cargo run {}", next);
    }
}

fn show_hint(exercise: &str) {
    println!();
    println!("💡 Hints for exercise '{}':", exercise);
    
    // 尝试从文件中提取提示
    let hints = extract_hints_from_exercise(exercise);
    
    if hints.is_empty() {
        // 如果没有找到提示，使用默认提示
        show_default_hints();
    } else {
        for (i, hint) in hints.iter().enumerate() {
            println!("  {}. {}", i + 1, hint);
        }
    }
    
    println!();
    println!("📝 Exercise file location:");
    println!("   exercises/{}/sources/", exercise);
}

fn extract_hints_from_exercise(exercise: &str) -> Vec<String> {
    let mut hints = Vec::new();
    let sources_path = format!("exercises/{}/sources", exercise);
    
    if let Ok(entries) = fs::read_dir(&sources_path) {
        for entry in entries {
            if let Ok(entry) = entry {
                if let Some(ext) = entry.path().extension() {
                    if ext == "move" {
                        if let Ok(content) = fs::read_to_string(entry.path()) {
                            hints.extend(extract_hints_from_content(&content));
                        }
                    }
                }
            }
        }
    }
    
    hints
}

fn extract_hints_from_content(content: &str) -> Vec<String> {
    let mut hints = Vec::new();
    let mut seen = std::collections::HashSet::new();
    
    for line in content.lines() {
        let line = line.trim();
        let mut hint_text = None;
        
        // 提取以 "HINT:" 开头的注释
        if line.starts_with("// HINT:") || line.starts_with("/// HINT:") {
            let hint = line.trim_start_matches("// HINT:")
                          .trim_start_matches("/// HINT:")
                          .trim();
            if !hint.is_empty() {
                hint_text = Some(hint.to_string());
            }
        }
        
        // 提取 TODO 项目
        else if line.starts_with("// TODO:") || line.starts_with("/// TODO:") {
            let todo = line.trim_start_matches("// TODO:")
                          .trim_start_matches("/// TODO:")
                          .trim();
            if !todo.is_empty() {
                hint_text = Some(format!("TODO: {}", todo));
            }
        }
        
        // 提取编号的提示 (// 1. xxx, // 2. xxx)
        else if line.starts_with("//") {
            let comment = line.trim_start_matches("//").trim();
            if comment.len() > 2 && 
               comment.chars().nth(0).unwrap_or(' ').is_ascii_digit() && 
               comment.chars().nth(1) == Some('.') {
                hint_text = Some(comment.to_string());
            }
        }
        
        // 避免重复
        if let Some(hint) = hint_text {
            if seen.insert(hint.clone()) {
                hints.push(hint);
            }
        }
    }
    
    hints
}

fn show_default_hints() {
    let hints = vec![
        "Read the exercise file comments carefully",
        "Look for TODO markers that guide you",
        "Check the test functions to understand what's expected",
        "Try running 'sui move test' manually to see detailed errors",
    ];
    
    for (i, hint) in hints.iter().enumerate() {
        println!("  {}. {}", i + 1, hint);
    }
}

fn show_general_hint() {
    println!("💡 General hints:");
    println!("  - Read exercise comments carefully");
    println!("  - Look for TODO markers");
    println!("  - Check test functions for expected behavior");
    println!("  - Use 'cargo run hint <exercise>' for specific help");
}

fn watch_mode() {
    println!("👀 Watch mode not implemented yet");
    println!("💡 For now, manually run 'cargo run <exercise>' after changes");
}

fn show_usage() {
    println!("Usage: cargo run [command] [exercise]");
    println!("Commands:");
    println!("  cargo run                    - Show main menu");
    println!("  cargo run <exercise>         - Test specific exercise");
    println!("  cargo run list              - List all exercises with status");
    println!("  cargo run progress          - Show detailed progress");
    println!("  cargo run hint <exercise>   - Get hints for exercise");
    println!("  cargo run reset             - Reset all progress");
}