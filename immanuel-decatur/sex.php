<?php
declare(strint_types=1);

enum sex: string {

    case male = 'm';
    case female = 'f';
    case unkown = 'u';
}

// sex::m->value == 'm';
