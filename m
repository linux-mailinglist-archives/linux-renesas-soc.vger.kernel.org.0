Return-Path: <linux-renesas-soc+bounces-34645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HNWsLFJdRmowRwsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:45:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900C6F7D2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:45:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d9zl4OfQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9A04300D552
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46194480DCB;
	Thu,  2 Jul 2026 12:31:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC4480DC7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 12:31:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995493; cv=none; b=mjA9xKUKygrSJvOYl0V2/wAIMwj2Qc+kAPSKMA9JHXx+hwpOxwHDocjef/P3L6B2LVt+Ao2RqAaFVEgl5h6+bX8SwXpLPWgbYWsmnJs9OZ3InZgDiAiG2uYzwBVmayh8V0W5/3nCEuPzsvnADGcOb/keKKL2kfvRpJ8IFAgU++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995493; c=relaxed/simple;
	bh=u4hTc5blzEHReAE+9qeOwTXdBKyWPW//pATNVCNoHq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cu+NdlcV/U0ly5Q3Nfx5YB0d57OK1b+SR/Ul+dfjJgzb1LhM0OCXdQS/CUh/z6gk3WkfDhcFEXjshFDyeBIxMNoehJF1clIpOd4lgX4rB5LRplsO4L1cpRSfjkvTSl4nYFE3LFho0E0gaNUpTKGDaTU3gLU5FymA8ZkygSZLhTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9zl4OfQ; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so11767665e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995486; x=1783600286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V51M+/oe04vuF+Mphkpe8n8kxFz5uYaP4IST+R1jshs=;
        b=d9zl4OfQp669HfmYnbtf5eUG198nf6KGD8ksasOVfxgf/34/1tjQwPSr8VX3KoYpDw
         NXFz8YWt4ODikc8MwbL7VarA2YBtwuo9I2n+FrcYMB1c/mtGMd7bQYN7Fn5gy/f0l2MJ
         B95BcrBMQUkdPgjBLwQ4pWAlssngLFtqkPD3Vwr/WAYRL6CtyJVPvYF7K4DtQ3JYEOPQ
         PR1LHxYgzd1DQn5pdvAyCUYvjgJLWmk0nw8mzr9Ft2woyvKs+IvxrndK06UJl2xwngBZ
         Su1ud2rJai3ZTGIzZgW7cSIu/51N5sqXe7N5kUMAWM6pE0dGPEiy7JMtLeHZYV7ajxzh
         pq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995486; x=1783600286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V51M+/oe04vuF+Mphkpe8n8kxFz5uYaP4IST+R1jshs=;
        b=UAfLQtYVzwNxEWfMoKj5T0itd4ktO4uDkFKJugNl29AdjQBBM8Ryh2lXJp8xUd9PpQ
         Ian3I/DQRB/Xe5rQWLnITo+M47FcKX/maifw058pMZo4zj04Onh5zXpKeZdAOisGBMpi
         8HSCMxZfV2GZ+1sbdiO+qzO+KfxZUL4GUwbj6Vngj1dIfV8ONpynEVsUICHDfRYugvdL
         67PTucKLzlegC3dhnqQ7sZOXdO3QlbtwTDeqIl7p5btBbKNsWVzgrYt0V0W1+TFH/Ton
         jJkyIIYJLNE6gKGRpd66GzqHnNghr++5yGkvAmvsLck2F/F7DFIrzNE9+Bgr6peXSgDl
         Et3w==
X-Gm-Message-State: AOJu0Yw3ENXr9fu0VrVV4ZnW/1Js8kKc8y60HBvaTrExnMb3a8mzckZG
	8c9xS7pcy7u/mS41IWUowcgz/hp+iOQpbe5hoSIcjqzHzhpvtzFX3oIz
X-Gm-Gg: AfdE7cmdo+mgx0xBXYpRGr+uDDitjaIkbmsla6a08eU0cZOG8rIim7K3epKI2eL/y4w
	D1A0gxGptnsoRhDGI86Lj4QDVAKsJ0ApL6ndr9mqzyVrUwR+izR2WCGDXrTeippQLxZgZH5k1FN
	lDbuzkwmGJp+Zye+y/zAdjvAhnCS9R2Rjx/ZWhIDbaBG/Y90P76U9WZhK6FfCzD6QrmPE4L5AUX
	qzLRqlT8RK5uxE97tscZOsZwES5IU8N/64zCdXAkPp6OFaCIxN8Az7NEVr1tbHlPmYNcQZs236D
	SLhU+cxqjXipSB9Du8JMSXxB1uK4fYn4w//0KoOZPSYqh/3S2CMeGL+KKeGu7CfrZKdP0lJPb5o
	t/V44VEj6+Yikwu5SYlWOFhU0BTMxI8nrztvwmIO3m2y9Dta/sYyzp+PTLwI6aOuwolDTSYSCq8
	xtRiEiOuy38ysJDGGfPHKQkYrMnBXQxuMT28Oqh4UVP5dyTxLhlyeJGtfGvuwEUyJpWqAY1hB2x
	pT8fjl7ZNnFXOVaCL+SXvfR1E4=
X-Received: by 2002:a05:600c:19c8:b0:493:c1bc:79c4 with SMTP id 5b1f17b1804b1-493c3cd494fmr75775095e9.7.1782995485918;
        Thu, 02 Jul 2026 05:31:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 1/9] dt-bindings: clock: renesas,cpg-mssr: Support RZ/T2H system controllers
Date: Thu,  2 Jul 2026 13:31:04 +0100
Message-ID: <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34645-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8900C6F7D2F

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H and RZ/N2H SoCs features system controller blocks for low-power
management and access control that reside within the CPG/MSSR address
space. To properly represent these hardware modules, allow them to be
defined as child nodes of the CPG/MSSR controller.

Update the CPG/MSSR binding to support child nodes by adding
system-controller child nodes using a patternProperty, requiring a reg
property and a renesas,sys-block property to identify the controller
instance.

Restrict these new properties to the RZ/T2H and RZ/N2H SoCs to ensure
existing bindings for other Renesas SoCs remain unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit message.
---
 .../bindings/clock/renesas,cpg-mssr.yaml      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 655154534c0f..ec13fcaf763e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -99,6 +99,41 @@ properties:
       the datasheet.
     const: 1
 
+  '#address-cells':
+    description:
+      Required for the RZ/T2H SoC to define the address space for child
+      system-controller nodes.
+    const: 2
+
+  '#size-cells':
+    description:
+      Required for the RZ/T2H SoC to define the size of the register
+      blocks for child system-controller nodes.
+    const: 2
+
+  ranges:
+    description:
+      Required for the RZ/T2H SoC to provide 1:1 address translation
+      from the child system-controller nodes to the CPU address space.
+
+patternProperties:
+  "^system-controller@[0-9a-f]+$":
+    type: object
+    description:
+      System controller child nodes representing sub-blocks for
+      Low Power Management (LPM) and Access Control.
+    properties:
+      reg:
+        maxItems: 1
+      renesas,sys-block:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Index of the system controller instance.
+        enum: [0, 1]
+    required:
+      - reg
+      - renesas,sys-block
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -126,6 +161,10 @@ allOf:
       properties:
         reg:
           maxItems: 1
+        '#address-cells': false
+        '#size-cells': false
+      patternProperties:
+        "^system-controller@[0-9a-f]+$": false
   - if:
       not:
         properties:
-- 
2.54.0


