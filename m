Return-Path: <linux-renesas-soc+bounces-32826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKFkE7uODGpnjAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:24:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1535823CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A092307F4D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6C54028F0;
	Tue, 19 May 2026 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEuZs1r0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D778F2E8DE3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206928; cv=none; b=uLYBkswNA+X5mHH1T5f4ONuLuiDC+vYZiLjWmbtpVOozwG7WIv7fT8g9MGGbC5c9z5g0vA+HByFxSbCjDfXgdyCNZYo4rbUr38KIb7YDA0pCrtXJu88KwFQ5RsEUsdHGjCVv6OPBDgA70cwfgFel7A5VDN3l/OX/4T1mi4rtR6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206928; c=relaxed/simple;
	bh=txmnwIry7YfsCxQmvrZh1q0EPy1m+2KG+lq8UUS3rhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/LRbj2H0qMwfKOICYNxHB9LXIVS3+Szeq1lcQUBW0d3YuXMHkp4HULrB6cvjdR7MOe6M9xmcqUtgyKCrnC/BburGRJMHoo3VWMvh6FmcnmubLNlMrlqZ0Eq6AZIcUTmgO64kUsbLkvudHr5M67xmU4uvycj+1Ph7fOQW5RekvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEuZs1r0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso24073985e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206925; x=1779811725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOkRbl/Z3KIo8IHWL0YYZ2T30bRveRdlbF9KAPZu9kI=;
        b=LEuZs1r0+xfszqN+IMmjNymaYET5PzO/xwezFhjJspZIqCk7qf39lJ4FKUCRUdoCFr
         8wCipjO0/vezFRmd7Z5CmjI+hWqtNgsMYxi6pKJpdmYTKN1E5Atx8H7wCwNb/stiuJ3v
         b0FvpbNY6Yd/vPWhlviAHnTESZld37wCF291Bt6sdKSk9dGZscVbZpb8NXKmVXPkIA0L
         laTPA5HYVNjft/oexgMvMhXVFLfeoMw2/16pXvq/b7L5ObiYZIMtH7R+GVRQLJd1KcEw
         icKHxX6iKvIK3deQJiWeX+v75d7lSDNOsif6Gp+e1PUFQVDuUA+BHr8Uu1uVtr3EmFax
         QozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206925; x=1779811725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UOkRbl/Z3KIo8IHWL0YYZ2T30bRveRdlbF9KAPZu9kI=;
        b=OFNCCgpKLcNiEbdb3GOfOKN4yS18BIyDUZGPDqF54D9kEXtpYfH1ic3Q/A/MdDJW6X
         AcRac9vim84iLDAFMo0fQCK6S57fl9aZNhUpykJqvdxhoUQlV/U2zDXiul4cb4WsZF+w
         6CcbHtki7iMew9mUgF6Xfs17ylDbBU9dmfS76ZpNYhbD+3k50+8YnYMI83njoF6Q92az
         uVt0GA5IYnPyMfLu0zfNKtu9ty+MdhA+gFu+jIqiv1RNlsd3KFgA5fu8GyJBzKz2GMhz
         Inyr9ixrsH8NxZXbdyjU+8lzmjjdehhVFSDAoxyKzKTb3OYDTsPNrSzuzYa4ZEDLLRXF
         nFuw==
X-Forwarded-Encrypted: i=1; AFNElJ81YKmjlSbZyI0nWEFg91a3EtIbRS0FjBnnGbZHtDgZ+lllmAgn6rdczLbXBszBJJ9B3h/nwkv9JJHMjgl7d3ygLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ySva19+ZhoCH/4YxMylzLtRJiqsChw2LmFLg0/Yp0jODBv2s
	AQG61GwcrJrwpZGtosiRE65kB5kemeUWCjLE+cyo+c7+Dq1yJGi3VCaK
X-Gm-Gg: Acq92OHaf3fQvNcyVmi28XA2Bn3zb7GH71himgOUdn+Iu1lJxK0y+WZnRW/MWF/o3Mc
	uHrHJmWd3nqvLF9f1Ot3b04bV+zSjazuuCPgjMdG4+X+51GwywaPnMD7EueHICW92/p+d12C6Se
	+70t8A3LXQH7WQNncmpo2yqOPsjDozi7cZtMRc/56GeWsPf5y+SCcVdun4dzIgM0DbXlGsLvo2k
	oyGt41+6foTuPls+oFcznvT1IEaD3FlCThu4MiCn4n7XMgzRm+wJlcaF0e8E5GEqn/mLOr2js9I
	zyZiPWXg/i06Ty70AjkWueZjz4Y/In1NuXFFZ5GiF6mfaRfEdfbdY5xwbzGMspFMIimxEuyNAv2
	YgwroJkAywSBzL41F5KiWGdJaLtLn8z9/DMXrxNRMS016iQdOMsB/0V8B16fIf9Fr4JbPF5HtWf
	8PmUc8MrdUbJO6zTN8whNfC0pR4SInawoQI1IPEDve5IFsf1rqstZ4Za2rYRG0YcIgBm8Cmvowr
	LJMsa6n0wxxjgxTTz8J1xlKawH0Bl1iBXdykQ==
X-Received: by 2002:a05:600c:34cd:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48fe61f2c03mr344635125e9.21.1779206925142;
        Tue, 19 May 2026 09:08:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:44 -0700 (PDT)
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
Subject: [PATCH v4 2/5] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
Date: Tue, 19 May 2026 17:08:22 +0100
Message-ID: <20260519160825.4082566-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32826-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.0:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6E1535823CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.

The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
supports the DPI interface, but includes SoC-specific register differences
and has no reset control. Add a dedicated compatible string to represent
this variant and update the allOf constraints accordingly.

As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v3->v4:
- Added RB tag from Rob.

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


