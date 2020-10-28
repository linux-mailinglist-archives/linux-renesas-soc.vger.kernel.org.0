Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D95D29E22E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 03:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgJ1VhD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Oct 2020 17:37:03 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:47386 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbgJ1Vg6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:36:58 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLt8j70B1zN9Gbr
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2020 16:41:25 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id lThR2300X4C55Sk01ThRET; Wed, 28 Oct 2020 16:41:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnZl-000pU8-Dv; Wed, 28 Oct 2020 16:41:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnZk-007HrD-QI; Wed, 28 Oct 2020 16:41:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas: defconfig: Disable Generic MMIO GPIO Controller
Date:   Wed, 28 Oct 2020 16:41:23 +0100
Message-Id: <20201028154123.1736896-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

No Renesas platform uses the generic memory-mapped GPIO controller
support (MMIO platform device), hence drop
CONFIG_GPIO_GENERIC_PLATFORM=y.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to topic/renesas-defconfig.

 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 048c24967a577f7f..321dcb1e22cb5cb5 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -157,7 +157,6 @@ CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
-CONFIG_GPIO_GENERIC_PLATFORM=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_BD9571MWV=y
-- 
2.25.1

