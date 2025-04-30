Return-Path: <linux-renesas-soc+bounces-16537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ACCAA55C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98B21188EB92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130E62C2598;
	Wed, 30 Apr 2025 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtRVGrE8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5292C109D;
	Wed, 30 Apr 2025 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045684; cv=none; b=nkHtICUCo2I82qzqSpyvD5qxLjIYDbWIgILzzDka6GP/SbpPnphSUksYoyHxWONHGOZZdaQBvoy1b74c3Nbbl3cqOo9EfnrWiDKfdNlNoohLMqRfEG3B6rXrt6KJWEvP4KT4+MbeaENGlk0wSxiZFbw7oIfodRDUO3On6p52qLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045684; c=relaxed/simple;
	bh=/3UqE+nJ81H2bFT7tSQx1yUjvAzmE4ntpdhfUJuGAjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6qUUyyH8xZaLQ/RJejwg4TzF+AIs4xBbvxuBQGhnGrSf2NnSEQicMVRfS3S7mYoJqF629buwREdgr4rLvWQhvktW4AANm/8ZkirygNTG3oToi5Ssg23Oh+LjIxSiu7EvNLdoFuX+D9pY6saIRKI4WjH+b/dSlYUdgHhSdrtvW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtRVGrE8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a07a7b4ac7so92816f8f.2;
        Wed, 30 Apr 2025 13:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045680; x=1746650480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=On2oKS4KpMiFNX9GGJWebr5I28XVUIr+D5gExlaa1s4=;
        b=ZtRVGrE8r4HwVL1/NIAn/Jn7C0vYzb0lFpccaTsrhdJfCFHI+Fp4j2RZb5NoRgTGmT
         s39XOe6QFVdNdyvKHN/cbAampo34lUuONci/buc3dxkb56ESoVT5yO1+7163IS/0yjYT
         kkHUtEuqDfkWDmFiQ+G/Xun69dDe0CQs8LmbfHnRrN7FQFpyzc93BdJrgg+cSy3bxgtw
         jx2A4VO2Jia6CrmYfDAj/FN16jwDpw0bK72RhyLNflU7kHIRdOJnEDQsdt5XGrlEXPTL
         vYGsXIZq98AzcYUmsx0DcrCZvCQ/UClg8N1v9l1vhZWTu/6HwZkVt96PfobX9s12IRat
         i15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045680; x=1746650480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=On2oKS4KpMiFNX9GGJWebr5I28XVUIr+D5gExlaa1s4=;
        b=kUDFvjttyCrlUPHT2Zgc72dF8WCh14/gaDAp7se23csaANHf7Kp1Z/5hxwHzSuPQKE
         21pVofrsbQgqVOgQxzFNEsmyHmefU/E8E4cTk0LneCFxMWbYwrwNtrApTmtXxvHRPNEx
         UyLwc31yG8VFbEtWR4Bia1GU3WAwSvRd6/lD9MjaoKkfXCdAaXBGQkqmBzT+vkAqtjn4
         MvOop/exv+8La0BCxqTC1JSYZvV+YuRKgkaThqPcmQSKPXwyw++yIoEkBe9DkZB2mByL
         ACkj+bLcxjPRNsH/EnDubq58zbTm3HdfelfEjdoRwKAguE2s5iep4mMHGNDDHhlSXTmX
         yM1A==
X-Forwarded-Encrypted: i=1; AJvYcCV58R/d9q4iT1JklQUeXe5BpfQzVcrwgZ/3jnrzFTauWb3WxbAf9DpyPLxHziyZSC8eCXhUNva53ZYF@vger.kernel.org, AJvYcCWWOAF5ZI6dqbnUOY7wmnQsMz1bT8jTPyLoiH3kISfUMpsb8+FLctaZ4k85V8awDwyG+UTfvp5RL6cdkCPb@vger.kernel.org, AJvYcCXbEh+Pn7MNkaWaIyGtjUvBjsUmxvXZsiAp3lS94duo9CVie88pMGqpPOsPsEPxHtpUZud+YqOY0Lc3WPIMmML0UZU=@vger.kernel.org, AJvYcCXn23kfHPVZZjPOMYAoGcbf+7DoU48txxTYmVSSQ75/FxWkraFcQJyMBksfkhB5+D5KPIdQgx/BSV9N@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9aai4wripfEMdzJ0xQHqcDMiGzhnJ5C9tR4SRsiW2kudMp9W
	3l81jajhbn7zHRWh/QP+wQEtfOXtakkAb4Mh+Tlq0JB8fgsJmrH+
X-Gm-Gg: ASbGncsELy+cQpeMGTpuMnkp/gpQxCJdmZkercZ2wP2dqBRTjWL6XdvQqwK/Vu/NfZm
	tjeFpR7hJF41AzJelgYgW9vgGFyDKT3kzn0lGpADd/hAliCEehtK0lK2bop6V1F0HTZTS3gYO0w
	XSeohCowis76hfA+rMorQF2Z2clLX5dv5cRj3NhNQzqTO6btzJUzfH2zY66Hc4juDWr+VTSDjQ+
	d7SFlezTs/PlYdoCeJUbpDx43XU2q3RKZ9XDEwT7kw4TQOoApr82hDq4Bu3JgP+kghFB2UcFjEG
	tuooD8Mw5kacKXK3/oaJwD71WTUuvyhUntyDVU7mr9b2cwf6c/WK3QWDLaUCqtQuPPSFz1YoFjM
	=
X-Google-Smtp-Source: AGHT+IF1Ipl/5U6SwjsJg0vzNSDQtkdpF5VTD0kmaDcq3x0fBQp4qrl2QURIQ/+alWMxNKSu0iBmGg==
X-Received: by 2002:a05:6000:2284:b0:3a0:8c68:19b7 with SMTP id ffacd0b85a97d-3a08f7985d0mr4459303f8f.3.1746045680588;
        Wed, 30 Apr 2025 13:41:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 03/15] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Wed, 30 Apr 2025 21:41:00 +0100
Message-ID: <20250430204112.342123-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The DU block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC. However, it only supports the DSI interface, whereas the
RZ/G2L supports both DSI and DPI interfaces.

Due to this difference, a SoC-specific compatible string
'renesas,r9a09g057-du' is added for the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 95e3d5e74b87..1e32d14b6edb 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -101,7 +102,12 @@ allOf:
 
           required:
             - port@0
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-du
+    then:
       properties:
         ports:
           properties:
@@ -113,6 +119,21 @@ allOf:
           required:
             - port@0
             - port@1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1: false
+
+          required:
+            - port@0
 
 examples:
   # RZ/G2L DU
-- 
2.49.0


