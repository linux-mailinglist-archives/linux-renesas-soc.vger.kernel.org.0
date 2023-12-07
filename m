Return-Path: <linux-renesas-soc+bounces-801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A16DB808188
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 08:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D7762829D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 07:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60C414264;
	Thu,  7 Dec 2023 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jqMXOIHM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104D010F1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Dec 2023 23:08:21 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso726078a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Dec 2023 23:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932899; x=1702537699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuAnHZUJssT/ogjytdawjrgSLlqBwwzWO4plVJg60Do=;
        b=jqMXOIHM7NIXqMSoon8Tj4OiojoQsSLX2/6BgPjh+kQEJb2tNRAvMtwr80Zq/+rxar
         zA6zWDMwm1H7uKoO6SUqbKvJuqYEkyqH+cAYLEWSVqMzzHZJXa4SVlI92vPjrOTU+uJd
         54WU0CELrbRUuz6yPC4i1buqDWphqHEKSiZSKy6TVDdraaf6TLx9vIDbvPMioneYPaLh
         lrXYCDqR7roY1d2s05sjVo3lU2onA3bhE4VZnpLGE58FvQVj78oL/nFMbaHbM12Heg0d
         zP21IRcdYVgXyTk89LXgqYxiAzywVARsz0kr7GOzei/VwbT9y9iFYuOPHv547AF4xZZC
         t5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932899; x=1702537699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuAnHZUJssT/ogjytdawjrgSLlqBwwzWO4plVJg60Do=;
        b=oHTTr3RcmzsSc5e4f5Fq7PLZxEBwoUfJVSa6fXJoYJvh86PwHjhEV1rs9VRUDeqxqa
         ZS2DuZd8FtrDz12S+ljSeU7jDV+IHWKX+yEiHssSgNIAkKzVEW12IthOahorP16QXXFZ
         wmdXVMUiTI5ck5SiyRphTfBQ8VsPDkBMiX3pLS4Gdm8Rbv62l/kKoqJaxZTGuj8iIGN0
         scQGe3L0qN4oQcNYOJBhWF371QFbQlKZ3uZBkTZAuicZG6s3Zn1c7Q5/qph4pgo7Fesv
         xqwlW4tcBQda5VBzacwo4d8sTzLiw6ME7+LYQB7A9dYcekAvsCTLHRRPqA8MzcM/MRwz
         iiTA==
X-Gm-Message-State: AOJu0Yxr8OuGrUGtNxn2Cwp9toh+VB+6yWEGRteKdsIM7LQRH5EeixJC
	tD6Rw+3OVWCYOW5JUD7KpllGyg==
X-Google-Smtp-Source: AGHT+IEK/F8KEkOlDZ8jP3JRofMjdFI+uwlBNgwbxKm8acFivOfhgfyBJhuNrj6wnLXSiVf/gPl5mQ==
X-Received: by 2002:a05:6402:1ada:b0:54c:4837:8b5e with SMTP id ba26-20020a0564021ada00b0054c48378b5emr1070240edb.44.1701932899557;
        Wed, 06 Dec 2023 23:08:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:19 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 07/11] pinctrl: renesas: rzg2l: Add input enable to the Ethernet pins
Date: Thu,  7 Dec 2023 09:06:56 +0200
Message-Id: <20231207070700.4156557-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Some of the RZ/G3S Ethernet pins (P1_0, P7_0) could be configured with
input enable. Enable this functionality for these pins.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new in v2


 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 0c05ccd03eb2..03253b3150e0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1444,7 +1444,7 @@ static const u32 r9a08g045_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(4, 0x20, RZG3S_MPXED_PIN_FUNCS(A)),			/* P0  */
 	RZG2L_GPIO_PORT_PACK(5, 0x30, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
 								PIN_CFG_IO_VMC_ETH0)) |
-				      PIN_CFG_OEN,					/* P1 */
+				      PIN_CFG_OEN | PIN_CFG_IEN,			/* P1 */
 	RZG2L_GPIO_PORT_PACK(4, 0x31, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
 								PIN_CFG_IO_VMC_ETH0)),	/* P2 */
 	RZG2L_GPIO_PORT_PACK(4, 0x32, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
@@ -1455,7 +1455,7 @@ static const u32 r9a08g045_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(5, 0x22, RZG3S_MPXED_PIN_FUNCS(A)),			/* P6  */
 	RZG2L_GPIO_PORT_PACK(5, 0x34, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
 								PIN_CFG_IO_VMC_ETH1)) |
-				      PIN_CFG_OEN,					/* P7 */
+				      PIN_CFG_OEN | PIN_CFG_IEN,			/* P7 */
 	RZG2L_GPIO_PORT_PACK(5, 0x35, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
 								PIN_CFG_IO_VMC_ETH1)),	/* P8 */
 	RZG2L_GPIO_PORT_PACK(4, 0x36, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
-- 
2.39.2


