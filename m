Return-Path: <linux-renesas-soc+bounces-31864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGA9Nld/9GmXBwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 12:24:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D38714AB99B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 01 May 2026 12:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD0D43004065
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 May 2026 10:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D2C386566;
	Fri,  1 May 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOToTaHd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536383859EC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 May 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631058; cv=none; b=C/yZILNFPv8ElQyMOh+1UBUvmBQHxG415ZPhnel9vPjN1GHeThqOb8bkiicNKxgUkv+n25nBwsDxA2LFrEcY5E3T+G8QOck++hjjfowv8kGauclQ4jEY9CkEABgszsF4VKfthroxJFlF+E2YS3SiyFJDpA4F0+uYk+fVHEh1H0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631058; c=relaxed/simple;
	bh=QnkNnx9k8UNt0OzcapqQjvj9/iFCN7S7MPJtuIjyvqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lm/A5vK792MsG1Wbou1BSHexzwLCMGz2dRBqtLNx4lFo5NQiv2I+EFo1O+kiOoUktL8RTodxT1PehysLp/yG+DA467C++sFJfsjGZ1fAJi/jLvl6cIpEwfM7kk0V3Cl+nwABOegipjTdVqHEseit1Zom8P/Kgmy659uQlPajO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOToTaHd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so17775395e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 May 2026 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631056; x=1778235856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tjdh99dmMY77j16LsBzv2dEuLqYqGw+VhQyABiovB2k=;
        b=IOToTaHda46GVhULUWEUd0N6CA6+cso4UAyI7xb2Sh0m6dRBn/fW6PJX8zO1FCnuav
         go+kmCygBSEFFcZ+cJuXiAYw+AfcPpnrkzHFTLmX3F/FENFzBWYsIKpAn3NRjGQg203H
         1Lj19Ci2SKXMWNWVuWGxIo5TmbCdcgob11ZULVdRuqpoqKzU8RSqVccbzUlxxbOSDFfK
         jn5sWHI02yBvlG3SzXQ6m29circSEDmAJiULxjxMKRmikoKCNkfM2Ys2X2LblLYbG+TP
         NDUbv4zoCA/M9bJC+QWxu7K4AGRMB8C0WS+GpanFv11bGm4npSriXudHNkVlYeQ/LU4v
         V9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631056; x=1778235856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjdh99dmMY77j16LsBzv2dEuLqYqGw+VhQyABiovB2k=;
        b=KS477zUssD23c3FQnqBEixnjNxqO8dpnGmbrkhn8zhf/VlZQq4eC8ycoI9v9hCX0Zw
         YUcefMB5ppkx7C6Fr5b7YE7C9R5Z3vv8H45au6d4ybEJ4xiBdtBfHItTbGAZKs4Elws+
         048rqmcF99jxJkXYjLG1ApzRLdTobfeiZfjHWegSnmkLfb1Kpd8uFyaqEOtIsScck+Wp
         Lb2k6YnpJQ9780pp92itP/gdLwbMABmasRsD+Xd+MvMNZbnpFtQsgWfd1f/hECjNGviq
         PcXbqEwYsL2rOvJ3daACMVviPRB2cvkpzz2ljNQloH61fMmN/ZVZH5bYxLoBUUTmNP5w
         lgMA==
X-Gm-Message-State: AOJu0Ywbk1q+nQwVfh0lZZsZp5FwySBXPL8N99RIvgQQQDxI6XgvCVX9
	LP9jwAFI1Ybn/GM7JWZbNSP//yK4Zj3dtfArwF1PsNxKBO0DFecewGjy
X-Gm-Gg: AeBDiesz2QuQbKNy90UVHekpf13Nefo1Fxth48CpzIhvfgXgFEd0r1Xv+i8zJGF2mDl
	DAO/cFwD+fkZsaJ4Z5uuCpUFyealrLv8aj+FTEYe89i7ENzRd/Qqz2XtDd/lKl+CKXSAfnF2Puz
	jPUJ7AX3l0fwjrEa3UURGHGZ0LGVEeW/0ZvvR64NIyk548e0iny0Y46TmT8wdpzvXHF+3KQ6cLX
	Y+WYzG/L6tKby3YQmckdol1m/JIfkj0bXzRWGZ0pBRfVrGjOA1HOKLpIgMqbASXIXrUe9TjryHo
	X+tYw0uBxCQIWbNYiwaYTNQmRdNQ2XNC0KLiQYxXFL92rRDUzSiJDr41mIkKlpcR4HyXxWpwUwZ
	Ijslj9lezCHd8H7U0El0WoBfl+/0se9X5npbTqC4nTD8rtvAvJgaqwrIqt0axKvxSuc0wtzogi0
	sgZz0ZSor0ri/7LN03/5MpitYrR1/NpXjNozc9fqQJMhdiLy0mFfYfGWDKyqKX5Ch7aiExV6v+c
	QOGlHjsJ/2ZuOGv8Mkl1+ooGJjfsTNLv38oePYDsLKqPbGb9U1d35Qi0g==
X-Received: by 2002:a05:600d:6:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-48a83d6a8b6mr90374315e9.4.1777631055567;
        Fri, 01 May 2026 03:24:15 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1220:5ff:c603:f3ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ef52854sm4405895f8f.12.2026.05.01.03.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:24:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2N support
Date: Fri,  1 May 2026 11:24:07 +0100
Message-ID: <20260501102407.29462-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D38714AB99B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31864-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Renesas RZ/V2N PCIe host controller, which is compatible with
the RZ/G3E PCIe IP and therefore uses it as a fallback compatible. The
only difference is that it uses device ID 0x003B.

Make the binding title generic to avoid extending the title for each new
SoC, and update the description to list the supported SoCs and their
capabilities.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated the title
- device-id value updated to lowercase

Note this patch was originally sent as part of series [0], as RZ/V2H
support needs discussion sending this single patch. The RZ/V2N support
can be merged independently of RZ/V2H.

[0] https://lore.kernel.org/all/20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index a67108c48feb..90086909e921 100644
--- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -4,21 +4,27 @@
 $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/G3S PCIe host controller
+title: Renesas RZ/G3S PCIe host controller (and similar SoCs)
 
 maintainers:
   - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 
-description:
-  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe
-  Base Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and
-  up to 8 GT/s (Gen3) for RZ/G3E.
+description: |
+  PCIe host controller found in Renesas RZ/G3S and similar SoCs complies
+  with PCIe Base Specification 4.0 and supports different link speeds
+  depending on the SoC variant:
+    - Gen2 (5 GT/s): RZ/G3S
+    - Gen3 (8 GT/s): RZ/G3E, RZ/V2N
 
 properties:
   compatible:
-    enum:
-      - renesas,r9a08g045-pcie # RZ/G3S
-      - renesas,r9a09g047-pcie # RZ/G3E
+    oneOf:
+      - enum:
+          - renesas,r9a08g045-pcie # RZ/G3S
+          - renesas,r9a09g047-pcie # RZ/G3E
+      - items:
+          - const: renesas,r9a09g056-pcie # RZ/V2N
+          - const: renesas,r9a09g047-pcie
 
   reg:
     maxItems: 1
@@ -152,6 +158,7 @@ patternProperties:
         enum:
           - 0x0033
           - 0x0039
+          - 0x003b
 
       clocks:
         items:
-- 
2.54.0


