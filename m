Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD85A170991
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 21:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgBZU2h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 15:28:37 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:20089 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbgBZU2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 15:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582748914;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Ol8NfaRSYfwGeuaCGM7dzuAkJIOPwXr9UFSzyxYOKcI=;
        b=nT8wDgOpFYGaNwzkNMr76KRKdVwo4Bqhhnb1lNBCSCk52lDvBd58hHfPqWUm2SwTa0
        0TlXEhf6v5EMr+IEe/iwfUzHY0R1Q2/iVUcrhAAkTIfAHCsapkWgpPbtOWI8qAChbhuS
        JDhbcOntOsSM2lB5uPHppj2m9fAcZQcZs2ugkKvF2AwZ5cXnAzBQ2tsfCSyBfAegvlPB
        SUwndSvLNxtR1D0Acxa6vGwMzDwS6+p/p2LUXgfXqHCT/TbFTwBBjcgCn46PCrZ4OWNb
        8N9NfxAaukFM/vNdYXy5yflqWAonV0CaTVd7mEk+ELwBwMwe63runGdNphtYENGO8tYD
        Enjw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GNcd21/dZ4="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id L09b9cw1QKSPWO0
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 21:28:25 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 02/11] clk: renesas: r8a7796: mark RWDT clock as ignore-unused
Date:   Wed, 26 Feb 2020 21:28:08 +0100
Message-Id: <1582748897-17374-3-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
References: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ensures RWDT remains alert throughout the boot process if enabled.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index e8420d3..3368495 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -254,7 +254,9 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a7796_used_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -354,6 +356,8 @@ const struct cpg_mssr_info r8a7796_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a7796_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a7796_crit_mod_clks),
+	.used_mod_clks = r8a7796_used_mod_clks,
+	.num_used_mod_clks = ARRAY_SIZE(r8a7796_used_mod_clks),
 
 	/* Callbacks */
 	.init = r8a7796_cpg_mssr_init,
-- 
2.7.4

