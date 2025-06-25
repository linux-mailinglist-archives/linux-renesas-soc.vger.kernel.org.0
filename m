Return-Path: <linux-renesas-soc+bounces-18694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D992AE79A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 10:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125663A81B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 08:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148CD20C47C;
	Wed, 25 Jun 2025 08:10:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BDE3074AD;
	Wed, 25 Jun 2025 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839058; cv=none; b=Pvvmsi8o7g2tXlFw2Owh8tp6v4dZis2wc6DoKDFXKaAGagpZMJcT/iWqPKUhKiJdck2TmrReL9822+wBojZfhngIYhzEbGyvxoWmmw1Ys3a2GdZeWZ5BRXib8oy/o2WxWh4twy+fwgIsPPRxGs0nyAhsFbF1lj3n2ErYybRd2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839058; c=relaxed/simple;
	bh=w4XBhTXvsyJ9T1RijrpxWM3w73mJ20E248FeBMP007I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t2bi0gXUJE2f+oGVyXO0Tam8yhvmo/mS8KUpeWXtbtYj59E+2E+pz25fYj9HC0TNn06L27Pm+FLuYQ0U7wf61B6MIho38T9oB6LVqc+qnhJc5iB1j2+OZ/69cb3dg7iqb+RyXI6tpLnymXH/Md3PkNc1PoyyGthsVqgeZ6mRWHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7D4C4CEEA;
	Wed, 25 Jun 2025 08:10:54 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: net: Rename renesas,r9a09g057-gbeth.yaml
Date: Wed, 25 Jun 2025 10:10:48 +0200
Message-ID: <721f6e0e09777e0842ecaca4578bc50c953d2428.1750838954.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT bindings file "renesas,r9a09g057-gbeth.yaml" applies to a whole
family of SoCs, and uses "renesas,rzv2h-gbeth" as a fallback compatible
value.  Hence rename it to the more generic "renesas,rzv2h-gbeth.yaml".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../{renesas,r9a09g057-gbeth.yaml => renesas,rzv2h-gbeth.yaml}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/net/{renesas,r9a09g057-gbeth.yaml => renesas,rzv2h-gbeth.yaml} (98%)

diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
rename to Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 9961253d1d411bd0..23e39bcea96b31db 100644
--- a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/net/renesas,r9a09g057-gbeth.yaml#
+$id: http://devicetree.org/schemas/net/renesas,rzv2h-gbeth.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: GBETH glue layer for Renesas RZ/V2H(P) (and similar SoCs)
-- 
2.43.0


