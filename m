Return-Path: <linux-renesas-soc+bounces-4186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C850892B47
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Mar 2024 14:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23264281776
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Mar 2024 13:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D941DDF8;
	Sat, 30 Mar 2024 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="s4j9+5zN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T332CDzy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0281FB5;
	Sat, 30 Mar 2024 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711804409; cv=none; b=X9Ltip7zthj9aqpST+wx2sE85OL4e1dv4iGo1bJYPymg4sFydx0aNaC8r9mlYq4oZ+aK1nNb60wrIfNHCYsMaHn2QMscWel8wPjEHYYTXdhB3Mim+UEjha/3Rmg1dZ4rwwroEppBzZ34ApMgzrX0xmAbn1zUmhCYqeNSSpo6xeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711804409; c=relaxed/simple;
	bh=oYWNSLB7Z3OmKkRKaMdt+xkwR1s947tnLcLU8T4RTrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A+MGrDpKH4eFNwmmnDrY1yESgFCJgICElw2WPUziiTdXmwB2ISQwVb7hH/l97xvffCiwww6oKpOwdB0NPFJy1pvwE9w2Mq2bxWN+/akEqJ3Iakn+HiBh2npfl0BkNlD56HZXD0Sl6Xn3vM7WN/hltLcAfIJifTTr7j3U+wOk7Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=s4j9+5zN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T332CDzy; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailflow.nyi.internal (Postfix) with ESMTP id 6C2B7200215;
	Sat, 30 Mar 2024 09:13:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 30 Mar 2024 09:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1711804402; x=1711808002; bh=DH
	XZ2gkIcVCkQdzHyEOYWm/LRH13Sc+9ts+wLRwRTE4=; b=s4j9+5zN9N2Oy5Wqb8
	16YQluyk3DEE+/Kc7VcyV7GgnsAFssOD6UUAWA+Duh9DzU8us0RWQXOyRlG0t3zu
	RamIKWUeCeWsJDx576RlAlyJTizC+LcyOYC6ryhQInQs1Z5Jm5pizoOgA7S/2Kxt
	oadd4N/6PqvO3k8TGhQPYND7U+QfJXoLSzMpMta2JxCjNqgZCVAW3XKB+GM3Kq2T
	jMx5loESWFPVvAMnHRiWucQi4K9j2Ko1dW4SPvAUhAD38E9B6P3n8bvB7qI+lFhh
	pkelvNpM+WDFc1PDK8cE675fUyfOefWpXED4t4j3p4b6EVRppehy09ZbQnhZR5C2
	Ve6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1711804402; x=1711808002; bh=DHXZ2gkIcVCkQ
	dzHyEOYWm/LRH13Sc+9ts+wLRwRTE4=; b=T332CDzybdOPUGRlmaDKfrA1hAED8
	gR/BWTgcmwkOe/U0VpYLzk9xYuAk6VTGkLsnEWGLhjRoC/XMUUniTgb3kqiruvuq
	F4rbd5JEv0vF51iojqiXKcFZfk/+Mr/L55QxXJnQmLNBe8UvujFiVh3dT11+6JQz
	4GCaFVLN2cfw2e+v4F/dY8uEHpwrzPBv1+qXaOW3VGRtDNAHf6Ut4yAkv0DpAspD
	BGGHcitbs8HEgclm6wuf6oRUI+C4HzAR/Dj378Mdndd8jO8aQuyJpAZoNE4Xqw6z
	ck2XDUP3emSCQRgNYP+aRF0jd7mPROuQfmrH9X3GydKvdKGtY/6QWp+7w==
X-ME-Sender: <xms:8Q8IZjvHBFzNn1XsPUf7WqtF07UZZ_NmTS5jiJ4juis3mqC1wrLB0Q>
    <xme:8Q8IZkfyYZU63a5yS8cMODWdwY15vU400YDoTIjgrmlOvhynUcqRc0vcLufL1-NMi
    9Byb-TOs-a_ztAhT9U>
X-ME-Received: <xmr:8Q8IZmxKNH0ANM3d0qv2nny-gXcdIMyFHRFheqQm3sbeFDgsiviqJSKv04R_IjXV1oNkiXw2WFzqYWtbKqIyd6pbY1e5-srewbSz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddvhedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:8Q8IZiMklNKIFXsjhLoJVAWfsTb-331eBq9-kEyoKFUFmOWtPYZKiA>
    <xmx:8Q8IZj-ZEqgeVBJ8_Q-WmARCvPkwyh0vg4Q4nNjuT21_PZh6wfDNEw>
    <xmx:8Q8IZiV2lK7WlSjHPGsDZO-P0WfYli8i_iLmKSFo0HwI8uvZ7vpSgg>
    <xmx:8Q8IZkcdFSrK11KRr6YFQM4t7f4h29wE6RPWj5-LGUXcCGWwBl0yhw>
    <xmx:8g8IZnXEr36MyWR291UoN0yIS9SwkuBUHS348t3HJ8JIsheerXEJlpD3pRI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Mar 2024 09:13:19 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rob Herring <robh@kernel.org>
Subject: [net-next,v2] dt-bindings: net: renesas,ethertsn: Create child-node for MDIO bus
Date: Sat, 30 Mar 2024 14:12:28 +0100
Message-ID: <20240330131228.1541227-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bindings for Renesas Ethernet TSN was just merged in v6.9 and the
design for the bindings followed that of other Renesas Ethernet drivers
and thus did not force a child-node for the MDIO bus. As there
are no upstream drivers or users of this binding yet take the
opportunity to correct this and force the usage of a child-node for the
MDIO bus.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Rob Herring <robh@kernel.org>
---
* Changes since v1
- Expand on history in commit message.

Hello,

The Ethernet TSN driver is still in review and have not been merged and
no usage of the bindings are merged either. So while this breaks the
binding it effects no one. So we can correct this mistake without
breaking any use-cases before we need to support any backward
compatibility.
---
 .../bindings/net/renesas,ethertsn.yaml        | 33 ++++++++-----------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
index ea35d19be829..b4680a1d0a06 100644
--- a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
@@ -71,16 +71,8 @@ properties:
     enum: [0, 2000]
     default: 0
 
-  '#address-cells':
-    const: 1
-
-  '#size-cells':
-    const: 0
-
-patternProperties:
-  "^ethernet-phy@[0-9a-f]$":
-    type: object
-    $ref: ethernet-phy.yaml#
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
     unevaluatedProperties: false
 
 required:
@@ -94,8 +86,7 @@ required:
   - resets
   - phy-mode
   - phy-handle
-  - '#address-cells'
-  - '#size-cells'
+  - mdio
 
 additionalProperties: false
 
@@ -122,14 +113,18 @@ examples:
         tx-internal-delay-ps = <2000>;
         phy-handle = <&phy3>;
 
-        #address-cells = <1>;
-        #size-cells = <0>;
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-        phy3: ethernet-phy@3 {
-            compatible = "ethernet-phy-ieee802.3-c45";
-            reg = <0>;
-            interrupt-parent = <&gpio4>;
-            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
             reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
+            reset-post-delay-us = <4000>;
+
+            phy3: ethernet-phy@0 {
+                compatible = "ethernet-phy-ieee802.3-c45";
+                reg = <0>;
+                interrupt-parent = <&gpio4>;
+                interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+            };
         };
     };
-- 
2.44.0


