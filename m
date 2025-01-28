Return-Path: <linux-renesas-soc+bounces-12616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD7EA207A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78BF81673E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 09:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A64219B5B1;
	Tue, 28 Jan 2025 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OZA64Pod"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7869F78C91
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738057646; cv=none; b=rWFs7Ki+EK2pdG9q0Pf/RXBlqstv7gPb2a1qVdTl6lvh6zxFSW7ttGnzZ+k6Ri9PBtIATWKzj3K9gDzjQVyBrWBGSG1cjHoFQ+Dbp7pmPKazKhE6n5Ah4UcMrKRx7mX3409kNPKgRljjOcpANMBpm0P6r86pxk1IrhCi/WddLdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738057646; c=relaxed/simple;
	bh=Md/5da+88yo3EJ4Jmesyr5X02uyFCpA6HuzLXyhsrR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h72b/STiAii+WYPT98z6kaVoCwd11OpqQYG9LIK1/Iq6X4/EItj1O78Ew+UnyrAMguplvsbvOlEfQVU6D2E6bMiYW/njUo+juv2ZpQzUbvtxdRDQMsdDj1C9xL/8O6VnfBBALnVLTtec5cnSSpz0Afw8dEe5MyyIJR/T1AIlK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OZA64Pod; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43637977fa4so4621945e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738057643; x=1738662443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lTmfrndiqp9foNBlo0TFMcTfyEKWgHjTbx0OZ/UMQ8s=;
        b=OZA64PodP6ABG2YEmsTy+t9JWBLeZIhOZc+tH3O+COHD91SsQvuNAAbWAuQZbGI8ZZ
         qgO3Flnp8oq8jftct7FWoM8hYibf8vevRx5pP4OtSn7g8LMJwPDttPQxFMhbz10Gz8hs
         x2TBZkps+50oMVuTeQ0z/ljDLGvcZK5L63prTYPihA0ZXwwwUqD44gkhE6ue+o4wzlaF
         UWt5N82kfw7PxtpaaJD2FsHpf0oWeu6an28KXpsYHPS7XmPD1ba3L56UQZoUVfF157GS
         dDHrP7U1kr5WSk/X5wSWOEhghj5CrMPTcc6MqzjZmLmxv2EmeeU1yJTFPpe2QLrMEzp9
         l0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738057643; x=1738662443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTmfrndiqp9foNBlo0TFMcTfyEKWgHjTbx0OZ/UMQ8s=;
        b=ApKBs+Ng23pDZ9k8y3On46kyYqhD8QvKwvfCmDpHWggk6D/0OqJ24+D40npxGGbHxP
         uVFhoLXzEHpU0RUl7lD/znWmpmE6Zec3hQxqasZXrFP7lk/xQztmXRC19dmSYogbJxFt
         D7IlOFs7l0ItKswLltNdVfY+9JN40mxMZeEGXjvxFyKhKdbSsgMs9HC+3jHu7gnmKqyM
         9vJPK+ACsQ2FrPkXpsF94ZaGSXIMSCQ3R1wH2ltpEKVzksLIDb62TlO/9Xvza3DTtW0B
         WfEJ2dUEVgSSrdzphCX4X+1NQTaJYyauxf/7P8S/Q67LhbmOInzhoPmqegB0u7C0E5b9
         S/yA==
X-Forwarded-Encrypted: i=1; AJvYcCU5wjWVO+ZbqynOoqn9iebWwUmc08PsHuOW/taxs9kuqrUuFSTVwsWieby5UvOjwbS94NWPSZmrs8lTHkpM38z6Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlOeauAJUIiC5eJi77wn7XKN6+FU8LxFw70BiFkz2l4GOqffm
	g5RJXDdEwvVFATOdDvZyizUgA/o4DYh0Z4Wg52Z/k5Z8PpB0ainsPTD2zBqUzEjiFdfHbP6nq7F
	p
X-Gm-Gg: ASbGncuvTBvkD1qsbpKBFqsuMka+QkskNhZOryggQb45Cwf5mAuGnFN/AMbB7jdlDav
	oH4ahfoavqOwjEwo6isJt3qbkdTxhy3O+mXr8Cc3b4BknYwROTW/5N5CaP1Ra4qQf7arr8+QoqO
	WDj9XMZGX429xUdTvtrwqisI2FNhScwqB2ONoYxTU6IDa3h3ZyLn4KdHs2RhsQfFRQm2dg+dWjo
	WbREqncTsUr8LXFyhztQV1kEjyFzPS2eIRH3VTvb2OYiMRKi+gW0KwXCzMVn9/0I0RSWWmt4Ivl
	CPAzUtY3N5Snjs3eQN9j1KiLSlv2
X-Google-Smtp-Source: AGHT+IGphrYVnQBNjNT6KJSZMftjAwxom8RcLx/vroNRf4BTwzMuXyMxnbel4sP5xzTO3KWriWLgAg==
X-Received: by 2002:a05:600c:350a:b0:436:17f4:9b1b with SMTP id 5b1f17b1804b1-43891476efamr162532165e9.6.1738057642769;
        Tue, 28 Jan 2025 01:47:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd50233dsm159711095e9.15.2025.01.28.01.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:47:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: display: renesas,du: narrow interrupts and resets per variants
Date: Tue, 28 Jan 2025 10:47:18 +0100
Message-ID: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each variable-length property like interrupts or resets must have fixed
constraints on number of items for given variant in binding.  The
clauses in "if:then:" block should define both limits: upper and lower.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This was sent already in August 2024 (!) and still not picked up. Thus
some other people started doing similar in December.

Can this be finally merged?
https://lore.kernel.org/all/20240818173003.122025-1-krzysztof.kozlowski@linaro.org/

Changes in v2:
1. Add Ack
2. Rebase
---
 .../devicetree/bindings/display/renesas,du.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 3880b4c2ea9a..88ecabc4348d 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -174,6 +174,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -229,6 +230,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -282,6 +284,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -336,6 +339,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
@@ -397,6 +401,7 @@ allOf:
             - pattern: '^dclkin\.[012]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
@@ -461,9 +466,11 @@ allOf:
             - pattern: '^dclkin\.[0123]$'
 
         interrupts:
+          minItems: 4
           maxItems: 4
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -534,9 +541,11 @@ allOf:
             - pattern: '^dclkin\.[012]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -605,9 +614,11 @@ allOf:
             - pattern: '^dclkin\.[013]$'
 
         interrupts:
+          minItems: 3
           maxItems: 3
 
         resets:
+          minItems: 2
           maxItems: 2
 
         reset-names:
@@ -726,6 +737,7 @@ allOf:
             - pattern: '^dclkin\.[01]$'
 
         interrupts:
+          minItems: 2
           maxItems: 2
 
         resets:
-- 
2.43.0


