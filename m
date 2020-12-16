Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33E92DC2F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 16:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgLPPVF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 10:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgLPPVF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 10:21:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C82C06179C;
        Wed, 16 Dec 2020 07:20:24 -0800 (PST)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C23AAD5;
        Wed, 16 Dec 2020 16:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608131982;
        bh=2dKnTd0ZB/SilOMHPNnfDszUl8UzX9cZXjBhR9ako4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ye4T6F6hk1gKXWGX29CJXbd1aAt+9zxeJ0wiyzbcZQqv507IJftkj5QvLbEG4URJT
         J7EVO32kLhncVNZAQ0ILeqwIVaBLD8azvVYXTQo25ab69hqxJKpOhbO4ZRD7yw+5GL
         lKYvs/QLT8CBp8Rtyz8sDaFW9+/eWdU6CmF1TiWU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 3/3] clk: renesas: r8a779a0: Add VSPX clock support
Date:   Wed, 16 Dec 2020 15:19:31 +0000
Message-Id: <20201216151931.851547-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216151931.851547-1-kieran.bingham+renesas@ideasonboard.com>
References: <20201216151931.851547-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clocks for the VSPX.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 2ce31508db73..d7825adcb19d 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -192,6 +192,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vspd0",	830,	R8A779A0_CLK_S3D1),
 	DEF_MOD("vspd1",	831,	R8A779A0_CLK_S3D1),
+	DEF_MOD("vspx0",	1028,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vspx1",	1029,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vspx2",	1030,	R8A779A0_CLK_S1D1),
+	DEF_MOD("vspx3",	1031,	R8A779A0_CLK_S1D1),
 };
 
 static spinlock_t cpg_lock;
-- 
2.25.1

