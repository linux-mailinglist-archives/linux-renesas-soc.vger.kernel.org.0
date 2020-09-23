Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51168275732
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 13:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgIWLcA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 07:32:00 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:43768 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgIWLcA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 07:32:00 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08NBPDQ7125046;
        Wed, 23 Sep 2020 11:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=a/3Y0JWml0cElcLXECJKh9QCu2GcyQ6fS9FlXSoHn8Y=;
 b=ohFxs4WM4GWSyb1Y7kDlXaCx3HVFbXmgcXxrVAvUXr+UGxMacL1y9OWozf4KZSwH7d2s
 53+QxNb6Tyi7FwOy/3WKjYfPzfitMg8pbnYFvm2c5zPahgDHE8rNA47R+q4FYDFalVHq
 ryQrgSwS1otOHF5GpwRhjdM0Fr2IjY6Il+vqdPSpvtzoqH8jQtucuhS0cR1Rw0ZlzqrS
 Pzi/GljHIXq2lLhUc2/2N5t7MSatotTIg9Z+EhBoYIwK0c4ouKEz09lPbUQ8PxuQXpNs
 gFGK0BZkn2DyX/Clf0/2RPtxKJtbsxvjUQKHv3Ag74pdGdfkI8eBCoe92c8L6zcTN59M 1w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 33q5rgg8fs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Sep 2020 11:31:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08NBTPS8145902;
        Wed, 23 Sep 2020 11:31:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 33nux100pv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Sep 2020 11:31:50 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08NBVmlR008029;
        Wed, 23 Sep 2020 11:31:50 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 23 Sep 2020 04:31:48 -0700
Date:   Wed, 23 Sep 2020 14:31:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] soc: renesas: rmobile-sysc: Fix some leaks in
 rmobile_init_pm_domains()
Message-ID: <20200923113142.GC1473821@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=2 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009230093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=2 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230092
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This code needs to call iounmap() on one error path.

Fixes: 2173fc7cb681 ("ARM: shmobile: R-Mobile: Add DT support for PM domains")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  The v1 patch potentially led to a use after free.

 drivers/soc/renesas/rmobile-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
index 54b616ad4a62..beb1c7211c3d 100644
--- a/drivers/soc/renesas/rmobile-sysc.c
+++ b/drivers/soc/renesas/rmobile-sysc.c
@@ -327,6 +327,7 @@ static int __init rmobile_init_pm_domains(void)
 
 		pmd = of_get_child_by_name(np, "pm-domains");
 		if (!pmd) {
+			iounmap(base);
 			pr_warn("%pOF lacks pm-domains node\n", np);
 			continue;
 		}
-- 
2.28.0

