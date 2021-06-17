Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF3E3AB59E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbhFQOQi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:16:38 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45548 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231668AbhFQOQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:16:38 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HE6nZr000981;
        Thu, 17 Jun 2021 14:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ElwLcusX/AAtxLXNAvMp31H9RCAgTlB9ROzyF4I46B8=;
 b=fCKdUmBkFOipiqUxFI1wiLvhNfoXfKMNbPzyQVepxuJvbIKkwGfufOVRwu8biQPsakv0
 mfcf6s4jLe33JVIlIMFAZekkjYIvPDf8sYfk8H/WZ+qCHjCC84ewzCxIdvawsYiY9oYD
 F8Z+NGssPuyYz3SsoTHyRdRp+RrmbzrtFhAQAQCCdPJShO0qWTiVjxPxBQN7BdyGay4N
 9GrYw9oITtV5aBJF92ZpnCp2zsbz44pM2c1JIYpLtxuzozqyvqrA/He5L+kyRQxMl2Mz
 wpFDKGp1bgqiOH/VGt3QFcTVsW6ioJOZlU0ikwfevUL2TBqAoL5n9o82gs/PrF2NAqS6 ng== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 397mpthxym-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:14:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HEBBPV157821;
        Thu, 17 Jun 2021 14:14:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 396wavng7b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:14:23 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HEEMov175165;
        Thu, 17 Jun 2021 14:14:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 396wavng6y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:14:22 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15HEEJn9005844;
        Thu, 17 Jun 2021 14:14:20 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 07:14:18 -0700
Date:   Thu, 17 Jun 2021 17:14:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2 1/2] clk: renesas: fix a double free on error
Message-ID: <YMtYs7LVveYH4eRe@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: rGxk-g23yV22GIcsr363oC-EZNuAaxtH
X-Proofpoint-ORIG-GUID: rGxk-g23yV22GIcsr363oC-EZNuAaxtH
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The "pll_clk" and "clock" pointers are allocated with devm_kzalloc() so
freeing them with kfree() will lead to a double free.  This would only
happen if probe failed, and the system is not bootable.

Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
V2: Fix "pll_clk" as well.

 drivers/clk/renesas/renesas-rzg2l-cpg.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 5009b9e48b13..7ba36f19896f 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -199,11 +199,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
 
-	clk = clk_register(NULL, &pll_clk->hw);
-	if (IS_ERR(clk))
-		kfree(pll_clk);
-
-	return clk;
+	return clk_register(NULL, &pll_clk->hw);
 }
 
 static struct clk
@@ -473,7 +469,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 fail:
 	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
 		mod->name, PTR_ERR(clk));
-	kfree(clock);
 }
 
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_cpg_priv, rcdev)
-- 
2.30.2

