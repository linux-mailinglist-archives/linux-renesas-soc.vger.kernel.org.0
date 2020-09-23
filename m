Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83D5275399
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 10:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgIWIrV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 04:47:21 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:44372 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgIWIrV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 04:47:21 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08N8jCsD039100;
        Wed, 23 Sep 2020 08:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=/f+a55Jrpg5z5UfOHn1FeTNLOR0tV1R5oqqDEthK3mY=;
 b=FXldwzRsBkugKughA56CsdL+tLdDRxLYXiFf5Y9TcqsMi7NPyGCWIIuPofkPyD1+Otpy
 kq4Q/gzM/6UzQBvgxwq+2rtqHuBd1FQRI9BaJy9TIirFeNly9GD1mlIJnSUWKUc24AWu
 xVoGxncszBButrBPTpxmFtKR+VtN+8Pr02gSVDu1in/bk6Hy7+FerL+xzKPGe7/NBO1g
 Qo8RrQpzOuo5763eZlaTcBPs5jbh1GHVnKwaY/xgjGqTQVaINSPrY7zlQzLyqbXppxKz
 qCUiOOE96zG6nUTRoIWHt3xjjoUT+t+upYDdiA+IlCSufn9MM01hlA0c2SPG9QKfv1BQ EA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 33q5rgfj3p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Sep 2020 08:47:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08N8a6o2032690;
        Wed, 23 Sep 2020 08:45:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 33r28uuqs9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Sep 2020 08:45:08 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08N8j5lp006939;
        Wed, 23 Sep 2020 08:45:07 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 23 Sep 2020 01:45:04 -0700
Date:   Wed, 23 Sep 2020 11:44:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: renesas: rmobile-sysc: Fix some leaks in
 rmobile_init_pm_domains()
Message-ID: <20200923084458.GD1454948@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230070
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230071
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This code needs to call iounmap() on the error paths.

Fixes: 2ed29e15e4b2 ("ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/renesas/rmobile-sysc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
index 54b616ad4a62..d8e6dc650939 100644
--- a/drivers/soc/renesas/rmobile-sysc.c
+++ b/drivers/soc/renesas/rmobile-sysc.c
@@ -328,6 +328,7 @@ static int __init rmobile_init_pm_domains(void)
 		pmd = of_get_child_by_name(np, "pm-domains");
 		if (!pmd) {
 			pr_warn("%pOF lacks pm-domains node\n", np);
+			iounmap(base);
 			continue;
 		}
 
@@ -341,6 +342,7 @@ static int __init rmobile_init_pm_domains(void)
 		of_node_put(pmd);
 		if (ret) {
 			of_node_put(np);
+			iounmap(base);
 			break;
 		}
 	}
-- 
2.28.0

