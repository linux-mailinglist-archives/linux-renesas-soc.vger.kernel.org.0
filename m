Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FB01FBBA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2020 18:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgFPQ0q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jun 2020 12:26:46 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:17609 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729953AbgFPQ0p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 12:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592324801;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=2OUjss8yQVXHEhs9rPhZssQVMH5EL8SZm/7jUhiDHtA=;
        b=cqeqLH7G/w6JqSPQ9F2KPVraOI8jKzLk33EzTF3Jfr7WiMPEZcwbVguixefdhNMOaj
        WT7j0Jw6OKreorsvEQRR46VbPDfF6b7fKpJ476gShZXGoGcoDCiSaAUCfqezsJp/4cin
        zTxQhh4yXvV7ydlP8ZP9kdgEg/W344b6QTgZcV4Ykde16kTU3iVBzZlI1bCwo/R3MlVi
        SYHRsYW1PaPGcTKbnpIII9AJ4ys+L6D3GH/4XTRgtViVfA/uv7Sq/0rmDTMXUVkE1e9H
        S/9OB2P8ugdlmpwdZ5QpILwm8JY0n8GNl9HxoB1cbGNixRNQZoNQz3QLDSlv/LvJt0W+
        Xnsw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8WdEaEuFwQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id a0ab6bw5GGQdFwU
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 16 Jun 2020 18:26:39 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, wsa@the-dreams.de, geert@linux-m68k.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v4 3/3] clk: renesas: rzg2: mark RWDT clock as critical
Date:   Tue, 16 Jun 2020 18:26:26 +0200
Message-Id: <20200616162626.27944-4-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616162626.27944-1-uli+renesas@fpond.eu>
References: <20200616162626.27944-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ensures RWDT remains alert throughout the boot process if enabled.

This patch applies the change to the following SoCs: r8a774a1,
r8a774b1 and r8a774c0.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index e05bfa200480..fd54b9f625da 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -237,6 +237,7 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a774a1_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index c9af70917312..f436691271ec 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -233,6 +233,7 @@ static const struct mssr_mod_clk r8a774b1_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a774b1_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index f91e7a484753..9fc9fa9e531a 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -238,6 +238,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a774c0_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
-- 
2.20.1

