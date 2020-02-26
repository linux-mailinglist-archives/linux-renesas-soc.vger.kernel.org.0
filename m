Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEAC170992
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 21:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgBZU2h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 15:28:37 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:13991 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgBZU2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 15:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582748915;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=zAgOSs4qkrhm/LBVFoYE2SMgbhIv79QShibf90EPMNY=;
        b=A8f45FerowcnDMIYFc7CaVjulchS7ZzfIQMtpEXoKEmHq5NRASyS6AOBvKfZ132ZoY
        6bKRHx5e8LCGjdMmJGhLaoZxneCV+cTeVmRQP7I0D2uo0vlGCwa2arYc+oZwIpV9Bwlk
        tD6BOOrEEWtBlvqQ+I+OG53+1dgQbF7TQKA3rIhUSFBankCKBt4ZKIEbixHkTPtQpgjA
        GKFobZ3Aqx5GWcwSBLw3XvYE5QwvGxctZ+28LXXDrspeRm6PzFkP/UQ9A1BeeC1mbnH9
        TX/aDrs7G2h8JN0s0RbqxLREUSU2UntcsrjyVlG0UKk4bTUFcudRAd8ogXNkEmPzrh04
        Ow6w==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GNcd21/dZ4="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id L09b9cw1QKSQWO2
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 21:28:26 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 04/11] clk: renesas: r8a77970: mark RWDT clock as ignore-unused
Date:   Wed, 26 Feb 2020 21:28:10 +0100
Message-Id: <1582748897-17374-5-git-send-email-uli+renesas@fpond.eu>
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
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index cbed376..fda842b 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -167,7 +167,9 @@ static const struct mssr_mod_clk r8a77970_mod_clks[] __initconst = {
 static const unsigned int r8a77970_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a77970_used_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -267,6 +269,8 @@ const struct cpg_mssr_info r8a77970_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a77970_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a77970_crit_mod_clks),
+	.used_mod_clks = r8a77970_used_mod_clks,
+	.num_used_mod_clks = ARRAY_SIZE(r8a77970_used_mod_clks),
 
 	/* Callbacks */
 	.init = r8a77970_cpg_mssr_init,
-- 
2.7.4

