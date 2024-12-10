Return-Path: <linux-renesas-soc+bounces-11191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 848389EB7D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469D816443F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DA3241F27;
	Tue, 10 Dec 2024 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cs7DgxPe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D624036D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850654; cv=none; b=lI010atZJp67djaZ7/LaZxXrvFUgogqNp10WzJNkxyhu8zErSW1LRvXD4SR7QqXDwdyIbsMFhwtspFIW8w0BFOQSofqRV+oInHES6TskeEYnejvlsCyQRXK0SaeB6p909MAs9XY15W8+2nIegJxpt4I0VCoIPVxBXxqMc5z+iDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850654; c=relaxed/simple;
	bh=jlwgcsx3LUvZUCXYVhjc8Lyua4wYz+90XYYggB1WV0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ijGZxjM91JkCq+byLseIWEa2U0YMHRUULvzSfri8WCfSLECnW1Dst1HQ+MvEJBB3BErD9WKZM3OkIeVgGeQyvryx6t7GwrNGKffYDGSVi6nrQtVmKFRa7jYpSIrKmWa81kMSKm7AQK0sc0ROM0FOiIztW1USUVPqRga9CfDEzdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cs7DgxPe; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so9171513a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850650; x=1734455450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMj/2kdBQwniGBjdZnm5DjNL0YdrCH1deyApmD3I+y8=;
        b=cs7DgxPeXIsJnhodf4oK44aB8VicMtAoqzJfIKp+oNm1FDwMl8RTlVOk1bTCpU2kwN
         NXtrNd3IGDmMhIf6cXonlwsD1LCkpW5WKuLRhfyfqrDyUTBQ2muc4maR56R/r4+If36f
         2lHVOOFpXUmDo598BB58RYNWXT/QzJ8/3KKCmYQKhCx6T2myAQwG3VYC13nWzr3lF8PZ
         Pr4L+mMvQh+6TtdrSVzxe16w3v/IEsInGCQJJa3crQPSC8ky/4Ge6/WFq5E6T6BVxNcj
         wEt2dkGQ+N+mJlpfEpWLIasB9H3sPfLlweeyw9XQWlbWgfrJmMA2BEEGkEuOuA853D6a
         /2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850650; x=1734455450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMj/2kdBQwniGBjdZnm5DjNL0YdrCH1deyApmD3I+y8=;
        b=q9SVuZdMe87WR0mosgH3c5Y+/azY6QSvzi125/1tYwlKFZDORoZZ/UrCW2rMRL9C+p
         lO1khmLYL6XhDZn8CYTN/7/ApVuFIDi5Cyi4jTFXk51fe4dFoBODxFwjVk/N8/f9RpVl
         AdNRQwC3PMvQFy2wGEE+LjUOTd3t6a2Na2C2E1dvQLSrVHJNMIEqCdbwCUcMuFCUDsgw
         bK6KWCE+40PMbz80vtE1+4o8E8JqAPOfuWO4vu+rZhuIQejXL2Klqu0mJdclYz5jYtM0
         P+lv8y/9q3zeB8oYbtEzR1FQ7ggpIPfOeuKUiwfYCYHxMfwGON2qqL0boLNIMnVKzGx5
         WiRg==
X-Forwarded-Encrypted: i=1; AJvYcCVrzJpXFsSuNv1A+ZCgOzy+m+aCALvEF5/qE05htdO3wsVa8vvTM7fwoqt/LgqOHaOb1xv+s0i/26e9q3+cAAeIQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6tkMDHh/UQ4dYyJRov2gxcRnkfTOKHWKrKvSsQ9wuBqJOQh2m
	IBBnZv9mpfGKWjuSl1EYM1UrhXIDaY3nm84F0s4SxvCZ+bxkKKE/i3FY7zvLyck=
X-Gm-Gg: ASbGnctJO7guDJt2Om4lhq3pRFR2NgGAo2bP9QX/emxZ1ED0sZNR3JebRpIbp3OrhtY
	WpeHv/8500O9fTDPfVo/Eq31MbuHoR5Gkst0IqOh8RfBItEWJSXwP0/9Hen2N7S1Zaj2r9rsRyv
	VmtTcz2Z/yA/+/gRVbumM/sHxd0fUtkj1asFANniNtfxyyjI7hPjLtvw6iuoWIfH7g18ygMLDlP
	fTYKPqulCceRglRA20BVdtJbiF8zOC3MBhoNlLLAqwp+wPvAsqwrlNd8VCkDsMTvho969S27lHH
	ZjId8QcU
X-Google-Smtp-Source: AGHT+IFXUw5ybDLD5qa89ZofGoIXkdy91MQ4lgB9QjSQ6ZzxsKHCx4/ijSbtTty6jRiH6OvTPqEZrg==
X-Received: by 2002:a05:6402:2691:b0:5d0:8f1c:8b94 with SMTP id 4fb4d7f45d1cf-5d418534c20mr6265042a12.13.1733850649565;
        Tue, 10 Dec 2024 09:10:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:48 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 19/24] ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
Date: Tue, 10 Dec 2024 19:09:48 +0200
Message-Id: <20241210170953.2936724-20-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 5b42eec864f8..e4cdbf2202b9 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -19,6 +19,7 @@ properties:
           - renesas,r9a07g043-ssi  # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
           - renesas,r9a07g054-ssi  # RZ/V2L
+          - renesas,r9a08g045-ssi  # RZ/G3S
       - const: renesas,rz-ssi
 
   reg:
-- 
2.39.2


