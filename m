Return-Path: <linux-renesas-soc+bounces-10421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B64999C1B86
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758A3282D4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7B01F76C1;
	Fri,  8 Nov 2024 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GsElz7ay"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45FE1F76A2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063066; cv=none; b=Qxptcj7MQiyj9JSOacPHFafURbfkwEh66WCUne6F7Z2hqrAPi2tNjiMbbOIlmTPUXir+Wgfuh3JcajVk2oh8S5rGmrXxJhMJBTri49uhHNGcfOjMvdCyCV7fJI9UBIFmWHn0QH0gMgrCl2rp4n6sCIetHmzZtB7Wt/1bryeV3gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063066; c=relaxed/simple;
	bh=SyEoER49TgbOw8koZErfyUVPRsJyjMMAI7/EzV/zhUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BDU2LteuaQtB+nHtv4KwwjT6/qAuVaStHQZ8nGu3DntI/AOKlMHSG3IHJ8+1hdYLFPShOwDwZvIXmU1jfRrxZ4GfztAbTOOlOzeKBKBl9GedcLU6LlApMg2byYunsQSMNsOVoiloKDH3k2OvZhCkdFuPVo7JgpAHk39Rjzq6dw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GsElz7ay; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316cce103dso23182135e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063063; x=1731667863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2LUcK8XuSXr1QJcg6d30scYHZwVtB8a9hiw+Z/icFQ=;
        b=GsElz7ays0ECMk/ayx2Wst8VGX/Uvgve9qxcD5cAeBqwubUcGYwVpS/aKx/GXoAMOW
         UvGC3bh7jz8OFwxr7wavcWXpoZsAMNKG6Hg6Cg08wZJD/fsaSYVjDuwbaMLdmSps0Qal
         Z09LbfAvKnPjrDK6zHdzTzGohDXVqksQWW3baOyoVeWzm8w1Q4xFcw16qUeH2FdcxsHD
         mmo7Ofw+vH0lgt769ygHc5OuN1Cf4y7E+tSZNMenEULy1Mg5x9xaJrVT8vdtO3kJH8MF
         XvDMzQNP6TMZZUvYQAGXWtIL+jX44TsiHAqh8/ka623I2uP62VHueq86wJVCkFD5nppW
         eRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063063; x=1731667863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2LUcK8XuSXr1QJcg6d30scYHZwVtB8a9hiw+Z/icFQ=;
        b=faqBpjTN2H7blUV7uqpEUyl0ZtCe212Ikj0r34GQIn4fEFweCST/riJRTfTNzeV7ZB
         3nrMuUX4a0UWjslm+YxMgFLR5d3GY6tNmrVMilN7yzArj7BgPyVIhBDCXaILAobOH8Xm
         JH7NnxNRuKPoJzYn1EV0jrZMsYZYYZJKlCBFvN1VZ1s0JC8J4ez5vfd1FhL5wRK40Vas
         R5iH3kydGv47TgfeHHX2c5AEDb14o3aVWrnoQxfFqeAKk0I6fqKsyqwt4/lcV86jVwij
         C+0qh7W5kzVrzo1nrU3Eiz8FU/iYD7NtVaKpLmJXbg47vIWkSiHQLr262Au+3MUk4cNu
         4NXA==
X-Gm-Message-State: AOJu0Yyi+2iTqfPD4Gx3kYbANCiD+74sgDtZzKfg8hYtVG9Ofnqd170B
	9JDADJkuZwbOTnBltBZunHnrsmnjh3C9X8sE43IAol3ped4jS+H/rCLZzF8sts4=
X-Google-Smtp-Source: AGHT+IH6ZeLrSNR+Q2akPh8YjeK/N2E/SJkNwBkiadlJZfpyopK+oUuuSM/gz5YCrmaT7nw9pdyYRA==
X-Received: by 2002:a05:6000:4022:b0:37d:4f69:c9b with SMTP id ffacd0b85a97d-381f18726a8mr2396102f8f.35.1731063063174;
        Fri, 08 Nov 2024 02:51:03 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:51:02 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 20/25] ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
Date: Fri,  8 Nov 2024 12:49:53 +0200
Message-Id: <20241108104958.2931943-21-claudiu.beznea.uj@bp.renesas.com>
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

The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index f4610eaed1e1..cab615f79ee4 100644
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


