Return-Path: <linux-renesas-soc+bounces-15584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9CA8166B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D59E14688E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9419253B5E;
	Tue,  8 Apr 2025 20:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0g4Lj5q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6E250BF1;
	Tue,  8 Apr 2025 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142972; cv=none; b=HKf6kLJq62E7x/yVCa228+lBmXX81Z5uxKNrRLAyyTOKfPD4KONIcZrg5wQBCZHSlu76GJfQnl4HlYxCVP4ie20y7G66UCblYfGgAlCL8O9g28LEtORuZfwm/QV6RN+/ukU3YuYm71Oxx0PzV5ZhhJbmlwKISvStmTfi1NxgLo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142972; c=relaxed/simple;
	bh=bjha3q3VMpH1pfw8xz/dj1xYIJEHZBX4ptcN3pM7p0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBleIqWJ6DoVDUzBzyo0jMb38xpQTtHEq8SWM03/wYGwL9097mxN7qkLD6/JPo2tP7vObQq/DGiP7QxdF7GOiv0lE9tsj2OHThJqVSVbrx58FkFGFwX7wv5+u6NREOfwCAXaLvKNnxDoHnuVkmPz+pXcLCm5rcit26wgcPDydsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0g4Lj5q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c14016868so5326513f8f.1;
        Tue, 08 Apr 2025 13:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142969; x=1744747769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PvSlX3UVeGDNwealKGP8bVLmlKmSx6HR6buSyxTi2M=;
        b=W0g4Lj5q09KAiX9np0eq1tE5OjpZmcg5SkqufDesyvzQNSrN1XXPjvGdE5SvX6N3L9
         rjh5QAjTVF/mPbcf3/jjTxXHtT2Oe+vBEbe156owS+L9ft/LmFy9/VmZFv4Ou5mynxHS
         GgERSsGmQAaNpJ3Km/z9UqjhSnU12diJeRtR5f0V8Xl26XpNOmkYSgJRNUCwANzjREVf
         GVFK5+Z7objFsSgIGLuz+8PgyAiuJesPxeuozE/fbgYz67qCIq90cKgcleW/d7X6nMWO
         4Vr0j//n5micX9hJYlP698imxj581IdU3BgKQUiLLXVupaSGPFQ8GFcSVnFXskBfiOQ3
         Aeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142969; x=1744747769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PvSlX3UVeGDNwealKGP8bVLmlKmSx6HR6buSyxTi2M=;
        b=xA+NtpdZuxAjPS1IthVnIfRiCOYbnGeDLqhkxFbsZ08hJhoVw83J4cBZAwD6PXPSrQ
         CNZ9yMtBxW0jl6VJpJ/Cj6M3IXfwLyDOc7Q4x788rVcnQOomLbz3DaRAwaksVl6lIZo9
         xon68tPBS70wAVRwvKkx0/Lfza2qNlw9sKDZTiDWnNhzLz38VVC6zBGilfHbHuOoteCP
         Iv7+cBQ6FKggTz5yhrTWMaT0Mffm0divdolDbA8MFbmDs2P0eWGc464dZsE/OyLuf6kB
         Cu66SZfJSxpMrhmj0s6EBl2fEK/qVuY1Gpe7WI/yEnQej/Ac29o/KzXUM2bBhVS7us0i
         Wd9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0UP3ZuSY7tm0pgvdIJFFuloR3HCEk6MdrLuzQvUIASTJx7HlCD0awYb18Ekf7SdN+4rFFVzFARMNJ@vger.kernel.org, AJvYcCW2npo7o3JeVW9026zs/gmD2LgJJTLloPFlSREymvyu/yhg456yKtkvaTKGOQ+67DKe/HPx2OCXz9RI@vger.kernel.org, AJvYcCX0/CemVXCfbMhQTdLY0cyJreMSiJPGmhtKLj+XVNTHLfBWnXNe7G+ykdYTYB+IRWUebIa1crhrEAUfZS6j@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2Rs3zRN8al0+po7e5WUSHX3noXDy3J8/Jg7xsGCNzJcqkLEd
	5GG8Dh9rn3S04HbUz03INtZrzuf9kGMk1Pggq2vuf9yXzlW9slnv
X-Gm-Gg: ASbGncuBPmu5zxymsaiuhAJ0WTnkOoTW4LKh1kGTFCRXb/B34owQ1/5RNRwI18zdMYW
	PfB6U1KNXkZLLE4I3HwPN9mY9pE0GcHq2H39qswJxRirlXWA4UyAFAVVqIgGCp0y6PJznJc2NCk
	d4pNJVhCgHo/pWkQiFZanN2SMgqy/S1kJtz2G255pZBbEAQk5BW5l4FgxQyZhKIRG9RmJ6EFrZ1
	0CWeuV5Lq4PHsMuMaKfOGjuIaCdmHbiJGWVH1Nv1U+yTvLKMpXbrUOPu2TW2/KGoLPTfQ0x3Wh6
	2L+PioC09JnagOkfhPLOPmewhRNqRRpjQ3wYABR7gPjyS3TCWloRHeTSNrDEfOSZahkG
X-Google-Smtp-Source: AGHT+IFUUqfy45SBK3izzH4KdLTpO1CBgEpKMhKxmbcxZfiJSnVmIdlzxBNsI+YFBYjxx7ohKRucIA==
X-Received: by 2002:adf:b641:0:b0:39c:1257:cd40 with SMTP id ffacd0b85a97d-39d87cdb14cmr239355f8f.58.1744142969024;
        Tue, 08 Apr 2025 13:09:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 03/15] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Tue,  8 Apr 2025 21:09:00 +0100
Message-ID: <20250408200916.93793-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v1->v2:
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
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


