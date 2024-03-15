Return-Path: <linux-renesas-soc+bounces-3813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B887D3BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 19:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617682849DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 18:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6F911198;
	Fri, 15 Mar 2024 18:39:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660701D553;
	Fri, 15 Mar 2024 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710527979; cv=none; b=BWSjSijWG/kasfynTqsO9mbFOC1ZFjtqdIIKDmRhX28cQ06wraDMuO9xVK1GWqDrFWMp/0q0ygu9hNOXXIuM0sptEj2gpR5rrw4e+qBlnPnrD/VzFtvjCmr1ZOSPTlREcjeItLpsv5Jh0v5i4T1hCpdEmB65FSWG2FdYgzGOfBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710527979; c=relaxed/simple;
	bh=Uaj2gn6s7btN5jyWi8u2YpJxAI5G6lZ3D3I7G66i08I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WbPYugIp5EOxnIlcNrMJU+HAR6higgJwq4ZH4hJKp4Ja8q1Pl6/uhcGgxgiYkFRTrdOFQWZI4eZmO7Plo8ePrFmXYj5wnufnUeh3G8XNd9mz2Mvv2ZL1T/istPbe2FDU7mmEErU+sjBHCA1uSEk7oMaKmrEudwZoW/NNaaf8c4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,129,1708354800"; 
   d="scan'208";a="201861063"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Mar 2024 03:39:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.102])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9D56B4066236;
	Sat, 16 Mar 2024 03:39:29 +0900 (JST)
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
Subject: [PATCH v3 1/7] dt-bindings: usb: renesas,usbhs: Document RZ/G2L family compatible
Date: Fri, 15 Mar 2024 18:39:15 +0000
Message-Id: <20240315183921.375751-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added Rb tag from Geert.
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


