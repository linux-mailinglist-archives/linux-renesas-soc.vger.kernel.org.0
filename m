Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41CCA2D5D6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 15:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgLJOVM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 09:21:12 -0500
Received: from mail.iot.bzh ([51.75.236.24]:40953 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388149AbgLJOVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 09:21:12 -0500
Received: from localhost.localdomain (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id 02D5E4009D;
        Thu, 10 Dec 2020 15:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607610031; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AS3FV48c3FHnM59FxARQADk8AI4MXkd65nJgAsJRKgQ=;
        b=YOeTVzuVzwCZJwM/DznvWvyLULLwHD5RUqFFvAdtMZrQvvmsuqm2MaXYj+dzMnD9mcgHBZ
        yZiZh0lmASil9yv1ilTlBxF2OyA55SKZaOoIHCkwQWYxEXtP+GC+PstinhuqVNL6HG2An2
        O71woEZyyQlvKXCCDcYs1kFCqEvmFIRW3pAj/cUK/ggOpDEYQqQwUWIBfTX3Hb1b4oMmuL
        f35XY4ip6J3TE6h9PCAOzO6qXFC8rJCi8cSKnRxPvBdFtHWIzd3bgWE2KE5dc5W80+05Uf
        aBtXHZjf06oFwM60mR4YBgExQjMGcEvB+V6gfYWqxpIk48/F17m+ZKpVGLoirw==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH 3/5] clk: renesas: r8a77965: Add MFIS clock
Date:   Thu, 10 Dec 2020 15:20:19 +0100
Message-Id: <20201210142021.163182-4-julien.massot@iot.bzh>
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
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 2b55a06ac5cf..66cc067bdb49 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -132,6 +132,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("msiof2",		209,	R8A77965_CLK_MSO),
 	DEF_MOD("msiof1",		210,	R8A77965_CLK_MSO),
 	DEF_MOD("msiof0",		211,	R8A77965_CLK_MSO),
+	DEF_MOD("mfis",			213,	R8A77965_CLK_S2D2),
 	DEF_MOD("sys-dmac2",		217,	R8A77965_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		218,	R8A77965_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		219,	R8A77965_CLK_S0D3),
-- 
2.29.2

