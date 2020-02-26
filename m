Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6832D170990
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 21:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgBZU2g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 15:28:36 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:26700 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbgBZU2g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 15:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582748914;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=q6Dg2FKsync8Vc5ci83dxqGblqEfGZbztswSKEH5GW4=;
        b=VmZVx9ga6ezrze2c6r0DqUYkl/QZrGeTzvLUZxjyqNIttUWOhctCrDA82xkkceCIFp
        qBy/gvbju+1fjEyjpAmKQX4HQh6Bxyj5URasxvgJWaQr6I2jncQ0Uixn+0ZIEVN3MWHB
        BJb8lCZtgYS7vTFYTsvpL6lkPYM4SNA/BXgdQ5tCLDvRd4cLy2N06mZqhkwft8ZTJbfH
        W6KcPWfffJkyh2vMG7iPE8TQkTnwmI1l5PojRnWyahprbR4sZ7HsXRNcO3yiKIZrnt6n
        A0//Rclzjx4+SScETu+5rCuBLLXru9l05Ep3+ttFV/ABJ5fSF06+L1GyJxjyG75tBWUC
        K5uA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GNcd21/dZ4="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id L09b9cw1QKSPWO1
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 21:28:25 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 03/11] clk: renesas: r8a7795: mark RWDT clock as ignore-unused
Date:   Wed, 26 Feb 2020 21:28:09 +0100
Message-Id: <1582748897-17374-4-git-send-email-uli+renesas@fpond.eu>
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
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index fbc8c75..e83bdcc 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -281,7 +281,9 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 static const unsigned int r8a7795_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
-
+static const unsigned int r8a7795_used_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -476,6 +478,8 @@ const struct cpg_mssr_info r8a7795_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks = r8a7795_crit_mod_clks,
 	.num_crit_mod_clks = ARRAY_SIZE(r8a7795_crit_mod_clks),
+	.used_mod_clks = r8a7795_used_mod_clks,
+	.num_used_mod_clks = ARRAY_SIZE(r8a7795_used_mod_clks),
 
 	/* Callbacks */
 	.init = r8a7795_cpg_mssr_init,
-- 
2.7.4

