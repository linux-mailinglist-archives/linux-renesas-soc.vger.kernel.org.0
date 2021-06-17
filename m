Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8413AB5A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhFQORg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:17:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58782 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231224AbhFQORf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:17:35 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HE6mD7000377;
        Thu, 17 Jun 2021 14:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=xnywoMTebZicxcXUGuM8zXBSV6QsHV5AilFZ59paul4=;
 b=gs1a8uCgAkkFM8Xqvw6Cmk2Cm/iZgXzme+YXAhf/lImZVo947AGHNRPeiCiwxN3rEKg1
 bRlH4f6zJQWzxkl3TDV9bc8q7GCbXU64iSYOl91NRAaqrL699x3P0JcOxexTcmbPscXj
 mN9feHtTMfI8NRgx+eFo26XNE3X6BvWFtna1/YfX0aLAse3AuR1GahAQc65U6ub1Rrzs
 LWRLyROuA1nM6jbYkdq8KtIoMmIFth5CaFOhZvXPuGaYi3MuwBJpBoMtTrlu+r7EwMOF
 if0Up3FMX1QqsE4My4HL5tkqsAF5ItJu8BaEnDxqd+vBJnos01YafO2jlwFZQ4VmtAdh CQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39770hbdyx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:15:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HEBMTM024965;
        Thu, 17 Jun 2021 14:15:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 396wavmyc9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:15:19 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HEBiFl025749;
        Thu, 17 Jun 2021 14:15:19 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 396wavmybf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:15:19 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15HEFHjH006449;
        Thu, 17 Jun 2021 14:15:17 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 07:15:16 -0700
Date:   Thu, 17 Jun 2021 17:15:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] clk: renesas: Avoid mixing error pointers and NULL
Message-ID: <YMtY7nOtqEvTokh7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMtYs7LVveYH4eRe@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: 0s5U7DmItYZXpD_GRTVHnuk2OkhOdCPM
X-Proofpoint-ORIG-GUID: 0s5U7DmItYZXpD_GRTVHnuk2OkhOdCPM
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

These functions accidentally return both error pointers and NULL when
there is an error.  It doesn't cause a problem but it is confusing and
seems unintentional.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/renesas/renesas-rzg2l-cpg.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 7ba36f19896f..83b58e1cb78f 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -124,7 +124,7 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 						 core->flag, &priv->rmw_lock);
 
 	if (IS_ERR(clk_hw))
-		return NULL;
+		return ERR_CAST(clk_hw);
 
 	return clk_hw->clk;
 }
@@ -174,17 +174,14 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	struct clk_init_data init;
 	const char *parent_name;
 	struct pll_clk *pll_clk;
-	struct clk *clk;
 
 	parent = clks[core->parent & 0xffff];
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
 	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
-	if (!pll_clk) {
-		clk = ERR_PTR(-ENOMEM);
-		return NULL;
-	}
+	if (!pll_clk)
+		return ERR_PTR(-ENOMEM);
 
 	parent_name = __clk_get_name(parent);
 	init.name = core->name;
-- 
2.30.2

