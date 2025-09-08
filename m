Return-Path: <linux-renesas-soc+bounces-21551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE3DB488B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 11:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3EF01884830
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 09:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC862F3C28;
	Mon,  8 Sep 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDZ8Zuqs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83072F1FC5;
	Mon,  8 Sep 2025 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324381; cv=none; b=j5aMAdYhmlUSO0eekY1OVm34w5N9zBWpbYT2zMvu3uiO5NzbfxNTd3TNVrnf2v8sGIzENXQ16W/H6sMDPGu58p4HWSUJYvRedeAi9wy5t/R0lraDcJBvA8G6AdwHSRd/AtUOmCkAYoq1Zvvly371QiNMha4d8juRwrm2NRiyAhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324381; c=relaxed/simple;
	bh=D7rhmBu26s298v0dU1yt7KE3oat5JXMDIUxawTvpBJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jg31GbPM3iDMTQmccbA8oQZ0NSm2vIStCy/X2KOHtUf/+YBIPF1uUfVIIiRwCgN7/pLDSjF8fBHJwFJNHa/Wg4YWtXe6U1GykTiN272ioltIocjTLdxFjdwJ955WnRf0V0veU3CJTo2fvn39OlUoJzErWFiisUtzAzuHJ7u5Gqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDZ8Zuqs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so27200685e9.3;
        Mon, 08 Sep 2025 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757324378; x=1757929178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FoNTng2g8xGN+jJlXKEcyc5Crvqkyg1xAFD2CRuD0z0=;
        b=EDZ8Zuqs7JrS+LyqcwbUSUdPjOBC85mwDzN7ynzyeeCZyoOi+8FXwJzQ52QcsShdDx
         gzz5W1dGH93T2CClOyMoHig1JLtaD6gQMsgHScqv8Gi0HIISkIm/f0jqYl88ZgAm3tiu
         3AALX8nHa0eoa8JEJsO/834U91rWht7hHRCfKDGMS8jHzy8qGc1mPYIi+h6sdzcKNTwR
         yTW6/BTGBxKfZPq0iYRQC73KsE4qai248EyzavHrwsIz1MO2b/HUQMQfkB+74NVEtcKa
         Qj1AqJqvSBYLtey3Efosa5zXMhMp/asOA4a81O8aVLfeG41qxWqbmnDQJiyhD7VoYlg8
         g5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324378; x=1757929178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoNTng2g8xGN+jJlXKEcyc5Crvqkyg1xAFD2CRuD0z0=;
        b=gSC3d0MHcRzz0VfAPmM2K7fsQXM+sDsM//UcLDVpHL+ZZzqukevz+wLkXFhk/IrYnQ
         Y/Lo0udQ2GSvSAFo3v2gwkCN6F3H31rxbfYh+pCQUrk62GgxfrC2VRDkE1+tO1FeseD1
         R9fN0TWwat9rjEY19/xYIwUPtCiClKLoLRHC6RKW/bjlVrVS352aiAEzFwqorknSqLza
         mtAtjOkNUhkYAfswnpdsOCNskObF8krfv2Br3g9BLtND30vctmogs2qPbDuIgyf6MagQ
         BnAStMcNk5WoF84yGTkKhE7Pw75eIbMN+pLt8JouzG8FqeAg9faKnteYM4LlAC+z6N6z
         TAbA==
X-Forwarded-Encrypted: i=1; AJvYcCUaohKU2609RLcZLZFNboikkpkRGsA+2hlsJdxY+UYkbHYVaA/NswzHkL5w7MDuOl3KEscf7dSCBO7sFMNIHfZe61A=@vger.kernel.org, AJvYcCVmDQ34SA2R+CZypF4cAp3RJ7nlKu7itRl/AG1EqTxrAtcbHZZsSfsTBPz2EBCdZZkvMi1tjfSTFl7b@vger.kernel.org, AJvYcCXXf/L9aLwNTAP5dU7pPCbmaPJwRA+ZBbucFOlME1MdLk4fA6YYgsQ8Qa4djiVuAArt9OCAUCCiz8ybuXTA@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8YFvycTtuFiEAd4b/RrjiQ9iQmEzQsxHQIMC5F5tCDe8aRoZ
	1q1kwLPcZHPMf2N4DVSE2/QQGPsBiZwOPK4sXuw2WTeBwuvZuEbpquf4
X-Gm-Gg: ASbGncuAcEnAFOSLDfwEUHngOQtDbB631JgPm9XVHvIrLZiifiiWxaTWbFHVHMC19n4
	nb8o4S5tLOD73Adx2yzGoISFw7On/PN+78O6i8NUqffbZWi/04oGjtxl3G1VxySs6YkVDORTfYV
	euX5n6CCHj7cs9c2S+OWMnFMldS3UODoIUQ/0RytOc9U3XFBppSKRjdipjxnYod8KBZyAU3LjeG
	4mQqrls+DfzjMLIitehT2hOr576XFFxsXq4En7qZ/Era1CMapTevqRz5qbtiFa9nRBGG3soOR41
	EqKrFjiViQLmWNgQBlttE7SA+pAEyZXCuE6APimg6pZcpoTxgJAU9xb410BZJwbpGEXRQXAAl+H
	/i/7D3sO1Fx8RCF1Ao3JAB5MEYJ6OaekhBQOUMuH1c1jCJThTdvLAgdiwTw==
X-Google-Smtp-Source: AGHT+IFml8PnnAXpMs8BuPR8osBQwIT2QiyRTX2wpse/oXtLeUZ88FAGrSWz/UMrvgXxN18WVpRXhg==
X-Received: by 2002:a05:600c:1f0e:b0:45d:e326:96ef with SMTP id 5b1f17b1804b1-45de5557e89mr31294655e9.15.1757324377828;
        Mon, 08 Sep 2025 02:39:37 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab832sm432020995e9.23.2025.09.08.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 02:39:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
Date: Mon,  8 Sep 2025 10:39:30 +0100
Message-ID: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the I3C Bus Interface on Renesas
RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
that found on the RZ/G3E SoC.

Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
"renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
"renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
compatibility with the RZ/G3E implementation.

Update the title to be more generic as it now covers multiple SoC
families beyond just RZ/G3S and RZ/G3E.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
- Updated title to be more generic.
- Updated commit message to reflect changes.
- Added Reviewed-by tag.
---
 .../devicetree/bindings/i3c/renesas,i3c.yaml     | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
index fe2e9633c46f..a20d875086d4 100644
--- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
+title: Renesas I3C Bus Interface
 
 maintainers:
   - Wolfram Sang <wsa+renesas@sang-engineering.com>
@@ -12,10 +12,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a08g045-i3c # RZ/G3S
-          - renesas,r9a09g047-i3c # RZ/G3E
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a08g045-i3c # RZ/G3S
+              - renesas,r9a09g047-i3c # RZ/G3E
+      - items:
+          - enum:
+              - renesas,r9a09g056-i3c # RZ/V2N
+              - renesas,r9a09g057-i3c # RZ/V2H(P)
+          - const: renesas,r9a09g047-i3c
 
   reg:
     maxItems: 1
-- 
2.51.0


