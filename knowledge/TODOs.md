A non-exhaustive list of TODOs. Helps one to track easily-forgettable stuff, and not be struck by analysis paralysis. Also, **some TODOs are not here; make sure to Ctrl+Shift+F "TODO"**.

## Not Resolved yet

1) Is a controller a singleton per all threads? If so, is there a chance that 2 parallel requests step on each other's toes?
```ruby
def index
  @posts = Post.all
 
  respond_to do |format|
    format.html  # index.html.erb
    format.json  { render :json => @posts }
  end
end
```

2) How to represent locations? If with lat & long as floats, what about the precision? And how does Ruby represent numbers with decimal points?

3) Can a trip be created with `ongoing` or `completed` state directly? Anyway, will probably ignore this point.

## Resolved
