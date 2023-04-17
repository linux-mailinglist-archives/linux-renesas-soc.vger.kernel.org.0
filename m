Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD456E5168
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 22:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjDQUI4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 16:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDQUIy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 16:08:54 -0400
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1F4F0;
        Mon, 17 Apr 2023 13:08:48 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id A8BF464551BD;
        Mon, 17 Apr 2023 22:08:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Fn7_KB46yy_T; Mon, 17 Apr 2023 22:08:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id E6C5D622623F;
        Mon, 17 Apr 2023 22:08:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 7Wwa0OVZlxRQ; Mon, 17 Apr 2023 22:08:44 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id B0A1064551BD;
        Mon, 17 Apr 2023 22:08:44 +0200 (CEST)
Date:   Mon, 17 Apr 2023 22:08:44 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org
Message-ID: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at>
Subject: Poor write performance to boot area using rcar-gen3-sdhi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Qw==
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

Writing to the boot area of an eMMC takes significant
longer than writing to the user area on v6.1 (Tested also on v5.4).
The following trace shows write of 4k using "dd if=4k.dat of=/dev/mmcblk1boot1 bs=512 oflag=sync".
As you can see from the timings, the whole operation took almost 80ms
where most of the time was consumed by the MMC_WRITE_MULTIPLE_BLOCK command.


     kworker/1:1H-34      [001] .....  5113.734166: mmc_request_start: mmc1: start struct mmc_request[0000000005d331e4]: cmd_opcode=18 cmd_arg=0x0 cmd_flags=0xb5 cmd_retries=0 stop_opcode=12 stop_arg=0x0 stop_flags=0x95 stop_retries=0 sbc_opcode=23 sbc_arg=0x8 sbc_flags=0x15 sbc_retires=0 blocks=8 block_size=512 blk_addr=0 data_flags=0x200 tag=26 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1 retune_period=0
     kworker/0:1-25      [000] .....  5113.735860: mmc_request_done: mmc1: end struct mmc_request[0000000005d331e4]: cmd_opcode=18 cmd_err=0 cmd_resp=0x900 0x900 0x900 0x900 cmd_retries=0 stop_opcode=12 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=23 sbc_err=0 sbc_resp=0x900 0x900 0x900 0x900 sbc_retries=0 bytes_xfered=4096 data_err=0 tag=26 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1 retune_period=0
    kworker/1:1H-34      [001] .....  5113.735996: mmc_request_start: mmc1: start struct mmc_request[00000000174773b9]: cmd_opcode=25 cmd_arg=0x0 cmd_flags=0xb5 cmd_retries=0 stop_opcode=12 stop_arg=0x0 stop_flags=0x49d stop_retries=0 sbc_opcode=23 sbc_arg=0x8 sbc_flags=0x15 sbc_retires=0 blocks=8 block_size=512 blk_addr=0 data_flags=0x100 tag=27 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1 retune_period=0
     kworker/0:1-25      [000] .....  5113.814376: mmc_request_done: mmc1: end struct mmc_request[00000000174773b9]: cmd_opcode=25 cmd_err=0 cmd_resp=0x900 0x900 0x900 0x900 cmd_retries=0 stop_opcode=12 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=23 sbc_err=0 sbc_resp=0x900 0x900 0x900 0x900 sbc_retries=0 bytes_xfered=4096 data_err=0 tag=27 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1 retune_period=0
    kworker/0:1H-144     [000] .....  5113.814391: mmc_request_start: mmc1: start struct mmc_request[00000000101675e9]: cmd_opcode=13 cmd_arg=0x10000 cmd_flags=0x195 cmd_retries=3 stop_opcode=0 stop_arg=0x0 stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0 sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
     kworker/0:1-25      [000] .....  5113.814408: mmc_request_done: mmc1: end struct mmc_request[00000000101675e9]: cmd_opcode=13 cmd_err=0 cmd_resp=0x900 0x900 0x900 0x900 cmd_retries=3 stop_opcode=0 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0 sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0 data_err=0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
    kworker/1:1H-34      [001] .....  5113.814477: mmc_request_start: mmc1: start struct mmc_request[0000000008526179]: cmd_opcode=6 cmd_arg=0x3200101 cmd_flags=0x95 cmd_retries=3 stop_opcode=0 stop_arg=0x0 stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0 sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
     kworker/0:1-25      [000] .....  5113.814497: mmc_request_done: mmc1: end struct mmc_request[0000000008526179]: cmd_opcode=6 cmd_err=0 cmd_resp=0x800 0x900 0x900 0x800 cmd_retries=3 stop_opcode=0 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0 sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0 data_err=0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
    kworker/1:1H-34      [001] .....  5113.814511: mmc_request_start: mmc1: start struct mmc_request[0000000061873c4a]: cmd_opcode=13 cmd_arg=0x10000 cmd_flags=0x195 cmd_retries=3 stop_opcode=0 stop_arg=0x0 stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0 sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
     kworker/0:1-25      [000] .....  5113.814529: mmc_request_done: mmc1: end struct mmc_request[0000000061873c4a]: cmd_opcode=13 cmd_err=0 cmd_resp=0x900 0x900 0x800 0x900 cmd_retries=3 stop_opcode=0 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0 sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0 data_err=0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0O


On the other hand, writing to the user area using "dd if=4k.dat of=/dev/mmcblk1p13 bs=512 oflag=sync" is fast:


    kworker/1:1H-34      [001] .....  5163.989096: mmc_request_start: mmc1: start struct mmc_request[000000003c3d18f8]: cmd_opcode=6 cmd_arg=0x3b30801 cmd_flags=0x49d cmd_retries=3 stop_opcode=0 stop_arg=0x0 stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0 sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
     kworker/0:1-25      [000] .....  5163.991009: mmc_request_done: mmc1: end struct mmc_request[000000003c3d18f8]: cmd_opcode=6 cmd_err=0 cmd_resp=0x800 0x900 0x900 0x800 cmd_retries=3 stop_opcode=0 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0 sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0 data_err=0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
    kworker/1:1H-34      [001] .....  5163.991027: mmc_request_start: mmc1: start struct mmc_request[00000000a1a3cac1]: cmd_opcode=13 cmd_arg=0x10000 cmd_flags=0x195 cmd_retries=3 stop_opcode=0 stop_arg=0x0 stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0 sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
     kworker/0:1-25      [000] .....  5163.991056: mmc_request_done: mmc1: end struct mmc_request[00000000a1a3cac1]: cmd_opcode=13 cmd_err=0 cmd_resp=0x900 0x900 0x800 0x900 cmd_retries=3 stop_opcode=0 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0 sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0 data_err=0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
    kworker/1:1H-34      [001] .....  5163.991081: mmc_request_start: mmc1: start struct mmc_request[00000000f096e251]: cmd_opcode=18 cmd_arg=0x4ea000 cmd_flags=0xb5 cmd_retries=0 stop_opcode=12 stop_arg=0x0 stop_flags=0x95 stop_retries=0 sbc_opcode=23 sbc_arg=0x8 sbc_flags=0x15 sbc_retires=0 blocks=8 block_size=512 blk_addr=5152768 data_flags=0x200 tag=6 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1 retune_period=0
     kworker/0:1-25      [000] .....  5163.991705: mmc_request_done: mmc1: end struct mmc_request[00000000f096e251]: cmd_opcode=18 cmd_err=0 cmd_resp=0x900 0x900 0x900 0x900 cmd_retries=0 stop_opcode=12 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=23 sbc_err=0 sbc_resp=0x900 0x900 0x900 0x900 sbc_retries=0 bytes_xfered=4096 data_err=0 tag=6 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1 retune_period=0
    kworker/1:1H-34      [001] .....  5163.991838: mmc_request_start: mmc1: start struct mmc_request[00000000ec4997fb]: cmd_opcode=25 cmd_arg=0x4ea000 cmd_flags=0xb5 cmd_retries=0 stop_opcode=12 stop_arg=0x0 stop_flags=0x49d stop_retries=0 sbc_opcode=23 sbc_arg=0x8 sbc_flags=0x15 sbc_retires=0 blocks=8 block_size=512 blk_addr=5152768 data_flags=0x100 tag=7 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1 retune_period=0
     kworker/0:1-25      [000] .....  5163.992203: mmc_request_done: mmc1: end struct mmc_request[00000000ec4997fb]: cmd_opcode=25 cmd_err=0 cmd_resp=0x900 0x900 0x900 0x900 cmd_retries=0 stop_opcode=12 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=23 sbc_err=0 sbc_resp=0x900 0x900 0x900 0x900 sbc_retries=0 bytes_xfered=4096 data_err=0 tag=7 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=1 retune_period=0
    kworker/0:1H-144     [000] .....  5163.992215: mmc_request_start: mmc1: start struct mmc_request[00000000101675e9]: cmd_opcode=13 cmd_arg=0x10000 cmd_flags=0x195 cmd_retries=3 stop_opcode=0 stop_arg=0x0 stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0 sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
     kworker/0:1-25      [000] .....  5163.992231: mmc_request_done: mmc1: end struct mmc_request[00000000101675e9]: cmd_opcode=13 cmd_err=0 cmd_resp=0x900 0x900 0x900 0x900 cmd_retries=3 stop_opcode=0 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0 sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0 data_err=0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
    kworker/1:1H-34      [001] .....  5163.992291: mmc_request_start: mmc1: start struct mmc_request[0000000008526179]: cmd_opcode=6 cmd_arg=0x3200101 cmd_flags=0x95 cmd_retries=3 stop_opcode=0 stop_arg=0x0 stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0 sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
     kworker/0:1-25      [000] .....  5163.992310: mmc_request_done: mmc1: end struct mmc_request[0000000008526179]: cmd_opcode=6 cmd_err=0 cmd_resp=0x800 0x900 0x900 0x800 cmd_retries=3 stop_opcode=0 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0 sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0 data_err=0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
    kworker/1:1H-34      [001] .....  5163.992790: mmc_request_start: mmc1: start struct mmc_request[0000000061873c4a]: cmd_opcode=13 cmd_arg=0x10000 cmd_flags=0x195 cmd_retries=3 stop_opcode=0 stop_arg=0x0 stop_flags=0x0 stop_retries=0 sbc_opcode=0 sbc_arg=0x0 sbc_flags=0x0 sbc_retires=0 blocks=0 block_size=0 blk_addr=0 data_flags=0x0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0
     kworker/0:1-25      [000] .....  5163.992808: mmc_request_done: mmc1: end struct mmc_request[0000000061873c4a]: cmd_opcode=13 cmd_err=0 cmd_resp=0x900 0x900 0x800 0x900 cmd_retries=3 stop_opcode=0 stop_err=0 stop_resp=0x0 0x0 0x0 0x0 stop_retries=0 sbc_opcode=0 sbc_err=0 sbc_resp=0x0 0x0 0x0 0x0 sbc_retries=0 bytes_xfered=0 data_err=0 tag=0 can_retune=1 doing_retune=0 retune_now=0 need_retune=0 hold_retune=2 retune_period=0

The whole operation took only about 3ms.

Is this expected?

Off the head I don't really see why writing to the boot area should be slower.
BTW: Using u-boot the write is blazing fast, so the eMMC itself should be fine.
At driver level there shouldn't be much difference between writing to boot and user
area except from MMC_SWITCH.

Thanks,
//richard
