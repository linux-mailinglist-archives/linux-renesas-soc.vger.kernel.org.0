Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83402FE727
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 11:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbhAUKJC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 05:09:02 -0500
Received: from www.zeus03.de ([194.117.254.33]:48402 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728952AbhAUKH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 05:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ZikhHhx/+77hpm
        9dWRye8k/r5po7bFIMz3jw9cGrF70=; b=JZvy0Gmqi9tXbKzWHWlfUV3YcPmWkw
        v6fv5+u0V4bIQLIw+3GREvOMHU5K0caW/BdRAfPI5r/7a4NVNTpR0AY4JuKibiNM
        nb9Aid1AhMDu1WjMc/cuup9aKhTTTHO9oy/FGx5D6GeVjfg6l2SCjt2rs7+XWNSm
        S7wPSddLAzZeI=
Received: (qmail 1790479 invoked from network); 21 Jan 2021 11:06:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 11:06:27 +0100
X-UD-Smtp-Session: l3s3148p1@dGqUOWa5tL4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] clk: renesas: r8a779a0: add clocks for RAVB
Date:   Thu, 21 Jan 2021 11:06:16 +0100
Message-Id: <20210121100619.5653-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* use S3D2 as parent clock

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index f7391ea5c2e2..79e6c6571144 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -156,6 +156,12 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("avb0",		211,	R8A779A0_CLK_S3D2),
+	DEF_MOD("avb1",		212,	R8A779A0_CLK_S3D2),
+	DEF_MOD("avb2",		213,	R8A779A0_CLK_S3D2),
+	DEF_MOD("avb3",		214,	R8A779A0_CLK_S3D2),
+	DEF_MOD("avb4",		215,	R8A779A0_CLK_S3D2),
+	DEF_MOD("avb5",		216,	R8A779A0_CLK_S3D2),
 	DEF_MOD("csi40",	331,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
-- 
2.29.2

