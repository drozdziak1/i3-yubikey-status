use pcsc::{Context, Scope};
pub type ErrBox = Box<dyn std::error::Error>;

fn main() -> Result<(), ErrBox> {
    let ctx = Context::establish(Scope::User)?;

    let names = ctx.list_readers_owned()?;

    println!("names: {:?}", names);

    Ok(())
}
