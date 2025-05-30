Return-Path: <linux-renesas-soc+bounces-17719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD211AC941C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 18:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7424F1C217A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 16:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AFD236451;
	Fri, 30 May 2025 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j83mPTAk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4125A23535F;
	Fri, 30 May 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624357; cv=none; b=uU2KRT0cq3k1IrONZRVQrlxY+PKMIW1FKANP5w3i2l5JfTB5L/ohqrK8Vbf7aJZD5DC5zU98vFpLScapuZkd8r3nImquQaOVHp+GSUtnwBVcVu63AfkiBkg+aw5Oz3Ys5GBzgMaZXQQBoezgcbNBmyB6AdbSnJAdAhz5nKvxuI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624357; c=relaxed/simple;
	bh=0q0XCyXywJW/BuudmmZKAbEQxMqCT1HCcBS7mwBlZhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtbZGWQBrr/6QXKO1hpbfGbBSaU0Q9ka1J5xnDP6JJXywfVEKaUE9ZUirPyiNeadLB2cfjoY1lyqzjetaMssl1+xlyzZqZgNhIOvT61Al5GNDFzyJy7fBEa8LgscoIKoyKsA4wcfeNUx3bXhmY+k7g4Bz5F9UOCW3rIKtcXw7fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j83mPTAk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450caff6336so13131945e9.3;
        Fri, 30 May 2025 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624353; x=1749229153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoEHKnPQTr5zR3ciIiMZWPKrWLoE2LlKJRQLW44Bmv8=;
        b=j83mPTAkOqi15LMC2qfN37z3g1TPgg6Ox2Nr40pUG75Ki2gluHp6oX8cgRUOWZfdmX
         PPzQeyd/FIKOYZbjQAwoWtEeVvyTeMG/YRczpb8g+Co33RoEP/p74ZnQh3sbpDrdwQ6/
         DUm4sezrQahSbMsSBaEs109exSfc6LijzPbb6Eg6arwSjkK9jelxHfThbTjQHdZSJeLD
         JC112Gc7RqwBMP0MiuytOsH/UE6oKq5PE8Ulp5YBX//W9j1Sgo3DpaVUbn8S+9pkr9nO
         /t7ElgzGBWogXQiMKrtLvzQljfV7uHiTqe0PppLD9mDShfyQCa2as40pLdyASQ/0V6GM
         rNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624353; x=1749229153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoEHKnPQTr5zR3ciIiMZWPKrWLoE2LlKJRQLW44Bmv8=;
        b=qWfIiBI7ymcY/kZ73Wyhcz/telb0Juv/nYNzNqJcDxcy4FHLC5mzavGM1axXkvH0S4
         EQTed7xfb7Q5gVVNXtJIQzo2YfISijD2GUlPSklX6cQ07FvV9DU2ihW1I2ZhwIlGPGl/
         3Ji27Ym+pRHfUOpKtZzBNXKcxeQiQlGfgGmzQOdO9a9NWzKVvm/XwQzlUrL54HVJ+hbt
         PMDHfb1kW0K9Aaq5RYEgiWLtq/p8npiZ7CfIgHQy5vYlVCkKmvR4lUNnWbevEYuhau+R
         jjx9T5eklIoo6WTZvn9b2O3Uls3Dj2B6/tm01U68POhEh2lBeYYeYAF2I/BTECjpOTe2
         npgA==
X-Forwarded-Encrypted: i=1; AJvYcCU9tHWk8mFVskmIckYVM1RXJqFkoFQSPnxZierxRUqs6DuhkSc2SmlrHXBarzdfXrSKmDhhkRPyDhHUAQ1iVG/6TVU=@vger.kernel.org, AJvYcCVB/ZjuCJxvRIHymFLIB+2lKBZ15Ocr6f/IlfuIXAZUXwTKp2z7FQKO4+V4J5arTAaDVEN4yxVlzBSx@vger.kernel.org, AJvYcCW4t35Re2nuoe7pha5vY9L5GOvHsovIR7Snws3C/aCnfvWwHAeTzBzRX13Oh5l1GnIgN+IjDGvufl9K+a3M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0QcmJxPGOs4D6/t+kaHXTYFtQVsK8zO4aJlY0jHjIQvrvScV5
	/zRCkzRExBK8n+M1HiXA3LqxqHDZ8DTHVVmqhVfKO4IKp2Vg51CkEp1x
X-Gm-Gg: ASbGncuSIlyjn/uLd2UOhUnhiompSCaG6e+IH1FNYYz6YUnckbp5KBv/999EeJ7uT1R
	0Z3oAX4xEgN7mC4SQYboba3r/kTmTLQTlrRLjm6bz2yKIlV9jWbbYe7TEnvBLYK0L9d6OOMVkTV
	L9eUfCVisJkjt3iMj6BduA4+Q4rcFEqaZVIOKDqjWKPoISz4p2kV/BjWunyfS8yV717rRYYQigA
	R7fJtra68xm1LSDL1rIrDN97R7XY4ksUHFxwatfxCBMGx1UO9pQLxnrvYZnQDnIHXcC5taGXI2o
	rbvU9nMooilLS4ZjtPrn1BG3iNl4Z9dgbnmyC34rrLoaeDRMVwtQpUw2xpT8kJc7SFXI9IgKFd1
	isO3xz6+3pg==
X-Google-Smtp-Source: AGHT+IGU2TmBQ9qYoBu+7qGqXAJP1YRkLBoB2GytIxCWe+V6JfpaNbAs9IJwJp2wzD66imLtn9z/sQ==
X-Received: by 2002:a05:600c:620a:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-450d88493a1mr29456355e9.14.1748624353393;
        Fri, 30 May 2025 09:59:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Fri, 30 May 2025 17:58:56 +0100
Message-ID: <20250530165906.411144-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Added reviewed tag from Laurent

v4->v5:
- Added reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0


