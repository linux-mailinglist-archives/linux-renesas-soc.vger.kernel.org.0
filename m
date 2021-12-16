Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAC1477635
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 16:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238634AbhLPPoA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 10:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhLPPoA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 10:44:00 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C18C061747
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 07:43:59 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by laurent.telenet-ops.be with bizsmtp
        id X3jy26007250X30013jymD; Thu, 16 Dec 2021 16:43:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsvF-005RBt-Ov; Thu, 16 Dec 2021 16:43:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsvE-00A3P3-V1; Thu, 16 Dec 2021 16:43:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 4/5] arm64: renesas: defconfig: Enable CONFIG_SPI_RSPI
Date:   Thu, 16 Dec 2021 16:43:55 +0100
Message-Id: <35d92f7afb963976f93b7849ab2db139041643d2.1639669217.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639669217.git.geert+renesas@glider.be>
References: <cover.1639669217.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the Renesas RSPI controller, as used on the RZ/G2L
SMARC EVK board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 6488805e418f3414..fcb28227a2decbb6 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -160,6 +160,7 @@ CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_RCAR=y
 CONFIG_SPI=y
 CONFIG_SPI_RPCIF=y
+CONFIG_SPI_RSPI=y
 CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_PINCTRL_SINGLE=y
-- 
2.25.1

