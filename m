Return-Path: <linux-renesas-soc+bounces-17080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E267EAB66EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 685FE1B63E27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 09:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A4022ACF7;
	Wed, 14 May 2025 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hoc7v/A1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842C122A1E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213479; cv=none; b=e7tRymPK/ZoQLi9loouSeJHBnpqG+eeS0TzuQjWDgFkNh9wsbLoz6HspI5Y5epN2jugQTEq1QWmRTqyywqEpUAwfQaqPxrrAViqlmIwFX/JNB43BecLGBj95/EP0JyOfbso+NHU5+U/lI2X4F4gq4hzhEEVS1ha441I3Nld7y1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213479; c=relaxed/simple;
	bh=4qxzgRYj3R0YSr5c7wuqfhdIlrtZfod1FQ+TL6UyLXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYT7riifPGI6nYu9Iha2bKUrL15i8j6XAJwZLlONPpQpz+r/cu+58B/ch2BmWSqKG7IRVicplqjtVt0nd4ToIf2G3PaS8LW2UuZX9RJYOW78ttJRviaWGuXrBF7IvERbHjfJfToJOQo/kEgXmSTmcoK9mc9V86GftMQADzXalGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hoc7v/A1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so3553343f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213476; x=1747818276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlrLdd5J+/M2OISiprAv0x4oZKgNtFnWiJLXGIklBOE=;
        b=hoc7v/A1yzO8Gv8DLZUATdV7x9gpTuSgqMrYFj9n8A0nVu1qubAijxormEOpnLpGka
         TdfKSLlcmo/l+giozAANxSQwhoejjL8454YEEAruOmzVIkQkCshCsJwg+S+tcIjkjTAu
         7T08bf1GeFm/Kxm1Bf4T9BrZqJ93F3/Ougc4CiwoSv7zogZYvFkrn63tV2GQ6rQ/8y/q
         +qqF0+soqWm2OAOVS/Jrmfso60bViI0tm3K5BGui/cxLvKwXYI2V63d5zxA22pDkiWHP
         hZUBIFjPsyIkcAZ+6s57v92XzqP3cvlygtL2rBltAOuHo4V5WgYizstZzVihU6h17Ouq
         z5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213476; x=1747818276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlrLdd5J+/M2OISiprAv0x4oZKgNtFnWiJLXGIklBOE=;
        b=RoZrwJr/leWABtoc9e7gb4M/Yifg9ACWglFS2JCBGyr0bHd8QvXLz2SXCeNMsqfppn
         CgburkDPXnwXy0t+OcI2OuVLJCX/jCqD850GIZ2J3PZWjKtu7tmkr8tlI3VdfdS9Fu7X
         GF4o3FyC6K39ouIc6I+zK2Jz3xb0JWOrgcbo8lCFJ1mKsrskHmfLP8T0hp8QpDRNjpnU
         a7VnfwdrVCttp4indfDGkqtuMc1h9XbqrpjMygGS7Lz8ygRl/0qXAbovSNHuBiiKXxCR
         x5ZTVxbPLj73VycsbG5K5gLiPGLURSK/ysPGRkTn+tF/bsGjoW/zBmh8ueeDI27Ttsq0
         frVg==
X-Forwarded-Encrypted: i=1; AJvYcCUB+WKMKMw1J1nAReEvbaLf5vj2aNAq6sVOB/+DDXukxGHFNqiJOgFSK0EeOwCKBC8YaLNkfecWwDE9DhNQM1Pzpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydAlLu1g3bt7pHSzKM8qlJGhMn9TvbusX0suKomcLS0mluLWne
	+jPGC/aYbPaYS+US31PHs1Y0EDkhAc55GwHbR+SuPh6OHJqPJa26Lp6DEEDdKBA=
X-Gm-Gg: ASbGncsEhlN3RMQPZKeNccXNFfheI5TBONVnameV/F4Iz5HyZtGIfWgvxJe7SP+w332
	jinHhVToACNMTA9K6UhiVxRrh/MeG6o7DQj9yXW3lF3lwQnjAhY5mbc/aDFNQ6I3awsk3R4GLpJ
	xXt5Lp1aPsdVItRarJE5z+suR4LQs7NFpaEF2L6tvJpQJwrmFBAEzzcpm/4f/pP+49nQvKDZ6g5
	WnFNCLZdTHc1loGAh51Kg8qJOJ2S7m2ysVozO0DPvQ5o7r0qT5pGJKWi8+g1bb3eL5czjBugGR2
	K3Tz6olkadlfj/q2BCjE9B6GX+XDKrUgaJH6OZCbyuTB63+sszWK5mveySvqVryL9Cnl4lnXmDR
	G3HeI
X-Google-Smtp-Source: AGHT+IEKWrUAq9SfIgehioeqh/K72TgwuXn7Fpock53ym5/tWn404/btuDmLUE0Kr4GNSRDHbVTVpQ==
X-Received: by 2002:a05:6000:430b:b0:39e:cbc7:ad38 with SMTP id ffacd0b85a97d-3a3496c28cemr1869568f8f.32.1747213475727;
        Wed, 14 May 2025 02:04:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:35 -0700 (PDT)
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
Subject: [PATCH v2 8/8] Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"
Date: Wed, 14 May 2025 12:04:15 +0300
Message-ID: <20250514090415.4098534-9-claudiu.beznea.uj@bp.renesas.com>
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

This reverts commit f33dca9ed6f41c8acf2c17c402738deddb7d7c28.
Since the configuration order between the individual MSTOP and CLKON bits
cannot be preserved with the power domain abstraction, drop the
Currently, there are no device tree users for #power-domain-cell = <1>.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


