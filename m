Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD271A2F11
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 08:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDIGPS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 02:15:18 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:50304 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbgDIGPS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 02:15:18 -0400
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 48yW8d2Th1z1XLGvC;
        Thu,  9 Apr 2020 08:15:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1586412913;
        bh=QQnWX1HHy6PykuHJlNj2nWQVf1g9ixSCCO3f33fTj/w=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=WW8ZeOFuycTa/lK64mX/fqtKm+QgabpINodcNNlsWc0kJO0fDXiflTevu+xvsvTo1
         MIPISBHu0Yv9ZQjY+Wc3M0OuTzUW7jlb4Z35t01uCxrCQlq1jJQUjLH91za+YMQMmo
         WjiTrg9cWUtwtGCFDZfPMAmPfXF480FZZyb8l8AM=
Received: from si0vm02576.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 48yW8d1zdTz2cb;
        Thu,  9 Apr 2020 08:15:13 +0200 (CEST)
X-AuditID: 0a3aad0d-8f3ff700000068f0-7f-5e8ebd719086
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by si0vm02576.rbesz01.com (SMG Outbound) with SMTP id B0.6D.26864.17DBE8E5; Thu,  9 Apr 2020 08:15:13 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 48yW8d0mPhz6CjZNv;
        Thu,  9 Apr 2020 08:15:13 +0200 (CEST)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.1979.3; Thu, 9 Apr 2020 08:15:12 +0200
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     <geert+renesas@glider.be>, <dirk.behme@de.bosch.com>,
        Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] ravb: Fix RAVB_RXTSTAMP_TYPE_ALL value
Date:   Thu, 9 Apr 2020 08:15:09 +0200
Message-ID: <20200409061509.13385-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sa0xTZxjH+/a0cFo5cCi3xyqihRgk4yLjFsaMMkiIt0zCFmNG8UCPbbFc
        1hYE9wFEQrBDbg65DZgKEZFrjY4GNmJxGBiNSMiwzAsgzMqYU8EwlMh6VpB+2Lf/c/k9/7z/
        vDgmaLYV4vJUNa1MpRQiGz6HH97m7vv1T8XiAK1uU1hdbTkKy2spwcJuPn/BDhtumbDdy4mZ
        rFhlx5QZfGPKTXpOzIJ22+ecY/wICa2QZ9JK/z3H+bJfSy5g6deIrPJ+rU0u6tqkQTgOZBDc
        7WNrEB8XkNVs0HY/4VqKPgSLj8aRpehAULiiMxc83Ib0AV1poS2jnckEyO/Mt2E0Rh6HxtwJ
        jNFOZCh0XZrmMppDesHLc8tsRhNkBPS1N/13B0gPuHhds9Z3hMHqGY7ljgecvVmLWTTAbZMJ
        s+zvgNYaHbcUOdRYITVWSI0V8gPCWpCrSh6QmRIQGBwa4qdMpFWnA3b7JaWlaJElU6Ib6TQv
        /fSIjSM9CsbZIhditb1YLLBPTJNkyyiVLEGZoaBVIiGRM38uXuD0oa3KSEyRq1TytFQ9AhwT
        ORMH8s6LBYSEyj5NK9MsmB5twTkiN8KF/41YQEopNX2SptNp5fr0ExwXAdHfazZ0VNJSOuuE
        XKFeH4vcCcRisQSu1hNrWzbO06OPcTuzt5A5QajSqRSVXLqGb7bggvXuBjqEQoVuRBvDkMxU
        lpH6wVW4lQi8bn6Ii9Vgg5xDRoQjkRPhxcB25h+64QdELhOR41pzAwpsMjPkEBfqu98g+Keo
        jAPvVie5YHp8jwdnLr+2gyfGWw5gWrkkgAdtlULombkshKr3hi1wI7fVHXoa57bB4NgvHjD6
        9oondGleecLij9/vhIapq96gHzN6Q3PTig8sVOZ/BG9fFYXDRN+LCPjO8PxTaF00RjLLh6H4
        6YUjUD+ijzXv3fkSiq79GQ8Vg/PxsFx3n4LmsgLJnDlMtjnM3xK/ZcJUU+r/CXOtu/E6YS4b
        CxvkDxQs7X09u2/2VF2nWnt++1c91TOa9uJnk9FnPkt+f/JQUeSwUbp5sjeY5zps/zdVuE+x
        UOnsGRX0zGHEeWTr/qkoqnpXrbTFp992cn7XfaqicenElCz8XTvri5J74qOjt0M88YeSuLGO
        6EexhoTDioHWcPTGrTK7LDkuK8p0LG+I1dB55WCMQ4E7N6nt1Nm4uYHHoWmy8Ihksb7qaWYD
        71Z0K3aHd8B7tGm8OC+yN+Iv+wH/Us0fmTsu7t/uWp8+62UInT60lBO7M0malCR5GBLlb9/x
        YNzkdfSGsW4ppzH1ros8uiXdsYqFH/x9WecUG0R59XckTs8Z1Ljvz3tEHJWM2u2DKVXUv2jV
        BH67BAAA
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

While at it, drop two unused macros.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/net/ethernet/renesas/ravb.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 9f88b5db4f89..5a05b74a6fe6 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -35,13 +35,11 @@
 #define RAVB_ALIGN	128
 
 /* Hardware time stamp */
-#define RAVB_TXTSTAMP_VALID	0x00000001	/* TX timestamp valid */
 #define RAVB_TXTSTAMP_ENABLED	0x00000010	/* Enable TX timestamping */
 
-#define RAVB_RXTSTAMP_VALID	0x00000001	/* RX timestamp valid */
 #define RAVB_RXTSTAMP_TYPE	0x00000006	/* RX type mask */
 #define RAVB_RXTSTAMP_TYPE_V2_L2_EVENT 0x00000002
-#define RAVB_RXTSTAMP_TYPE_ALL	0x00000006
+#define RAVB_RXTSTAMP_TYPE_ALL	0x00000004
 #define RAVB_RXTSTAMP_ENABLED	0x00000010	/* Enable RX timestamping */
 
 enum ravb_reg {
-- 
2.20.0

