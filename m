Return-Path: <linux-renesas-soc+bounces-26264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75ECF16A5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 04 Jan 2026 23:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3DAF3009404
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Jan 2026 22:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587F631576C;
	Sun,  4 Jan 2026 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="idv3zNz9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OS1ICSVP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE223EA87;
	Sun,  4 Jan 2026 22:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767565728; cv=none; b=iLAx8i8spaj2Zs7IvA8VBvxAoDZxSOpIuj3oMMzIwgiqg/Khn4nR6sXGs6qFeDPo3SehrrPtjTNqdKXkI6GRxzezmfFGgJ0gOdKotiCynvqfW3C30qkk4QSzCBQLxIjvV/vzMppiKk3V2qS8N80evzm4LoIDiDDaTdygeSs7F6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767565728; c=relaxed/simple;
	bh=3plX4El+OZozDEipvvD0mmIspIlK1XmxT03iBmhsDdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzvPLLT5RWW0ZoI9JL7fwLtJPQC4k/qmoFmq35tviD/AwOoFGU/fD2uoiTJ7ysGm6vVzcUOrUK96AYozymusDzN5h5gX14Yfup8qgDu/2n4iId1SYmCGB0ekr6WiXmDi5Degpc77k6pSCTkx5EKilTLMhDTOcEzNalHKE/MBMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=idv3zNz9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OS1ICSVP; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0047A7A00CB;
	Sun,  4 Jan 2026 17:28:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 04 Jan 2026 17:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767565724;
	 x=1767652124; bh=gnwxhnxoPvgNMtbnXeriRdNuZarGPSE9r0ereZIdrdU=; b=
	idv3zNz9u2qpg9L1ts57d0Dl19A/YB0r6wV/6ZiKkG/axD3J/UnXFbQGeSN13uOg
	3uFt4E2XMExX12HAPbgkMoFUiS3DC0JGj7LVjkd+cU14mhCEvbCHLZ6eYEgkvo0R
	WDLe73WVdi4gECzkxdBdVheoLfid/6BE1WzG8iPXnOTtDnxlEy8cFslUONXq3LIp
	GYxolW9yf/dPiK7F60KzoXTTER7Sod+9xEJC4v9bzBYqZTHDYx7yT/QatmmOta9I
	UUUd2kwUcXszJlbnenTPR6c84XfrhUIbN+WWEAnjwvKtzLyq5sq4jfGaKlPsrNhk
	+TbzrJ6soHNV9CKeKdNy2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767565724; x=
	1767652124; bh=gnwxhnxoPvgNMtbnXeriRdNuZarGPSE9r0ereZIdrdU=; b=O
	S1ICSVPNBUVV/hZEZ+MZ38fXHIWvp3wpEe+rsh25fAstGn5HmCExvGpfxeaQ/kGJ
	SJfwZ0MjzruQnjM9aEdsAoM5J6M/i8uPWgbu9lHxIGqv1k0cFtJjVFt9cJ2wyoJg
	Kd357WJMDhRRO8Ft3tlacztGMMQET5TaCHgsv/Js9uchEkntZqZPY+EToaeIiesi
	cSoKShiJDKo0txzH64YjZcsh7xQt/s/SlvOAfHcBMpGkV9fUgHh0L7a6YT+nHIiy
	uoXvMpZHpkmSukvm9DMyI2SykR3ZHNBr6B1gok7CKno+YqjqOVYnZvom0UbyguN0
	5PDSt0rFXhwbe0AQ5ELJw==
X-ME-Sender: <xms:nOlaaZn9C4tw9UrzZ-9EzhdZYQJ3xIxswxswj0sl2XzvbuvXTESjdg>
    <xme:nOlaaRI6gB7fnAtKibLXHmNVk6RGbEkVIQ4AcYsUvEpOggD4Ixg-o_uMoy90Gx8up
    9xU5jik-CEsV7gR1nLxTw4W-KUiZY6QbGMPLhm3OyZV3LtcvXoYxw>
X-ME-Received: <xmr:nOlaaRSIUg8JxOlKwk9Jc6T4mwu2OPSWE45KdPox-lpzdAvr3prMFpZxAfyK_rJ7QuCTI_Ok87oZugiRylmu04O7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelheeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehm
    rghilhgsohigrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgrnh
    hkrdgsihhnnhhssehimhhgthgvtgdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhes
    ghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthdrtghoshhtvghrsehimhhgthgvtg
    drtghomh
X-ME-Proxy: <xmx:nOlaaWunGsANwC6sNxodSwRUNdYBCeKAqB7ajQ8Mxyu_jXteFow8Nw>
    <xmx:nOlaac8GSaEkl41JNIYgcSrUVTLYpP53tQflpbpHUEpFphUjAOwzgQ>
    <xmx:nOlaafa4rzNRSaUrSibM9z7AEz1IjKXQ9XpavwZT5SO3DhuxKPx0Bw>
    <xmx:nOlaaYp3hsVnY1GX2cNk6FM52LdM76QKl5jLkJCbpRlV4PoEzpGBYQ>
    <xmx:nOlaaYPZ1166W_Kon4uwP_29YvI3nEBScjvwJXJGuBf94aio6p1xCzuS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jan 2026 17:28:44 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE8300 GPU in Renesas R-Car D3
Date: Sun,  4 Jan 2026 23:26:52 +0100
Message-ID: <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
present in Renesas R-Car R8A77995 D3 SoCs.

Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
it is always on. Extend the list of special cases for R8A77995 to
capture this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 86ef68985317..2122380561e4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -25,6 +25,11 @@ properties:
               - renesas,r8a779a0-gpu
           - const: img,img-ge7800
           - const: img,img-rogue
+      - items:
+          - enum:
+              - renesas,r8a77995-gpu
+          - const: img,img-ge8300
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -111,6 +116,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - img,img-ge8300
               - img,img-ge7800
               - img,img-gx6250
               - thead,th1520-gpu
@@ -169,6 +175,20 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a77995-gpu
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: There is only one, always on, power domain.
+        power-domain-names: false
+      required:
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.52.0


