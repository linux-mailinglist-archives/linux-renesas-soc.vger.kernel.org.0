Return-Path: <linux-renesas-soc+bounces-266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B00EB7F9C4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 10:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6926F28110E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 09:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B853134AA;
	Mon, 27 Nov 2023 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mOW8jygG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0439618F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:47 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54acdd65c88so3819830a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701075885; x=1701680685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQu10j0QwV+Ad1UGRhRRU7KzoLHJiBSEBkkZ5ea4Ue8=;
        b=mOW8jygGTTUSGr7OMcMHFQIUAKrZcmdrT0Lm9SCUKlwpmtlg/4E8Beo5KiXx+LW4tE
         CWiI0Bu77dttGNPMVAQxqOV8LaevIHY6Lpo54B8c+2ystx8GJxlnSct7WrkFeobHxSrV
         Tncu3FJt7ZOqm11A5bxL9nr3OFeU2IuQR3zlgAnAOJzpuwLnNw+C9db/NwnW/qGyHd68
         rTF/zjAJhqIvEhGRfTxPcPLwbzKWPrw/457bv4DZ94JWReWw+GbvkewGnyOtMPwS/CO9
         G7iWfj6FATirr5rGhp4ECHCV6Al/cBGsyNHjzW2W3HsgsmdZgf2K5tWnaQ0UyoEjICEv
         XA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075885; x=1701680685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQu10j0QwV+Ad1UGRhRRU7KzoLHJiBSEBkkZ5ea4Ue8=;
        b=L1q5ZbRhQAeZfYwd17V21AFKDQxm81wHS9Y8YU84925NbtlmP0bcyFkfdJj2r2XP+v
         H3HtUeD0F6CVcKJuu2iP+6xtVR0l1S2IZ6Ta3iNFez21aT5KYHH9eEQabmDJHt94ACrv
         C4dBBxhHtEtMfjqkXcEz38L4U89Ziu7mQ0ptCpooSjip7dX/BtRH95W7YatVU57ImVqk
         ROv9u7Gp5W4GIR2d74zAOg7Pc49v94zWZYQKA7C8Q1tZevYwfgmf1/oDLWuWB0DFk3Bg
         4U3aaKoqAI5N1LMSuEqucXJL8d2A13okyNev9kwduLIeqsftCdVwHkWwYjn5wYTiXTz0
         AhAw==
X-Gm-Message-State: AOJu0Ywz2xb2mwg6jp1aBMdqaQWtB+1KboKeYWYqVC18l3ZwNnXoGd47
	JTXU18IgpAZJyn18bXMWrpEoUQ==
X-Google-Smtp-Source: AGHT+IGISQK94Ry155vVV8zvw2RP+e6FJAj5j8pFkqlLI+MX3mV1b6v4bHggEslm10y8MkPvbBynTQ==
X-Received: by 2002:a17:906:eb0f:b0:a02:95ea:1289 with SMTP id mb15-20020a170906eb0f00b00a0295ea1289mr8362060ejb.20.1701075885302;
        Mon, 27 Nov 2023 01:04:45 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id ay14-20020a170906d28e00b009fad1dfe472sm5456539ejb.153.2023.11.27.01.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 01:04:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/6] net: ravb: Make write access to CXR35 first before accessing other EMAC registers
Date: Mon, 27 Nov 2023 11:04:23 +0200
Message-Id: <20231127090426.3761729-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hardware manual of RZ/G3S (and RZ/G2L) specifies the following on the
description of CXR35 register (chapter "PHY interface select register
(CXR35)"): "After release reset, make write-access to this register before
making write-access to other registers (except MDIOMOD). Even if not need
to change the value of this register, make write-access to this register
at least one time. Because RGMII/MII MODE is recognized by accessing this
register".

The setup procedure for EMAC module (chapter "Setup procedure" of RZ/G3S,
RZ/G2L manuals) specifies the E-MAC.CXR35 register is the first EMAC
register that is to be configured.

Note [A] from chapter "PHY interface select register (CXR35)" specifies
the following:
[A] The case which CXR35 SEL_XMII is used for the selection of RGMII/MII
in APB Clock 100 MHz.
(1) To use RGMII interface, Set ‘H’03E8_0000’ to this register.
(2) To use MII interface, Set ‘H’03E8_0002’ to this register.

Take into account these indication.

Fixes: 1089877ada8d ("ravb: Add RZ/G2L MII interface support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes since [1]:
- collected Rb tag

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index cd3474168452..2d4f4fb3d16e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -515,6 +515,15 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 
+	if (priv->phy_interface == PHY_INTERFACE_MODE_MII) {
+		ravb_write(ndev, (1000 << 16) | CXR35_SEL_XMII_MII, CXR35);
+		ravb_modify(ndev, CXR31, CXR31_SEL_LINK0 | CXR31_SEL_LINK1, 0);
+	} else {
+		ravb_write(ndev, (1000 << 16) | CXR35_SEL_XMII_RGMII, CXR35);
+		ravb_modify(ndev, CXR31, CXR31_SEL_LINK0 | CXR31_SEL_LINK1,
+			    CXR31_SEL_LINK0);
+	}
+
 	/* Receive frame limit set register */
 	ravb_write(ndev, GBETH_RX_BUFF_MAX + ETH_FCS_LEN, RFLR);
 
@@ -537,14 +546,6 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
 
 	/* E-MAC interrupt enable register */
 	ravb_write(ndev, ECSIPR_ICDIP, ECSIPR);
-
-	if (priv->phy_interface == PHY_INTERFACE_MODE_MII) {
-		ravb_modify(ndev, CXR31, CXR31_SEL_LINK0 | CXR31_SEL_LINK1, 0);
-		ravb_write(ndev, (1000 << 16) | CXR35_SEL_XMII_MII, CXR35);
-	} else {
-		ravb_modify(ndev, CXR31, CXR31_SEL_LINK0 | CXR31_SEL_LINK1,
-			    CXR31_SEL_LINK0);
-	}
 }
 
 static void ravb_emac_init_rcar(struct net_device *ndev)
-- 
2.39.2


