class View {
    constructor(game, $el) {
        this.game = game;
        this.$el = $el;

        this.setupTowers();
        this.render();
    };

    setupTowers() { 
        for (let i = 0; i < 3; i++) {
            const $towers = $('<ul>');
            for (let j = 0; j < 3; j++) {
                const $disk = $('<li>');
                // row and col
                // tower 0 1 2
                // this.towers = [[3, 2, 1], [], []];
                // disk 1
                $disk.data('pos', this.game.towers[i][j]);
                $towers.append($disk);                 
            }
            this.$el.append($towers);
        }
    };

    render() {
        // if disk.data -> 3
        //li css styling append basec $('disk-${disk.data.pos}') addClas-> .disk-3
        // if the last child has any class then take the bottom child append disk 2
        // if the last child has any class then take the bottom child append disk 1

        // This corresponds to the actual towers in the document
        const $towers = this.$el.find('ul');
        // debugger

        // corresponds to the game two mensional array
        const towers = this.game.towers;
        // [[3,2,1], [], []]
        towers.forEach((disks, towerIndex) => {
            //forEach(array [3,2,1], index 0)
            //      [LI,li,li] => [3,2,1]       UL
            const $disks = $towers.eq(towerIndex).children(); // JQuery [li, li , li]

            // Javascript Game array [3, 2, 1] 
            disks.forEach((disksize, diskIndex) => {               
                $disks.eq(-diskIndex-1).addClass(`disk-${disksize}`);
                
            });

        });
  

        
    };
}

module.exports = View;