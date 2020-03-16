Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47DA0187016
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 17:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732097AbgCPQfA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 12:35:00 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:26200 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731924AbgCPQfA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 12:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1584376497;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=XQO1aW6RArIYmOs8dBMYxDVu294Y+FF5+pgCc7w86ss=;
        b=De9CGDxQ2RvWMTO5Xk84+Y8QVPs6jLV9nFESg+FH36TY1jtvBe87IgLVjB4GcyRHjF
        LTE6/MwRJeDTMYXcFmfWzvhfs5NSLyiogI8v6e83+BWbI71+OH5tWIavnxNFgcNWSvW5
        xzF9MaAZU3qPB3rxxDn26RrP4pbJOV77Y8rmS1lSdpt7x35mGXFNxmsSIbYMu6tSLiyU
        BaU/uB8fyuZMv8yGN1eEZK7AYOy/j4WSY1bDREY01w8OsY2xJk6628rguDdzSN6yj6WV
        AYhE8cAq4BsEOpP9v7niieW6vJ5SiPstsM0lEmN//KSqJJq198BDJrLny0m4klf5Fau4
        4zfQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82RYdxOjioM="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id d00eabw2GGYlDtI
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 16 Mar 2020 17:34:47 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 1/3] clk: renesas: cpg-mssr: add support for ignore-unused clocks
Date:   Mon, 16 Mar 2020 17:34:37 +0100
Message-Id: <1584376479-25258-2-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
References: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This adds facilities to mark clocks as "ignore used", i.e. never to be
turned off. The primary application is the RWDT clock, which needs to
remain on throughout the boot process if enabled by the bootloader.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/renesas-cpg-mssr.h | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index a2663fb..046efc9 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -423,6 +423,11 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 			init.flags |= CLK_IS_CRITICAL;
 			break;
 		}
+	for (i = 0; i < info->num_ignore_unused_mod_clks; i++)
+		if (id == info->ignore_unused_mod_clks[i]) {
+			init.flags |= CLK_IGNORE_UNUSED;
+			break;
+		}
 
 	parent_name = __clk_get_name(parent);
 	init.parent_names = &parent_name;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 3b852ba..2a4b47e 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -105,6 +105,11 @@ struct device_node;
      * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
      *                 should not be disabled without a knowledgeable driver
      * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+     * @ignore_unused_mod_clks: Array with Module Clock IDs of clocks that
+     *                          should not be disabled even if they seem to
+     *                          be unused
+     * @num_ignore_unused_mod_clks: Number of entries in
+     *                              ignore_unused_mod_clks[]
      *
      * @core_pm_clks: Array with IDs of Core Clocks that are suitable for Power
      *                Management, in addition to Module Clocks
@@ -141,6 +146,10 @@ struct cpg_mssr_info {
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
 
+	/* Module Clocks that should not be disabled even if unused */
+	const unsigned int *ignore_unused_mod_clks;
+	unsigned int num_ignore_unused_mod_clks;
+
 	/* Core Clocks suitable for PM, in addition to the Module Clocks */
 	const unsigned int *core_pm_clks;
 	unsigned int num_core_pm_clks;
-- 
2.7.4

