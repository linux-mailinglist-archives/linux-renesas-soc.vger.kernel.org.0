Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E396207450
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389250AbgFXNTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387915AbgFXNTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:19:38 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C7DC061573
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:19:37 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by laurent.telenet-ops.be with bizsmtp
        id v1KY2200c3ySsk1011KYMi; Wed, 24 Jun 2020 15:19:36 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5JM-00027i-RS; Wed, 24 Jun 2020 15:19:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5JM-0000yc-Ql; Wed, 24 Jun 2020 15:19:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/7] ARM: shmobile: defconfig: Enable RZ/A1H RTC support
Date:   Wed, 24 Jun 2020 15:19:31 +0200
Message-Id: <20200624131931.3686-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624131931.3686-1-geert+renesas@glider.be>
References: <20200624131931.3686-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the RZ/A1H Realtime Clock, which is used on the
Genmai and RSK+RZA1 boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 916ca4941a629577..bbedc42bb2d9987c 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -170,6 +170,7 @@ CONFIG_RTC_DRV_BQ32K=y
 CONFIG_RTC_DRV_S35390A=y
 CONFIG_RTC_DRV_RX8581=y
 CONFIG_RTC_DRV_DA9063=y
+CONFIG_RTC_DRV_SH=y
 CONFIG_DMADEVICES=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
-- 
2.17.1

