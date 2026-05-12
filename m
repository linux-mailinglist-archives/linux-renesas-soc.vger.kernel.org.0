Return-Path: <linux-renesas-soc+bounces-32491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKbDIHI+A2qr2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 16:51:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DBD522F66
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 16:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBAC531C21F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D433BFAE1;
	Tue, 12 May 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbPjPf4z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1263B992E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596904; cv=none; b=Ej+NUmCTBZPqBIUWpO5Yl6UN9duGUx/Jgzn72mE/EQoi6RY75j72+oT1jgK77z0g2cYDSkSxvSm2wDJj3VzIJjOHWGv30Y3ksv2fF69a3M6xTNusNY/Rad1ggm0fU3Wi+SLHOM5laVWZ+8PWv6oofBxsyXDbI+BG1ATLpJ3ZRWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596904; c=relaxed/simple;
	bh=Las8n2PhcqMFxQgtnNLWKwatngfWthlZ919/bJHgRUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCXlQkYyKz2urFjrlnrrXuZlcrMPHmt7rS6Ift9ugE/ElCWYkYm27gLBLICa0soxyIrONQnUTxOR50QNGu5XoBVjNdT2DoTNpMg+Dx6t2dpDbLx9ctE2cLBsR4TL0CsWYTRHw9kFgcBgm1FB/JuyWX5ybNgPaFy1uTSeZ7qgLj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbPjPf4z; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44e1860558fso3643594f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596901; x=1779201701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/kJIKcZqxJ8G0thiFyFX6xJiY+UhKIMT0pGQl1UUr4=;
        b=jbPjPf4zvlQEnn6u2xe1X3Kny3lGvIG+JaiwfoxGtnjxGkQB/JujWmLLZK7X0e2cJH
         3X1QkmPvoIULqQ4KHs4b8Hn17nq8B5mDfPCZM6HjlUUzrYBCwsrcS5x0DI1ZSI0AOuK+
         Yt+wL6WsYHL3h7pdmhhEA1jqNU3v7AW7A1SFw0At9AzRu/1v7ZlRJmppun5Wir7PAlqp
         yBK6V2YOgK9vxxD8zwbT5dq1OGdFPMifUXXQkuyq+PFbK2cSfuJixgQ/4ikpzungybgi
         2Lw8QgIfNk4Lz43iLado3L/k43RwlVnU6BmOnbogoIqrKbQd6iSRdlRdadPm0uZL3pkb
         mBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596901; x=1779201701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q/kJIKcZqxJ8G0thiFyFX6xJiY+UhKIMT0pGQl1UUr4=;
        b=qgWQ6bzWltXfV2nfqKe3taUZniMeCa6NvZsRAe4MflVxMcSOIgFfVtHBDmbfum1Xvq
         etuRjJeK0UOwo9SXIWS2VBmdLOVdHAk2cp+Ih6/PZMC56Xt878qnFPbFNL14e0uXRrBT
         jizofEvUPWAIBCdZZ9aeEU1wyy8iDLZnyw1OH7OCudBszy5Li+xWiFStaNNc9aQv+4ev
         8UIFEjdhi20gJVN73akc3oLBdIN19LZxLwhsOSts/FHKtcc127pSG3zGfcSzzqpEZQJh
         EVg5Gaw+v5VrdlFAVVpBgMuH8MBdWT0bDCaIFI+U8lmOOchqhyXxxgDxXkAh3lJNOg//
         6i1w==
X-Forwarded-Encrypted: i=1; AFNElJ+OaY9/ec2WT3a6fb1N5nZg09TyFpGeHUQ+agz6fz0l001pwWU7l1SfTOmpnBk1r4LsM+BSi321ClzyfbIvM7qEhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYzkZYBILDZq87aI1Thavid5w30Ldi73lKhJ1z7SyjVuPOogL7
	N0e/NszcLAvxpFrNn/WakfBupa81Mv5ZOGRL5OCdWsu5jU8SxSWHO0PE
X-Gm-Gg: Acq92OHMpB6cZBZaQ6fs8y51LYHQ4Nl6pWha+ZKwF2gLV0TKwSgYKimXi+VtxGAj9wN
	g3v2TdRv7bshIyu0TiGKY7xtBBzYv65ksWc1RUE5M/TiJt/iKufHvPw1Wz/Ia1lcpRhbUhyqBE/
	8Qhw9wsTp3elLnHILvJVFZhacBBYg9eEe3eq/4yJ1CGgI4AwqB94898FNL3drAOMeLXI5RG03GM
	pW1xWhwSy3B9CneKlwjnpsM2pJzeVJetR2V8QdXm7WB31eBDEqyDMK2fQTKoQqRh5USMXI8M3eR
	WMsF5HyQp6IYC65YPLSdcLXLEmYoLxJEgjVWspMW81jn9lXTE8F9Nb8g47LS9uOuJ3IP/z8s8dN
	E5r7mi02uehMdg7RY8FKTeHXRg312uMaaXG9h0FN/DZEIw3HW6/uX8IPKt0WulCsznIiII7okWS
	XlsVzYWVAzKUtTaTf9WFWCW6wkut+wHrHCFC85mC/z4K0ninI/Cy0vpROBQfw7IEAn7NtVLK8wU
	Px6YLuD/So389vzSBAf8SxjV2HZPi7l9iE=
X-Received: by 2002:a05:6000:420c:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-454637c817fmr27827468f8f.38.1778596900791;
        Tue, 12 May 2026 07:41:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:40 -0700 (PDT)
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
Subject: [PATCH v3 2/5] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
Date: Tue, 12 May 2026 15:41:01 +0100
Message-ID: <20260512144104.761531-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 01DBD522F66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32491-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Action: no action

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
v2->v3:
- No change

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
index 5add3b832eab..7c84a9ecc7a7 100644
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
@@ -138,6 +143,17 @@ allOf:
 
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


