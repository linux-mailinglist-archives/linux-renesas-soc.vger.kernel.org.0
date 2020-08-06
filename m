Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C332E23DE73
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 19:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgHFRZ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Aug 2020 13:25:59 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:18432 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729950AbgHFRZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 13:25:51 -0400
X-IronPort-AV: E=Sophos;i="5.75,441,1589209200"; 
   d="scan'208";a="54055350"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Aug 2020 21:17:09 +0900
Received: from localhost.localdomain (unknown [172.29.51.173])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5AF3D42AA402;
        Thu,  6 Aug 2020 21:17:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ARM: shmobile: Enable TOUCHSCREEN_STMPE in shmobile_defconfig
Date:   Thu,  6 Aug 2020 13:17:04 +0100
Message-Id: <20200806121704.3192-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the stmpe i2c touch controller, which is used on the
iWave RZ/G1E platform.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm/configs/shmobile_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index bbedc42bb2d9..5e42549660c0 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -64,6 +64,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 CONFIG_TOUCHSCREEN_ST1232=y
+CONFIG_TOUCHSCREEN_STMPE=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_DA9063_ONKEY=y
 CONFIG_INPUT_ADXL34X=y
@@ -104,6 +105,7 @@ CONFIG_RENESAS_WDT=y
 CONFIG_RENESAS_RZAWDT=y
 CONFIG_MFD_AS3711=y
 CONFIG_MFD_DA9063=y
+CONFIG_MFD_STMPE=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AS3711=y
 CONFIG_REGULATOR_DA9210=y
-- 
2.17.1

