Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 387601937F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 22:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfEIUgk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 16:36:40 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:34924 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfEIUgk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 16:36:40 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x49KCa5m018263;
        Thu, 9 May 2019 16:13:43 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap01.intersil.com with ESMTP id 2scabqgu1f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 09 May 2019 16:13:42 -0400
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Thu, 9 May 2019 16:13:41 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Thu, 9 May 2019 16:13:40 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH v2 09/15] usb: renesas_usbhs: add support for CNEN bit
Date:   Thu, 9 May 2019 15:11:36 -0500
Message-ID: <20190509201142.10543-10-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=887
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905090115
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For some SoC, CNEN must be set for USB Device mode operation.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 6 ++++++
 drivers/usb/renesas_usbhs/common.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index efb26ffd9809..820636fc4dc9 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -116,6 +116,12 @@ void usbhs_sys_function_ctrl(struct usbhs_priv *priv, int enable)
 	u16 mask = DCFM | DRPD | DPRPU | HSE | USBE;
 	u16 val  = HSE | USBE;
 
+	/* CNEN bit is required for function operation */
+	if (usbhsc_flags_has(priv, USBHSF_HAS_CNEN)) {
+		mask |= CNEN;
+		val  |= CNEN;
+	}
+
 	/*
 	 * if enable
 	 *
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 1ca94b8f5508..211ab8e741be 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -104,6 +104,7 @@ struct usbhs_priv;
 
 /* SYSCFG */
 #define SCKE	(1 << 10)	/* USB Module Clock Enable */
+#define CNEN	(1 << 8)	/* Single-ended receiver operation Enable */
 #define HSE	(1 << 7)	/* High-Speed Operation Enable */
 #define DCFM	(1 << 6)	/* Controller Function Select */
 #define DRPD	(1 << 5)	/* D+ Line/D- Line Resistance Control */
@@ -343,6 +344,7 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev);
  * flags
  */
 #define USBHSF_RUNTIME_PWCTRL	(1 << 0)
+#define USBHSF_HAS_CNEN		(1 << 1) /* Single-ended receiver */
 
 #define usbhsc_flags_init(p)   ((p)->flags = 0)
 #define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
-- 
2.16.1

