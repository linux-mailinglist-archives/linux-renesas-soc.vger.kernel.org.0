Return-Path: <linux-renesas-soc+bounces-10404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1D9C1B2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47251B2468C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E5B1E47AF;
	Fri,  8 Nov 2024 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JMUOky6S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D79C1E47AC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063020; cv=none; b=RfeduqVjFKwQ8l5be6MN0K+MSLyT1hLJi0bTbNuGb7E5CPA9EjBv4Rkh9KwAPGqWruXTJLwy0OW3DB8tFiqfOnK/VTnwQtZwBXxU0n6kSltadHCl4wzB7HO/n+UZ7Ruu6Hw7R7MedmaiVEsEdnXOmXUftKkv8ZhjIFA9NJcnOPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063020; c=relaxed/simple;
	bh=G6w9SU/JyPHNM+uECWSJTLvFRR12Nj03dy5VFwcn+fE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lnZnVFMjcFasWUkGzpVQPJ6A8uAzxZrqRwNHO/qFqK9WbjpqDLK9FMQrywUI/IcIK5ywQNUvHetLXDK10SjUbbmqn7DdkUpdzcO/BLnxxPlt+MG1MqH85Ii/C/kT73HNxsLbbqfQoSiw2VYHe5CgNW8lLhhSBRTa5rei5T8vreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JMUOky6S; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9eb3794a04so275707566b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063016; x=1731667816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTliOjC8o47muw2PXFdZ4DeFAQHj/4JtsrXTotLewwM=;
        b=JMUOky6Si7BteOAMJo3Mi0Y44XpWhzXYDI2halQy0dLiuyxXXLb8GuPfKrOOittzvo
         Sdp+mExdujlkayFWLoyfSWgl7g04ky/cUWOC8JKYZAOIlaFRS7Vv+it3JXQGRxuPefiu
         Rx9uiok87Mmfx8ZB2fTVJ6u1FWg2EQXv86nkdE64zIX4xQtQXwBghc1d899zevw7erR5
         plcvEiS9UEGmdf/aPaH3r505RxssssHpyYTiPOqDgnVmUGOanNosEAz8fH0fUVnUf2NT
         AU2nuoDtKMPMHpHUbhDHlg5Sw+m0nPhs8k0ktwBp4Q6+vQbBRJKZAELvOzAMqAGx/SAD
         I9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063016; x=1731667816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTliOjC8o47muw2PXFdZ4DeFAQHj/4JtsrXTotLewwM=;
        b=qkHxgkU0/90MGYKauRQKhg2wBvY+dW+qj2q9z1lOUVghHrwPGrMR8smkCZZ4//7Ayd
         ZQ/ot8ug9Zpafd/9705XMqmTxW6Tu/kLsiZieNioGEZM0VLAcORRNyPStXd05huKkSC2
         3x/Ajr/bQQkdCviwqq5P1qY8IkE+sffGjF2OgLIEhN8qUSIxKBi+XBzBeaPRabJ8RLoW
         d9AZXbQlVxTearMMzUaU0kIQqe9GhK4Nqfkred+ETRJ3VbchuKdDpIdvpDcEKnssK9UN
         yOIMM75eIscrSZBpwT29yY3RDSzjNGd5Qrv+3A1lY1WIdXyA8zgA3XDIhvM4y/YtH1hi
         k/Pg==
X-Gm-Message-State: AOJu0Yz3defHaXNrtB13j+jklq8cUZb+Gx1yGk/WntYz9AdbGi4JGjjG
	DrwTwqBC/9mT1CUzphg8VioK3VzBaqXpmuUtfuBve7+ujBfWYc9etzaadKmgCdY=
X-Google-Smtp-Source: AGHT+IHBudDnUY5c/ccRKDOgI0Wk4Gwcz9Ak4iZWC2EMYNOBaQ417ZT6U7DBOFMInbbrD3TDu5MuIA==
X-Received: by 2002:a17:907:3ea3:b0:a9a:3fd8:9c95 with SMTP id a640c23a62f3a-a9eefff131fmr192652766b.47.1731063016457;
        Fri, 08 Nov 2024 02:50:16 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:15 -0800 (PST)
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
Subject: [PATCH v2 03/25] dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock generator
Date: Fri,  8 Nov 2024 12:49:36 +0200
Message-Id: <20241108104958.2931943-4-claudiu.beznea.uj@bp.renesas.com>
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

There are some differences b/w 5L35023 and 5P35023 Versa3 clock
generator variants but the same driver could be used with minimal
adjustments. The identified differences are PLL2 Fvco, the clock sel
bit for SE2 clock and different default values for some registers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/clock/renesas,5p35023.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
index 42b6f80613f3..162d38035188 100644
--- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -31,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - renesas,5l35023
       - renesas,5p35023
 
   reg:
-- 
2.39.2


