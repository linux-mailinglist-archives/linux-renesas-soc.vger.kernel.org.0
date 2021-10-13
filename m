Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB0142BCF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 12:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhJMKjO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 06:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhJMKjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 06:39:07 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C50C061570
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Oct 2021 03:37:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by andre.telenet-ops.be with bizsmtp
        id 5Nd12600W0KW32a01Nd1qj; Wed, 13 Oct 2021 12:37:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mabMh-004XwN-6x; Wed, 13 Oct 2021 12:20:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maa85-002spD-HL; Wed, 13 Oct 2021 11:00:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/4] arm64: renesas: defconfig: Disable CONFIG_SPMI
Date:   Wed, 13 Oct 2021 11:00:42 +0200
Message-Id: <fa758f27d9153ae3d8d92d7452bce9aa881327c7.1634115568.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Gen3 and RZ/G2 systems do not use the System Power Management
Interface.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index f57f4cf4d8cd9c34..829d459a2e1067fc 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -156,7 +156,6 @@ CONFIG_SPI=y
 CONFIG_SPI_RPCIF=y
 CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SPIDEV=y
-CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCA953X=y
-- 
2.25.1

