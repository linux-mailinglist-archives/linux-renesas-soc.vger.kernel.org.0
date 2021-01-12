Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3062F3668
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390846AbhALRCX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:23 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:36655 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390860AbhALRCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470771;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=IgAirySnJW0mpBW53MOeGVOA6UvCiIZIChEN35qZ0uY=;
        b=PXPe0A9+nIqp2FsvzL2SBz/RHg+D6E23F8htexd5eJtpewZGJKV1N3sSnJuUS1EpD7
        rlJYks4rOz5cZh1xXIPLspXws4W2yJEEQZXnckrq41EjA4wq9DEQQ3XmYFcusWRFwTCx
        HIQ2Yr0bvwmISDqxQXFvScBl3dYrE0F60fNiwlf2VERuSAkwyyHIbZl4YV1UzlqniyJ+
        15/Ugd2Ir4pun61gd4L72/yQzmEIL65n75PYAzmxp+UjIplEyrUUjeofy0R6KMB3QFCf
        Egnw1W7TLLlTG/H9P39PQjwwZdhZuOIGAZMIceYpRQHyzp71iNq92aZRVnocTY9FKO6M
        sLtg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxPNUH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:25 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 3/6] pinctrl: renesas: add PORT_GP_CFG_{2,31} macros
Date:   Tue, 12 Jan 2021 17:59:09 +0100
Message-Id: <20210112165912.30876-4-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165912.30876-1-uli+renesas@fpond.eu>
References: <20210112165912.30876-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/renesas/sh_pfc.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 9787dc893a33..4367fe5b0f4a 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -460,9 +460,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	fn(bank, pin, GP_##bank##_##pin, sfx, cfg)
 #define PORT_GP_1(bank, pin, fn, sfx)	PORT_GP_CFG_1(bank, pin, fn, sfx, 0)
 
-#define PORT_GP_CFG_4(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_2(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg)
+#define PORT_GP_2(bank, fn, sfx)	PORT_GP_CFG_2(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_4(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_2(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_1(bank, 2,  fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 3,  fn, sfx, cfg)
 #define PORT_GP_4(bank, fn, sfx)	PORT_GP_CFG_4(bank, fn, sfx, 0)
@@ -581,9 +585,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 29, fn, sfx, cfg)
 #define PORT_GP_30(bank, fn, sfx)	PORT_GP_CFG_30(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_32(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_31(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_30(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 30, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 30, fn, sfx, cfg)
+#define PORT_GP_31(bank, fn, sfx)	PORT_GP_CFG_31(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_32(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_31(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 31, fn, sfx, cfg)
 #define PORT_GP_32(bank, fn, sfx)	PORT_GP_CFG_32(bank, fn, sfx, 0)
 
-- 
2.20.1

