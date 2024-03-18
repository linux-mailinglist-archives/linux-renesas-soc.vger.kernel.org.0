Return-Path: <linux-renesas-soc+bounces-3863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26287EEF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 18:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3A11C22131
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 17:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89815A4E2;
	Mon, 18 Mar 2024 17:33:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692C65646C;
	Mon, 18 Mar 2024 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710783214; cv=none; b=LdkgvcS7MtZiTt11k2id1yWLrRypIDRfvlCkMVm+mTc1cP726AfLY7a2aRv8nvMKRg1e1z5NMLJ1bWddayG5SdIVhHD5RRPwqL/T50Uftt7mOcWuvjsgY6w5cKnRdnganiv0J5Yl30gYrTcUTjpf4aMJShN+p6yR7JV1teIaPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710783214; c=relaxed/simple;
	bh=Cx/9N4sl8IiBbRN+qkAbZRKJpgXPaVShNdYE9UaK3RY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C6E3DU8rgkOE0ZABQtKcBG2myFShfmq6ilyn51U1vqkGyfaf91jeWrhc7kb6C3rXqI69b7jZo42c+sfCtUrdHlelivDlgQBVioya9jwxYrZg7VBhKDuOUsNUfPa8vWcI7E7l9jF01yLXRMz8zcxs/ubfQQuGx3rXz8pu36V2M6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="198216084"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Mar 2024 02:33:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E707340359E5;
	Tue, 19 Mar 2024 02:33:26 +0900 (JST)
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
Subject: [PATCH v4 1/6] dt-bindings: usb: renesas,usbhs: Document RZ/G2L family compatible
Date: Mon, 18 Mar 2024 17:33:14 +0000
Message-Id: <20240318173319.201799-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318173319.201799-1-biju.das.jz@bp.renesas.com>
References: <20240318173319.201799-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * No change.
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


