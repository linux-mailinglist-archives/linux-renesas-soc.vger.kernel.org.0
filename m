Return-Path: <linux-renesas-soc+bounces-31761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH0zDGc78mlypAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:09:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A526B498056
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E39C63025F42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 17:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D656140B6E0;
	Wed, 29 Apr 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDAcqbeU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D45374E76
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482024; cv=none; b=hxnPHR55RCgUW2j7PAvIsBTgEmbFRjEU1ArpZa8fCULMD7IHjBJ6Cte2VpUAp4pK6KmpmSi9bgJYKdDMtaarlDcxBcXK8znFldgEowqlwt/YMfmXg0e/Yo9huYLje8KU8N2Cd1ovIU5PXimMiILuhEuWSwY/je2xJj6WCsNbBBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482024; c=relaxed/simple;
	bh=bLNTtKp/CVda7Cb/aKSAn7N01NwscsKfgXsH38fKinM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qn+QXji70sxgYiliQHQVUiOvXe6l5ZGD75zRkTq/xXNWp4xkhkbna/kSGVqfSIiuMXx1UvnYeN3E3cFP1Az3CdtjrqhUc7/aXkb8YESilT3nquLmStUmuzkRo1SWlvVkMT51bksjODi47ikBb4CKOvSzJ6N9fdz682MDn99iSYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDAcqbeU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483487335c2so127093275e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482021; x=1778086821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikSPOGR4XXwx0JwMlnraIx1B5HOIyelZFy6MXUSY+IY=;
        b=iDAcqbeUiZp+yqy63C3pV7kcXiTBNCxawfja7sk/TkZXr9AVhFF5oNqZLJgRvjiYrI
         f+/GmU4jmR4jJuEpWiJ3YDEML5mxIJDSjxq5wfOiU0f+zWWtSqYwtlBdh2zcWZPG1szt
         W57Ab9IHcucI+0A8+L1/SrihcWp9Osr4sZsb7VpmJ9pfVTYp/yhP7CAECG13ZgH6Eikx
         +TsBo76+7KlNKOoYsXqfLde4YZtETYqvtrudT6B83cMoJLBNe4IBFqDcP+ezIsHw43F3
         Lu3/IkZszuiCIYKz05Ru/lECE0vKSY0LmT0df77c/cWMTyMawvoXMkjPsGeA9SxpKlAp
         P1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482021; x=1778086821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikSPOGR4XXwx0JwMlnraIx1B5HOIyelZFy6MXUSY+IY=;
        b=dCiJedoIbd2wvjlJe2eFGayfniYJszy3J/qcDNzxYK+Iu7dtYa2ySvt2r7lJPSBcvS
         l2TOH+q5n4cMlJSeGqGuTVK74laVXclD/gHm2XBO/hvbm82ofWw8cMnxQIv0SauAiio2
         Hoze+svelYOUmT998rgPqLeZWS+zbGgW6KKtvBYW6IPRrohTf/8eO3vBEJSiW61zzTud
         rg/SUdSGwmIq7jPwixn5OX6gIgIsN8rvidP+dQq5QcF4nA5uwn/O3jUrVgRGhdx/J/J7
         m0JPGKxfHUJOZnAsWyE3qdQcvkZQQwZvDTGawkJ3ht1MZxg1HAX3Uev6XoWJjBgVyKFn
         tWEg==
X-Gm-Message-State: AOJu0YwV0y/AokKcN5Y6Qe0udwrvsQ3HZNS5tMQfRZ/9G1jrCA0RjQty
	GtgdVLc7vufA+w/b85jQby5aWBSeT4q6HWSPhn6XgrwlH9yJK7rwNdCr
X-Gm-Gg: AeBDievXuT1zenWCjTa7NWWiA3X1T4C07KOBZ/HjOvNHXJZIJ++/dp7V406IvUs3ljQ
	cXyelMzRsUv3k6SYM/pangMqQDnk5aLC6OxhymaFMhLFhsXbuATHnziDSaj1jmhKaoVpOhGs8yX
	R3ziwCqw4UH3DzZly5LmG6DKuIcHdO5/UcmfvWm++PNUYGuq7FMr9D0pNTrrVlcPMoY4P5cbl1B
	UsXwC9UDtjpykOAtHOZxeTFc/gfNsmCSO+7+9QPXDI7fz6VHdzGJRTJqgzIUuUHHiUaHgxl48MS
	ah2mxq1AN3C42dX12KLbCeR0W60m5LhExRVlWyIMx6CP/k4ivQOXG0n0HQkw8YpbVXQWX89JGtx
	OwukU0awOOyUB7WTvKhJM5zitRp+0YXHXYRSi+e5sYJIK3Mf2nbj5CQiWVbR/g3h1seGTVOrJqW
	wQl1/M1Tjzbi4exfxQosc6zR1l24VOLgf+WlWVVZRNdaTd+yywfa4tX1s/kZqz93xA7pYVMieNi
	fjDhupfhy3mdexsdIS8rT8GMQe35ItNn9kctFtIZMKC0FIt
X-Received: by 2002:a05:600c:3b0f:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48a77b177aamr133031915e9.15.1777482020092;
        Wed, 29 Apr 2026 10:00:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
Date: Wed, 29 Apr 2026 18:00:09 +0100
Message-ID: <20260429170012.366537-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A526B498056
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31761-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.992];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,0.0.0.0:email,bp.renesas.com:mid]
X-Spam: Yes

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.

The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
supports the DPI interface, but includes SoC-specific register differences.
Add a dedicated compatible string to represent this variant.

As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.

Unlike other DU variants which use a multi-port model, the RZ/T2H and
RZ/N2H DU has a single output and is modelled using a single port node
with one endpoint. Add a port property to support this and update the
allOf constraints accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..45678d536a75 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -21,6 +21,7 @@ properties:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
           - renesas,r9a09g057-du # RZ/V2H(P)
+          - renesas,r9a09g077-du # RZ/T2H
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -28,6 +29,9 @@ properties:
       - items:
           - const: renesas,r9a09g056-du # RZ/V2N
           - const: renesas,r9a09g057-du # RZ/V2H(P) fallback
+      - items:
+          - const: renesas,r9a09g087-du # RZ/N2H
+          - const: renesas,r9a09g077-du # RZ/T2H fallback
 
   reg:
     maxItems: 1
@@ -53,6 +57,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Single output port for single-output DU variants.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
@@ -83,9 +91,7 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - resets
   - power-domains
-  - ports
   - renesas,vsps
 
 additionalProperties: false
@@ -137,6 +143,20 @@ allOf:
 
           required:
             - port@0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-du
+    then:
+      properties:
+        resets: false
+      required:
+        - port
+    else:
+      required:
+        - resets
+        - ports
 
 examples:
   # RZ/G2L DU
-- 
2.54.0


