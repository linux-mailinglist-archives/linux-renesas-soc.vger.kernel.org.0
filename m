Return-Path: <linux-renesas-soc+bounces-30938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIiiOYAb1Wli0wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 16:58:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F1E3B07C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 16:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 532B8301F28E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 14:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4999A33D6FC;
	Tue,  7 Apr 2026 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLpRSsKr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC01E3DDE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573881; cv=none; b=Ye6CRb9JZVQPNvmwRMIHNbg6qHbjc71q1NDDZ3LpFmUp0/FQVmfJhtUh2G9vQxRuKgU/uqvAErZDO09amFaALdBmDVEL8Bvfza3RWjj6wqFZt7eSzmwy8BhJpk75NFMr8XDvA3u3W0ZV62Bzc4W7cnlha3qBoCIm/T1u3I7euAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573881; c=relaxed/simple;
	bh=AZKWRwnPcDmGna5D4XqVdcKgsyc23TO/G7JP900AX5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKzYsIeqMIlDuorakYW/xAdcGQvRq8fKPZNyaLkoRNMvPHY6O24oRbO5fVxO527TfSeAtBu/NmPzx0s7cHB84doFp/sf3WWGyOw6ztoVNsSScuGwMy4O9BIkRo6Sd5NnFAHR+F2igK1+fgRXyWVs6+g0VBkWQp/JisX7FysGkF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLpRSsKr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b983bb07eso2996297f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775573878; x=1776178678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4X5Ywank+eNVyFO5dPCj1pjA8q43kOKW4mZefNgApY=;
        b=RLpRSsKr+zFaujQTiSvk7F66hu3JKuCAvS+CMYFCS/kS0lW5csqx7xq2K0ZMnSNT6t
         O02Bo/zi9zf1It3ZLYvWTtwjx1R1u9xHfd6YsPZwKrIKinlHXyOtyWUJad6C5OrpMP+N
         aQpu9K6YNB07Z5mC5VJvy4WDG2f/V69N9+8PAAFrkAcva8AQFtmZk/8g8Lb9OSE4A4Cb
         WXdp8iro2K1rOjj8eMTTAtlialPJoJe9RXKmOBhrh+q4biO/Rw2ChDZCF/nV2N+L0Nih
         /w/dkLTQZrJpe0XXBk3OIMtjMHslzQdYQCw6xt7d8Em/t0YQjyQH8mNn9e6qIWxtNddj
         EORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775573878; x=1776178678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U4X5Ywank+eNVyFO5dPCj1pjA8q43kOKW4mZefNgApY=;
        b=eakPOjeyjFaRbxY7wy5ia3UciZGwoub2w0cDYi+9FQ+soIvXCdVnRsFaZVsZsqEamu
         XdAfiMCaAxV03Ssl0WGiDtggxehihaCmfxkSn59LnDkVXjEbdvcEifdXew/onwqgwwtR
         oMUlo08l/P/79c76dVWqOiZhC0abGWG1CHcscaXMXf+sKyzIpafjTex5WRv+ZtbjqRLh
         pS/zRYK38FNZHfWCUEaWgVvAgkSEuIeyJ1S5EkjNrnImia5qdX4js+cDYzEqiGWY6v8t
         lVKLDvb/ZJX+n7WrsfSOyU0ZGGATyF5oT3pKpWZeZkHn5Mx8U4uCBcjGIA44Mxdt3L2E
         61xA==
X-Forwarded-Encrypted: i=1; AJvYcCU6kr+VLt6Ln94IY9eSs5HD8jLgyX/DHuKGFJRxr/5uH0LrlJYpsgYa0XxkjO3wuxCGY1us9d5kI0F4x21kg4YJOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhO+d4OPX2G+5TrcxolJbS6JOyvYpEG38qnFKAXUqNoOHuU2SP
	/at/r1A2uIOMUsn2ubc1dJZxlAtnMnYnycUXKPQlZt88IdHroMXnVHWt
X-Gm-Gg: AeBDiets7UfOZko/vOcnfkNXcHY2U0xj7WZKXi9mJFFhzE9DNXfQg429iP9LoGMt2Qv
	+AZa0lcKD0V1ijQggnubIlt3IQr6r21HLfre/HhxiG34GkkQ0H08TtoQcXdfSxFu0Fz3wttUDJZ
	OafViw6ooft8J6SHRYxHoBXUJeepMpNjg53WPfp7+k8r/xzt6lZjS2Zjkz4lniqxPYF2S3ins4r
	qsXh07vtsw0fVpclzx1v0cb1xetNWqWSG3/TE24LIHCYhDSnegwYjDkpVi/xXIbYrgLzxxsWyGR
	XPXzHTI0CmQizOiF+H5e1UxixcbIEQ0eaXIf18vW8v5Bxt7P0g32b+kkU5SX/O+DEu9XapE6I8o
	YZh06dgK/Y9AtoTu6zCNbzLNsAbYjmKtPwjxBJTLODMWlBU8QGWGFbQWx09cJdPxUvRzcx009sE
	/cNKuXab5XlUkYIw2qdkN81BPnNm5SsMcEp1gDozgKdkxkk/ln
X-Received: by 2002:a05:6000:25c6:b0:43c:f49f:9b7d with SMTP id ffacd0b85a97d-43d292a0019mr24536389f8f.17.1775573877995;
        Tue, 07 Apr 2026 07:57:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3f9a:11a8:20c3:fe58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm45207018f8f.9.2026.04.07.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:57:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
Date: Tue,  7 Apr 2026 15:57:50 +0100
Message-ID: <20260407145753.101840-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407145753.101840-1-biju.das.jz@bp.renesas.com>
References: <20260407145753.101840-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30938-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: D2F1E3B07C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible with
the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added ordered DMA names for the dma-names property.
 * Dropped the tag
v1->v2:
 * Collected tag
---
 .../bindings/spi/renesas,rzv2h-rspi.yaml      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
index 2c9045fd51de..6f4bb83a549f 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - renesas,r9a08g046-rspi # RZ/G3L
           - renesas,r9a09g057-rspi # RZ/V2H(P)
           - renesas,r9a09g077-rspi # RZ/T2H
       - items:
@@ -90,6 +91,33 @@ required:
 
 allOf:
   - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a08g046-rspi
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: pclk
+            - const: tclk
+        dmas:
+          maxItems: 2
+
+        dma-names:
+          items:
+            - const: rx
+            - const: tx
+
+      required:
+        - resets
+        - reset-names
+
   - if:
       properties:
         compatible:
-- 
2.43.0


