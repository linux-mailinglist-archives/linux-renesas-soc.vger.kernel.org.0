Return-Path: <linux-renesas-soc+bounces-3751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DCB87B0ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 20:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD954291C32
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 19:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7716BFC5;
	Wed, 13 Mar 2024 18:16:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10F3DDBB;
	Wed, 13 Mar 2024 18:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353781; cv=none; b=pj+V5ylo4X2/u58W9a8/sEnq2Qi7r1ny8fBngXQQzltqkhDlFzmtj/VWH2kksEoH6ADzE/M34s4eBo2PBWdeiXE303FAgtxShOi0nupabI2RnvDKo6uM0IOGecuehlvA6ZHfhZUC6x71FL/LLEXCUF2lnxQS39wY/XCjv+0c0Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353781; c=relaxed/simple;
	bh=+mRBWHwgYAHSii7NrCjfxCjL6RgWvT7QXoLpiPNOXvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KP+XFYGT24X9s40eoscDoYunVSd7asjhsg1iP/+o/vLrMvsw4qp72UaEuhKpEAjV0osRRQAzM6wCe+9mhZRV87LIVQWymJy6l0ubCqAq8ksC48jidJPyizCAX0IsLZcihCQ29bOS2M50pH3sY78kzmiSIt7KLNmbV/y/Px03/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,123,1708354800"; 
   d="scan'208";a="197599011"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Mar 2024 03:16:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4CA224045877;
	Thu, 14 Mar 2024 03:16:09 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: usb: renesas,usbhs: Document RZ/G2L family compatible
Date: Wed, 13 Mar 2024 18:15:58 +0000
Message-Id: <20240313181602.156840-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USBHS IP found on RZ/G2L SoCs only has 10 pipe buffers compared
to 16 pipe buffers on RZ/A2M. Document renesas,rzg2l-usbhs family
compatible to handle this difference for RZ/G2L family SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v1->v2:
 * Added Ack from Krzysztof Kozlowski.
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 40ada78f2328..c63db3ebd07b 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -19,10 +19,14 @@ properties:
       - items:
           - enum:
               - renesas,usbhs-r7s9210   # RZ/A2
+          - const: renesas,rza2-usbhs
+
+      - items:
+          - enum:
               - renesas,usbhs-r9a07g043 # RZ/G2UL and RZ/Five
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
-          - const: renesas,rza2-usbhs
+          - const: renesas,rzg2l-usbhs
 
       - items:
           - enum:
-- 
2.25.1


