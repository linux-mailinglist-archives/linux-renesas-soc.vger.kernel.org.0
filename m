Return-Path: <linux-renesas-soc+bounces-10410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F8E9C1B4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C7B7B25A53
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101511EE02B;
	Fri,  8 Nov 2024 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MCezlR8B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519B1EBFEA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063037; cv=none; b=SPkMCpRgLVLZ7SfKUXQRn4ZKVl/GfNA5e+5E2bbtxvXsAjcqR8wU4w9i7CiG9lValhEJzjX7e9Dq2obbxeM21ytGREToAqbTd+xRyULalOytJ7MtxLJ29I/URZSEHn+/0ACMcUBsuMGnYSCxLfwfBIKSPBYoYoIsbVfMJDsM6fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063037; c=relaxed/simple;
	bh=JjIahQr6A0j7MFD+w6mZNB6iEn2WX+1Wm4FASvWAtvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a84Z+Hhem53XlTJbf1I5EQyPx3KTsYpLbI9+BvRKoFNcZqmPJl6QhahXOYB49+wWF9HLCyaiL6v+HAzG5olO0s1LuP76D7j5PB2MeG2JbHbk+NxMTAnO32EtzoNFEYSI3fz2QRHQ3cQo1sJwOSUQ/AhLj3vLgyTRIa2QDmnONEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MCezlR8B; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9ec86a67feso332945366b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063033; x=1731667833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8RwfIDsdAPmonZ2TVWnj8OzE+nZU+M7zjNrbRKY8/4=;
        b=MCezlR8BYV7NJ7y1eHnLvPoXVcOHurcSRg5/doI7sph4NSWJKwT5Gbic4XuxFkjKj/
         qa7zS1Kr7YjRaDb8v9Yu2EbO77BGyoxtdpOl5lvagAA6VKcgC5uwQAJ7Bvk1MVhavbEg
         dfjY1CKsjkA4VKrNFoIY6SH1zHEDp+/jPm2FpuplxfeisxwnvSsIkJ3OvGbfqhVznI7p
         liEoUNMZ8T+a1JPPS/UPmE1Do5o5GV4myKflWwqipS98UoV6Q7ev9bYwy9BTyxs6Nl17
         SvP9S5iU1kZh8yc751wLctE1fhiU+3ffUcu2AHqeFd5Rp+CjxDzg60mwcLEKl2V+dNgL
         4RQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063033; x=1731667833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8RwfIDsdAPmonZ2TVWnj8OzE+nZU+M7zjNrbRKY8/4=;
        b=SqAJVb/2dzahGmAhjkchiBL4FDRfQXz08J49nx2xBsfuZfUQl7X6NiL6Mdfn34Gblf
         J/RVj5ISqXZtTKI2sxMuMDfJQtL5xiSA0305QkADQlobR5deD3JJoWJ1pWMThQuX6NJi
         SRNk5GqWVINyQDW2fYnc+eXxpuu98+Nnz/wBjfjX5HmA8V5pHD/aDNrI4kBu6MT+N+fO
         evBmQoaXnIh+50F2p+VGFExbeiuR37FMIiMKs7AjaPW50IBz25j+4Cko5qpMRdSMKNhy
         HGbXckev9DrEOcUQk+uR7kcfxd7ympmX/vyDCaDQAhQfP53MPmPpoPUefeA8Y0IYRZ9X
         6sZw==
X-Gm-Message-State: AOJu0YzZkcGYcGbnyNazGnfYnII+y/BoplmLy5xDDbI2xvDOG04luZuZ
	34RX/HYLjruzzOt9vEiRr9Zvk4yO3qEZholKk4n1UJ2rLRBe123of+EQ0zkmIyU=
X-Google-Smtp-Source: AGHT+IFPnrgFfPbNd3TP73wQjFYRKTrU9RrXTJRvMfUQhEiSnGU8niQr6Ks7xN8nlYRGUMQMvIJMJg==
X-Received: by 2002:a17:907:84a:b0:a9a:be:37f8 with SMTP id a640c23a62f3a-a9ef0018b3bmr208920566b.43.1731063033457;
        Fri, 08 Nov 2024 02:50:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:32 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 09/25] ASoC: sh: rz-ssi: Remove pdev member of struct rz_ssi_priv
Date: Fri,  8 Nov 2024 12:49:42 +0200
Message-Id: <20241108104958.2931943-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the pdev member of struct rz_ssi_priv as it is not used.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index a4d65be17eb1..a359235b55af 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -99,7 +99,6 @@ struct rz_ssi_stream {
 
 struct rz_ssi_priv {
 	void __iomem *base;
-	struct platform_device *pdev;
 	struct reset_control *rstc;
 	struct device *dev;
 	struct clk *sfr_clk;
@@ -1043,7 +1042,6 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	if (!ssi)
 		return -ENOMEM;
 
-	ssi->pdev = pdev;
 	ssi->dev = &pdev->dev;
 	ssi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ssi->base))
-- 
2.39.2


