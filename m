Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3F434325D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 13:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhCUMRQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 08:17:16 -0400
Received: from lists.levonline.com ([217.70.33.37]:46353 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCUMQb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 08:16:31 -0400
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 91DC13A12D7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 13:06:31 +0100 (CET)
X-SA-score: -1
X-Halon-ID: df705bee-8a3d-11eb-a51d-0050568168d4
Received: from ormen1.djurnet.levonline.com (ormen1.djurnet.levonline.com [192.168.17.31])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id df705bee-8a3d-11eb-a51d-0050568168d4;
        Sun, 21 Mar 2021 13:06:31 +0100 (CET)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen1.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 12LC6TgF027154;
        Sun, 21 Mar 2021 13:06:30 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be
Date:   Sun, 21 Mar 2021 20:33:03 +0900
Message-Id: <161632638364.9010.14149594685878279298.sendpatchset@octo>
Subject: [PATCH/RFC] ARM: dts: kzm9g: Extend DTS with hints on how to build
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Include hints in the DTS for KZM9G on how to build a kernel that may be booted
using the old on-board boot loader. Special handling includes:
 - The DTB needs to be appended to the zImage before generating the uImage
 - LOADADDR needs to be set to 0x48008000 to be able to generate an uImage
 - CONFIG_ATAGS=n is needed for the board to boot

Perhaps there is a better place where this kind of information should be
placed? Many years ago the LOADADDR information used to be part of the kernel
makefiles (and make uImage just worked out of the box) but when going DTS
and zImage this seems to have been dropped. So these days special care is
needed to build a uImage file which is required by the boot loader.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/sh73a0-kzm9g.dts |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

--- 0001/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ work/arch/arm/boot/dts/sh73a0-kzm9g.dts	2021-03-21 18:10:53.515741849 +0900
@@ -2,9 +2,24 @@
 /*
  * Device Tree Source for the KZM-A9-GT board
  *
- * Copyright (C) 2012 Horms Solutions Ltd.
+ * The KZM9G board comes with on-board out-of-tree U-Boot from 2012 with:
+ *  uImage support but without zImage support
+ *  one way or the other busted ATAGs
+ *
+ * Generate an uImage at the correct load address with apppended DTB like this:
+ *  make ARCH=arm CROSS_COMPILE=_ uImage LOADADDR=0x48008000
+ *  rm arch/arm/boot/zImage
+ *  make ARCH=arm CROSS_COMPILE=_ dtbs zImage
+ *  cat arch/arm/boot/dts/sh73a0-kzm9g.dtb >> arch/arm/boot/zImage
+ *  $(cut -f 3- -d ' ' < arch/arm/boot/.uImage.cmd)
+ *
+ * For a working recent kernel (v5.10+) the following configuration is needed:
+ *  CONFIG_ARM_APPENDED_DTB=y
+ *  CONFIG_ATAGS=n
  *
- * Based on sh73a0-kzm9g.dts
+ * The shmobile_defconfig works well after setting CONFIG_ATAGS=n
+ *
+ * Copyright (C) 2012 Horms Solutions Ltd.
  * Copyright (C) 2012 Renesas Solutions Corp.
  */
 
