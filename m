Return-Path: <linux-renesas-soc+bounces-17072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F12AB66D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF0817235A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB79C2253B0;
	Wed, 14 May 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jtUDPFa/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C4521B9E4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213466; cv=none; b=XujAEyCrKQ/UhoyjTUUbR4+CVcpcXn3tkTpfGUfvxIAEbDIAYsGHoOxqfKKUFIa59QIk1dmoERILSt4z0uithUBeTtipsMZgI4AswraYxqKZHN0MAqTA2/Cemxcq2VL7OlpjfAd4ra+YHxrl4h+elgvfS0iosqhQVvyHw/I+g/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213466; c=relaxed/simple;
	bh=JnHdWEIPeM0wK2Ula9jh9MnaUM824531+Pq5OYIHFp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2Bzl5G3UlkhbLfYYtE1/FmUH+0TtNA8GdBLb3ZMfZf1k4p8ED0GcYMUtd56ooI6AGg/AGq2QU47zZhw3J0rbAXD4CERDeoKGfJbHdRR3XpX6gWGKqRpsTqM86uRn30EaKgZ1vzX/BMjEA3DIAyaGjuxfEqhOuQIwnpFK/lXBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jtUDPFa/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso65109485e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213463; x=1747818263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K4j572MT7sI790Ze+eK+i3Uz5b16gmlTqgWUGftrXM=;
        b=jtUDPFa/9Ql69jiYYVOviU7HYphSdOgrCUe+jrgzlzBI3DsL5reLSyvmAYj02UuQWl
         dTSujW6NhFwoLVU1S+/sqvYAKAFHx8jYRlpl+21r2meNs3a/52PvCqWkysXdLtUS9cea
         E/Xfv0sd9348LKvdcnHBTTALf2xU/P2eNPfq7mx6IvWp8l043q2P+C3wOGsKaC5szH9Z
         RdyL1HnUAUM5lHPux6WCw1yW2qJsPogGWhBCn1K5WY7IjRtxjOBpC6t/sdyjIzUoDrdA
         L1qvusUJkBobl/S8V9mVeFi3ZDeGv2SGyDdLAByntSQVSEcmn1ee51jhfSGszs1vM2AC
         wosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213463; x=1747818263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K4j572MT7sI790Ze+eK+i3Uz5b16gmlTqgWUGftrXM=;
        b=MRFpmzPh3Zj07Ml0ZecxplhXos0C29UlzJA3yD2ac2BJjCeNlNe1vCThrXKzg0zpmi
         Q4OXr1hKPcAHegga6qjrlsPS6sEueCtAUpSIv044rrDU9nTU016zqVRnZonT8uohihz3
         zjbxSbMmNO1E9GyKcOYUnijWVuE9dH0U3Gu2gS0ZWomao/6HpBObNMbHdmDOlV5idh8P
         9DZOZ1hGMV4Z4bpw0QEBzb8BehYX2eOwKZ+4vS4VdI0qLg76FzVsylErXL0KSevVQPnb
         4B+yrdikvZPmVpZ6r7Fke7dhN6HSBnoo7CdOR3Dc014IXY2YPLAuiyHVY9C2U4YraGDj
         MC8w==
X-Forwarded-Encrypted: i=1; AJvYcCUXO4eSYjvrpUWs8oGeC7FeYGCtZILjtIIi+oJBRatsV024WWCNrwNLxumOVtHBKqWb9gnsr36Laottpvc2yqqunw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUOa8/qdwy9ROU6vyickz//F0OIauy3aY4EkAzIbXsYn6/iBAT
	bq4UdOm2B7U/B+1dbUzUpi5d5LSWsp9cOyVrxCxmwxCZ7LsB8aMcmkndqqc9/IQ=
X-Gm-Gg: ASbGncvXR4Yp8H3rQPimJ/nCE50Kf8Mq5oIBsf4yUnllaijFp4Fz2dNJ/G2akRD40M1
	3huDtXlGbAM9eJLZ383gpw1X+0y7h5DJeuoyfRhheBuq0NyXNjq4URU+juuTq3qbeq0i2IpA1N1
	bmaGmh9YLCEHEJKgp/hH3cRkO4FSDLYw3L0iF/k21/WtsXIAyEvofhhcmLmYrp30eIm+Cp3kP5A
	Mc0o8IrxbSP4Lpmy20eiW35FQttUhsFgupl94WOxgC+i2f43/1FUzY1SbKHqcDP+sLgOZP9dhNg
	6nfLTYVkLTqTofGFWt/8MBET0y8+moPUv015/eEwsiLDdKZ7BnLAHgMemSezvFyCsdZHWH//F+h
	chMYD
X-Google-Smtp-Source: AGHT+IGdaeJMKgGTg/Sc7hL1ltOR8m+B42VrjYSEhJIqNaP+mgKdctUxgZHq2QuUEOmWT9ML+hI28A==
X-Received: by 2002:a05:6000:2503:b0:391:3049:d58d with SMTP id ffacd0b85a97d-3a3493d7b80mr2348215f8f.0.1747213463319;
        Wed, 14 May 2025 02:04:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:22 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/8] clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
Date: Wed, 14 May 2025 12:04:08 +0300
Message-ID: <20250514090415.4098534-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Since the sibling data is filled after the priv->clks[] array entry is
populated, the first clock that is probed and has a sibling will
temporarily behave as its own sibling until its actual sibling is
populated. To avoid any issues, postpone updating priv->clks[] until after
the sibling is populated.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- postpone the update of priv->clks[id] as suggested in review process
- updated the patch title and description to reflect the new approach

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a8628f64a03b..c87ad5a972b7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1389,10 +1389,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
-	clk = clock->hw.clk;
-	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
-
 	if (mod->is_coupled) {
 		struct mstp_clock *sibling;
 
@@ -1404,6 +1400,10 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		}
 	}
 
+	clk = clock->hw.clk;
+	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+
 	return;
 
 fail:
-- 
2.43.0


