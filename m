Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE1F3B1092
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 01:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFVX3e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 19:29:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55222 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhFVX3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 19:29:34 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03D1DB63;
        Wed, 23 Jun 2021 01:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624404436;
        bh=vmMteKdK6L5Fks8gdq3K11RhP5QnV61a9RUgLCjXK8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Amvu9pEjs5J851syKQYjuhKlAtQFc9PzCVt4y+tJ4UhXAgkS1kRlq7O49KzKwLRHZ
         uttEM0Kh6cYn8z10fXFmfV9IbQQ+jJM2ojxGBpv0lJd3csTHycDxY+TJd4zWgPxTpF
         3yYpx+6AHvSVBKmxEhmZavXGyC89DtIOFw+iB/ps=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] clk: renesas: r8a779a0: Add the DU clock
Date:   Wed, 23 Jun 2021 00:27:10 +0100
Message-Id: <20210622232711.3219697-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622232711.3219697-1-kieran.bingham@ideasonboard.com>
References: <20210622232711.3219697-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DU clock is added to the S3D1 clock parent. The Renesas BSP lists
S2D1 as the clock parent, however there is no S2 clock on this platform.

S3D1 is chosen as a best effort guess and demonstrates functionality but
is not guaranteed to be correct.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index acaf5a93f1d3..a1bd158defb5 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -167,6 +167,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi43",	402,	R8A779A0_CLK_CSI0),
+	DEF_MOD("du",		411,	R8A779A0_CLK_S3D1),
 	DEF_MOD("fcpvd0",	508,	R8A779A0_CLK_S3D1),
 	DEF_MOD("fcpvd1",	509,	R8A779A0_CLK_S3D1),
 	DEF_MOD("hscif0",	514,	R8A779A0_CLK_S1D2),
-- 
2.30.2

