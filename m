Return-Path: <linux-renesas-soc+bounces-17147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15397AB8EC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 20:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5126650211A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 18:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5B225C832;
	Thu, 15 May 2025 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuA7E/69"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8925C6E8;
	Thu, 15 May 2025 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333337; cv=none; b=Z7gZFue25xDiW+VFmaGO4ZXxaIV5RoWq7E32Qp264BYykT3/xkqRjBYeWW9Sbe1UFowT99tRkzLSXah3sFxY+Rme5frq2S4xPtkH9U6JFPuK+xqUx5BOaO6CDE7lXi40UFS6q+zRUbymuVuQqZ8z7zBueG+wzeLaqTAcpd2f80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333337; c=relaxed/simple;
	bh=8oi7n4MqQnJPCgCIQ4o2HivG0NRxE/CM//3JeDCGw7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jezXMyEdS+sF7cTwzTyi8cY8HrFqidCvi7onfewNXXJEJGyO1kuE8BN/wi7x/c7+eByFnf3ygl4CctfvtY5ovSwpELQV1bdliIypNwSBJA9dEBEozuL+NuYE64qkABKZItJyQ8OjYUzr4dg9FSguiX1yGDpo0gliZCA/l0bv1Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuA7E/69; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so1063503f8f.1;
        Thu, 15 May 2025 11:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333334; x=1747938134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn2yYrM1UIKukLP0LvXbrmIvY2l7yUk/5s66jBjj1PM=;
        b=MuA7E/69htxRrRVzwlFZ1b2RAmtYorOpPTRJmu/tXnf1C3rnfwKIUHPA00qpGBP6BI
         HWJDeGU3ZOZ9Czlkrvu9FZTTOOEpwwDN8Z6slxHsChez4fVaRbfC/e8JIWsvQwpgcXJX
         e85EUTUBqbOdLXNl+Lm0M/tQBM6pbHeJZhWITg2qEC3kfQ0eLAviX49jXsRPtT+fuel3
         ZAQ2pAVy6j720CbDfxbm4QYcrN+DAfaL+XwuCpGzMa7PPBE4MdVMJyxc/WTspvtHxs2w
         J9AiPgyYOPBOXr09b9jHriN3lodhK/EyymssnCn2NMEPKaFORkBKhevsHwkqgZ/gqnT1
         5ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333334; x=1747938134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kn2yYrM1UIKukLP0LvXbrmIvY2l7yUk/5s66jBjj1PM=;
        b=ENdbW74R9tXUwze5vbVQmI5RM+nvs3GIETg3xZ8xmz+fR33lIqXnXIswovI+x4hJPS
         8+GWlGE99F40Y8j7hA8+A5VamxPt6Sbt6oyRP7Pyng5frQIOvceyLpyzszf1PPLNtrok
         fPGhdm30voFh7cbv5guhw1BrG4qpi85QnlmC2o66tL0DjTjusJ3fJRIL04R/j8QC5lYT
         KdBy0SZCckjakz7FCJhQFCAJDlo/YiMg45gp4BnB70nFcqb3pEjfS4z1agf/tpoY5YGp
         6T1Nw2TsOARY8r6Wg2Vy8Sx8KTep8xogQHuA7iQZ3G2jYotEf7nXxe3QfxYfyQ4H1PxX
         4B7w==
X-Forwarded-Encrypted: i=1; AJvYcCUWilQYwfhND+tKwCR8lny+ssMFHv4neTNRnO/urfrNTHTwhDxKJTg30Wyr341gRk9DePSuMJGez5p5Ndfr7SmaVqU=@vger.kernel.org, AJvYcCWvRhM4zsRjdSCy7UH6IZVcqwKPeYkiMCwrKeHfhEfsRRTTB1K0qtor6sB6SrD+DrvvB09NEUYYsbrv@vger.kernel.org
X-Gm-Message-State: AOJu0YxXC+9rXnJxys/lwsGv7kCyZvGPxEsKYibzVRu7U7/uMF53ZNUt
	iudZ5/1Ya0EtcjXDe4E51FFzgv9qViFaRMtQFqPtaON7YQVdth6K8Hmi
X-Gm-Gg: ASbGncsVR9kS5XI77e+EHekEudAs/xfKY1FEfybvcSSKyZBgdLcqgSK46iMUhG1SWS/
	6juOQj7BUJ5aX7zzvf5fXga5VUx33egaZhE3C48aBUVtYeZAURkAdLh2UNrHY/cdvJ2QQyo9C3F
	gywMAkDan9UIvY7RPklukEa5bzsFCCQvBhV8rlUVmGqF7TV2q2v4JcJ4LZgM2nY6jOKzA6PJ5g4
	T6AyVuElLDLV4J2ErEvIodOZmYUN6xbDgsTBuTsJTY1tUyMZd+gDL/PxJALAqSw95rXSGN0QfUC
	AkhWJTSsFatKgqCq5p6zdGhxBeqAXvH920kjDbFuIZ4FyT7Xce32lt/AhhoCeeUDXyri+Jsh4Tt
	bO7elcJznSwy9jiaXROs=
X-Google-Smtp-Source: AGHT+IE8zDfTUWjNT5rLG+A5krv4zeKC9QmV6pM2KSbj4VrigC6WF+Rh7NRaZUTmIELjyBa4bQtZEw==
X-Received: by 2002:a05:6000:22c6:b0:38f:28dc:ec23 with SMTP id ffacd0b85a97d-3a35c821a7dmr789663f8f.19.1747333333843;
        Thu, 15 May 2025 11:22:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm5828155e9.0.2025.05.15.11.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
Date: Thu, 15 May 2025 19:22:07 +0100
Message-ID: <20250515182207.329176-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Previously, the OSTM driver's platform probe path was only enabled for
selected SoCs (e.g., RZ/G2L and RZ/V2H) due to issues on RZ/Ax (ARM32)
SoCs, which encountered IRQ conflicts like:

    /soc/timer@e803b000: used for clock events
    genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs. 00215201 (timer@e803c000)
    Failed to request irq 16 for /soc/timer@e803c000
    renesas_ostm e803c000.timer: probe with driver renesas_ostm failed with error -16

These issues have since been resolved by commit 37385c0772a4
("clocksource/drivers/renesas-ostm: Avoid reprobe after successful early
probe"), which prevents reprobe on successfully initialized early timers.

With this fix in place, there is no longer a need to restrict platform
probing based on SoC-specific configs. This change unconditionally enables
reprobe support for all SoCs, simplifying the logic and avoiding the need
to update the configuration for every new Renesas SoC with OSTM.

Additionally, the `ostm_of_table` is now marked with `__maybe_unused` to
fix a build warning when `CONFIG_OF` is disabled.

RZ/A1 and RZ/A2 remain unaffected with this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- Added __maybe_unused to the of_device_id table to avoid build
  warnings when CONFIG_OF is disabled.
- Added Reviewed-by and Tested-by tags from Geert.
- Updated commit message to clarify the change.

v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.
- Dropped Reviewed-by tag from Geert

v1->v2:
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 drivers/clocksource/renesas-ostm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..2089aeaae225 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,6 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -233,7 +232,7 @@ static int __init ostm_probe(struct platform_device *pdev)
 	return ostm_init(dev->of_node);
 }
 
-static const struct of_device_id ostm_of_table[] = {
+static const struct of_device_id __maybe_unused ostm_of_table[] = {
 	{ .compatible = "renesas,ostm", },
 	{ /* sentinel */ }
 };
@@ -246,4 +245,3 @@ static struct platform_driver ostm_device_driver = {
 	},
 };
 builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
-#endif
-- 
2.49.0


