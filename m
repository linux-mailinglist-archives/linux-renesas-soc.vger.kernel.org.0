Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C4D336EE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhCKJ3w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:29:52 -0500
Received: from www.zeus03.de ([194.117.254.33]:49084 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232037AbhCKJ3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Iba5juctoexgi7
        53fL8VqzcP8Mo7Fuw7u8EPD3FZtlk=; b=h1cR8ZklHrxYsnx0742QhuuGsrScnp
        1h30FuSDBOYsHG1eBIh5+Wd04RFCNZBJYi07Cx+HQ5r99YzZZT8TvU8U1x/gGkQM
        GEv57rgCEd1nb5ktDNNH76e353TIkh/cx/JB3IP/0sNznfu2dhiKM4KQwPYCMIMZ
        6ZzYNFkv/ItQU=
Received: (qmail 4141752 invoked from network); 11 Mar 2021 10:29:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2021 10:29:43 +0100
X-UD-Smtp-Session: l3s3148p1@N3pxbD+9OswgARa4Rf6LAY0TkMkJSYgM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] clk: renesas: r8a779a0: Add CMT clocks
Date:   Thu, 11 Mar 2021 10:29:37 +0100
Message-Id: <20210311092939.3129-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210311092939.3129-1-wsa+renesas@sang-engineering.com>
References: <20210311092939.3129-1-wsa+renesas@sang-engineering.com>
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
index 33e44621a33a..53bc2db0f3fc 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -233,6 +233,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("vspd0",	830,	R8A779A0_CLK_S3D1),
 	DEF_MOD("vspd1",	831,	R8A779A0_CLK_S3D1),
 	DEF_MOD("rwdt",		907,	R8A779A0_CLK_R),
+	DEF_MOD("cmt0",		910,	R8A779A0_CLK_R),
+	DEF_MOD("cmt1",		911,	R8A779A0_CLK_R),
+	DEF_MOD("cmt2",		912,	R8A779A0_CLK_R),
+	DEF_MOD("cmt3",		913,	R8A779A0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779A0_CLK_CP),
 	DEF_MOD("pfc1",		916,	R8A779A0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779A0_CLK_CP),
-- 
2.30.0

