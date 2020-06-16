Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252191FBBA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2020 18:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgFPQ0q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jun 2020 12:26:46 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:33972 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729940AbgFPQ0p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 12:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592324800;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=YW8YukbR/Awfdi4y3TVUB6fSqkbnAE/XV10hcN4ZauI=;
        b=QnbVVfZKczR+bAAfYzJns0XNqvmgvl3JxqlCqgLNZ0OoiBpUtjJ9L+tDu8kjPGmfC9
        WByXKwr7bis2DizOXuxhT7idFnPXvYzDzzkSeCod48AcMSXx7asL0W9dlc5KlTpjwWIk
        BDkF/P5+eXHxHxciTsua7Gzsx5RkiKxKDP2t+YdvWEXl+5uE6DIa/6sPJZI3MKpRAUSe
        /w7MP3xhYROFGfGgy1RG57foK9HjvLPadpMEKBDkpObHpdcDDS88lcRDckvLayOCZ2fv
        JF9nw2mAR9x6HQ/1SXMGKuQ0jIje6w7dWFODXOEF+TPFJPoq3As+LzsHdRT9N4BzcOXt
        /IZw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8WdEaEuFwQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id a0ab6bw5GGQcFwT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 16 Jun 2020 18:26:38 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, wsa@the-dreams.de, geert@linux-m68k.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v4 2/3] clk: renesas: rcar-gen3: mark RWDT clocks as critical
Date:   Tue, 16 Jun 2020 18:26:25 +0200
Message-Id: <20200616162626.27944-3-uli+renesas@fpond.eu>
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

This patch applies the change to the following SoCs: r8a7795,
r8a7796, r8a77965, r8a77970, r8a77980, r8a77990 and r8a77995.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 +-
 7 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ff5b3020cb03..068018ae3c6e 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -287,10 +287,10 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 };
 
 static const unsigned int r8a7795_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
-
 /*
  * CPG Clock Data
  */
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index e8d466dbc7f9..2cd6e3876fbd 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -262,10 +262,10 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 };
 
 static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
-
 /*
  * CPG Clock Data
  */
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 7a05a2fc1cc6..2b55a06ac5cf 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -263,6 +263,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a77965_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index cbed3769a100..0f59c84229a8 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -165,10 +165,10 @@ static const struct mssr_mod_clk r8a77970_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a77970_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
-
 /*
  * CPG Clock Data
  */
diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 7227f675e61f..9fe372286c1e 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -180,10 +180,10 @@ static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a77980_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
-
 /*
  * CPG Clock Data
  */
diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 8eda2e3e2480..2b97ab61d044 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -245,6 +245,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a77990_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 056ebf3e70e2..5b4691117b47 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -183,10 +183,10 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a77995_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
-
 /*
  * CPG Clock Data
  */
-- 
2.20.1

