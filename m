Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D717DD0E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Oct 2023 16:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjJaPsc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Oct 2023 11:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbjJaPsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2023 11:48:31 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EA8E4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2023 08:48:28 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8e37:9cb1:cb68:af34])
        by baptiste.telenet-ops.be with bizsmtp
        id 4foR2B00X54etMF01foRUF; Tue, 31 Oct 2023 16:48:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qxqyc-00881g-UP;
        Tue, 31 Oct 2023 16:48:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qxqyf-00GAds-IY;
        Tue, 31 Oct 2023 16:48:25 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] mmc: tmio: Cancel delayed work before freeing host
Date:   Tue, 31 Oct 2023 16:48:24 +0100
Message-Id: <b669f8e2aebcfe7a0937175058364daa5862d862.1698766265.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On RZ/Five SMARC EVK, where probing of SDHI fails due to missing pin
control:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 0 at kernel/time/timer.c:1739 __run_timers.part.0+0x1e8/0x22a
    Modules linked in:
    CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-10953-ga37a67d260e6-dirty #86
    Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    epc : __run_timers.part.0+0x1e8/0x22a
     ra : __run_timers.part.0+0x130/0x22a
    epc : ffffffff8007540c ra : ffffffff80075354 sp : ffffffc800003e60
     gp : ffffffff814f5f08 tp : ffffffff8140d5c0 t0 : 0000000000046600
     t1 : 0000000000000001 t2 : ffffffff81200c10 s0 : ffffffc800003f20
     s1 : ffffffd8023bc4a0 a0 : 00000000fffee790 a1 : 0000000000000200
     a2 : 0000000000000200 a3 : ffffffff81489640 a4 : ffffffc800003e60
     a5 : 0000000000000000 a6 : 0000000000000000 a7 : ffffffc800003e68
     s2 : 0000000000200000 s3 : 0000000000000122 s4 : 0000000000000000
     s5 : ffffffffffffffff s6 : ffffffff814896c0 s7 : ffffffff814f58a0
     s8 : ffffffff80f8bec8 s9 : 0000000000000000 s10: ffffffc800003e60
     s11: ffffffff81489640 t3 : ffffffff81489678 t4 : 0000000000000240
     t5 : ffffffd8024ac018 t6 : ffffffd8024ac038
    status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
    [<ffffffff8007540c>] __run_timers.part.0+0x1e8/0x22a
    [<ffffffff80075472>] run_timer_softirq+0x24/0x4a
    [<ffffffff80804ec6>] __do_softirq+0xc6/0x212
    [<ffffffff80027434>] irq_exit_rcu+0x7c/0x9a
    [<ffffffff807fcd8a>] handle_riscv_irq+0x40/0x4e
    [<ffffffff807fd7f8>] do_irq+0x40/0x68
    ---[ end trace 0000000000000000 ]---

What happens?

    renesas_sdhi_probe()
    {
    	tmio_mmc_host_alloc()
	    mmc_alloc_host()
		INIT_DELAYED_WORK(&host->detect, mmc_rescan);

	devm_request_irq(tmio_mmc_irq);

	/*
	 * After this, the interrupt handler may be invoked at any time
	 *
	 *  tmio_mmc_irq()
	 *  {
	 *	__tmio_mmc_card_detect_irq()
	 *	    mmc_detect_change()
	 *		_mmc_detect_change()
	 *		    mmc_schedule_delayed_work(&host->detect, delay);
	 *  }
	 */

	tmio_mmc_host_probe()
	    tmio_mmc_init_ocr()
		    -EPROBE_DEFER

	tmio_mmc_host_free()
	    mmc_free_host()
    }

When expire_timers() runs later, it warns because the scheduled work was
freed, and now contains a NULL handler function pointer.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Calling __mmc_stop_host() instead works too, but __mmc_stop_host() is an
internal core function, and is not exported to modules yet.

Perhaps this should be handled by mmc_free_host() instead?
---
 drivers/mmc/host/tmio_mmc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index be7f18fd4836ab29..1e56e78a020d94b9 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1132,6 +1132,7 @@ EXPORT_SYMBOL_GPL(tmio_mmc_host_alloc);
 
 void tmio_mmc_host_free(struct tmio_mmc_host *host)
 {
+	cancel_delayed_work_sync(&host->mmc->detect);
 	mmc_free_host(host->mmc);
 }
 EXPORT_SYMBOL_GPL(tmio_mmc_host_free);
-- 
2.34.1

