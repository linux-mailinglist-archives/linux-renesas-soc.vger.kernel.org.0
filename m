Return-Path: <linux-renesas-soc+bounces-4009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236988AAB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 18:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2567D2E750E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 17:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00E955C29;
	Mon, 25 Mar 2024 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J3duFqIG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k+1SUIRU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wflow2-smtp.messagingengine.com (wflow2-smtp.messagingengine.com [64.147.123.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4683AC0F;
	Mon, 25 Mar 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711380979; cv=none; b=NR0ji+QPaWyY3Hr9xhWru72YeLwmnq+yWY9IrS5RV07tFbavwndo0fXs9+jXaKrNgoNWYhS4d6QdYKPtVbdflYCZiUp/3ebob2ei3Hycr0x+JJLVoY1JXRE1LRPx5LqxMAeSC3tWBK9QbniItOMyVY5I/0cO9FQ9puG8DD/FP5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711380979; c=relaxed/simple;
	bh=czsYT6nP1jOrx7YKGC+AmhOiGcxfIDI8xZQ1Ul2mc4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SqLfTxia7U3dhWCzPXnf9b0b2175oqsr5MHe1bGuX7g93GSSVrxRu6WBNYMIDaOijeM6Mg8idz8O6vxPSfnXmyF9vBnPGdOKmwKHLntBgM8Vgtpj5eLUTiiCV47GAtq+ZvrYawY4XkHuRdF+6ZHEXcbyyd5LFvZh8PkyDYKjjTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J3duFqIG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k+1SUIRU; arc=none smtp.client-ip=64.147.123.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.west.internal (Postfix) with ESMTP id 6864D2CC051F;
	Mon, 25 Mar 2024 11:36:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 25 Mar 2024 11:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1711380973;
	 x=1711384573; bh=LIJeOCVIC2JRS263l49Ix0rSEeRfAGpNTjKYs7zmiho=; b=
	J3duFqIG3Yo8tPp35OUBKYBbh3UE6HwQbHP9ndfRBIBa8r1LPsjREKhL0Njrb9fI
	8jNKOH6+FgVmk8hicoYvky0A/z9NDpnwGwzTpPJqlprVL0rjr7j6l0uECur6mJX+
	2AEu8/Ed2XFZ1P43qq5DKaCk1d0cTHF383ucH6OZc6SKa45p2+sSHAmsECOWF3Ts
	sNr9eq6/x/O5f4zsSKYV4vwuUgAou9vpTAE3Z34kQCZgFOP0EQJfBbD6zIrs/pJv
	PYlSfoXSVxNqKuhMnFbbFw0wHdZA6y++Ed91qxWrxjxohmHvTX0Ra3XkYEA7cIu9
	N7L0IgOw7mpzWHDGBk9TdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711380973; x=
	1711384573; bh=LIJeOCVIC2JRS263l49Ix0rSEeRfAGpNTjKYs7zmiho=; b=k
	+1SUIRUr6ARO+zIKBJdupoCnOpCOgDsvxpPEdu6YfAkgFEzU7PADDmC06S0gUVGz
	Tj5KEo32KDBrtEtq1qziMBV2R8iIXMxMV58nKaI5sjqzWT+q7aLnAFQkVTwuUmuR
	OMrftIzRH7gfGToL0MYkqoZURtiKrLNkT+pgea7FUQCbKxnpXF1fpJdtDWPzQDzJ
	wUrqZevEMIUd5AvRIY0UhMUR1XQb6h4sQuYxs6NJUAGLNsSoo+e3bKlv6jReACJ0
	uOzBr/pOF2y4SrwCSIAo4HeyMCP5vXqZLV2cA6FEA+Uc53VosoJ3gP+K/82Q48d6
	tmCPC9D8dy9eYW2z+mQpg==
X-ME-Sender: <xms:7ZkBZp7UUBZL79nADrQ9V2ldw_9ChxaFd-euR9_oHb6jsjZxiFv6iw>
    <xme:7ZkBZm6XDm1ZXnJS3jHuz7ZeOM_jA0eFEORgh2s0AexuXazypGpVRRB96dhdJEFI6
    IX9WwmObV71UD0hAM8>
X-ME-Received: <xmr:7ZkBZgemC4DDygguI22RI3zCUIr-4ScqvkkIg5loC42MCLUvHq7ciX9dPZrMI3tn0U_WmJr4GGPj63tlFlYNqGTlDYMHgMzztXXE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:7ZkBZiJnd2Hp_WFMnT03N9CwqJHJ__ySUDHcAkdFRiKrdrSehpcuXQ>
    <xmx:7ZkBZtI5G5Ktc0BZ2zDppcYo92OFALdgEB58OcZyA3sOlYJb6cfnUg>
    <xmx:7ZkBZrzmCJYktbIbSVbSbIRg5c3TiW6xCOmPz3byJ8MJCpryX_VIrg>
    <xmx:7ZkBZpK3BBEVDNCUTd5LttMjyiJ2HlNDbEtE0xALmBI2knxAGiHNPw>
    <xmx:7ZkBZqc3BaRMg4-4kGrE0NMdY5JurDHDyWaSKL14al7lMGhRO75NCKP40iMH6YHt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 11:36:10 -0400 (EDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rob Herring <robh@kernel.org>
Subject: [net-next,v4 1/2] dt-bindings: net: renesas,etheravb: Add optional MDIO bus node
Date: Mon, 25 Mar 2024 16:34:50 +0100
Message-ID: <20240325153451.2366083-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Renesas Ethernet AVB bindings do not allow the MDIO bus to be
described. This has not been needed as only a single PHY is
supported and no MDIO bus properties have been needed.

Add an optional mdio node to the binding which allows the MDIO bus to be
described and allow bus properties to be set.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
---
* Changes since v3
- Marked the '#address-cells' and '#size-cells' properties as depricated
  as well as making them optional.

* Changes since v2
- Mark the PHY pattern as deprecated and add a comment that new bindings
  should describe the PHY inside the MDIO node.
---
 .../devicetree/bindings/net/renesas,etheravb.yaml    | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index de7ba7f345a9..21a92f179093 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -88,10 +88,16 @@ properties:
   '#address-cells':
     description: Number of address cells for the MDIO bus.
     const: 1
+    deprecated: true
 
   '#size-cells':
     description: Number of size cells on the MDIO bus.
     const: 0
+    deprecated: true
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
 
   renesas,no-ether-link:
     type: boolean
@@ -110,9 +116,13 @@ properties:
   tx-internal-delay-ps:
     enum: [0, 2000]
 
+# In older bindings there where no mdio child-node to describe the MDIO bus
+# and the PHY. To not fail older bindings accept any node with an address. New
+# users should describe the PHY inside the mdio child-node.
 patternProperties:
   "@[0-9a-f]$":
     type: object
+    deprecated: true
 
 required:
   - compatible
@@ -123,8 +133,6 @@ required:
   - resets
   - phy-mode
   - phy-handle
-  - '#address-cells'
-  - '#size-cells'
 
 allOf:
   - $ref: ethernet-controller.yaml#
-- 
2.44.0


