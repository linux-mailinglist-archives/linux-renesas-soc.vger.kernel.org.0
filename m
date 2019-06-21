Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 548584E2C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfFUJMR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:12:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33672 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:12:16 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1365725AEEC;
        Fri, 21 Jun 2019 19:12:13 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1EA5F940396; Fri, 21 Jun 2019 11:12:11 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] soc: renesas: Enable RZ/A1 IRQC on RZ/A1H and RZ/A2M
Date:   Fri, 21 Jun 2019 11:12:09 +0200
Message-Id: <02af9f90941b6cce5fb672ee058c142adcc11a2f.1561105093.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561105093.git.horms+renesas@verge.net.au>
References: <cover.1561105093.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Auto-enable support for the RZ/A1 Interrupt Controller when configuring
a kernel which supports RZ/A1H or RZ/A2M SoCs.
Keep selects sorted while at it.

This is similar to how interrupt controllers for other Renesas SoCs are
enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 68bfca6f20dd..2bbf49e5d441 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -57,14 +57,16 @@ config ARCH_R7S72100
 	bool "RZ/A1H (R7S72100)"
 	select PM
 	select PM_GENERIC_DOMAINS
-	select SYS_SUPPORTS_SH_MTU2
 	select RENESAS_OSTM
+	select RENESAS_RZA1_IRQC
+	select SYS_SUPPORTS_SH_MTU2
 
 config ARCH_R7S9210
 	bool "RZ/A2 (R7S9210)"
 	select PM
 	select PM_GENERIC_DOMAINS
 	select RENESAS_OSTM
+	select RENESAS_RZA1_IRQC
 
 config ARCH_R8A73A4
 	bool "R-Mobile APE6 (R8A73A40)"
-- 
2.11.0

