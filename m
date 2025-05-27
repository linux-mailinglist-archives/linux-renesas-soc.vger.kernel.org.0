Return-Path: <linux-renesas-soc+bounces-17555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DF8AC4D3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 13:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51DE8189FC3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8D226A0BD;
	Tue, 27 May 2025 11:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lx/gSGfN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9A0269826
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345068; cv=none; b=d5M5HXYrOMpVtZdc8k29UIrrpG2EBbmFZDekAxlaEV+f7Tx+PAh0r0Qb1nitOvAJ+2gbUDPl0lrEYu2FHBG6ohblQKT0cdDftxhvGgTbBZgIbdYlPLVaHeYcwT+0LkFMh2fV5YoQhEmqD9DX7gMYgPcQsfgfjjcWrsaPn2gi0XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345068; c=relaxed/simple;
	bh=JNetTBKeCVzrpVSgQrKDXh0nn73Cmuetb65CN4hLZuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHH/IF3r0cVSz0blB6I1ZeaVsQv2yXfWqdR4YWsv+GN8HMQKJHsfEbdEn4kmVD+XH8tRs3V5OwwnOLdP68EQaT3q1MfiGekCtKvRjoFQtJyTugGKGS+2GVocwGIElnFMLJGn5qn7YyupP2VeYDIcnWLKzG/z1bjMRgsuwsI4jhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lx/gSGfN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad1b94382b8so542762266b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 04:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345064; x=1748949864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aELTmlEfKCAByNhR0BeCy3DVdg3Hk/gRSgPmB0KiggE=;
        b=Lx/gSGfNN/rqyZtjWoBBuXeEtZI0o7NicpioRvjsTfcSWe0OfBgdkhcvvDFGCJ/4a/
         I6DbIykAeVO6cRBurn5wmpB7lPcPREaSaHIdGI5XeAs4FtPdgTSsSD3E+STLviSLdeDx
         3jos0EEeq7fjhNUWPZcdztu0JzTgbY/Bn5WIYv45oQ54EuxMhRz0M/Dx3qRuz5qi8z0a
         B3HBx6hdhtmJVtaTTTBqnGXVEw0Pw3naqkAORvDKv6UrBFPJLMdenT+Jj+KJJIdO46kQ
         Om2gx7YJTqIty3+68hrTaUoHL/GKwEz+h+m5Cp67lywE7mOofn31rLE9fZqrhio9GynA
         DSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345064; x=1748949864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aELTmlEfKCAByNhR0BeCy3DVdg3Hk/gRSgPmB0KiggE=;
        b=ffvpT/x/U4g9hno6HxGFNdXxvo7rxSGRxgphWNbubJRSGuOO1fV2riE9F5qdxss3kg
         6KpUvYsKabTFrAp4rMlfxtr46eDaCSeubDaNtD5YTA4LqfR+tVYbNCEHnRbcRrXF1DNc
         muFbk9P8OS358RATcvDEgrrePq8HqbvT+qf+t2faW4ol3XwSAYJj1xXNP004KYKSsajX
         uMzgNJ6VATbSBvgAbfV/WPsKHwjaVVf3yVEjBSXNICgdOdIYbQ67IyCWjuBVxXm45wx+
         8yZyEa4PX+AERKxqXARkTqOUgVFXx587wtpGlz1Hs0VIBUbZHe1mQPejRzNAwwoiv/PO
         UXaw==
X-Forwarded-Encrypted: i=1; AJvYcCWU2vII4rR/VakwqW25rsILfanZ/j5F+cfjek+yRnVgAMn6JK56WZs065ujWyGcXGAIEYqL2pJXjZ+5SLnuRv5nMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI56Ux5SEdUmW6v8RTR/1R14uq6puwLefwLyVsLB7I/REuyxsC
	lU45NGPe6kLwv6xq+74X7yIPtRA+PGRWLYxONNbt/7NP5AWLzDCnksudwO/rEXnaCmQ=
X-Gm-Gg: ASbGnctHVVVdoHJsJD7KDmW0uC9mmD783OcfWHYWlHMFC2ySinGqTt7vMKY4+ZSfg6h
	U5WVsUrSM+ly1OE0Oul0PCMNYFTi/D5Oax54+ICBGFsdGQm692FaBKAm+Lg2UABtFGJa0QPjWMt
	6l3c6gForz84HD18T5dv+bxLr58nS6stIqkBxkMKCRWWlGvJZ6zv7ZMauXBOFa2ZDUcSQiwIoI6
	A//fVUVH0aRxUdavE85RKOVdBfwhoPxrVAr+3AS9gszLBUfQe8wfoVv7LsztMae92r8h8naME2A
	wLhR55gEhdJdVr2yyoV3k9VCpdfy/WiiaD/QF/dtTSepesyGe5/H6lJ7kaWZQcA5z5kimZ+VDwh
	O0poB
X-Google-Smtp-Source: AGHT+IH0qBe+DR1WbAi8SJNopWYn7T60qvkLsrw0PuKe+GwRXeTQ2TMf2+Xjj+q5wrNMTSeGjN4KfA==
X-Received: by 2002:a17:907:72c1:b0:ad5:2260:e018 with SMTP id a640c23a62f3a-ad85b2b5dd5mr1077079566b.44.1748345064416;
        Tue, 27 May 2025 04:24:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:24 -0700 (PDT)
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
Subject: [PATCH v3 8/8] Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"
Date: Tue, 27 May 2025 14:24:03 +0300
Message-ID: <20250527112403.1254122-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

This reverts commit f33dca9ed6f41c8acf2c17c402738deddb7d7c28.
Since the configuration order between the individual MSTOP and CLKON bits
cannot be preserved with the power domain abstraction, drop the
Currently, there are no device tree users for #power-domain-cell = <1>.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 .../bindings/clock/renesas,rzg2l-cpg.yaml      | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 0440f23da059..8c18616e5c4d 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -57,8 +57,7 @@ properties:
       can be power-managed through Module Standby should refer to the CPG device
       node in their "power-domains" property, as documented by the generic PM
       Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
-      The power domain specifiers defined in <dt-bindings/clock/r9a0*-cpg.h> could
-      be used to reference individual CPG power domains.
+    const: 0
 
   '#reset-cells':
     description:
@@ -77,21 +76,6 @@ required:
 
 additionalProperties: false
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: renesas,r9a08g045-cpg
-    then:
-      properties:
-        '#power-domain-cells':
-          const: 1
-    else:
-      properties:
-        '#power-domain-cells':
-          const: 0
-
 examples:
   - |
     cpg: clock-controller@11010000 {
-- 
2.43.0


