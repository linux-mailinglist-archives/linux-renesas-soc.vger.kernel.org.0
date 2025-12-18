Return-Path: <linux-renesas-soc+bounces-25890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 64975CCC7F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D729301E370
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016F8355046;
	Thu, 18 Dec 2025 15:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NCNS2ngk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay31-hz1.antispameurope.com (mx-relay31-hz1.antispameurope.com [94.100.133.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE4D355027
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.207
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071325; cv=pass; b=m2FhPoxWcmJ7p1wRMcCaKZMoUWH1xjJmZfaIQOL1jM4IlfTWmPwALJXxUd1+WVZlkyjQrrM7CxoB91pyKIvm5wgp21Y8WQl1YQgVDKUxy4aO9rwWJkikgKBv1XC/54qAblWq2Gfvzqys50GdvCW8vbePhuVyv0lDbQKYHy0X/q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071325; c=relaxed/simple;
	bh=xU+o4EwdFkRdWDIg0E/QjC9yBED5TOlSry1ayU8ef1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkfwK8VBt+WEwqE+i8iGPV0rNSYksAfaeLsGgbsYWR1XDFEBKRqljM6PnfgCkMfLqeWWIpjGkFJksdlSFap0qmGuHn4M67yrLvDPRqnDwXTlTGN6Tow4t1uabVjXy3i9sjh+jPC9ai3yShYQeXhSv9wmEbVvOxGx92naFhj0jlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NCNS2ngk; arc=pass smtp.client-ip=94.100.133.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate31-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071289;
 b=D6xJF9e2eXq0V6oH+Z7gkDBzVPRh65VuXOASUbmpH2irfE3EbpKGBZJKqiQQlMoYdiSkxXjh
 b/5c/61lWnayvTNayCQUXqHJxe0VEIJzKBSGNUvsR/n1jHuQJ+7I9M3/8ArH5VhABs5dqfOZJsY
 OoThb5uZSNQQNPc7s6LDlPfuqyiVgpvaeVj3rsVCSkJrAFcCDj0TvFr/k7YG8Bg04g6QX7MQXjF
 d611gQ42ZKwvKFXkMxhuUlYJRBk07OPdkmnTeuipTcPsq2LZxPFfiAObunrlQ/edWSajneFKRUk
 BlnLcjqEbjNYUkk1JtU7uvvmLEG6TbdikfBmC+f4gk1aw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071289;
 b=rOb1G1FbXpZvj3U4qymKEYZpwOLTX6EVg5aMc1b3/KOBZvAYs+56119R7zZW1CG5QOdEUdmV
 qa+oxeJFuS6AtrabNobr/LgUfDCd76lGIHm7WkKXC2zeOfaBWkV4QVDwGIGnb00B4iZXRv/UEzz
 5FQu7SlhJ/2NhNFEk7M0PGeUOxQ5KgzQynf6/VZuQQ245z20liJUbMz8c8IFpaMvOJ8E+UmB6Iu
 FhEMj0Zy0W2ELv4Pi/BddUg15ZxpdcPlZXEQluYMGAdc/0z8vVtRy7MKePoWbP27G7uKAdrf6qL
 OhKlzdQl3BBwk2CSZmHAh/5wfycal5gVBXfb77nAY67tw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay31-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:28 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 54C12CC0D30;
	Thu, 18 Dec 2025 16:21:07 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 18 Dec 2025 16:20:49 +0100
Message-ID: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay31-hz1.antispameurope.com with 4dXDs03JbGz4HPhR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4d69e4e769c0d457f96290f5ace7a8c2
X-cloud-security:scantime:1.856
DKIM-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071288; v=1;
 b=NCNS2ngk4jXaXupdMz4+49ulYY1ppNWSzNM97Lm1u1LIHkDau0UuSz+Fa5I3CjsAQZGoyaPw
 7mT2+TYtlmsLRF9ZrWk1/fIggXa6eoPI1is3gnrkTNnupElPhosNzXzrqS16hPwRDvKOigWMcMt
 FPHLhevj1T0CCtp8oW8eJkV5HwTCtb9deEPOmXiUQiKNJiJ0oRedpnvnIF/SMlSlAJFZGZ3xE9R
 Iq9dFnQeD5K2Nh+n76INczF/uuGKQN44E5i1pdxuekaBozZ/eKM1ciI4xrd+E1ug67eKH1RicLA
 O6CZppcGXXsi3RcN1kBWfrmi+B37eUbhtQZ/xsIKZll9Q==

Reference usb-hxci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..1f7f0adc3b1ed 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,17 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else:
+      $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0


