Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F142711A6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Sep 2020 03:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgITBBR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 21:01:17 -0400
Received: from lists.levonline.com ([217.70.33.37]:47860 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgITBBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 21:01:17 -0400
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 9F07E3A0D5C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2020 02:50:43 +0200 (CEST)
X-SA-score: -1
X-Halon-ID: cb5c4ec8-fadb-11ea-9775-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id cb5c4ec8-fadb-11ea-9775-0050568168d4;
        Sun, 20 Sep 2020 02:54:10 +0200 (CEST)
Received: from [127.0.0.1] (15.178.138.210.rev.vmobile.jp [210.138.178.15])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 08K0s6bd029329;
        Sun, 20 Sep 2020 02:54:08 +0200
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>
Date:   Sun, 20 Sep 2020 09:33:18 +0900
Message-Id: <160056199852.9912.5581183514421117508.sendpatchset@octo>
Subject: [PATCH 0/2] r8a77961 CMT test setup using UIO
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

r8a77961 CMT test setup using UIO

[PATCH 1/2] r8a77961 CMT0 device exposed via UIO
[PATCH 2/2] UIO CMT test program

These two patches contain kernel and user space modificatons to allow some
basic testing from user space of the CMT0 device included on the r8a77961 SoC.

For the kernel, simply apply the kernel patch (including a few debug printouts)
and make sure to extend your kernel config with CONFIG_UIO_PDRV_GENIRQ=y.

The following log shows how to execute the test program on the target:

# ./uio-cmt-test
found matching UIO device at /sys/class/uio/uio0/
CLKE
CMCSR
CMCOR
[   12.284451] irqhandler 20
waiting 10s
UIO write
CLKE
UIO read
got CMT IRQ
CLKE
#

Please note that only a few registers of a single channel of the CMT0 device
has been exercised. The kernel debug printout and /proc/interrupts may be
used to verify that at least one interrupt has been delivered.

One limitation with the current setup is that the UIO kernel driver only
supports a single interrupt however the CMT devices come with one interrupt
per channel on R-Car Gen3. Currently the code only uses a single IRQ.

If it turns out that the current test coverage should be extended then perhaps
it would be wise to also extend the UIO kernel driver with support for multiple
interrupts as well. To maintain the same user space interface the UIO driver
can simply have a list of interrupts associated with each device and then
enable/disable all of them on each IRQ. Not fast but good enough for testing.

The code applies cleanly on renesas-drivers-2020-09-15-v5.9-rc5 from the
renesas-drivers repo on kernel.org. Testing has been performed remotely on
r8a77961 Salvator-XS but should be easy enough to move to more or less any
other SoC with any kind of memory mapped device. Devices that do not support
bus mastering (like the CMT) can be safely used without any IOMMU.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77961.dtsi |   10 +
 drivers/uio/uio.c                         |    3 
 drivers/uio/uio_pdrv_genirq.c             |   10 +
 uio-cmt-test-20200919.c                   |  190 +++++++++++++++++++++++++++++
 4 files changed, 210 insertions(+), 3 deletions(-)
