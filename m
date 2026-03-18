Return-Path: <linux-renesas-soc+bounces-29766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VDIMDnSeumkkZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:45:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C21202BBC0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03AE03019CBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78A43CFF51;
	Wed, 18 Mar 2026 12:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUfK8uxO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C13D3335
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837915; cv=none; b=gekyhBlFM9aT/i1kUW+VR4wW6UAuNr/i20M+AFxTx2Q6dhO1p1AOR3msd8mXdll+kTqHO+EUGDBaRDTCLr0HsDLtsZ0vE64/4o+Oq7zyKagH8YHd3TBgJEH+9BWgw5EnX2KtyfZ+U34m2wv/pruFHXYrsdYB1pIGSuYlpTnuo1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837915; c=relaxed/simple;
	bh=WzTncAMQYnUAjkJv6VacHhJuXVWxUaLMygBhcDC1f9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbEv/Z4AUjh16pitc+4SDBK/5R2rBa/WbEB3coHIqCQ9qmCQRw2wjjHSWhfkiwvyyHMVjeHPf1qU17dej67YZqogCyJwTTMPLx+iXTqn5Fg9R5H34gvAgcWYGTSD+cZAfRrkxMjXKsNqcUqqnCAGl3xONCTu6dtZz3kRsM/pmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUfK8uxO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b47b95a77so2363868f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773837908; x=1774442708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stC055Do0g5JVm9ctV7BdXY8ikwKBl5kRv52IetvAxY=;
        b=mUfK8uxOOgZ67GQsE/RnpR75Xw26rRNFofBH0GGqHFlnfOua3w+0WC3NHasT/DQdMs
         ttsJRxDjhPfmgXzz+P6UEU8BVYxSBNHXutsdlLGj1DQ+RjnrZhekKF83sjhu72xeBDfN
         Y8nGLWxTV1tqKggOwaCYkRaXaxav4zhIdjRr1vgqyBaumBkBfAdwxE5xYrYrzf5TJZa+
         O7W1Jx+DkqWkeIc5gdxx05ivD6hKczzOpJEjaw8avjgNhYpYuWGr4vcUXNdxzNRBvo9m
         lKITew3viWQeMB8RO9iMcv8fZTbTBRWLtGTq1fYsnhP8g1cg3Ni+CLqNzl6biKnLBGjp
         g5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837908; x=1774442708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stC055Do0g5JVm9ctV7BdXY8ikwKBl5kRv52IetvAxY=;
        b=ccoFb79NefZMXXZ12ikjHnfYREsXE0TVSLAy/9bgvkfQAOvLiUvpPlUaKRoQ7Z+0vD
         QpJSvCzf/Rqge9eSP0BgH/gL2ZqJU4F1EtjuTZLqullnCahQdsgwtCvdYymj+rh49agM
         mn6WW+bq/sl5/+oIlrwa7bMiZI/kBLztfPOf7GeMpiAGTlNeGkbnbIMi0D09CBqyphig
         sIVimrumFGrHEtrSK6xe8sb8BcjXBWzw3zLSC7e3mNS2WxANR4QI86SbQvSUROI5P4yJ
         OH80QrAVw+pBN9wtz5gckL8YDuD8gBJ7BI4xzijkdZJVAu5XMV6kVEsTq/yyijeafevM
         KsGw==
X-Forwarded-Encrypted: i=1; AJvYcCVOWsh73CHWbfL/QgHUi+A7j3nGAQ0jIU51BN4b4qoH1W9MpNRBOmfcmwb90KjKoTcbvpDOg78o561VgKtwHJsSpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0+4zF8vM+y60EG3OU61BprY6rFwJdJm8S17rd7FXZD7C1Rmn
	tI2GXsrVqJW4H5vCUTq1dVZ2W0ebzBUEK1fX0DEhXhcEs9dxQcT9ptyd
X-Gm-Gg: ATEYQzwjFS7BzJB3TNeKaoQ474nvNqGU9B9cvTCrzEuJ4Kf+pJPBklHa3XK0Y+Pw7B9
	i+u4ntP02IQAtwJ1pCf/xBbJ/3NNO5TNqJ+LLbdtWJJSATF7FuROpqCxgLq4nTwJyGkyhDxHmWL
	YWyI3hB/B2HixzCuLCqIb88SuPzv9Ir1aaIPzp31O+f76I8j/cAADlNzWjIcg22HeTGO70rzJAG
	n/goNzS+PkuRETG1UzpC8ugpMTWnF6XuI1X0o+SZxBQZTABrSeeksDPeuH6fmfmU3CP2YcB/Qkh
	N+C3h2Zaya9yWfgex4PKtZwvRxoSSeFhbGhkv8cA3wm/paFNyjlGsS96Tn8euC1tpLgsro5Sr6Y
	6WIakiDaxx2r65QjeAi4AbXAcH791g4pGj5+QeIjz1Sv7SleDrFYaXXKpVfiIpwYaSX5AJeEQ9l
	7TQY+NBxxbiEuVo7OSU/53dhSRCiicBP/Nz0/59frKU1rD2VIadVT3lwTH7YzwDQwVYSVqmCMEA
	4p/InWnD3ZMHwMVBGBFeHDhO5J2z+HMNvvsKBCO2bkrSS8=
X-Received: by 2002:a05:6000:2c04:b0:439:c6d9:7fc with SMTP id ffacd0b85a97d-43b527c4040mr5296152f8f.25.1773837907912;
        Wed, 18 Mar 2026 05:45:07 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5f14:a98b:b4be:efbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518985f6sm7888162f8f.25.2026.03.18.05.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:45:06 -0700 (PDT)
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
Subject: [PATCH 1/5] dt-bindings: pci: renesas,r9a08g045-pcie: Add RZ/V2N support
Date: Wed, 18 Mar 2026 12:44:46 +0000
Message-ID: <20260318124450.163471-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29766-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,bp.renesas.com:mid]
X-Rspamd-Queue-Id: C21202BBC0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Renesas RZ/V2N PCIe host controller, which is compatible with
the RZ/G3E PCIe IP and therefore uses it as a fallback compatible. The
only difference is that it uses device ID 0x003B.

Make the binding title generic to avoid extending the title for each new
SoC, and update the description to list the supported SoCs and their
capabilities.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index a67108c48feb..858ec02e6d62 100644
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
+          - 0x003B
 
       clocks:
         items:
-- 
2.53.0


