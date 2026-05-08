Return-Path: <linux-renesas-soc+bounces-32280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PQ/Fe/J/WkpigAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 13:33:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C54F5CD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 13:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 728C23008A4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 11:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E52396B7F;
	Fri,  8 May 2026 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrvFTadJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221AA39449C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239074; cv=none; b=THElawz1MAjuD06I7ogNec5W2omWdxAl+RFmY2H5PdTwtQraJgbNLQTgxLMXG0eDjK6XPr+61hZJxYByRoAEYvsveSOabOrKEDDiIscnuCf/dRUFwWLD8tuH3p6SlqTKmpxEh5OpHs7bvnrPkh9R9OOeqA8aPl+5OuRsKpmwK8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239074; c=relaxed/simple;
	bh=MlbtACyaTMMI5yMaKErn0MSWJwT8IfR5hys4lJuVZmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrHzrZYi2+kLgJ6b79nEc9fp2ksYc224aO0SoiQ6iDA3lAwi6ZB/w/TxVZuF9drbvR1YOtPUZ61vAEmP3n9NRbt24XxNZOUC6MDNTGqoJqYNDsm2q9mFGXaco/XcbX6OEoUnuQgGzhqzdzr2gctfQJnFfP8E3UEYsrmxeFIWIAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrvFTadJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d75312379so1970168f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239070; x=1778843870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umnPqhqqv013uzG5MHEH2JE+ZpMvEjDm4eYLN1odRbQ=;
        b=DrvFTadJNF86zB8O3xJHVsQUrF68KfYD1t3H00Pz6UmI/AVSxOVxi9mke4V0iOh8Uk
         wjR7c9RImGdq5nb775tyv0ev2ozXrdzX63luMZAT5zs5u8itazo5hc+P5aP0O2yaNfA8
         n1gCyYctyttkwG2c9TVozaz6rkWclvp6nckmYWn4aoAEEs5Z9BduS6LPa9n2ePQ9t48n
         Ru3omzihedsHP6f1gFlMQq2ET0k423jnAAsmHy5R+tvaQCnXoy2wTC0Zj6XuWWJfa9VP
         y+5sGGIpKmh98QZtXXexf5zX+4Fhcn5+ZsEU9pc1Xdau1lh2FpigR6xz7riJr9VUa3xU
         SZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239070; x=1778843870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=umnPqhqqv013uzG5MHEH2JE+ZpMvEjDm4eYLN1odRbQ=;
        b=E8kD0a4Y1wUXOddxnycpfwVAObbojD/9Fc4w52Nd1SWOLsB5O5iQ0wiaRVovufej+i
         9CBVryexCJqhRouja1auEioYUsMWQU039RyYRUC8chZGWqdFFmIryLOv7hE+IgmmjSah
         rCIWJ+A8wgrXZoTU11iJEGVfB8a6aM6gwEYZnQQkn9iTOOQ22PaWw1zERHDczesyG8+L
         eDQu+Iq6/xUkUmbVxicP2a+5/6LPM56nD9Fi4YniZf8tMy9VXULDcKxgqwC2hYSsdb5M
         kAB8Znz5lLXT0o2sTZVVtZzV82NOU1NC6yRVfbbe2mOn512nXOVaEwdKF+evR/oNsf+9
         Ftnw==
X-Forwarded-Encrypted: i=1; AFNElJ9rRrZ4Ge+XifnbJnxi105o8J11Sl8VEP3j1m/cbUhBipCuPEpj8g/smoIcerK2KWMA6o8CIojboJoeEbTlnfPouw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxijRcr3XexrgMWautw4yLcfG5yVpmTrPitjkX9wHc+OzSJnzM1
	sjVbUTco2Mn7cI6Vbo4qpHMkpx4r0Q6Y6+m/PVU/22BH7mZ9HwbFK0gF
X-Gm-Gg: Acq92OHmYRuqIMk45U+7NR51WhJcesW3WO2317FMjIoyJvZR6F3Ajd+/ue8GA8hkTnf
	dQZfUTw6zDXuG2BvrfL8kxm+Z+UzQoREQVoSrDyAvLETpHO2MVMW5qvCdJQSnHLesoEELTVcr79
	0sIf7dVvvMys8U36Mo4tm6Cmi6YwTaFHlOnYpVe2denwmIlKm4MNernwWFSXv9Ln/w3DMbaOUpV
	cFJIhGT3SDXbWfq8IFzedQCnpd2xs2hjobkl28UNTeU2yeI+F/gkMui0nu/G2EJugc39Ssr71vD
	We+xQcwQeYpLr++r79Mh8oBAmm5HEmSeS0JVC2eCh+j8FgiUF9Y/OAgqrcL78pAyDbONuoQMpmG
	iwsCSI7GhmbRjZBX3J2C0j2YWbhKT2YqNJLad+jcAP47sIlcOvCNZ1hUZ2UFuDd4A/bWl6Kxw08
	TGPp94xhKFGuzelCjaZ5HjFz6h/cwrASrDxBGgXOmtApKULlvaPQswt2H57ozaKjGul3APU4Gwv
	B0W4EkNNhKMPad/5ioLoWiGWnes0SF+cYgyFpqnQItkmjQp
X-Received: by 2002:a05:6000:20c6:b0:449:8650:954d with SMTP id ffacd0b85a97d-452e84663e6mr7389736f8f.12.1778239069759;
        Fri, 08 May 2026 04:17:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:74ae:919a:e57c:bd9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm3535563f8f.25.2026.05.08.04.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:17:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
Date: Fri,  8 May 2026 12:17:41 +0100
Message-ID: <20260508111744.771659-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 934C54F5CD2
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
	TAGGED_FROM(0.00)[bounces-32280-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.707];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: add header
X-Spam: Yes

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.

The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
supports the DPI interface, but includes SoC-specific register differences
and has no reset control. Add a dedicated compatible string to represent
this variant and update the allOf constraints accordingly.

As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped the "port" property in favor of "ports" with a single port@0
  child, to align with the existing RZ/G2L bindings and simplify the
  device tree structure.
- Updated the commit message to reflect the change from "port" to "ports".
- Dropped RB tag from Rob due to above changes.
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..18776ac9e7c7 100644
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
@@ -83,7 +87,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - resets
   - power-domains
   - ports
   - renesas,vsps
@@ -95,7 +98,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a07g043u-du
+            enum:
+              - renesas,r9a07g043u-du
+              - renesas,r9a09g077-du
     then:
       properties:
         ports:
@@ -137,6 +142,17 @@ allOf:
 
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
+    else:
+      required:
+        - resets
 
 examples:
   # RZ/G2L DU
-- 
2.54.0


