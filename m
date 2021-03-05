Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0324F32EC1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 14:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhCEN3s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 08:29:48 -0500
Received: from www.zeus03.de ([194.117.254.33]:43464 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230191AbhCEN3R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 08:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=KW+srCpULcFtgDnCcQFMGQbti33
        KO94xV6SG6wzLUio=; b=s6sALbP4khYZVLthXFyymsc4aKJq9O3UWFNsCFDbLjS
        zciHgJ/X2sh9nV2XSM/wA7X1HIvqNjkJwRsl+RbJwJ3LfLc7BxoW4zIYm7kwN28R
        rsL1KwKXyPoJe5qs/dJ+4ci2/gBDfjVpygbQKcfaelomw1FzjmvJ4n7S/JBx9Fsc
        =
Received: (qmail 2234829 invoked from network); 5 Mar 2021 14:29:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 14:29:15 +0100
X-UD-Smtp-Session: l3s3148p1@H/r3Ecq852Qut2cR
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: [PATCH] clocksource: sh_cmt: use CMTOUT_IE only when supported
Date:   Fri,  5 Mar 2021 14:28:59 +0100
Message-Id: <20210305132859.8208-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CMTOUT_IE is only supported for older SoCs. Newer SoCs shall not set
this bit. So, add a version check.

Reported-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Confirmed with datasheets and could successfully repeat Niklas' CMT
tests on an R-Car M3N based Salvator-XS.

 drivers/clocksource/sh_cmt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index c98f8851fd68..3b53c6cb1da9 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -143,6 +143,7 @@ struct sh_cmt_device {
 #define SH_CMT32_CMCSR_SSIE		(1 << 10)
 #define SH_CMT32_CMCSR_CMS		(1 << 9)
 #define SH_CMT32_CMCSR_CMM		(1 << 8)
+/* CMTOUT_IE only for SH_CMT_32BIT and SH_CMT_48BIT */
 #define SH_CMT32_CMCSR_CMTOUT_IE	(1 << 7)
 #define SH_CMT32_CMCSR_CMR_NONE		(0 << 4)
 #define SH_CMT32_CMCSR_CMR_DMA		(1 << 4)
@@ -339,8 +340,9 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
 		sh_cmt_write_cmcsr(ch, SH_CMT16_CMCSR_CMIE |
 				   SH_CMT16_CMCSR_CKS512);
 	} else {
-		sh_cmt_write_cmcsr(ch, SH_CMT32_CMCSR_CMM |
-				   SH_CMT32_CMCSR_CMTOUT_IE |
+		u32 cmtout = ch->cmt->info->model <= SH_CMT_48BIT ?
+			      SH_CMT32_CMCSR_CMTOUT_IE : 0;
+		sh_cmt_write_cmcsr(ch, cmtout | SH_CMT32_CMCSR_CMM |
 				   SH_CMT32_CMCSR_CMR_IRQ |
 				   SH_CMT32_CMCSR_CKS_RCLK8);
 	}
-- 
2.29.2

