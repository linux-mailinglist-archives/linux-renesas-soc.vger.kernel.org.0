Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6002E3668
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 12:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbgL1L2I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 06:28:08 -0500
Received: from www.zeus03.de ([194.117.254.33]:37558 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727326AbgL1L2H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 06:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=K97IZtztq8hzAS
        3RRELRYWQuWuDkaP/jU9xKY1/j0fY=; b=bz5fPiEmnGjG7xvw+lEfcbUaUBqkP+
        Xd6pPquDW41RiHDBqIDClATbYi0bBLodoYz5b0HCwKFqYISzXAVsNKLN6FCBIbqn
        gsCh+8eU1NhPnhZmV9+vjYL+WrwkfBZ4M/iu4xahlHnnP2Nsc83XLQ5jtsMI+c3O
        96U3dZ22cBTSs=
Received: (qmail 1739106 invoked from network); 28 Dec 2020 12:27:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 12:27:18 +0100
X-UD-Smtp-Session: l3s3148p1@4+9/joS3zJQgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] clk: renesas: r8a779a0: add HSCIF support
Date:   Mon, 28 Dec 2020 12:27:11 +0100
Message-Id: <20201228112715.14947-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index d85c31a465e1..f518c9e12a49 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -166,6 +166,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi43",	402,	R8A779A0_CLK_CSI0),
+	DEF_MOD("hscif0",	514,	R8A779A0_CLK_S1D2),
+	DEF_MOD("hscif1",	515,	R8A779A0_CLK_S1D2),
+	DEF_MOD("hscif2",	516,	R8A779A0_CLK_S1D2),
+	DEF_MOD("hscif3",	517,	R8A779A0_CLK_S1D2),
 	DEF_MOD("i2c0",		518,	R8A779A0_CLK_S3D2),
 	DEF_MOD("i2c1",		519,	R8A779A0_CLK_S3D2),
 	DEF_MOD("i2c2",		520,	R8A779A0_CLK_S3D2),
-- 
2.29.2

