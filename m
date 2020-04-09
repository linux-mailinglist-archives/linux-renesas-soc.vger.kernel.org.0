Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAE21A3219
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 11:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDIJs4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 05:48:56 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:37096 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDIJs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 05:48:56 -0400
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 48ybv961Slz1XLFjw;
        Thu,  9 Apr 2020 11:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1586425733;
        bh=QQnWX1HHy6PykuHJlNj2nWQVf1g9ixSCCO3f33fTj/w=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=nLcpmftlXqqFa5ADSqD9os+b51jSIj/2quYJ8/uAos+oJ9mJtOW0p2AJ2Ci8CFPII
         JoXx50REOvhdEPNHEUSuE13zd19AcKb+7mgtdOqa0x8LHTcVQsHy8PjEcnDVQeuHxY
         NufTiVWY5FrQnDpsbUxJyPmkf5Bn5V25I/XP0wek=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
        by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 48ybv95Zwpz5vq;
        Thu,  9 Apr 2020 11:48:53 +0200 (CEST)
X-AuditID: 0a3aad15-2e9ff7000000622b-10-5e8eef852a39
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id CD.20.25131.58FEE8E5; Thu,  9 Apr 2020 11:48:53 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 48ybv94011z6CjZNv;
        Thu,  9 Apr 2020 11:48:53 +0200 (CEST)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.1979.3; Thu, 9 Apr 2020 11:48:53 +0200
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     <geert+renesas@glider.be>, <dirk.behme@de.bosch.com>,
        Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v2 1/2] ravb: Fix RAVB_RXTSTAMP_TYPE_ALL value
Date:   Thu, 9 Apr 2020 11:48:50 +0200
Message-ID: <20200409094851.22142-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBLsWRmVeSWpSXmKPExsXCZbVWVrf1fV+cQUuTusXc2ZMYLZpW9TNb
        bH35jsnizKpb7A4sHg+m/mfymHhW12PSi0MsHp83yQWwRHHZpKTmZJalFunbJXBlrHz4kb3g
        I3dFx70drA2Ms7i6GDk5JARMJCZOP83UxcjFISQwg0li0qLJbBDOfkaJM5v+MkI46xklti77
        yA7SwiagJbFzQgeYLSIQL9GyoYUNxGYWSJBY0nCLGcQWFrCT+LW6gxHEZhFQkZg/7TYriM0r
        YCNx/H4jE8RqeYlpq7uYIOKCEidnPmGBmCMv0bx1NjOELSFx8MULZoh6RYk1s3ayTmDkn4Wk
        ZRaSlllIWhYwMq9iFE1LNSjLNTQ3MdQrSkotrjIw1EvOz93ECAlT0R2Md7o/6B1iZOJgPMRo
        ysGkJMq762lfnBBfUn5KZUZicUZ8UWlOarGSFG/9m85YIWG4cHFpUm5mcXFmft4hRgkOZiUR
        Xu+m3jgh3pTEyqrUonyItkOM0hwsSuK8olzVcUIC6YklqdmpqQWpRTBZaw4OJQnev++AFgoW
        paanVqRl5pTApJVkeRkZGBiExJBlkK1l4uA8xGjMwQO0+yXIzbzFBYm5xZnpUO2SEO1CMFGE
        1lOM5lLivB9B1gqAZDNK8+C2SsnwGq0GekQUSQKh8xXjTUYORiVh3jiQZh5gCkXYJ8HbAAoi
        QaggQpPRUqAegV5WiXk7vjJK/OiZyCLx+/8DVokX985zSjQu+sQjcf/mNn6JG2unS0nsfrJI
        SmJzwxpZid1LXslJnLxyVF7i0q/FyhIbuz4qS3zZPkdNYv7D5RoSh67c1JBYsfSPlsSvjz1W
        Erf2v7ORmHL2pa3Emi83nSQ+z2r0BSn2k5j684K/RN/jyYES8y4cCpL4PP1ImETPytexElNP
        vomV+Dn3YqLEioltKRKbb1xMeQUMTCZgYF5L6gYFZkliCZbAhIoifCfVwGTx/pRoaMGsjoQ4
        ll0cCjsa/n2ykPP/yid7StxU+FWZss6Hy8zFD+rfbjj+fv7xTFaz5oznqyPuN0rkCvC1eWws
        W2vj+2PZ34rXDqZTOPyXT02aZBS0wyL2r3rvVwOZncyB5ryZmZ3NMV9Fv8165NbrZv3BqF+4
        eNK6PTd+m1xgOR5zaIvpNdW7vVbv/3Mt3D+veP3fJbJzi9jn364OWbl9191npW5M+2sea4f+
        7dxSLte4oa93ugybK/s7kXDv584+Fam2waoWzNmd3ocZcgpXcmw+JH5A+qVq2d2eSRK75Lqu
        6uXIfLxoUaTz2zK7wJHhSa+wwx6Ob58uR/gobv4oLmHA2f3cMcx22X8tJZbijERDLeai4kQA
        S9caW7sEAAA=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In the function ravb_hwtstamp_get() in ravb_main.c with the existing
values for RAVB_RXTSTAMP_TYPE_V2_L2_EVENT (0x2) and RAVB_RXTSTAMP_TYPE_ALL
(0x6)

if (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE_V2_L2_EVENT)
        config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
else if (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE_ALL)
        config.rx_filter = HWTSTAMP_FILTER_ALL;

if the test on RAVB_RXTSTAMP_TYPE_ALL should be true, it will never
be reached. Correct this by changing RAVB_RXTSTAMP_TYPE_ALL to 0x4.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v2: Split fix and cleanup into two patches.

 drivers/net/ethernet/renesas/ravb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 9f88b5db4f89..e921eae82022 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -41,7 +41,7 @@
 #define RAVB_RXTSTAMP_VALID	0x00000001	/* RX timestamp valid */
 #define RAVB_RXTSTAMP_TYPE	0x00000006	/* RX type mask */
 #define RAVB_RXTSTAMP_TYPE_V2_L2_EVENT 0x00000002
-#define RAVB_RXTSTAMP_TYPE_ALL	0x00000006
+#define RAVB_RXTSTAMP_TYPE_ALL	0x00000004
 #define RAVB_RXTSTAMP_ENABLED	0x00000010	/* Enable RX timestamping */
 
 enum ravb_reg {
-- 
2.20.0

