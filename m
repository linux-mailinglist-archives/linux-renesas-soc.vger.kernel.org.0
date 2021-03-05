Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E47C32ED2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhCEOdl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:33:41 -0500
Received: from www.zeus03.de ([194.117.254.33]:42022 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231177AbhCEOdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=bw2eDs6FJY8DLv
        YPsVtgGJZKWf0WsSZmpAvpWz7ZV7U=; b=Fqifqr9tHPiJmZwGxaxwkMQDgjqJPN
        WjsO99DRFjrI7pZ2AIO4KRRnwUh8u5vCIgAn/0o74YmrIymjS+eWY5ye9EJl0efa
        KyOJnUoLO2S47hC5Nvd+un2wwsC9jcRIKL5Adtt3YnEhg0zXU8RffZiCNYJptyFY
        MBy5/kXxi+jew=
Received: (qmail 2251831 invoked from network); 5 Mar 2021 15:33:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 15:33:05 +0100
X-UD-Smtp-Session: l3s3148p1@7aJL9sq8eJlN91Vm
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] clk: renesas: r8a779a0: Add TMU clocks
Date:   Fri,  5 Mar 2021 15:32:57 +0100
Message-Id: <20210305143259.12622-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
References: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Also add CL16MCK source clock for TMU0.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 228068823caf..53bc2db0f3fc 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -144,6 +144,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED("vcbus",	R8A779A0_CLK_VCBUS,	CLK_PLL5_DIV4,	1, 1),
 	DEF_FIXED("cbfusa",	R8A779A0_CLK_CBFUSA,	CLK_EXTAL,	2, 1),
 	DEF_FIXED("cp",		R8A779A0_CLK_CP,	CLK_EXTAL,	2, 1),
+	DEF_FIXED("cl16mck",	R8A779A0_CLK_CL16MCK,	CLK_PLL1_DIV2,	64, 1),
 
 	DEF_SD("sd0",		R8A779A0_CLK_SD0,	CLK_SDSRC,	0x870),
 
@@ -192,6 +193,11 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("sdhi0",	706,	R8A779A0_CLK_SD0),
 	DEF_MOD("sydm1",	709,	R8A779A0_CLK_S1D2),
 	DEF_MOD("sydm2",	710,	R8A779A0_CLK_S1D2),
+	DEF_MOD("tmu0",		713,	R8A779A0_CLK_CL16MCK),
+	DEF_MOD("tmu1",		714,	R8A779A0_CLK_S1D4),
+	DEF_MOD("tmu2",		715,	R8A779A0_CLK_S1D4),
+	DEF_MOD("tmu3",		716,	R8A779A0_CLK_S1D4),
+	DEF_MOD("tmu4",		717,	R8A779A0_CLK_S1D4),
 	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
-- 
2.29.2

