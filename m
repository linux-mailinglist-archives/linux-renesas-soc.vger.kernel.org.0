Return-Path: <linux-renesas-soc+bounces-4187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1079893415
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Mar 2024 18:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668CE28621C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Mar 2024 16:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D600158D79;
	Sun, 31 Mar 2024 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="s4j9+5zN";
	dkim=permerror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T332CDzy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C8158A20;
	Sun, 31 Mar 2024 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=62.96.220.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711903259; cv=fail; b=Y7SrDjjLENzkOZ8oQSahmPhBaCd2xF48oJfNNtCWgxcoPrDGCoisv59m2wI8TrH03hIMP1tj2XSDA7Dr1e7svAWh53WqKater2EDwxA67yXKMmqZM51o/s9THY/AaX8afaGRJXpu2NZgO5CAVRh7MWq1IXMH5vb5JFjf3AueKMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711903259; c=relaxed/simple;
	bh=jCw150l1h+iplg6FzJNMSKX6uHh4q1z/FjS5+/tv2b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pj8cF3VExPyMgncIne6bwRc1va2QOpbhN/xwAbetRSUgbdqMfnSsMLb4yAIItOyrXmyP7mLqzgp8LVv6iy3+eld78RxzoyStlCVePIKdM/d0iXXgt8Mk/UN/o5qYWdpPIfy2j+Ova7qIhWY84pfEOamePnwj3ZxcVKpFGtPYHSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ragnatech.se; spf=fail smtp.mailfrom=ragnatech.se; dkim=permerror (0-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=s4j9+5zN; dkim=permerror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T332CDzy; arc=none smtp.client-ip=103.168.172.142; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; arc=fail smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ragnatech.se
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 6E843207FD;
	Sun, 31 Mar 2024 18:40:52 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sd7bf6XytkgS; Sun, 31 Mar 2024 18:40:50 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 4904A20842;
	Sun, 31 Mar 2024 18:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 4904A20842
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout1.secunet.com (Postfix) with ESMTP id 3A88980005E;
	Sun, 31 Mar 2024 18:40:50 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:40:50 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:36:23 +0000
X-sender: <netdev+bounces-83505-peter.schumann=secunet.com@vger.kernel.org>
X-Receiver: <peter.schumann@secunet.com>
 ORCPT=rfc822;peter.schumann@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAJ05ab4WgQhHsqdZ7WUjHykPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGAAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249UGV0ZXIgU2NodW1hbm41ZTcFAAsAFwC+AAAAQ5IZ35DtBUiRVnd98bETxENOPURCNCxDTj1EYXRhYmFzZXMsQ049RXhjaGFuZ2UgQWRtaW5pc3RyYXRpdmUgR3JvdXAgKEZZRElCT0hGMjNTUERMVCksQ049QWRtaW5pc3RyYXRpdmUgR3JvdXBzLENOPXNlY3VuZXQsQ049TWljcm9zb2Z0IEV4Y2hhbmdlLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUADgARAC7JU/le071Fhs0mWv1VtVsFAB0ADwAMAAAAbWJ4LWVzc2VuLTAxBQA8AAIAAA8ANgAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5EaXNwbGF5TmFtZQ8ADwAAAFNjaHVtYW5uLCBQZXRlcgUADAACAAAFAGwAAgAABQBYABcASAAAAJ05ab4WgQhHsqdZ7WUjHylDTj1TY2h1bWFubiBQZXRlcixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc
	2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: a.mx.secunet.com
X-ExtendedProps: BQBjAAoAxI2mlidQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAGgAAAHBldGVyLnNjaHVtYW5uQHNlY3VuZXQuY29tBQAGAAIAAQUAKQACAAEPAAkAAABDSUF1ZGl0ZWQCAAEFAAIABwABAAAABQADAAcAAAAAAAUABQACAAEFAGIACgAhAAAA3IoAAAUAZAAPAAMAAABIdWI=
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.36
X-EndOfInjectedXHeaders: 19713
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.48.161; helo=sy.mirrors.kernel.org; envelope-from=netdev+bounces-83505-peter.schumann=secunet.com@vger.kernel.org; receiver=peter.schumann@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com E6FD020882
X-Original-To: netdev@vger.kernel.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711804409; cv=none; b=X9Ltip7zthj9aqpST+wx2sE85OL4e1dv4iGo1bJYPymg4sFydx0aNaC8r9mlYq4oZ+aK1nNb60wrIfNHCYsMaHn2QMscWel8wPjEHYYTXdhB3Mim+UEjha/3Rmg1dZ4rwwroEppBzZ34ApMgzrX0xmAbn1zUmhCYqeNSSpo6xeY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711804409; c=relaxed/simple;
	bh=oYWNSLB7Z3OmKkRKaMdt+xkwR1s947tnLcLU8T4RTrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A+MGrDpKH4eFNwmmnDrY1yESgFCJgICElw2WPUziiTdXmwB2ISQwVb7hH/l97xvffCiwww6oKpOwdB0NPFJy1pvwE9w2Mq2bxWN+/akEqJ3Iakn+HiBh2npfl0BkNlD56HZXD0Sl6Xn3vM7WN/hltLcAfIJifTTr7j3U+wOk7Bo=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=s4j9+5zN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T332CDzy; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
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
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

The bindings for Renesas Ethernet TSN was just merged in v6.9 and the
design for the bindings followed that of other Renesas Ethernet drivers
and thus did not force a child-node for the MDIO bus. As there
are no upstream drivers or users of this binding yet take the
opportunity to correct this and force the usage of a child-node for the
MDIO bus.

Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
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

diff --git a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml b/=
Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
index ea35d19be829..b4680a1d0a06 100644
--- a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
@@ -71,16 +71,8 @@ properties:
     enum: [0, 2000]
     default: 0
=20
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
=20
 required:
@@ -94,8 +86,7 @@ required:
   - resets
   - phy-mode
   - phy-handle
-  - '#address-cells'
-  - '#size-cells'
+  - mdio
=20
 additionalProperties: false
=20
@@ -122,14 +113,18 @@ examples:
         tx-internal-delay-ps =3D <2000>;
         phy-handle =3D <&phy3>;
=20
-        #address-cells =3D <1>;
-        #size-cells =3D <0>;
+        mdio {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
=20
-        phy3: ethernet-phy@3 {
-            compatible =3D "ethernet-phy-ieee802.3-c45";
-            reg =3D <0>;
-            interrupt-parent =3D <&gpio4>;
-            interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
             reset-gpios =3D <&gpio1 23 GPIO_ACTIVE_LOW>;
+            reset-post-delay-us =3D <4000>;
+
+            phy3: ethernet-phy@0 {
+                compatible =3D "ethernet-phy-ieee802.3-c45";
+                reg =3D <0>;
+                interrupt-parent =3D <&gpio4>;
+                interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
+            };
         };
     };
--=20
2.44.0


X-sender: <netdev+bounces-83505-steffen.klassert=3Dsecunet.com@vger.kernel.=
org>
X-Receiver: <steffen.klassert@secunet.com> ORCPT=3Drfc822;steffen.klassert@=
secunet.com NOTIFY=3DNEVER; X-ExtendedProps=3DBQAVABYAAgAAAAUAFAARAPDFCS25B=
AlDktII2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURh=
dGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQB=
HAAIAAAUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3=
VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4Y=
wUACwAXAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5n=
ZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl=
2ZSBHcm91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ0=
49Q29uZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAH=
QAPAAwAAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5z=
cG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAw=
AAgAABQBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbi=
xPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQ=
XV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8ALwAAAE1p=
Y3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmV=
yc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ=3D=3D
X-CreatedBy: MSExchange15
X-HeloDomain: a.mx.secunet.com
X-ExtendedProps: BQBjAAoAxI2mlidQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc2=
9mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAA=
AAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAHAAAAHN0ZWZmZW4ua2xhc3NlcnRAc2Vj=
dW5ldC5jb20FAAYAAgABBQApAAIAAQ8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwA=
AAAAABQAFAAIAAQUAYgAKACIAAADcigAABQBkAA8AAwAAAEh1Yg=3D=3D
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.36
X-EndOfInjectedXHeaders: 19690
Received: from cas-essen-01.secunet.de (10.53.40.201) by
 mbx-essen-02.secunet.de (10.53.40.198) with Microsoft SMTP Server
 (version=3DTLS1_2, cipher=3DTLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sat, 30 Mar 2024 14:13:41 +0100
Received: from a.mx.secunet.com (62.96.220.36) by cas-essen-01.secunet.de
 (10.53.40.201) with Microsoft SMTP Server (version=3DTLS1_2,
 cipher=3DTLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Fronte=
nd
 Transport; Sat, 30 Mar 2024 14:13:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id AD12520882
	for <steffen.klassert@secunet.com>; Sat, 30 Mar 2024 14:13:41 +0100 (CET)
X-Virus-Scanned: by secunet
X-Spam-Flag: NO
X-Spam-Score: -5.051
X-Spam-Level:
X-Spam-Status: No, score=3D-5.051 tagged_above=3D-999 required=3D2.1
	tests=3D[BAYES_00=3D-1.9, DKIM_SIGNED=3D0.1, DKIM_VALID=3D-0.1,
	DKIM_VALID_AU=3D-0.1, HEADER_FROM_DIFFERENT_DOMAINS=3D0.249,
	MAILING_LIST_MULTI=3D-1, RCVD_IN_DNSWL_MED=3D-2.3, SPF_HELO_NONE=3D0.001,
	SPF_PASS=3D-0.001] autolearn=3Dunavailable autolearn_force=3Dno
Authentication-Results: a.mx.secunet.com (amavisd-new);
	dkim=3Dpass (2048-bit key) header.d=3Dragnatech.se header.b=3Ds4j9+5zN;
	dkim=3Dpass (2048-bit key) header.d=3Dmessagingengine.com
	header.b=3DT332CDzy
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1xSVlry9SmB for <steffen.klassert@secunet.com>;
	Sat, 30 Mar 2024 14:13:38 +0100 (CET)
Received-SPF: Pass (sender SPF authorized) identity=3Dmailfrom; client-ip=
=3D139.178.88.99; helo=3Dsv.mirrors.kernel.org; envelope-from=3Dnetdev+boun=
ces-83505-steffen.klassert=3Dsecunet.com@vger.kernel.org; receiver=3Dsteffe=
n.klassert@secunet.com=20
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 6205620892
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99]=
)
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 6205620892
	for <steffen.klassert@secunet.com>; Sat, 30 Mar 2024 14:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.2=
5.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71FC028254E
	for <steffen.klassert@secunet.com>; Sat, 30 Mar 2024 13:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAC721364;
	Sat, 30 Mar 2024 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=3Dpass (2048-bit key) header.d=3Dragnatech.se header.i=3D@ragnatech.s=
e header.b=3D"s4j9+5zN";
	dkim=3Dpass (2048-bit key) header.d=3Dmessagingengine.com header.i=3D@mess=
agingengine.com header.b=3D"T332CDzy"
X-Original-To: netdev@vger.kernel.org
Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.c=
om [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0281FB5;
	Sat, 30 Mar 2024 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=3Dnone smtp.client-ip=
=3D103.168.172.142
ARC-Seal: i=3D1; a=3Drsa-sha256; d=3Dsubspace.kernel.org; s=3Darc-20240116;
	t=3D1711804409; cv=3Dnone; b=3DX9Ltip7zthj9aqpST+wx2sE85OL4e1dv4iGo1bJYPym=
g4sFydx0aNaC8r9mlYq4oZ+aK1nNb60wrIfNHCYsMaHn2QMscWel8wPjEHYYTXdhB3Mim+UEjha=
/3Rmg1dZ4rwwroEppBzZ34ApMgzrX0xmAbn1zUmhCYqeNSSpo6xeY=3D
ARC-Message-Signature: i=3D1; a=3Drsa-sha256; d=3Dsubspace.kernel.org;
	s=3Darc-20240116; t=3D1711804409; c=3Drelaxed/simple;
	bh=3DoYWNSLB7Z3OmKkRKaMdt+xkwR1s947tnLcLU8T4RTrU=3D;
	h=3DFrom:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=3DA+MG=
rDpKH4eFNwmmnDrY1yESgFCJgICElw2WPUziiTdXmwB2ISQwVb7hH/l97xvffCiwww6oKpOwdB0=
NPFJy1pvwE9w2Mq2bxWN+/akEqJ3Iakn+HiBh2npfl0BkNlD56HZXD0Sl6Xn3vM7WN/hltLcAfI=
JifTTr7j3U+wOk7Bo=3D
ARC-Authentication-Results: i=3D1; smtp.subspace.kernel.org; dmarc=3Dpass (=
p=3Dnone dis=3Dnone) header.from=3Dragnatech.se; spf=3Dpass smtp.mailfrom=
=3Dragnatech.se; dkim=3Dpass (2048-bit key) header.d=3Dragnatech.se header.=
i=3D@ragnatech.se header.b=3Ds4j9+5zN; dkim=3Dpass (2048-bit key) header.d=
=3Dmessagingengine.com header.i=3D@messagingengine.com header.b=3DT332CDzy;=
 arc=3Dnone smtp.client-ip=3D103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=3Dpass (p=3Dnone di=
s=3Dnone) header.from=3Dragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=3Dpass smtp.mailfrom=
=3Dragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailflow.nyi.internal (Postfix) with ESMTP id 6C2B7200215;
	Sat, 30 Mar 2024 09:13:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 30 Mar 2024 09:13:22 -0400
DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dragnatech.s=
e; h=3D
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=3Dfm1; t=3D1711804402; x=3D1711808002; bh=3DDH
	XZ2gkIcVCkQdzHyEOYWm/LRH13Sc+9ts+wLRwRTE4=3D; b=3Ds4j9+5zN9N2Oy5Wqb8
	16YQluyk3DEE+/Kc7VcyV7GgnsAFssOD6UUAWA+Duh9DzU8us0RWQXOyRlG0t3zu
	RamIKWUeCeWsJDx576RlAlyJTizC+LcyOYC6ryhQInQs1Z5Jm5pizoOgA7S/2Kxt
	oadd4N/6PqvO3k8TGhQPYND7U+QfJXoLSzMpMta2JxCjNqgZCVAW3XKB+GM3Kq2T
	jMx5loESWFPVvAMnHRiWucQi4K9j2Ko1dW4SPvAUhAD38E9B6P3n8bvB7qI+lFhh
	pkelvNpM+WDFc1PDK8cE675fUyfOefWpXED4t4j3p4b6EVRppehy09ZbQnhZR5C2
	Ve6Q=3D=3D
DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3D
	messagingengine.com; h=3Dcc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=3Dfm2; t=3D1711804402; x=3D1711808002; bh=3DDHXZ2gkIcVCkQ
	dzHyEOYWm/LRH13Sc+9ts+wLRwRTE4=3D; b=3DT332CDzybdOPUGRlmaDKfrA1hAED8
	gR/BWTgcmwkOe/U0VpYLzk9xYuAk6VTGkLsnEWGLhjRoC/XMUUniTgb3kqiruvuq
	F4rbd5JEv0vF51iojqiXKcFZfk/+Mr/L55QxXJnQmLNBe8UvujFiVh3dT11+6JQz
	4GCaFVLN2cfw2e+v4F/dY8uEHpwrzPBv1+qXaOW3VGRtDNAHf6Ut4yAkv0DpAspD
	BGGHcitbs8HEgclm6wuf6oRUI+C4HzAR/Dj378Mdndd8jO8aQuyJpAZoNE4Xqw6z
	ck2XDUP3emSCQRgNYP+aRF0jd7mPROuQfmrH9X3GydKvdKGtY/6QWp+7w=3D=3D
X-ME-Sender: <xms:8Q8IZjvHBFzNn1XsPUf7WqtF07UZZ_NmTS5jiJ4juis3mqC1wrLB0Q>
    <xme:8Q8IZkfyYZU63a5yS8cMODWdwY15vU400YDoTIjgrmlOvhynUcqRc0vcLufL1-NMi
    9Byb-TOs-a_ztAhT9U>
X-ME-Received: <xmr:8Q8IZmxKNH0ANM3d0qv2nny-gXcdIMyFHRFheqQm3sbeFDgsiviqJSK=
v04R_IjXV1oNkiXw2WFzqYWtbKqIyd6pbY1e5-srewbSz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddvhedgvdeiucetufdot=
eggodetrfdotf
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
From: =3D?UTF-8?q?Niklas=3D20S=3DC3=3DB6derlund?=3D <niklas.soderlund+renes=
as@ragnatech.se>
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
	=3D?UTF-8?q?Niklas=3D20S=3DC3=3DB6derlund?=3D <niklas.soderlund+renesas@ra=
gnatech.se>,
	Rob Herring <robh@kernel.org>
Subject: [net-next,v2] dt-bindings: net: renesas,ethertsn: Create child-nod=
e for MDIO bus
Date: Sat, 30 Mar 2024 14:12:28 +0100
Message-ID: <20240330131228.1541227-1-niklas.soderlund+renesas@ragnatech.se=
>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit
Return-Path: netdev+bounces-83505-steffen.klassert=3Dsecunet.com@vger.kerne=
l.org
X-MS-Exchange-Organization-OriginalArrivalTime: 30 Mar 2024 13:13:41.7275
 (UTC)
X-MS-Exchange-Organization-Network-Message-Id: 6193e8d8-8759-4738-9ae1-08dc=
50bb3887
X-MS-Exchange-Organization-OriginalClientIPAddress: 62.96.220.36
X-MS-Exchange-Organization-OriginalServerIPAddress: 10.53.40.201
X-MS-Exchange-Organization-Cross-Premises-Headers-Processed: cas-essen-01.s=
ecunet.de
X-MS-Exchange-Organization-OrderedPrecisionLatencyInProgress: LSRV=3Dmbx-es=
sen-02.secunet.de:TOTAL-HUB=3D0.214|SMR=3D0.139(SMRDE=3D0.005|SMRC=3D0.133(=
SMRCL=3D0.102|X-SMRCR=3D0.132))|CAT=3D0.075(CATOS=3D0.001
 |CATRESL=3D0.024(CATRESLP2R=3D0.018)|CATORES=3D0.047(CATRS=3D0.047(CATRS-T=
ransport
 Rule Agent=3D0.001 (X-ETREX=3D0.001)|CATRS-Index Routing
 Agent=3D0.044)));2024-03-30T13:13:41.957Z
X-MS-Exchange-Forest-ArrivalHubServer: mbx-essen-02.secunet.de
X-MS-Exchange-Organization-AuthSource: cas-essen-01.secunet.de
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-FromEntityHeader: Internet
X-MS-Exchange-Organization-OriginalSize: 12178
X-MS-Exchange-Organization-HygienePolicy: Standard
X-MS-Exchange-Organization-MessageLatency: SRV=3Dcas-essen-01.secunet.de:TO=
TAL-FE=3D0.015|SMR=3D0.009(SMRPI=3D0.007(SMRPI-FrontendProxyAgent=3D0.007))=
|SMS=3D0.006
X-MS-Exchange-Organization-Recipient-Limit-Verified: True
X-MS-Exchange-Organization-TotalRecipientCount: 1
X-MS-Exchange-Organization-Rules-Execution-History: 0b0cf904-14ac-4724-8bdf=
-482ee6223cf2%%%fd34672d-751c-45ae-a963-ed177fcabe23%%%d8080257-b0c3-47b4-b=
0db-23bc0c8ddb3c%%%95e591a2-5d7d-4afa-b1d0-7573d6c0a5d9%%%f7d0f6bc-4dcc-487=
6-8c5d-b3d6ddbb3d55%%%16355082-c50b-4214-9c7d-d39575f9f79b
X-MS-Exchange-Forest-RulesExecuted: mbx-essen-02
X-MS-Exchange-Organization-RulesExecuted: mbx-essen-02
X-MS-Exchange-Forest-IndexAgent-0: AQ0CZW4AAZAGAAAPAAADH4sIAAAAAAAEAKVVf3PT=
RhA9OZbjKJbDjz
 QF/toJtJQ6cuzYhMRQJgxkCjMUaJKh02Fo5mydbRFZcnVSEvfH1+oX
 6Ifo1+nuneTIJGHawZMRp723796+3RP/LB8MBXS9wPWCgYR+GMGeCI
 TkEnbjoYgCEcPB/is4wcCHRMYwEtFAuOAFcLxZ3wYeuIA423KF9AaB
 IohnGX0/PBGE4jGEfQiJ9vwhbuQdi0jalmZMJLieC0EYE2VPAIfe0P
 NdJwhdMT3lh2cvXkM3kXV4IikQoRAeCUyDZCzjSPBRRgyYkki16CPU
 k5lEmODpMT8Suo5wPA6jOAm8eAJxCL0wikQv1hkkTauhwxPJB4LYLp
 JmW1NttmVb++iNcJ2w33e6kw688o58LH7/779cEfkJ0j4KVKguwzRS
 i7RDOxEfBDwWvWFdise2tSeOPYF+Kp69sAvPRRRRGY+isDvcOSI3/X
 oYDRDrOI5tfQtPhzwYCAnSC1D6cRM3YPd0TNWEAWBhcRhNqKO9cDTy
 qMWSSlPCnwts3xqtaE5mRkIbC+iLjD3fJ4JIiVM+DfmxUO3rChFkU4
 MbtkXNyaybGRXqXAoUHp1Uh/0QTtBbkXYMG3oktb1Z91Cv6PexRZK6
 HgZCJwno8WC2eyMslNp8gtxhEiMF0REHDyY0G06PS7SpK7CHgigCQX
 MbgkzUUChcl/eOTniEdaBbYx57Xc/HWamnbkO9Xl/PKlpHq9bTPq4J
 qiiWQX3CRz6kvz+g1YJa+nPOfkjUhD4V3lPNc9eg2UaHcYBjLwzkN7
 V7GNkGV/hCB5x71CTX6/fBcQboCl9/FvaSkQhiToh1F3vTE3gnxH/R
 1/2cbNtCiDgFwVv33eZ2V2xtbNfr3fbmVoM33QZvbEKz0dhst5Vpn6
 fUttC5z5W7swPOg+ZacxNq+M8W4Ps4CsdktpAdbAb9RJCMOvCusQYb
 jUbjfRp1RZ8nftyBBvnvANy9zV03wivk9PDuyLsdFQWcxUAijG5fip
 Peb+JiUEODcLxivG9v8lIQtvqLSO+hMx5Odt41nG3u9N/fWc1Y4slY
 dCDsfsDZT0N3ItHvQD5PlX4b7QMYuV7YUasMuC57QzHi2jTaztCq5i
 QQx9xP8Kvk5rRBn/tSkAv4Hfg18SLhdrS12230tLa1ufaAnM1tIpeD
 71LEMn1BYc4Iv4G5V7wAri9UHc45d6fhnJmqEkdVpdRghkdTwf0L1Z
 LC5sbGGl6wWrPZWmuq/otTPhr7Z91Xvp46XkAd4b6DN49PnLGE7+AR
 zcPjhzngmWza/hpfW7Sf9oJ+s2UQqkmIs/2zemhT0deyTaoMfs8FPs
 E4i7mANXco6Zwdkp0WnePkObLPnqptNQ92PCHEVmOj3nJ67furDz9K
 jMRgeujMhvI0SsZIgv8FBLHybDD2wvblUKW/BS/2fjw8+PnN7uHL3b
 e7Lw9fvv5ppg/6WBwvh+jklLgJGy34/s2L14dPnh68eLubJdbOJ45D
 GafNThRBO2127SP4BeY1zjXp/xp4Ljlv4rnNTxt5OfyTZs6k/Zl3d/
 pCC/o/a6PebtfVd9C2GJtjxTJbwOc8K+sF/hWZWWLzBTZXMOYMxgxW
 UHEKagAi8Q9hiDFZSefOq3QMagzGMdE0mMVK06Ba6CyiwoVKLGsefC
 IAX6fIRVbBIEY0A2L0E4PnyE21KOOpdkpeRMELbBEjX9HCQh58FphZ
 NtgiWygoSSi7aLCltDobMYq/pB3Q2nA9zyoms6Z26V2tRNuiZRRTHn
 O6m08pZZVOYZpfP3WWTtEl43NeWU0FGmxB1a6P1uZrr8rMstmtfB+L
 RrXAWMG4qdtHVMYCRdicZSzpxQK7UlTKEWCzqsUWZxiYeUm8hBoqrF
 ox7BJjJVa5BGZdHDdwjc0rKnlzeq1Emha7VjTmaW1gdazIKqhZbVnz
 1FPsS9XUALZYpNabucj8VXYT21rBswxTkaC2gp4TxBbJt+qcan0lHV
 QM2gheYcZ05PDQL9iX2OiyUT3TZhTyOsvsSokSWZlSFudICTZ3KRO5
 lGmzi2xhma2YRoXKMUxd8tmalcpsGcUtq1tA02KUVOFXM87FIltOaV
 MrMvL0tVpkK7OA67MAbHEps0Xrv2axapkOVU0xytork+748lxq5jVM
 vsIsFGCyFcuoph8B3FAuqWu4bNIlwmGwTKOkJyp3j2j3uprzXF03zo
 lZuVzMjUzMSk7MrYvFGBu6TdphWv8LSqHCvDMPAAABAp8IPD94bWwg
 dmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTE2Ij8+DQo8VGFza1
 NldD4NCiAgPFZlcnNpb24+MTUuMC4wLjA8L1ZlcnNpb24+DQogIDxU
 YXNrcz4NCiAgICA8VGFzayBTdGFydEluZGV4PSI3NjEiPg0KICAgIC
 AgPFRhc2tTdHJpbmc+YnJlYWtpbmcgYW55IHVzZS1jYXNlcyBiZWZv
 cmUgd2UgbmVlZCB0byBzdXBwb3J0IGFueSBiYWNrd2FyZDwvVGFza1
 N0cmluZz4NCiAgICAgIDxBc3NpZ25lZXM+DQogICAgICAgIDxFbWFp
 bFVzZXIgSWQ9InMuc2h0eWx5b3ZAb21wLnJ1Ij5TZXJnZXkgU2h0eW
 x5b3Y8L0VtYWlsVXNlcj4NCiAgICAgICAgPEVtYWlsVXNlciBJZD0i
 ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldCI+RGF2aWQgUy4gTWlsbGVyPC9FbW
 FpbFVzZXI+DQogICAgICAgIDxFbWFpbFVzZXIgSWQ9ImVkdW1hemV0
 QGdvb2dsZS5jb20iPkVyaWMgRHVtYXpldDwvRW1haWxVc2VyPg0KIC
 AgICAgICA8RW1haWxVc2VyIElkPSJrdWJhQGtlcm5lbC5vcmciPkph
 a3ViIEtpY2luc2tpPC9FbWFpbFVzZXI+DQogICAgICAgIDxFbWFpbF
 VzZXIgSWQ9InBhYmVuaUByZWRoYXQuY29tIj5QYW9sbyBBYmVuaTwv
 RW1haWxVc2VyPg0KICAgICAgICA8RW1haWxVc2VyIElkPSJyb2JoK2
 R0QGtlcm5lbC5vcmciPlJvYiBIZXJyaW5nPC9FbWFpbFVzZXI+DQog
 ICAgICAgIDxFbWFpbFVzZXIgSWQ9ImtyenlzenRvZi5rb3psb3dza2
 krZHRAbGluYXJvLm9yZyI+S3J6eXN6dG9mIEtvemxvd3NraTwvRW1h
 aWxVc2VyPg0KICAgICAgICA8RW1haWxVc2VyIElkPSJjb25vcitkdE
 BrZXJuZWwub3JnIj5Db25vciBEb29sZXk8L0VtYWlsVXNlcj4NCiAg
 ICAgICAgPEVtYWlsVXNlciBJZD0iZ2VlcnQrcmVuZXNhc0BnbGlkZX
 IuYmUiPkdlZXJ0IFV5dHRlcmhvZXZlbjwvRW1haWxVc2VyPg0KICAg
 ICAgICA8RW1haWxVc2VyIElkPSJuZXRkZXZAdmdlci5rZXJuZWwub3
 JnIiAvPg0KICAgICAgICA8RW1haWxVc2VyIElkPSJkZXZpY2V0cmVl
 QHZnZXIua2VybmVsLm9yZyIgLz4NCiAgICAgIDwvQXNzaWduZWVzPg
 0KICAgIDwvVGFzaz4NCiAgPC9UYXNrcz4NCjwvVGFza1NldD4BCt8C
 PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTE2Ij8+DQ
 o8RW1haWxTZXQ+DQogIDxWZXJzaW9uPjE1LjAuMC4wPC9WZXJzaW9u
 Pg0KICA8RW1haWxzPg0KICAgIDxFbWFpbCBTdGFydEluZGV4PSIzOT
 AiIFBvc2l0aW9uPSJTaWduYXR1cmUiPg0KICAgICAgPEVtYWlsU3Ry
 aW5nPm5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2
 U8L0VtYWlsU3RyaW5nPg0KICAgIDwvRW1haWw+DQogICAgPEVtYWls
 IFN0YXJ0SW5kZXg9IjQ1NiI+DQogICAgICA8RW1haWxTdHJpbmc+cm
 9iaEBrZXJuZWwub3JnPC9FbWFpbFN0cmluZz4NCiAgICA8L0VtYWls
 Pg0KICA8L0VtYWlscz4NCjwvRW1haWxTZXQ+AQyuBzw/eG1sIHZlcn
 Npb249IjEuMCIgZW5jb2Rpbmc9InV0Zi0xNiI/Pg0KPENvbnRhY3RT
 ZXQ+DQogIDxWZXJzaW9uPjE1LjAuMC4wPC9WZXJzaW9uPg0KICA8Q2
 9udGFjdHM+DQogICAgPENvbnRhY3QgU3RhcnRJbmRleD0iMzcyIiBQ
 b3NpdGlvbj0iU2lnbmF0dXJlIj4NCiAgICAgIDxQZXJzb24gU3Rhcn
 RJbmRleD0iMzcyIiBQb3NpdGlvbj0iU2lnbmF0dXJlIj4NCiAgICAg
 ICAgPFBlcnNvblN0cmluZz5OaWtsYXM8L1BlcnNvblN0cmluZz4NCi
 AgICAgIDwvUGVyc29uPg0KICAgICAgPEVtYWlscz4NCiAgICAgICAg
 PEVtYWlsIFN0YXJ0SW5kZXg9IjM5MCIgUG9zaXRpb249IlNpZ25hdH
 VyZSI+DQogICAgICAgICAgPEVtYWlsU3RyaW5nPm5pa2xhcy5zb2Rl
 cmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U8L0VtYWlsU3RyaW5nPg
 0KICAgICAgICA8L0VtYWlsPg0KICAgICAgPC9FbWFpbHM+DQogICAg
 ICA8Q29udGFjdFN0cmluZz5OaWtsYXMgU8O2ZGVybHVuZCAmbHQ7bm
 lrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25hdGVjaC5zZTwvQ29u
 dGFjdFN0cmluZz4NCiAgICA8L0NvbnRhY3Q+DQogICAgPENvbnRhY3
 QgU3RhcnRJbmRleD0iNDQzIj4NCiAgICAgIDxQZXJzb24gU3RhcnRJ
 bmRleD0iNDQzIj4NCiAgICAgICAgPFBlcnNvblN0cmluZz5Sb2I8L1
 BlcnNvblN0cmluZz4NCiAgICAgIDwvUGVyc29uPg0KICAgICAgPEVt
 YWlscz4NCiAgICAgICAgPEVtYWlsIFN0YXJ0SW5kZXg9IjQ1NiI+DQ
 ogICAgICAgICAgPEVtYWlsU3RyaW5nPnJvYmhAa2VybmVsLm9yZzwv
 RW1haWxTdHJpbmc+DQogICAgICAgIDwvRW1haWw+DQogICAgICA8L0
 VtYWlscz4NCiAgICAgIDxDb250YWN0U3RyaW5nPlJvYiBIZXJyaW5n
 ICZsdDtyb2JoQGtlcm5lbC5vcmc8L0NvbnRhY3RTdHJpbmc+DQogIC
 AgPC9Db250YWN0Pg0KICA8L0NvbnRhY3RzPg0KPC9Db250YWN0U2V0
 PgEOzwFSZXRyaWV2ZXJPcGVyYXRvciwxMCwxO1JldHJpZXZlck9wZX
 JhdG9yLDExLDM7UG9zdERvY1BhcnNlck9wZXJhdG9yLDEwLDE7UG9z
 dERvY1BhcnNlck9wZXJhdG9yLDExLDA7UG9zdFdvcmRCcmVha2VyRG
 lhZ25vc3RpY09wZXJhdG9yLDEwLDI7UG9zdFdvcmRCcmVha2VyRGlh
 Z25vc3RpY09wZXJhdG9yLDExLDA7VHJhbnNwb3J0V3JpdGVyUHJvZH VjZXIsMjAsMjA=3D
X-MS-Exchange-Forest-IndexAgent: 1 4262
X-MS-Exchange-Forest-EmailMessageHash: 28218C02
X-MS-Exchange-Forest-Language: en
X-MS-Exchange-Organization-Processed-By-Journaling: Journal Agent

The bindings for Renesas Ethernet TSN was just merged in v6.9 and the
design for the bindings followed that of other Renesas Ethernet drivers
and thus did not force a child-node for the MDIO bus. As there
are no upstream drivers or users of this binding yet take the
opportunity to correct this and force the usage of a child-node for the
MDIO bus.

Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
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

diff --git a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml b/=
Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
index ea35d19be829..b4680a1d0a06 100644
--- a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
@@ -71,16 +71,8 @@ properties:
     enum: [0, 2000]
     default: 0
=20
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
=20
 required:
@@ -94,8 +86,7 @@ required:
   - resets
   - phy-mode
   - phy-handle
-  - '#address-cells'
-  - '#size-cells'
+  - mdio
=20
 additionalProperties: false
=20
@@ -122,14 +113,18 @@ examples:
         tx-internal-delay-ps =3D <2000>;
         phy-handle =3D <&phy3>;
=20
-        #address-cells =3D <1>;
-        #size-cells =3D <0>;
+        mdio {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
=20
-        phy3: ethernet-phy@3 {
-            compatible =3D "ethernet-phy-ieee802.3-c45";
-            reg =3D <0>;
-            interrupt-parent =3D <&gpio4>;
-            interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
             reset-gpios =3D <&gpio1 23 GPIO_ACTIVE_LOW>;
+            reset-post-delay-us =3D <4000>;
+
+            phy3: ethernet-phy@0 {
+                compatible =3D "ethernet-phy-ieee802.3-c45";
+                reg =3D <0>;
+                interrupt-parent =3D <&gpio4>;
+                interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
+            };
         };
     };
--=20
2.44.0



