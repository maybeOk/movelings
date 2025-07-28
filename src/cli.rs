use clap::{Parser, Subcommand};

#[derive(Parser)]
#[command(author, version, about, long_about = "Interactive Move programming language exercises")]
pub struct Cli {
    #[command(subcommand)]
    pub command: Option<Commands>,
}

#[derive(Subcommand)]
pub enum Commands {
    /// Lists all exercises and your progress
    List,
    /// Runs a specific exercise
    Run { name: String },
    /// Provides a hint for a specific exercise
    Hint { name: String },
    /// Resets all progress
    Reset,
    /// Shows your detailed progress report
    Progress,
    /// Watches for file changes and automatically runs tests
    Watch,
    /// Run exercise by name (any unrecognized command will be treated as exercise name)
    #[command(external_subcommand)]
    Exercise(Vec<String>),
}