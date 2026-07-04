Return-Path: <linux-renesas-soc+bounces-34692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6p0/GD7USGpCuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:37:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB752707493
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:37:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lnQY0cfo;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72D2F303A8F5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A923A875D;
	Sat,  4 Jul 2026 09:34:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2753A7829
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157683; cv=none; b=YzYwExTD6KNQGm6Vcj033aayRBd4AI4b86HKP/JBupkefRPJGihtQ6rBKI3o7WgbNA90tMlaS4JrXCu0LxO6EUieQKMc+b/mEWmLGCxhYj67rfQslzBb74OffEcaGvmSkSYCDQa4pYZkydqqWqnFlnrbeDgFpLb0zbSe0y8EM2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157683; c=relaxed/simple;
	bh=BbYLJhEgdSoWZo4IzbOnYd4Pb5An1UxlxVaJpXJ+EQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZnfBUq2oaj3Lb9SpoPSem72vG/f03woxpDN344SWohsoIZPqEsWifmsqCK9HIvmEzEXDcexnEkSDwv3UtqBE0Vj06zGS+qdodlhe1ha/r+sXTrW6iHe/bmUKvs4WA86IgQ+mOPuNncdXPyKl9PuvXw4F0gTOVBLNUdOle6oBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnQY0cfo; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c83474ddso13410085e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157680; x=1783762480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9vf76BqIuQO+oLK9NNkHBXuVK+BkmRkVD8Sg2pJCJU=;
        b=lnQY0cfoq832O6rCLuYXLvIQxmp2dw0ewrB6hGbGoWBQ5vucAViErqwssm+vevGLkT
         KZXyTuqLQ0wAEXhVMbpfPh6aNxUy8+kUo08g0R0TgaNvc1jWSJakuBaQ0airSDxW3HAA
         yi5dYMS6T1wtQyEwP+UWEi7hSXphSmFxMrPwX574orZObT7FPmic91GzE2SUWk4R4LH8
         NENHxXlDnh4tlXcfOmTZ3waWkozqPMmhucV+Kz1MARdAs3vMuqFnW2giXXp4Yc7GZUtZ
         17awrmn+GBE81NEq4P0jLnp4rS/TjNZCcwOSv2um/vJdeZbco3w1u58vCZQITx20UxIZ
         yW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157680; x=1783762480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9vf76BqIuQO+oLK9NNkHBXuVK+BkmRkVD8Sg2pJCJU=;
        b=bXBcIpzFz6IwYAwFufpwpjvXpMoXZnAqz9UmMEI1itb12sdUmcIZa+Vt9Hz8H1Y/dq
         L5kbhNIUDK4pAV38GyAVwi4khcLKKkfggTXqxx1XBhk4jQDoxE7XDDLhUA4z9kxyEAdr
         CZBOQ1wDxvi+mbUl5voxYVAudLCVkG95bBTJqq6Rm+O5huBLGA/CTJWHGx9061BQ+obY
         Ew615YOFGtt3UJtg2dU9JfixXOcxROLx8HsBtT6ipD58BhqcUedT2AiiZ1nuQL41HoKE
         kI6/Eaw56N8GqLITz02TrQsfqzu4lPdKEHmUb7AWqpbQ9p5tZUV2RQZwXh2bcQX6yY+e
         6P2w==
X-Forwarded-Encrypted: i=1; AFNElJ+wQUxAS0+PeeJGUTa9nogDcJnyUpUBe3t05E+4LrHPZPeUY9HxO54dSjQEnOEunshbGApYAXVpwGUA6XZTnwgI3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFsKt6GmJc1kfhhcBkdQVt8yZyiDsQ+iFms4XvPVF9+x6Wz3i
	fwR6ltw79isHUwVuHhonSXUIgu3cmIlv6VC/LQnt0OsKnUYym6JIyQqr
X-Gm-Gg: AfdE7clPs4Co9kT8UPdpaRv6DpATsvwofcISkiMDs1gXkKwJn61Z9Dz8e//mrxzil5m
	PEM/l6JRlnx4eMe1oetnahsR1gn6vNF4ydRZImjUmQ3OX+M/1jvGl7zEty+M9R/qrKvGOfNLxpt
	G3YpWbZgLutjOPaDETelv194/oOp4Hnl97tWsA3LiC3yzihDbNiULQpqeMgLOf6lvpEFJbQg8Sl
	+45LlxcMHA1NtiH2U5+pc2HPioTFYO0nhazPpURRxCIyOOFaQj6O8bwhpPE07eayEeFsx4SLGHC
	Gj4ZDOcLdbMxGvDejzIzE71jAvnvmtdZ5dgmH+unhUH1rL5DKOlqb7OwhkxweEFG5QuuPEpFVYm
	F7OCz1MFvxGY70157umVyJFabmtd3G3ByPja7QOBTtM2XqTgryC4yq1KFnjqZ0lR7clrtG/l9C1
	avLqh/EXfdKaI0hBlWZVuh
X-Received: by 2002:a05:600c:3515:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-493d11894f7mr32349275e9.0.1783157679621;
        Sat, 04 Jul 2026 02:34:39 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 07/16] dt-bindings: display: renesas,rzg2l-du: Document RZ/G3L SoC
Date: Sat,  4 Jul 2026 10:34:17 +0100
Message-ID: <20260704093433.273672-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34692-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,lists.freedesktop.org,vger.kernel.org,bp.renesas.com,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB752707493

From: Biju Das <biju.das.jz@bp.renesas.com>

The DU block on the RZ/G3L SoC is identical to the one found on the RZ/G2L
SoC. However, it supports the DSI, DPI, and LVDS interfaces, while the
RZ/G2L supports only the DSI and DPI interfaces.

Due to this difference, a SoC-specific compatible string,
'renesas,r9a08g046-du', is added for the RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 7c84a9ecc7a7..65368649fe77 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a08g046-du # RZ/G3L
           - renesas,r9a09g057-du # RZ/V2H(P)
           - renesas,r9a09g077-du # RZ/T2H
       - items:
@@ -65,7 +66,7 @@ properties:
       model-dependent. Each port shall have a single endpoint.
 
     patternProperties:
-      "^port@[0-1]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/properties/port
         unevaluatedProperties: false
 
@@ -88,7 +89,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - ports
   - renesas,vsps
 
 additionalProperties: false
@@ -108,6 +108,7 @@ allOf:
             port@0:
               description: DPI
             port@1: false
+            port@2: false
 
           required:
             - port@0
@@ -124,10 +125,31 @@ allOf:
               description: DSI
             port@1:
               description: DPI
+            port@2: false
 
           required:
             - port@0
             - port@1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-du
+    then:
+      properties:
+        port:
+          properties:
+            endpoint@0:
+              description: DSI
+            endpoint@1:
+              description: DPI
+            endpoint@2:
+              description: LVDS
+
+          required:
+            - port@0
+            - port@1
+            - port@2
   - if:
       properties:
         compatible:
@@ -140,6 +162,7 @@ allOf:
             port@0:
               description: DSI
             port@1: false
+            port@2: false
 
           required:
             - port@0
-- 
2.43.0


