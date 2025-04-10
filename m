Return-Path: <linux-renesas-soc+bounces-15758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA1A845D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 261693AF9F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 14:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537EB28D852;
	Thu, 10 Apr 2025 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OMb2Fdrz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05028CF5E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294013; cv=none; b=p6Vm5Ghs79sy0v3v85J3u+EGK8TK+TtNWgec7x4aoshR4HwWm4tIAATf7I3KU/0pNwMcBf/xbyoUJ1zEaPjThNEHnjBVfbzTBpNYcK59Er72X8MDeR3TBPOvlUJqm5speWEKW2kusl+dKnd0o1SzHadePgrG/nidiJRiV6mGmnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294013; c=relaxed/simple;
	bh=kPIosshDR5H6osac6wbdQDDN6UXpRpsRAyxz5no1LTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SahTUtogiQNaaINAOGPbdlkj/grvgqHrytsZZs4Iv8hgjvWL3r8KA3SDgwyHyMebyYQxKnLZO9xMvwuA9Oc5tT9PziGKOsyo49AmozyFRLPtXdoRugicz2jGQQXHaxwW8omUWyC0lzHuibcXs7aQsGB1CSNh25HVBnXA+JgHeV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OMb2Fdrz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39d83782ef6so1251422f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744294009; x=1744898809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHL5IPj5wQTERMMMmzAKWea18ujPZ58wyWG0cWKNHYQ=;
        b=OMb2Fdrzsz7kC4peeIRq4jrA4SyhUqs4dnD/NqzwFaXLI3hmQpuoy1gtKyZbivYT6d
         bq7wnfPv2UdGUxGNOfYxhWNuRCqDoAY+BFoqo4bUPi9oNiiHWxfFSeSHYjuDipQx0JXy
         RNNni1oy+W7VCyBKY3AY+3eEJERnFPA6vB7PWeVVsuQ05PFPwE8R3XpgNY3GXpaiPUa1
         3NTTMJS5futcrkxs1gdrGnm0MVEUe6mOP0bse00cgNuMDZAt55secVLjfe0brOONBbrq
         K46Q+edukx2zwHk5/scqXjYEDW90NOJ+CDRH9w/0/dSvJ/zyYbEasw+pHeN0Aca6QA6a
         7F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294009; x=1744898809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHL5IPj5wQTERMMMmzAKWea18ujPZ58wyWG0cWKNHYQ=;
        b=fujXCA/OV6WY5Mzw+NfR/iIP8w8c5kCkHNnbcmp9aI+SwjcvUglBIPdSzTuCSls6oA
         bYYnE4UBbx8wOpYgtyxyXyNPevpKTCQ2LOXLMmaiUJiY/LDoYrtnRcJA22WPF9MnQsjP
         44cwlku669fyRRMu+h0pBl0woPcRpCf96uaBc7sUfZY8NduzfqWjr7iQu1vZMWsCBRl3
         wGUl74XZCsXt1798bKXnBVQoz5NjzS3WqoVOdG4KjHu++8pyMiTCU4oB1jmSfgtJaeE8
         4zI9yNe4W37ZmA6oiHVUJjcqj3LyDQVUd2oLFxD4RCcWts2CohV/orKY6DEG2kVl4TMp
         /CSw==
X-Forwarded-Encrypted: i=1; AJvYcCX4+Y053dAEvw10psU4vGqQGKI7zT1aqUyPsGUJpm0/vL1NKY8vsTCOe07GvS3kbeDcAF4F3M7AxCxyIr+FSMV/hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOanzo5saBQblnBAxLeDPu1UPEY5nuqJ6YU2hgQxGHFnYeygQ
	Vk19hRQqEzkfHT6ZTJl/sF6IskvFePEYucOlzPsa15284XfyRbMTajCiU3NS//g=
X-Gm-Gg: ASbGnct0cIKcbWxrRNGSJ5j6pNOCw0YcEm4rMlWwAYzg6C4hVM5gSL9QdUvd4VsgIL/
	VmAIdVmrX7CxQrRVmEI78l+IQ9cnVzPbuHl8cbJjjk7IKy6oKnBGiCdpnDoiNHmu/cwz6hn7KYc
	MSaKwqe3De2b72gt7moR0AJ7+EE/eIUplrM5fRx4hT221ypQL5IcDivC4FnYlmjT1o3t50EwXc3
	E/5i99TCZlMBqQBehlH3ijhWv3dfqYDjQpOe9nBf81Qbe8IVR4nWPxKmTmW95V/UI7TFyYJ3x/D
	fJdKdc5wm2OFZBobZWK+Q0ng7tvni18fuDugup08oytIocNmlAYe8mht9Thfvvldn7Q1Yg==
X-Google-Smtp-Source: AGHT+IHOcPZ66SzEZvQYNSIfZ5gzgwZTGjRiYOAcMR0wqLzi2RpfoI/4+zomLnNdjGeNVHWvRUCJkg==
X-Received: by 2002:a5d:5f4c:0:b0:39d:8e61:b6eb with SMTP id ffacd0b85a97d-39d8f26771fmr2971729f8f.1.1744294008896;
        Thu, 10 Apr 2025 07:06:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:48 -0700 (PDT)
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
Subject: [PATCH 7/7] Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"
Date: Thu, 10 Apr 2025 17:06:28 +0300
Message-ID: <20250410140628.4124896-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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


