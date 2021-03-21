Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499CA343258
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 13:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCUMMI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 08:12:08 -0400
Received: from lists.levonline.com ([217.70.33.37]:46228 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhCUMMG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 08:12:06 -0400
X-Greylist: delayed 330 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Mar 2021 08:12:06 EDT
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id A272C3A12E1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 13:12:03 +0100 (CET)
X-SA-score: -1
X-Halon-ID: a570bc42-8a3e-11eb-a51d-0050568168d4
Received: from ormen1.djurnet.levonline.com (ormen1.djurnet.levonline.com [192.168.17.31])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id a570bc42-8a3e-11eb-a51d-0050568168d4;
        Sun, 21 Mar 2021 13:12:03 +0100 (CET)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen1.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 12LCC1Qi028107;
        Sun, 21 Mar 2021 13:12:02 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be
Date:   Sun, 21 Mar 2021 20:38:35 +0900
Message-Id: <161632671592.9191.18170615656272399147.sendpatchset@octo>
Subject: [PATCH 0/2] sh73a0 CMT1 test setup using UIO
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

sh73a0 CMT test setup using UIO

[PATCH 1/2] sh73a0 CMT1 device exposed via UIO
[PATCH 2/2] UIO CMT test program

These two patches contain kernel and user space modificatons to allow some
basic testing from user space of the CMT1 device included on the sh73a0 SoC.

Similar code for other target platforms have been posted earlier as:
[PATCH 0/2] r8a77961 CMT test setup using UIO
[PATCH] r8a77965 CMT test setup using UIO

This time the SoC-specific part has been adjusted to fit sh73a0 and the
user space test program has been extended to wait for and ack multiple IRQs.

For the kernel, simply apply the kernel patch (including a few debug printouts)
and make sure to extend your kernel config with CONFIG_UIO_PDRV_GENIRQ=y.

The following log shows how to execute the test program on the target:

# ./uio-cmt-test
found matching UIO device at /sys/class/uio/uio0/
[   39.717894] irqcontrol 1
[   41.718729] irqhandler 33
IRQ nr 0
[   41.721397] irqcontrol 1
[   43.718968] irqhandler 33
IRQ nr 1
[   43.721614] irqcontrol 1
[   45.719211] irqhandler 33
IRQ nr 2
[   45.721854] irqcontrol 1
/ #

Test program output and /proc/interrupts (with or without kernel debug output)
may be used to verify that several interrupts have been delivered:

/ # cat /proc/interrupts
           CPU0       CPU1
24:          0          0     GIC-0  27 Edge      gt
25:       2629        168     GIC-0  29 Edge      twd
31:          0          0     GIC-0  87 Level     arm-pmu
32:          0          0     GIC-0  88 Level     arm-pmu
33:          3          0     GIC-0  97 Level     timer

The code applies on v5.10. Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---
 arch/arm/boot/dts/sh73a0.dtsi |    2
 drivers/uio/uio.c             |    3
 drivers/uio/uio_pdrv_genirq.c |   10 +-
 uio-cmt-test-20210321.c       |  179 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 190 insertions(+), 4 deletions(-)
