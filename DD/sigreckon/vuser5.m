clc
clear all
close all

aa1=[1448 7019 75790561 0 1240 430 312
1437 6953 75790571 1 1250 440 322
1406 6941 75790581 1 1240 460 304
1354 6857 75790591 1 1260 470 309
1364 6726 75790601 1 1270 490 322
1376 6521 75790611 1 1270 500 362
1389 6261 75790621 1 1270 510 453
1399 5965 75790631 1 1270 510 497
1407 5575 75790641 1 1270 510 533
1424 5153 75790651 1 1260 510 565
1442 4709 75790661 1 1240 520 588
1471 4339 75790671 1 1230 520 620
1507 3964 75790681 1 1210 530 636
1536 3726 75790691 1 1180 540 662
1567 3580 75790701 1 1170 540 666
1597 3496 75790711 1 1120 550 669
1613 3468 75790721 1 1110 550 675
1619 3478 75790731 1 1090 570 676
1619 3520 75790741 1 1070 570 664
1596 3667 75790751 1 1040 570 645
1566 3885 75790761 1 1030 580 617
1543 4186 75790771 1 1020 580 611
1525 4545 75790781 1 1000 590 597
1541 4942 75790791 1 980 590 595
1577 5329 75790801 1 990 600 574
1654 5669 75790811 1 990 600 536
1746 5979 75790821 1 1000 600 507
1847 6189 75790831 1 1020 600 496
1966 6358 75790841 1 1040 600 499
2097 6499 75790851 1 1080 600 491
2236 6570 75790861 1 1100 600 499
2350 6562 75790871 1 1130 600 522
2451 6501 75790881 1 1150 600 550
2543 6364 75790891 1 1180 590 595
2621 6193 75790901 1 1200 580 624
2663 5999 75790911 1 1210 580 665
2682 5791 75790921 1 1230 580 687
2661 5600 75790931 1 1270 570 699
2603 5424 75790941 1 1280 570 700
2520 5253 75790951 1 1280 570 702
2416 5104 75790961 1 1300 560 694
2284 4985 75790971 1 1280 570 699
2132 4887 75790981 1 1280 570 700
1975 4862 75790991 1 1270 560 707
1849 4888 75791001 1 1260 570 720
1743 4948 75791011 1 1260 570 748
1667 4989 75791021 1 1260 570 758
1644 5002 75791031 1 1240 570 752
1656 4996 75791041 1 1240 570 755
1708 4983 75791051 1 1240 570 757
1804 4901 75791061 1 1230 580 761
1930 4772 75791071 1 1230 580 753
2103 4604 75791081 1 1210 580 768
2293 4383 75791091 1 1210 580 771
2494 4126 75791101 1 1200 580 777
2709 3926 75791111 1 1200 580 787
2924 3804 75791121 1 1200 580 793
3161 3735 75791131 1 1200 580 793
3413 3740 75791141 1 1180 590 784
3636 3811 75791151 1 1180 590 779
3832 3926 75791161 1 1180 590 780
4009 4056 75791171 1 1170 590 782
4147 4204 75791181 1 1170 590 773
4245 4364 75791191 1 1160 580 763
4315 4484 75791201 1 1160 580 754
4355 4542 75791211 1 1140 590 722
4365 4558 75791221 1 1130 580 724
4356 4553 75791231 1 1130 580 722
4333 4495 75791241 1 1130 580 727
4302 4401 75791251 1 1130 570 730
4266 4257 75791261 1 1140 570 761
4248 4099 75791271 1 1140 570 768
4259 3932 75791281 1 1140 570 779
4290 3777 75791291 1 1130 560 771
4358 3668 75791301 1 1150 550 777
4445 3589 75791311 1 1150 550 777
4545 3574 75791321 1 1150 550 773
4653 3619 75791331 1 1150 550 773
4764 3703 75791341 1 1140 550 770
4840 3827 75791351 1 1150 550 768
4892 3957 75791361 1 1150 550 751
4908 4091 75791371 1 1150 550 725
4893 4242 75791381 1 1160 560 733
4858 4360 75791391 1 1160 560 720
4802 4457 75791401 1 1160 560 733
4725 4493 75791411 1 1160 560 740
4635 4500 75791421 1 1160 560 750
4585 4488 75791431 1 1160 560 754
4574 4478 75791441 1 1160 560 762
4590 4463 75791451 1 1160 550 779
4658 4425 75791461 1 1160 550 785
4774 4372 75791471 1 1170 560 791
4923 4353 75791481 1 1170 560 791
5119 4375 75791491 1 1180 560 794
5341 4424 75791501 1 1180 560 793
5581 4528 75791511 1 1180 560 782
5820 4672 75791521 1 1180 560 760
6016 4843 75791531 1 1190 560 743
6182 5032 75791532 1 1190 560 724
6330 5221 75791542 1 1210 560 691
6430 5416 75791552 1 1210 560 656
6499 5615 75791562 1 1210 560 639
6525 5779 75791572 1 1220 570 636
6517 5875 75791582 1 1220 570 641
6486 5925 75791592 1 1220 570 646
6434 5882 75791602 1 1230 560 685
6376 5765 75791612 1 1230 560 728
6313 5599 75791622 1 1230 560 754
6270 5342 75791632 1 1250 560 791
6242 5088 75791642 1 1250 560 817
6225 4835 75791652 1 1250 560 821
6220 4565 75791662 1 1250 560 845
6220 4312 75791672 1 1250 560 848
6236 4070 75791682 1 1250 560 851
6262 3899 75791692 1 1250 560 849
6306 3809 75791702 1 1250 560 846
6351 3774 75791712 1 1230 560 852
6397 3800 75791722 1 1230 560 848
6458 3893 75791732 1 1230 560 837
6539 4030 75791742 1 1220 570 824
6633 4197 75791752 1 1220 570 817
6759 4332 75791762 1 1210 580 829
6899 4446 75791772 1 1210 580 830
7047 4491 75791782 1 1200 580 830
7185 4491 75791792 1 1200 580 830
7298 4454 75791802 1 1200 580 817
7395 4384 75791812 1 1200 580 819
7450 4297 75791822 1 1200 580 825
7472 4198 75791832 1 1200 580 845
7472 4096 75791842 1 1200 580 855
7451 3997 75791852 1 1200 580 873
7428 3910 75791862 1 1210 590 878
7402 3830 75791872 1 1210 590 875
7396 3773 75791882 1 1210 590 867
7413 3752 75791892 1 1210 590 864
7445 3752 75791902 1 1240 600 827
7505 3792 75791912 1 1240 600 821
7610 3880 75791922 1 1240 600 817
7745 4003 75791932 1 1240 600 817
7938 4124 75791942 1 1240 600 824
8117 4192 75791952 1 1240 600 821
8287 4224 75791962 1 1240 600 846
8473 4262 75791972 1 1240 600 861
8641 4246 75791982 1 1240 600 854
8796 4195 75791992 1 1250 600 861
8964 4145 75792002 1 1250 600 869
9099 4094 75792012 1 1250 600 884
9213 4041 75792022 1 1250 600 891
9322 3994 75792032 1 1250 600 888
9431 3963 75792042 1 1260 610 887
9539 3945 75792052 1 1260 610 855
9647 3958 75792062 1 1260 610 799
9776 4011 75792072 1 1260 610 760
9928 4090 75792082 1 1260 610 750
10096 4203 75792092 1 1270 620 765
10226 4269 75792102 1 1270 620 808
10340 4304 75792112 1 1270 620 857
10444 4265 75792122 1 1270 620 894
10533 4208 75792132 1 1290 630 900
10613 4139 75792142 1 1290 630 897
10686 4093 75792152 1 1290 630 870
10732 4063 75792162 1 1290 630 777
10752 4045 75792172 1 1290 630 613
10752 4065 75792182 1 1290 630 254
10078 4419 75792233 0 1300 630 85
9610 4584 75792243 1 1300 630 149
9393 4621 75792253 1 1300 630 141
9187 4638 75792263 1 1290 630 207
9027 4638 75792273 1 1290 630 275
8900 4620 75792283 1 1300 620 250
8796 4599 75792293 1 1300 620 242
8731 4577 75792303 1 1300 620 91
8047 4645 75792383 0 1290 600 711
7846 4632 75792393 1 1290 600 722
7750 4643 75792403 1 1290 600 724
7713 4631 75792413 1 1280 590 691
7713 4603 75792423 1 1280 590 469];
a1=aa1(:,1:2);
Na1=size(a1);

aa2=[
2298 6307 81096140 0 1340 470 22
2276 6196 81096150 1 1340 470 56
2269 6089 81096160 1 1340 470 96
2262 5957 81096170 1 1340 470 103
2255 5752 81096180 1 1340 470 120
2238 5488 81096190 1 1340 470 149
2213 5185 81096200 1 1330 470 136
2184 4808 81096210 1 1330 470 139
2158 4458 81096220 1 1320 480 156
2137 4126 81096230 1 1310 480 173
2123 3815 81096240 1 1310 480 178
2110 3569 81096250 1 1290 490 205
2098 3367 81096260 1 1280 490 222
2123 3177 81096270 1 1270 500 209
2086 3044 81096280 1 1260 500 209
2071 2948 81096290 1 1250 510 217
2091 2910 81096300 1 1230 510 222
2091 2915 81096310 1 1220 510 193
2085 2948 81096320 1 1210 520 182
2072 3056 81096330 1 1200 520 173
2060 3235 81096340 1 1200 520 175
2049 3461 81096350 1 1200 520 173
2049 3705 81096360 1 1180 530 163
2068 3991 81096370 1 1180 530 156
2100 4306 81096380 1 1180 530 149
2149 4614 81096390 1 1180 530 146
2209 4887 81096400 1 1180 530 141
2286 5138 81096410 1 1200 520 141
2385 5348 81096420 1 1210 520 139
2498 5552 81096430 1 1210 520 141
2646 5711 81096440 1 1220 510 143
2801 5843 81096450 1 1220 510 144
2960 5953 81096460 1 1230 510 149
3134 6005 81096470 1 1260 510 158
3279 6018 81096480 1 1270 510 163
3404 5972 81096490 1 1280 500 179
3507 5875 81096500 1 1290 500 170
3592 5744 81096510 1 1300 500 181
3664 5595 81096520 1 1300 500 183
3708 5407 81096530 1 1320 490 185
3715 5194 81096540 1 1320 490 183
3698 4983 81096550 1 1310 480 180
3631 4764 81096560 1 1320 480 180
3527 4579 81096570 1 1320 480 178
3397 4419 81096580 1 1320 480 176
3232 4251 81096590 1 1320 480 173
3051 4129 81096600 1 1310 480 176
2860 4038 81096610 1 1310 480 176
2711 4005 81096620 1 1290 490 183
2566 4018 81096630 1 1290 490 188
2473 4062 81096640 1 1280 490 191
2412 4122 81096650 1 1280 490 193
2388 4179 81096660 1 1270 500 196
2388 4218 81096670 1 1270 500 196
2400 4246 81096680 1 1260 490 196
2428 4267 81096690 1 1270 500 196
2472 4267 81096700 1 1270 500 202
2526 4262 81096710 1 1270 500 205
2593 4228 81096720 1 1270 500 212
2670 4171 81096730 1 1270 500 214
2754 4100 81096740 1 1270 500 240
2835 4012 81096750 1 1270 500 252
2920 3918 81096760 1 1270 500 267
3014 3804 81096770 1 1270 500 275
3113 3678 81096780 1 1270 500 280
3216 3572 81096790 1 1260 500 284
3313 3473 81096800 1 1260 500 287
3407 3379 81096810 1 1260 500 276
3520 3298 81096820 1 1260 500 277
3636 3241 81096830 1 1260 500 279
3758 3201 81096840 1 1260 500 287
3883 3176 81096850 1 1250 510 289
4009 3162 81096860 1 1250 510 289
4147 3156 81096870 1 1240 500 289
4293 3156 81096880 1 1240 500 287
4426 3170 81096890 1 1240 500 289
4557 3195 81096900 1 1240 500 284
4687 3241 81096910 1 1240 500 277
4822 3318 81096920 1 1220 500 277
4935 3416 81096930 1 1220 500 287
5033 3530 81096940 1 1220 500 285
5132 3652 81096950 1 1220 500 285
5215 3780 81096960 1 1220 500 285
5287 3880 81096970 1 1240 500 285
5330 3945 81096980 1 1240 500 285
5352 3988 81096990 1 1240 500 285
5359 4018 81097000 1 1260 500 276
5352 4038 81097010 1 1260 500 277
5335 4052 81097020 1 1260 500 279
5311 4052 81097030 1 1260 500 279
5266 4052 81097040 1 1270 500 286
5203 4024 81097050 1 1270 500 297
5127 3979 81097060 1 1270 500 312
5053 3903 81097070 1 1270 500 309
4997 3801 81097080 1 1280 490 312
4954 3683 81097090 1 1280 490 317
4940 3569 81097100 1 1280 490 317
4930 3453 81097110 1 1280 490 322
4938 3332 81097120 1 1270 500 322
4957 3221 81097130 1 1270 500 322
4987 3117 81097140 1 1270 500 320
5024 3047 81097150 1 1260 500 317
5073 3013 81097160 1 1260 500 322
5128 3002 81097170 1 1260 500 327
5196 3015 81097180 1 1260 500 337
5272 3054 81097190 1 1250 510 344
5349 3110 81097200 1 1250 510 338
5423 3179 81097210 1 1250 510 338
5494 3257 81097220 1 1230 510 336
5560 3341 81097230 1 1230 510 338
5619 3425 81097240 1 1230 510 333
5672 3508 81097250 1 1230 510 344
5710 3589 81097260 1 1230 510 339
5727 3665 81097270 1 1230 510 337
5727 3737 81097280 1 1230 510 337
5727 3783 81097290 1 1230 510 342
5718 3814 81097300 1 1230 510 340
5718 3814 81097310 1 1230 510 339
5711 3791 81097320 1 1250 510 344
5711 3747 81097330 1 1250 510 333
5711 3652 81097340 1 1250 510 346
5711 3542 81097350 1 1250 510 361
5741 3423 81097360 1 1260 500 371
5784 3304 81097370 1 1260 500 374
5849 3206 81097380 1 1260 500 386
5918 3122 81097390 1 1260 500 387
5996 3076 81097400 1 1260 500 396
6094 3055 81097410 1 1260 500 392
6204 3055 81097420 1 1260 500 394
6329 3073 81097430 1 1260 500 394
6449 3117 81097440 1 1250 510 396
6565 3177 81097450 1 1260 510 394
6682 3259 81097460 1 1260 510 394
6801 3357 81097470 1 1240 520 388
6903 3467 81097480 1 1240 520 384
6993 3594 81097490 1 1240 520 364
7081 3754 81097500 1 1240 520 364
7169 3937 81097510 1 1250 530 359
7256 4107 81097520 1 1250 530 358
7339 4247 81097530 1 1250 530 356
7398 4368 81097540 1 1250 530 346
7441 4465 81097550 1 1250 530 342
7470 4551 81097560 1 1270 520 322
7489 4631 81097570 1 1270 520 314
7502 4725 81097580 1 1270 520 301
7511 4841 81097590 1 1270 520 294
7520 4971 81097600 1 1270 520 294
7529 5096 81097610 1 1270 520 292
7529 5223 81097620 1 1270 520 292
7529 5360 81097630 1 1280 520 294
7518 5504 81097640 1 1280 520 294
7502 5617 81097650 1 1280 520 294
7482 5705 81097660 1 1280 520 292
7465 5776 81097670 1 1280 520 292
7447 5822 81097680 1 1290 510 284
7430 5844 81097690 1 1290 510 274
7413 5850 81097700 1 1290 510 284
7391 5831 81097710 1 1300 510 282
7366 5774 81097720 1 1300 510 282
7327 5691 81097730 1 1300 510 284
7280 5561 81097740 1 1300 510 285
7228 5385 81097750 1 1320 500 276
7183 5179 81097760 1 1320 500 277
7141 4962 81097770 1 1320 500 286
7106 4746 81097780 1 1320 500 296
7088 4532 81097790 1 1320 500 314
7081 4322 81097800 1 1320 510 305
7088 4130 81097810 1 1320 510 309
7100 3950 81097820 1 1320 510 309
7122 3775 81097830 1 1320 510 312
7152 3626 81097840 1 1300 520 312
7189 3495 81097850 1 1300 520 317
7234 3373 81097860 1 1290 520 320
7290 3251 81097870 1 1280 520 320
7354 3152 81097880 1 1270 520 324
7417 3069 81097890 1 1270 520 322
7479 3009 81097900 1 1270 520 322
7545 2968 81097910 1 1270 520 322
7613 2939 81097920 1 1250 530 322
7687 2939 81097930 1 1250 530 322
7769 2976 81097940 1 1250 530 322
7856 3029 81097950 1 1250 530 320
7943 3095 81097960 1 1250 530 325
8023 3162 81097970 1 1250 530 327
8100 3230 81097980 1 1250 530 329
8181 3302 81097990 1 1250 530 329
8265 3377 81098000 1 1270 530 327
8356 3455 81098010 1 1270 530 322
8434 3538 81098020 1 1270 530 304
8504 3626 81098030 1 1270 530 306
8553 3717 81098040 1 1270 530 294
8586 3819 81098050 1 1270 530 292
8608 3915 81098060 1 1270 530 294
8615 3974 81098070 1 1270 530 297
8615 4011 81098080 1 1270 530 297
8600 4035 81098090 1 1270 530 299
8590 4045 81098100 1 1270 530 302
8581 4045 81098110 1 1270 530 302
8581 4045 81098120 1 1280 530 301
8574 4045 81098130 1 1280 530 301
8574 4045 81098140 1 1280 530 299
8574 4031 81098150 1 1280 530 299
8574 4009 81098160 1 1280 530 302
8582 3977 81098170 1 1290 520 309
8593 3910 81098180 1 1290 520 310
8606 3820 81098190 1 1290 520 320
8620 3703 81098200 1 1300 520 327
8642 3604 81098210 1 1300 520 329
8673 3517 81098220 1 1300 520 329
8714 3450 81098230 1 1300 520 334
8765 3405 81098240 1 1300 520 335
8826 3375 81098250 1 1290 520 342
8897 3368 81098260 1 1290 520 334
8976 3384 81098270 1 1290 520 336
9058 3416 81098280 1 1290 520 336
9142 3461 81098290 1 1280 530 336
9228 3516 81098300 1 1280 530 336
9314 3577 81098310 1 1280 530 334
9393 3638 81098320 1 1280 530 345
9466 3704 81098330 1 1270 530 342
9526 3774 81098340 1 1270 530 337
9573 3847 81098350 1 1270 530 337
9611 3900 81098360 1 1280 540 337
9641 3940 81098370 1 1280 540 337
9666 3955 81098380 1 1290 530 339
9688 3947 81098390 1 1290 530 340
9712 3924 81098400 1 1290 530 334
9737 3873 81098410 1 1290 530 339
9767 3805 81098420 1 1290 530 344
9801 3727 81098430 1 1290 530 348
9842 3667 81098440 1 1290 530 351
9899 3619 81098450 1 1300 530 356
9966 3579 81098460 1 1300 530 358
10042 3564 81098470 1 1300 530 361
10121 3564 81098480 1 1300 530 361
10216 3585 81098490 1 1300 530 361
10319 3625 81098500 1 1290 530 361
10428 3679 81098510 1 1290 530 359
10532 3742 81098520 1 1290 530 361
10623 3813 81098530 1 1290 530 363
10707 3852 81098540 1 1290 530 368
10780 3869 81098550 1 1290 530 371
10843 3859 81098560 1 1290 530 372
10898 3817 81098570 1 1290 530 384
10961 3753 81098580 1 1290 530 396
11025 3684 81098590 1 1290 530 399
11092 3619 81098600 1 1280 540 391
11161 3570 81098610 1 1280 540 399
11239 3532 81098620 1 1280 540 393
11325 3509 81098630 1 1280 540 341
11413 3509 81098640 1 1280 540 257
11501 3515 81098650 1 1270 530 36
10227 4545 81098884 0 1320 490 10
10263 4518 81098894 1 1320 490 17
10296 4494 81098904 1 1330 500 25
10334 4466 81098914 1 1320 500 27
10376 4435 81098924 1 1320 500 27
8808 4329 81099154 0 1300 460 75
8725 4378 81099164 1 1300 460 89
8689 4410 81099174 1 1300 460 88
8672 4402 81099184 1 1300 460 88
8672 4402 81099194 1 1290 460 91
8680 4402 81099204 1 1300 470 99
8696 4388 81099214 1 1300 470 90
8729 4370 81099224 1 1280 470 101
8773 4346 81099234 1 1300 480 101
8826 4309 81099244 1 1300 480 103];
a2=aa2(:,1:2);
Na2=size(a2);

for n1=1:Na1(1)
    xy1(:,n1)=[a1(n1,1);a1(n1,2)];
    figure(2)
    plot(double(a1(n1,1)),double(a1(n1,2)),'ro')
hold on

end

for n2=1:Na2(1)
    xy2(:,n2)=[a2(n2,1);a2(n2,2)];
    figure(1)
    plot(double(a2(n2,1)),double(a2(n2,2)),'ro')
hold on

end