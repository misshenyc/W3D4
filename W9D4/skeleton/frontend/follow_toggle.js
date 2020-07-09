const APIUtil = require("./api_util.js")
class FollowToggle {

    constructor(el){
        this.$el = $(el);
        this.userId = this.$el.data('user-id')  //el['user-id']; 
        this.followState = this.$el.data('initial-follow-state') //el['initial-follow-state'];

        this.render();
        $("button.follow-toggle").on("click", this.handleClick.bind(this) )
    }

    render(){
        if (this.followState === 'followed') {
            this.$el.text('Unfollow!');
        } else if (this.followState === 'unfollowed') {
            this.$el.text('Follow!');
        } else if (this.followState === 'following') {
            this.$el.text('Frozen do not click')
            this.$el.disabled = true;
        }
    }

    handleClick() {
        event.preventDefault();
        const id = this.userId;
        // debugger
        if (this.followState === 'unfollowed') {
            this.followState = 'following';
            this.render();
            APIUtil.followUser(id).then(() => {
                this.followState = 'followed';
                this.render();
        })
         
        } 
        else if (this.followState === 'followed')  {
            this.followState = 'following';
            this.render();
            APIUtil.unfollowUser(id).then(()=> {
                this.followState = 'unfollowed';
                this.render();
            })
        }
    }

    //     return $.ajax({
    //     method: "GET",
    //     url: `https://api.giphy.com/v1/gifs/random?tag=${queryString}&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,
    //     success: gif => appendGifToUL(gif.data.image_url),
    //     errors: errors => console.log(errors)
    //   });
};

module.exports = FollowToggle;

