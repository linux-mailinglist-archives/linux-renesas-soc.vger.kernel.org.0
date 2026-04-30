Return-Path: <linux-renesas-soc+bounces-31786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HImAeYs82mwxgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:20:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF34A0B8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16B3630055D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCE03FE650;
	Thu, 30 Apr 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER2bVgf3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2213DCD94
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543785; cv=none; b=PlzstK1UrQ/10axmuHfIPSErx88ceuPpaGZi/xWFUfgh7Qhx7udSeZBSeXlB32FfYl/QQg3QS9bAck9xnnHcTZeU5dQA0st/dveEGP/YJ7oIgffKMBWeK4VV0bqwseBNm4SXZmUUsVrCW14anzzXsmlCT5tLI56mQkWT9ypZZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543785; c=relaxed/simple;
	bh=R2mGUgVgDOXquc18MO2nFUnPiIUFtzW2JSwhhXHeA20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwAjbUIhUBZ/iHv7X7u/jWW4JjXQQ2nHopYyEH9QdhE2v3B/j2NOSL3D9i65NvTfhgGwcyv/zZgynL2n2lpsTLzUWx1lGu06LAtZ8obo8Xg2NKTFkc/SQyfyz1K/MnL6yVqgfCGoonYgR2lxLPjqt6RAIEtprSyNZiLAzZqBHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER2bVgf3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso7463755e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543782; x=1778148582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lH8TTJLFLbOhiTHR6lIN5pwq1nU1A3T8wtyLnEmupU=;
        b=ER2bVgf3syhUBnYlj6eIo34Mc3DUsBW1uXi5EyuXGpvw5CQpkSuw3/fZCWZHzadJzS
         4uh3U8XHpboAyl5LM3JaK59VJ/XB1Lf66TndL38xWpyDkD6ND+9R+Zo+mXy3F10JYB0V
         VEZjldXZcN8g3avG9lbVLCaWIXpaWnYZpZcoT3VUOQgjlXQXDLcwCRDuUUnwuX9GuhDl
         dJcYRkwGNEjJw5889AdhDzrk2ubCx/u//t098iz9/dhNwFvMWoMyVimKT7s8qzHlKHHr
         n09+ZSXVO5V9M+yZToYfLULHvHpFEJGOmOfiYQxwiRBRVum5dHc8QCTzxVG0er32ufRr
         +0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543782; x=1778148582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1lH8TTJLFLbOhiTHR6lIN5pwq1nU1A3T8wtyLnEmupU=;
        b=hUsUQMZF458lSsSDg26YBYHC0zpwQ4KWoItFtKh3fmo7P4M3JPxNO/tiuCwaxr+RdV
         U2K/ODQg5lhm37m1vCCmQ0pu6jWNpklEJ2V7OdMRvC7EruTEI8ddhMEiNCZg/kvk4BGA
         YHh2oH1a5sVvcb3PvjGTZu+FPtEj6lCC73eETOyaSHcS+nzsgDkNKpbk/gQJgdmXgdiX
         azBz/xPQWr0eZ7vQWkRdlsBFNhQybG5m/hTY3Zln7+ykphQ2rRhjgrmU675F8eiUdMls
         9rHeG0baPdii9EY8DMs09qIHHijqNVJmYnI7UH1lePyG4Bhf8iX4FHVSeuy5gJf2FLP3
         /V6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/4p7U+p5oF8tszM2gsY3No5VXu8+xZImqwnvR3jVqoZXXx0kcsekLteQiZZ4t5tjLO9ORgqPPb0307Nxfuw2X4tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgIOSPy/IrIRBd47UWiQ+BIGNmQN3DMh1rt9Qd6wK3fn2ZAcj9
	dh/8XHXajxUA25b/z8aNQPVEhWH0XgqnKolYS9MXateWbdVS6FMDtQP7
X-Gm-Gg: AeBDieudOVnxpHuJAiZ0QzsYY1a0ETNKbFeRXug+5k1XKHbkRtnUW2M8HXsFY8WQy1s
	vICkgA1+x0YQAfeUdMF+HKIBFhIWklXaws1wigO9hoOtXO1QpTi69voZIJZQHNCT6x6wYZwn7Zf
	pPNrqTVq0OLmoeUIjMPzMe5KPsKon8qrz1XJBtfiV5yM/1G0ZnlnfavX9AZ84GvA9bmh1s5Tzx1
	SWK8sbZ1p7MLyHdBd9J6/pkhXE6TMmsbz0NaORtDjF9tRXa387DyblfbSB3TnsISb2qdxRzj280
	IlBgLioIBcTW/FC4l9x0jJlDdvn92kp19oj9ZnkAn4GYbDbxrcmpMnnIRy466pAmP3lo+niZIor
	WLYxSBUdNcfUoeAOnCJoejjKhfXrjcqhUTyxnVvsxb7gAJjTuv8N4urK3cd22UZwEhL73D4ZGXK
	2Ngtp8WeTfidK05mrdx7aaxcTx/2SA3Ep3wgUF70R4g1kY1V7VIGygsFkjZN3WCU+na2y6XU+oq
	/BhUi/xn/D6v0vu7776Ei9vdbijEUzNjID8uPi0CZlob0RSgl0PKPLe0A==
X-Received: by 2002:a05:600c:4fc5:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48a8445dda3mr41087235e9.27.1777543782165;
        Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] media: dt-bindings: media: renesas,fcp: Document RZ/T2H and RZ/N2H SoCs
Date: Thu, 30 Apr 2026 11:09:27 +0100
Message-ID: <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 00BF34A0B8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31786-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.986];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the FCPVD blocks present on the RZ/T2H and RZ/N2H SoCs.

The FCPVD implementation on these SoCs is identical to that found on the
RZ/G2L family.

Update the schema to disallow the "resets" property for these SoCs,
reflecting the absence of a reset control for the FCPVD instance.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 5e11ae0ee456..cbb16a7a5481 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -34,6 +34,8 @@ properties:
               - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
+              - renesas,r9a09g077-fcpvd # RZ/T2H
+              - renesas,r9a09g087-fcpvd # RZ/N2H
           - const: renesas,fcpv         # Generic FCP for VSP fallback
 
   reg:
@@ -66,7 +68,6 @@ required:
   - reg
   - clocks
   - power-domains
-  - resets
 
 additionalProperties: false
 
@@ -83,6 +84,8 @@ allOf:
               - renesas,r9a09g047-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
+              - renesas,r9a09g077-fcpvd
+              - renesas,r9a09g087-fcpvd
     then:
       properties:
         clocks:
@@ -94,6 +97,19 @@ allOf:
         clocks:
           maxItems: 1
         clock-names: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g077-fcpvd
+              - renesas,r9a09g087-fcpvd
+    then:
+      properties:
+        resets: false
+    else:
+      required:
+        - resets
 
 examples:
   # R8A7795 (R-Car H3) FCP for VSP-D1
-- 
2.54.0


