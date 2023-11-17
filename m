Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B897EF674
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 17:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235563AbjKQQpB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 11:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbjKQQpB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 11:45:01 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D251AD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:57 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so19122425e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 08:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700239496; x=1700844296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhPeJT65e+HlTL4GEJcknvOqJIOmP+OVNMnytUlHsfE=;
        b=ozSvtk17xBLXkMfBwC2qyJJk0GVjTJmr0wWomvIaoviYcwg8IlJ11FZOX6ZtP10K7q
         gXOC34Y62Y88RPBuNhazpUNJ2EVKID9Q/Y2gt1bs7eV2vzNtlzW0/ngh9IhSq+KtoOCj
         +2w92g0vDdbTwvy+8hSU1YB1WXHO8X9BX87+h7rb93swmBHeRvTfQmh/x2077IfT+OWs
         6c9GMyqOokObymXWRF+aBAgFEPROMRm3mlvq3OOiufeWnuxRzhvLR+5nqai3pXwZEbpH
         xI9sWaDU91kccDDKaHN98rUdxWCiTiCSz0TLDds+DsAOKQir/iW1eS5ZwB6Xo1aMnpd7
         TmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700239496; x=1700844296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhPeJT65e+HlTL4GEJcknvOqJIOmP+OVNMnytUlHsfE=;
        b=Ejo/AZAcTN62IK5gBfIjz29E77Y1yeDFJa/oXNbjKNMjtOpPPesBSDQ/wdpzm7rNXh
         2T8KcAIr1Dr1zHWgL32P0YX+on0JiscGtpYlvOAPYSW42XoFokCaUvfVn3BwY+tLguKG
         cy6FFcgAjJIqYTNVVe9hckvZhfYFTvq0aDYbk7vpCogBnBZJ2yiLFchbz2fWFg/c6QaV
         r+Nbt8lSx2MKAg+b5MFkxmU7pyeyR7QgBGFlMr0pA2cg3jOB9f88imc48x01a9FU+sJx
         KzTw/RrHU2sS96r3di3dwb1p7EZyBxjdGP+hLsKGyi9j3NIGm7M89QX8oXD2EcD4wweS
         tWUw==
X-Gm-Message-State: AOJu0Yxjw7nINUxPG/koU9acm3DuE8UuuLrLRitzO1JY5ByM+47Q2cMX
        CJOzK78YOXwvgKpsFYBw+LlawA==
X-Google-Smtp-Source: AGHT+IG4Fo+rQkLIhotw1LTO6yBVUGA+K8V4fgVejBF7yALbeqscuO6QEm4badwj2b9vcfPRno2sDQ==
X-Received: by 2002:a05:6000:1a8f:b0:319:8a66:f695 with SMTP id f15-20020a0560001a8f00b003198a66f695mr18194190wry.55.1700239495876;
        Fri, 17 Nov 2023 08:44:55 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id y10-20020adfee0a000000b0032dcb08bf94sm2791947wrn.60.2023.11.17.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 08:44:55 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 3/5] net: ethernet: renesas: rcar_gen4_ptp: Prepare for shared register layout
Date:   Fri, 17 Nov 2023 17:43:30 +0100
Message-ID: <20231117164332.354443-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All know R-Car Gen4 SoC share the same register layout, rename the R-Car
S4 specific identifiers so they can be shared with the upcoming R-Car
V4H support.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 6 +++---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 4 ++--
 drivers/net/ethernet/renesas/rswitch.c       | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 443ca5a18703..59f6351e9ae9 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -14,7 +14,7 @@
 #include "rcar_gen4_ptp.h"
 #define ptp_to_priv(ptp)	container_of(ptp, struct rcar_gen4_ptp_private, info)
 
-static const struct rcar_gen4_ptp_reg_offset s4_offs = {
+static const struct rcar_gen4_ptp_reg_offset gen4_offs = {
 	.enable = PTPTMEC,
 	.disable = PTPTMDC,
 	.increment = PTPTIVC0,
@@ -133,10 +133,10 @@ static struct ptp_clock_info rcar_gen4_ptp_info = {
 static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
 				  enum rcar_gen4_ptp_reg_layout layout)
 {
-	if (layout != RCAR_GEN4_PTP_REG_LAYOUT_S4)
+	if (layout != RCAR_GEN4_PTP_REG_LAYOUT)
 		return -EINVAL;
 
-	ptp_priv->offs = &s4_offs;
+	ptp_priv->offs = &gen4_offs;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 9f148110df66..35664d1dc472 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -14,7 +14,7 @@
 #define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
 
 enum rcar_gen4_ptp_reg_layout {
-	RCAR_GEN4_PTP_REG_LAYOUT_S4
+	RCAR_GEN4_PTP_REG_LAYOUT
 };
 
 /* driver's definitions */
@@ -27,7 +27,7 @@ enum rcar_gen4_ptp_reg_layout {
 
 #define PTPRO				0
 
-enum rcar_gen4_ptp_reg_s4 {
+enum rcar_gen4_ptp_reg {
 	PTPTMEC		= PTPRO + 0x0010,
 	PTPTMDC		= PTPRO + 0x0014,
 	PTPTIVC0	= PTPRO + 0x0020,
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 43a7795d6591..e1e29a2caf22 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1828,7 +1828,7 @@ static int rswitch_init(struct rswitch_private *priv)
 
 	rswitch_fwd_init(priv);
 
-	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT_S4,
+	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
 				     RCAR_GEN4_PTP_CLOCK_S4);
 	if (err < 0)
 		goto err_ptp_register;
-- 
2.42.1

