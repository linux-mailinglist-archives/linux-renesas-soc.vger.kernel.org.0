Return-Path: <linux-renesas-soc+bounces-614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E5803186
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 12:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD3DB1C20A5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 11:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F6F22EFD;
	Mon,  4 Dec 2023 11:30:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E833AF2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 03:30:03 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f143:dd2b:2cfe:eb7c])
	by baptiste.telenet-ops.be with bizsmtp
	id JBVz2B00R5Tnyl201BVzsb; Mon, 04 Dec 2023 12:30:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rA78t-00Aw16-H5;
	Mon, 04 Dec 2023 12:29:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rA79D-002BS4-EQ;
	Mon, 04 Dec 2023 12:29:59 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] mmc: core: Cancel delayed work before releasing host
Date: Mon,  4 Dec 2023 12:29:53 +0100
Message-Id: <205dc4c91b47e31b64392fe2498c7a449e717b4b.1701689330.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RZ/Five SMARC EVK, where probing of SDHI is deferred due to probe
deferral of the vqmmc-supply regulator:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 0 at kernel/time/timer.c:1738 __run_timers.part.0+0x1d0/0x1e8
    Modules linked in:
    CPU: 0 PID: 0 Comm: swapper Not tainted 6.7.0-rc4 #101
    Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    epc : __run_timers.part.0+0x1d0/0x1e8
     ra : __run_timers.part.0+0x134/0x1e8
    epc : ffffffff800771a4 ra : ffffffff80077108 sp : ffffffc800003e60
     gp : ffffffff814f5028 tp : ffffffff8140c5c0 t0 : ffffffc800000000
     t1 : 0000000000000001 t2 : ffffffff81201300 s0 : ffffffc800003f20
     s1 : ffffffd8023bc4a0 a0 : 00000000fffee6b0 a1 : 0004010000400000
     a2 : ffffffffc0000016 a3 : ffffffff81488640 a4 : ffffffc800003e60
     a5 : 0000000000000000 a6 : 0000000004000000 a7 : ffffffc800003e68
     s2 : 0000000000000122 s3 : 0000000000200000 s4 : 0000000000000000
     s5 : ffffffffffffffff s6 : ffffffff81488678 s7 : ffffffff814886c0
     s8 : ffffffff814f49c0 s9 : ffffffff81488640 s10: 0000000000000000
     s11: ffffffc800003e60 t3 : 0000000000000240 t4 : 0000000000000a52
     t5 : ffffffd8024ae018 t6 : ffffffd8024ae038
    status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
    [<ffffffff800771a4>] __run_timers.part.0+0x1d0/0x1e8
    [<ffffffff800771e0>] run_timer_softirq+0x24/0x4a
    [<ffffffff80809092>] __do_softirq+0xc6/0x1fa
    [<ffffffff80028e4c>] irq_exit_rcu+0x66/0x84
    [<ffffffff80800f7a>] handle_riscv_irq+0x40/0x4e
    [<ffffffff80808f48>] call_on_irq_stack+0x1c/0x28
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

When expire_timers() runs later, it warns because the MMC host structure
containing the delayed work was freed, and now contains an invalid work
function pointer.

Fix this by cancelling any pending delayed work before releasing the
MMC host structure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is v2 of "[RFC] mmc: tmio: Cancel delayed work before freeing
host".

v2:
  - Move cancel_delayed_work_sync() call from tmio_mmc_host_free() to
    mmc_free_host(),
  - Correct explanation from missing pin control to vqmmc-supply probe
    deferral,
  - Update backtrace.
---
 drivers/mmc/core/host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 096093f7be006353..2f51db4df1a8571b 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -692,6 +692,7 @@ EXPORT_SYMBOL(mmc_remove_host);
  */
 void mmc_free_host(struct mmc_host *host)
 {
+	cancel_delayed_work_sync(&host->detect);
 	mmc_pwrseq_free(host);
 	put_device(&host->class_dev);
 }
-- 
2.34.1


