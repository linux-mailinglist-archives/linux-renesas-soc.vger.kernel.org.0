Return-Path: <linux-renesas-soc+bounces-29767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBlXCRSfumkkZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:48:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B55532BBCCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D09B13039ED6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9723D75CC;
	Wed, 18 Mar 2026 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jddml+oL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837A83D75AC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837917; cv=none; b=ZtMnVEXBIF0iql/aZKuHjc+VhssRHS509T1FCNrE5qo30xwHsEIAcdJgGwnf+v3XA95X2bImp4XbNX+q1tCuXOz38cCNgI0QJanbb4WRy49x9xE0hhzbpPNgQZR3wh4UIVeCD6v24smxSTHlOzd+SBXk05NLFKCkXJOKj7aD+EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837917; c=relaxed/simple;
	bh=S2KC3vKp+XiJMeRZkqtihpR3beahjbDMHQU04/KXPHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aI5bIj+qe/3WOJKe7zX1t6p0gbT5J7+hz1iGTqnuFWoSHHAsEiC4+6Da6/eDxa8uJJ4DqIYKKeCXOr8KKNjcp6gK8foBrpFjQBWhLEYz++WunAcipC2gxJyk0FmJDCpvc84w1+1ygoITrdIQ9by9xFgVwlisJ5r+BpDoNdgbeB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jddml+oL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b4d73463dso1259804f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773837909; x=1774442709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+e51u2Yg6neT38eXp4c23jk4Undnjc8a7bolt2l3qII=;
        b=jddml+oL2i7whJ/Gr2f+6ld1F0nPVZmR0KPkydbevcXowWNXVKP260851n5/1sY9AK
         F1E0ofe0jdUTgOFHgU/15DSeE0btgl56t66mcVwXKWnJETUiAbUrlXmetLr1yfOuKq2s
         NVg7aSp0gHwCh+Xg8hv62TdD1zlu3d9/qlhhzBiJZgVJiykrBQgUw4r5URpOs1Lr6xAc
         wH0fcmygF40rnyDK1sdjgacLieCSnqQfBKBvGORm/am7Soj7QF0+GYICa4LN4RBzdycP
         QjakgS2uVKeKz43cO1V9RDUljz1n/nW0z4OVFei6p3LIKHD8dYkdpZ/mY/UeU0RnOymG
         pEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837909; x=1774442709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+e51u2Yg6neT38eXp4c23jk4Undnjc8a7bolt2l3qII=;
        b=n9iZMdqHMue+Qk5PonH0Pw+1Tb5u0jdGUGcpnqbvYDIkZ449ZKYZ+eVKUnJuwPzdaK
         5Xwd2jvkIdlQRI45H56CNUEGIxti1lBlWkxRktKMlN2fRz3bqrsLPfHTdixgxRR+W1JT
         U2GaZHHEwwa7+N5pqRiOzolGev5X8+wYpXE1Sli1JYwzauNK8cELW9h5YbBocDDVw+XC
         AUV7RBQ7LkEKNw514Q4fGCq57gbBI2Z+CE6bDlrJ0SNOahOIqe8OCMr2TRzqZFZQXHUd
         12nyBC6fdPKvY8Z88Rn35FOrV3CbadoF5DhKhz3aNlg8vWd54p5pmSLWB0GqB+p/9xoq
         xyQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+WVem0nY3r48Zrrg5OlbMNRrABfWB0cxW7KjhhYVUDJB6hdYiCybNObUCWzBh/VihDOfcgxZP6SdmaQtM7R8Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8ev8DAE0MfRM6SsS7R6p2r8AhiisnKYAe3x+U9BCRwa2NeqQ
	8CCxzt9L0XzB/vQFgKwmMkBKSBSREE53vE7C/82NdeQDSWtKwKTfADqy
X-Gm-Gg: ATEYQzwf5QwTCInFaIsvvxZPA4IjwOhUvEuJWAV6d1H4apK6LCd+xshryOD16K+4yiL
	RwAtSL7xroMv319vTCplztxxvcc7wN9DlUI+G1340wHczvQ7X8HdGNnL7Y9oZsRwPTw74VROgoN
	7ZMy4i6kE/wIXPr3Y70w1IGR9IShLjadyV0iH/a+f11m3O6v2Y9s82wCSkfECkI64M54V/r86GE
	KnyQyjiQbbxW7Izb99mt7GfdPpjvD4fP8SBAIp5lXCRSGWMO+qL2B5/nnUmmygiz1NaBmfAeF3I
	s9/cSEfV91466nV1xkLY3W1lWoIFgAVhnWLmdXtf8ok0LukICkFTayx8fMNvXU8XHfhXkDLLnT+
	4xh0OBEXmbT/njJJFm0FidZEKVKYa7TId0RAWc2/4zu3ju/VA8iZWPPPKq+rYh7dLu22fIhqWoW
	UpilnY6rnbyQSAkb6tMfcoBLN+d2OotHAhp1munyW5nYlUn0mVmDLH2oK1PbWQI3u4/INIJxb7M
	qzL8aGXsS4LcvmwAn4PF8u4RKMt6CyPcqhJKLHLAfs7ytU=
X-Received: by 2002:a05:6000:2f81:b0:439:cb9f:d635 with SMTP id ffacd0b85a97d-43b527cd28emr5179904f8f.46.1773837909165;
        Wed, 18 Mar 2026 05:45:09 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5f14:a98b:b4be:efbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518985f6sm7888162f8f.25.2026.03.18.05.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:45:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] dt-bindings: pci: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
Date: Wed, 18 Mar 2026 12:44:47 +0000
Message-ID: <20260318124450.163471-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29767-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B55532BBCCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the PCIe controller found on the RZ/V2H(P) SoC. The
RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
additional registers and configuration bits for PCIe lane control, and
supports multilink operation selectable between a single x4 port or two
independent x2 ports.

The RZ/V2H(P) SoC supports multilink operation, in which it provides
two independent PCIe channels (channel 0 and channel 1). To correctly
configure the multilink mode and per-channel PCIe settings in the SYS
registers, make the "linux,pci-domain" and "num-lanes" properties
mandatory for this SoC and restrict their values as per the SoC
requirements.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index 858ec02e6d62..57807d0abd9a 100644
--- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -14,7 +14,7 @@ description: |
   with PCIe Base Specification 4.0 and supports different link speeds
   depending on the SoC variant:
     - Gen2 (5 GT/s): RZ/G3S
-    - Gen3 (8 GT/s): RZ/G3E, RZ/V2N
+    - Gen3 (8 GT/s): RZ/G3E, RZ/V2H(P), RZ/V2N
 
 properties:
   compatible:
@@ -22,6 +22,7 @@ properties:
       - enum:
           - renesas,r9a08g045-pcie # RZ/G3S
           - renesas,r9a09g047-pcie # RZ/G3E
+          - renesas,r9a09g057-pcie # RZ/V2H(P)
       - items:
           - const: renesas,r9a09g056-pcie # RZ/V2N
           - const: renesas,r9a09g047-pcie
@@ -220,7 +221,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g047-pcie
+            enum:
+              - renesas,r9a09g047-pcie
+              - renesas,r9a09g057-pcie
     then:
       properties:
         interrupts:
@@ -236,6 +239,21 @@ allOf:
         reset-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-pcie
+    then:
+      properties:
+        linux,pci-domain:
+          enum: [0, 1]
+        num-lanes:
+          enum: [2, 4]
+      required:
+        - linux,pci-domain
+        - num-lanes
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0


