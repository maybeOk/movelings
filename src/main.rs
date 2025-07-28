mod cli;
mod handlers;
mod utils;

use clap::Parser;
use cli::{Cli, Commands};
use handlers::*;

fn main() {
    let cli = Cli::parse();

    match cli.command {
        Some(Commands::List) => list_exercises(),
        Some(Commands::Run { name }) => {
            check_exercise(&name);
        },
        Some(Commands::Hint { name }) => show_hint(&name),
        Some(Commands::Reset) => reset_progress(),
        Some(Commands::Progress) => show_progress(),
        Some(Commands::Watch) => watch_mode(),
        Some(Commands::Exercise(args)) => {
            if let Some(exercise_name) = args.first() {
                check_exercise(exercise_name);
            } else {
                eprintln!("Error: No exercise name provided");
                std::process::exit(1);
            }
        },
        None => show_menu(),
    }
}