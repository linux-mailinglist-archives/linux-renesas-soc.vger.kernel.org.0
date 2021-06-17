Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F11483AB4EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 15:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbhFQNka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 09:40:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50000 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231454AbhFQNk1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 09:40:27 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HDWc0q017390;
        Thu, 17 Jun 2021 13:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ybK073aC2hYRjNZrPNq6PmQL/NypsUqZHzxuvLpbpeU=;
 b=A+9DKbDL5TofL2KfE5vdN3/V5Ru7Ox2/ccfHH4gOxA3I/piw4QjkSb/HGWNd4ysZCsWl
 K8M6GRDH5q6geZVHirFad8ZQVNs98BEXbUQJYAzOK8TG7XHHilZ/qGqe4bZ5frS6tLkg
 VgE9rWLAaz1Mn4MZxYZQLjtK/WefDOTcFrk1Cn4R3ACMHFLLytNPUMwNIsu8T3zivZrn
 N8KwAar8stlbGqwzB9hETfFpnAhjYTeUh1fzMHqS3JxxCAzIHOFIBfdFnPieA3L3H06e
 Ca7oijCVbh9m/txjD93VLTpVQQIo5iMw9VHIoVV/U1JNPTKrWhE6UHX7NqV4LyhQkiIZ ng== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 396tr0vk1s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:38:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HDVYLo115397;
        Thu, 17 Jun 2021 13:38:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 396waxn0ub-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:38:11 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HDZ3va122708;
        Thu, 17 Jun 2021 13:38:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 396waxn0tq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:38:10 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15HDc7TP005323;
        Thu, 17 Jun 2021 13:38:09 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 13:38:06 +0000
Date:   Thu, 17 Jun 2021 16:37:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: renesas: fix a double free on error
Message-ID: <YMtQN++uwH41TAg0@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: I3XzZxjHhWlO4QMXSyhP0g1vZ43p413X
X-Proofpoint-ORIG-GUID: I3XzZxjHhWlO4QMXSyhP0g1vZ43p413X
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The "clock" pointer is allocated with devm_kzalloc() so freeing it
here will lead to a double free.

Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/renesas/renesas-rzg2l-cpg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 5009b9e48b13..9516fb4d93e2 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -473,7 +473,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 fail:
 	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
 		mod->name, PTR_ERR(clk));
-	kfree(clock);
 }
 
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_cpg_priv, rcdev)
-- 
2.30.2

