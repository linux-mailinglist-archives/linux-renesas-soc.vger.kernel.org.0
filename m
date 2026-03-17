Return-Path: <linux-renesas-soc+bounces-29582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JbSGwAruWmVtQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:20:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FCD2A7C1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CDE2305E300
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7175539F184;
	Tue, 17 Mar 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4M5zYhb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D139FCA7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742594; cv=none; b=iryjucirCRSfHKXoz5xyyRKlaxugwHq72/S1FgNKx8Jz/TnoO3YcduErRG+hMF+znIY49NVpRbPxp01nEMzkfYi28rkbFJlSrcxDHna1LKdFvBCylCKlR+sHrGUmN2t95YWfYxM/sJohrg4mlT9TfthGFiGsZm1SnnJAAoARknE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742594; c=relaxed/simple;
	bh=MkKJsnHJt0I3M0VDRqlYD6Y/FYCi4SGRoTsot9r9C98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqHDyiBrfh2faykm9e7Ab9b3ExtgO1M9dH3n4cuwGQu87Su49XZLTFlpttxqoF1N8fHlboJd+RE/OxRFZIGDQ7LEN47zFjeWXaoOogLek4QXAN5/ZKrRiqwpmoyGSQnm/R/w823F1wNtdyslfqdDpyCrI3K3pUm9GhVwvm8efcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4M5zYhb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f454be5bso6003705e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742591; x=1774347391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPU/OB6JjZLkGjsMveSgC+3WpNZwaCIVZ3MgU8COI8Y=;
        b=l4M5zYhbKZqXFBOmgxRGR/CjiszGzCFNsHkEFIe1hwMV5e8Ug3YlnHDBEBUIcER6rP
         4B/1LaiVYpV+MWrfulMjc67iwNjNGeziIOw0Qaq2t+k0+L+hYF4WrKsOWT5d4gtYv935
         6g0P5TIJ3jcLbSAvUczLr3XYuA8KMaIGS/JWXZ2i7rBwZ2CdhjjmdztoI5f7fk6NFCXR
         OzKmO/APIGYblGveonCdYYvQgBxqXqjRj0eYcpVG5pkXeYrZ9vga7JH9nixcTkY358sM
         vX8LJmg8mfFvxfCzrbaxrjFyh91dG8ALK2qGhLbAfeW9gOEB6VpD3XUVvJByoL9i+WsP
         Y+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742591; x=1774347391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UPU/OB6JjZLkGjsMveSgC+3WpNZwaCIVZ3MgU8COI8Y=;
        b=c85rAyeLFn5Vlig8zlKNtyTndbK7NS6vwMICPlNykzoZNaWUFGeXOlia5bYk3uxGF2
         x7BtRNAS+M7y0SF+tSlnO8jAF7pPjouUJcbL+Z4iOVFNCR9RA/0TasDsiqeGr6Nx1qtP
         JHf04WM6YcAwuFwdMLJiWgAGfFdioi8mlLiG4BNdCXOjBANMalRx1+wIx1GTkESM6Le6
         AZjp0OsB7cdxqe8j0jn058RPbJ9MMrexrMIOPrOBokagmchneo0ZD+1jjRyTCojc3Bly
         VZyXJiXAhJeqLmXfW+fBcWu5ITBFfOZIF0H7ySgF/xbjWS+lD4vdI1lmwiwqFZGrN5Uu
         jXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVNkxjVSZX3tTxfXWln52kGUZOYcF14VPQciRFx/VK+HWP8+zf4GLSfaNi0eSOb6I9dU7fhBHiN1fdKupTubRsVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3meDXGO66+g7ROPMYqoWVktmmwtRT+ic5PEOMp0tlSDOsaHH7
	oASpWyYTWNLaJPeDDWxMR9G6Kc3YEBzgHyEKGxXH9MZfcornfOYsivpY
X-Gm-Gg: ATEYQzyju8IYh86pCwfmAbEbX+k8pu1Z+6cvseNUK51BYmNg7YF8rWghN6rfhMx++09
	c/gOffHGEvd4G9Nn2wqyHoC7QW56IAuUKnuGw5awKQFis1Y5teiwkQnsMeHiJ97s5r23YOBEv0Z
	7ZrZ89Zf5mcOq8tN6e9egbtXoF/Ir/hrGVuVF47IomBY4j/pfcLejSpopV+Fa1kuieogmTn4Rwr
	O1YlPRAn+02hfRSWGKMCaYOHINQ7mwN2vkD2YmoWcNOLjzMBtbVfdQ2IIQSvU4WtmoDApLJ/+lH
	Oo/URrVYBfoH1k7QAe3RsTYX4vB9bc/5iUC71gjbVR3uVycPPm/JXFgDpEQpPPrTjt+6xFPFdyH
	OPjAR8wlpFQXY6oDslGvf3keR8Nsx+ut8cXgdZ6OEIHENQz1t95HJzOeDn34J14cXrTbOdvEaSL
	UruIACLMzUq5VF+YCjvIjH18xMmZeCN/ubo45WJJ267Y3pfJu7
X-Received: by 2002:a05:600c:4f92:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-4856eadb12amr36947195e9.13.1773742591264;
        Tue, 17 Mar 2026 03:16:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:30 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/8] dt-bindings: pinctrl: renesas: Document reset-names
Date: Tue, 17 Mar 2026 10:16:14 +0000
Message-ID: <20260317101627.174491-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29582-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,microchip.com:email,renesas.com:email]
X-Rspamd-Queue-Id: C7FCD2A7C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

All SoCs has multiple resets. Document reset-names property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems
 * Collected tag
---
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 00c05243b9a4..1a94e396b1b0 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -78,6 +78,16 @@ properties:
           - description: PFC main reset
           - description: Reset for the control register related to WDTUDFCA and WDTUDFFCM pins
 
+  reset-names:
+    oneOf:
+      - items:
+          - const: rstn
+          - const: port
+          - const: spare
+      - items:
+          - const: main
+          - const: error
+
 additionalProperties:
   anyOf:
     - type: object
@@ -152,10 +162,14 @@ allOf:
       properties:
         resets:
           maxItems: 2
+        reset-names:
+          maxItems: 2
     else:
       properties:
         resets:
           minItems: 3
+        reset-names:
+          minItems: 3
 
 required:
   - compatible
@@ -187,6 +201,7 @@ examples:
             resets = <&cpg R9A07G044_GPIO_RSTN>,
                      <&cpg R9A07G044_GPIO_PORT_RESETN>,
                      <&cpg R9A07G044_GPIO_SPARE_RESETN>;
+            reset-names = "rstn", "port", "spare";
             power-domains = <&cpg>;
 
             scif0_pins: serial0 {
-- 
2.43.0


