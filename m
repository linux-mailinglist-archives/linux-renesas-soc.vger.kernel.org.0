Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4DC3FD64E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 11:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243418AbhIAJSc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 05:18:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:37090 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233043AbhIAJSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 05:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=7HGclFfH6wRdPT
        zvFkwJj+XB89L8G7i3GPuu1iq+C44=; b=J3QTMzAj/4AssTiE4fuu+pRuLMzVky
        orsbbLeBpdmGkEBYNiByCO3Jh3C5/aazzKPMp2FOCZnutLWib+zwi8b7yrjQ0mWg
        dBQEM96P4KgLq4lG/g+Hsk+HYjXlXBIELhMJ0jVmcMiPDp2y4CYcASUIdUholj0G
        bJaHMAixM7eq4=
Received: (qmail 2978697 invoked from network); 1 Sep 2021 11:17:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2021 11:17:34 +0200
X-UD-Smtp-Session: l3s3148p1@Hb5fievKUoMgARa4Rc4DAUbRC24QnL0V
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] clk: renesas: r8a779a0: Add TPU clock
Date:   Wed,  1 Sep 2021 11:17:23 +0200
Message-Id: <20210901091725.35610-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901091725.35610-1-wsa+renesas@sang-engineering.com>
References: <20210901091725.35610-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index acaf5a93f1d3..7bef98f1cd7f 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -202,6 +202,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("tmu2",		715,	R8A779A0_CLK_S1D4),
 	DEF_MOD("tmu3",		716,	R8A779A0_CLK_S1D4),
 	DEF_MOD("tmu4",		717,	R8A779A0_CLK_S1D4),
+	DEF_MOD("tpu0",		718,	R8A779A0_CLK_S1D8),
 	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
-- 
2.30.2

