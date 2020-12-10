Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F045F2D5D6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 15:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgLJOVM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 09:21:12 -0500
Received: from mail.iot.bzh ([51.75.236.24]:19377 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726431AbgLJOVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 09:21:12 -0500
Received: from localhost.localdomain (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id 4A4E34009B;
        Thu, 10 Dec 2020 15:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607610030; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=32LjwJDV2dJlTNeSvA+gu9+DCd1ZlI5efGoKr0AU518=;
        b=j2lKIO7zSOpsOEbHQf4DTFbBYeZjX6m+ZwvsmDpGlhZcnFBNtMOBMNpUvbjNv4YLpMeqNr
        B6W0jRZD4AvVP9fbQAZDn4hT3KzhFBH0CJfsNlPxszPkc/e7h3lerybItApy8R785vbY3Z
        EJuWYDZaMCGHJa6CnX2A0kwLWJWRZEixZ4+WOTQxhzv++jqtt62ZK/1kDCEkr/iyFxJBwi
        6y2VdWKAyr/hrAVpqQ9RfQeJmKCZpormn9jEMrfkPtslV+9Cx+NFRTtNcA+2XsoQ5FHUfk
        11qjrc1Mjlad62OmJlI/Jp34jW/+yd1a1ycck6Bk8Cr+jTYeMIyqQPj4s/4f4Q==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH 1/5] clk: renesas: r8a7795: Add MFIS clock
Date:   Thu, 10 Dec 2020 15:20:17 +0100
Message-Id: <20201210142021.163182-2-julien.massot@iot.bzh>
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
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 068018ae3c6e..c2ee4e2ab84d 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -137,6 +137,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("msiof2",		 209,	R8A7795_CLK_MSO),
 	DEF_MOD("msiof1",		 210,	R8A7795_CLK_MSO),
 	DEF_MOD("msiof0",		 211,	R8A7795_CLK_MSO),
+	DEF_MOD("mfis", 		 213,	R8A7795_CLK_S2D2),
 	DEF_MOD("sys-dmac2",		 217,	R8A7795_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A7795_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A7795_CLK_S0D3),
-- 
2.29.2

