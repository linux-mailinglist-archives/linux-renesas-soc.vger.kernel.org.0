Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2866F2DC2F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 16:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgLPPUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 10:20:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42114 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgLPPUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 10:20:23 -0500
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3833445E;
        Wed, 16 Dec 2020 16:19:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608131981;
        bh=DRVn/jh6P9pCe4ch3aNobE02R1sPucU0GZE7lDDKUCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jWPfYsZS+2Qk70cXW8XiTNpmbwxvNxrp/GMtbq7fMUOXBKsJ2gpSVx5WrSJe1Fpqe
         QG2jh/O34IdvKO/SXY4MVtYgqIV32CWpVddLE0C5CHjEmf0c4lbi0hRdydJY+UEXIl
         7tIes7+ZInxDs7mae+nITPeAe6iPzwo6TR9rphbM=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/3] clk: renesas: r8a779a0: Add FCPVD clock support
Date:   Wed, 16 Dec 2020 15:19:29 +0000
Message-Id: <20201216151931.851547-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216151931.851547-1-kieran.bingham+renesas@ideasonboard.com>
References: <20201216151931.851547-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clocks for the FCP for VSP-D module.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index aa5389b04d74..8160f41191b2 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -152,6 +152,8 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi43",	402,	R8A779A0_CLK_CSI0),
+	DEF_MOD("fcpvd0",	508,	R8A779A0_CLK_S3D1),
+	DEF_MOD("fcpvd1",	509,	R8A779A0_CLK_S3D1),
 	DEF_MOD("scif0",	702,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
-- 
2.25.1

