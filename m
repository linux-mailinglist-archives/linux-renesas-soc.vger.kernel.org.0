Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCB62D5D6C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 15:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388149AbgLJOVM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 09:21:12 -0500
Received: from mail.iot.bzh ([51.75.236.24]:31743 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388144AbgLJOVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 09:21:12 -0500
Received: from localhost.localdomain (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id C07074009C;
        Thu, 10 Dec 2020 15:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607610030; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=chZGNjW/asPB+qqM//kF25OMw8P4w5iWrXbBKUp6oII=;
        b=PMPZeKMS3zvHL5ctcurI4cVfgmH3klW4Uxkmvo1hvxAIdSnZxv6sNxCb3djcUaqdicXAEs
        tgovT4BHQLBuN58a0XyWsoOlIhWh+F7OwL9q7cMPuXWotEIdrtKLtMtJxqZp2sjaYG+ZIE
        jP6uwWCg5xsMQVXfkUv3pLlHWNSE28euW+t/J9trrmQACHzU52wQ4k0ISRzoClbo9kYQct
        w/QOjuk5pfUDghY0rq5/3BwOx++X/CwH9pEcVMbXWxTzwu3xB/bsDOHVqNwafvmfXekYGo
        NBh/bayEq0GZVGqya1UrS5wLiW1bUJ7R9QA+QjAVxI5m8XJA4hB3j3akG/hFEg==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH 2/5] clk: renesas: r8a7796: Add MFIS clock
Date:   Thu, 10 Dec 2020 15:20:18 +0100
Message-Id: <20201210142021.163182-3-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210142021.163182-1-julien.massot@iot.bzh>
References: <20201210142021.163182-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 2cd6e3876fbd..0892d85a82f3 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -137,6 +137,7 @@ static struct mssr_mod_clk r8a7796_mod_clks[] __initdata = {
 	DEF_MOD("msiof2",		 209,	R8A7796_CLK_MSO),
 	DEF_MOD("msiof1",		 210,	R8A7796_CLK_MSO),
 	DEF_MOD("msiof0",		 211,	R8A7796_CLK_MSO),
+	DEF_MOD("mfis",		         213,	R8A7795_CLK_S2D2),
 	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A7796_CLK_S0D3),
-- 
2.29.2

