Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B3E2E1FE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 18:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgLWRZw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 12:25:52 -0500
Received: from www.zeus03.de ([194.117.254.33]:42322 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgLWRZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 12:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=63aSf89WovdWHo
        ngsvBT8GMXHeiIvBmwGChFpGSieXU=; b=OObVyZtd/yJwJnLzr2OeXj4cvGvG1Y
        HnJQOKZC4/3EdhdNc/XMxFh9Hbd5rdCbycbHeWC0WozuFEf7yl6gmhY68mznV3Xx
        8omcQpLt6+hiteEwBLZfZPf/UX3UT7uPoeo9gA+AX5lNPjzLEDX3cTZjgHKsTdYZ
        8yQLAiLOYOKW0=
Received: (qmail 544621 invoked from network); 23 Dec 2020 18:25:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:25:09 +0100
X-UD-Smtp-Session: l3s3148p1@ZMgT+SS3yudUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] clk: renesas: r8a779a0: add clocks for I2C
Date:   Wed, 23 Dec 2020 18:25:01 +0100
Message-Id: <20201223172505.34736-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index bf9fdcdd7d85..989b83c26421 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -152,6 +152,13 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi43",	402,	R8A779A0_CLK_CSI0),
+	DEF_MOD("i2c0",		518,	R8A779A0_CLK_S3D2),
+	DEF_MOD("i2c1",		519,	R8A779A0_CLK_S3D2),
+	DEF_MOD("i2c2",		520,	R8A779A0_CLK_S3D2),
+	DEF_MOD("i2c3",		521,	R8A779A0_CLK_S3D2),
+	DEF_MOD("i2c4",		522,	R8A779A0_CLK_S3D2),
+	DEF_MOD("i2c5",		523,	R8A779A0_CLK_S3D2),
+	DEF_MOD("i2c6",		524,	R8A779A0_CLK_S3D2),
 	DEF_MOD("scif0",	702,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
-- 
2.28.0

