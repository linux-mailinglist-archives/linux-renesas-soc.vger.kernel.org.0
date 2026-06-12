Return-Path: <linux-renesas-soc+bounces-33911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bsITBabSK2oMFwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:34:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA83678585
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:34:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=koMdaba5;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="H JT11KI";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77BDF31BEEA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 09:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF473A48CE;
	Fri, 12 Jun 2026 09:29:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8437F73E;
	Fri, 12 Jun 2026 09:29:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256553; cv=none; b=A/weC+T4eZtahKy1N7sGaNAgr2QOLqTOyzzqzDKm3I7SiTw5cBdDPPTMuj2rj1Y7ubcDVsnZwb4nbrMZrmi8fnk5wf9j4kergznH3RyolAdYMDdEoyK79hpoOlH685dlSQYwsHF72XjFy0WV9uaNnzW5Ys6C+FwMD8+9bF3hcPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256553; c=relaxed/simple;
	bh=7br9hLmMNszBH65ssLVahuA8ln2EDQnpNF77+EW+jVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYyrwklGoXiAVO7y/iPBOUcRmW98TJxvq3QGB4NGqr1jnrXjzL1QPeKNoQ59bZLIg7s5qo6RboaVE/vOmlmVX97SJbbvMmMbBK0lYmkudkC9ifoeX8dOgd/UIz0d2gu5ERDoGGN+ATD9yuKhOX3Qg/JTaHVefUu9n1MQ+XUeHRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=koMdaba5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HJT11KI0; arc=none smtp.client-ip=103.168.172.144
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id B11C8EC01A3;
	Fri, 12 Jun 2026 05:29:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 12 Jun 2026 05:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781256551;
	 x=1781342951; bh=ImCdmhAVZm3M+AMQV/xtdrYD4sh0kD6M6i6IC2BcKYo=; b=
	koMdaba5E8JBSM/Jpra32Xfjhi4TRtnqLl+oC6iL2SmgiTp5M2FegTJo/A5fjtnc
	US/Jj24ruD8LkpGFbHMhO4ytNEsj8VCGYmq6YKvoj9yvF+gogX0+mGOtZ6tI1GbV
	YZRorSGXGURkU+2iYAB2lHE2I8AAFl+8PHacGd3WoIHICrT1pRBX/6Sc0/eyQ1qE
	JvoP4uABeuJSl+f3m5mNqSoVF2XsVgO+j5nWtZjeWskNi8zCM3olk5X7EpKhBm8D
	s3izoKxkfL7UmHKCTypjwC3BiuI9YeVdp2YZ6yPSArpOPQDxcovev+28KvXbnox4
	rGFNSOUR3S52EqeL+n84Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781256551; x=
	1781342951; bh=ImCdmhAVZm3M+AMQV/xtdrYD4sh0kD6M6i6IC2BcKYo=; b=H
	JT11KI0rJdwIDEFdM8jLxZXqZrI7OGN5f70SohNUmS+adOkZ4bwf4HdDIV3EiJ+F
	hnGLYC80asm7tBbm0Xvw66QuplVXdAkuPXxOzhki+KzBDzCpmhKeP64RF+I52urF
	bXlz6Dxmhx8Ddx86ydMGsS9oTeDM2hjMbWd3jr+t5ewGU6AVLXOTx5rvu56bLcsP
	e11HMdnVn+Opk2GaBEAG1Qn3nz1nPceyBOJ1yEsNZNKZVJY8oY6LHP3jIkJ7bg0d
	F+52qvCgf7EpK6gVW8pkVaUNdEzSN5CWPbpXtixRQDPxQMBKaLpRtNypvMz31ZH9
	c2m67b+Ws/YXdUdrpVb2w==
X-ME-Sender: <xms:Z9Erai7aZyyjhYwmkRrsFxi9rPpP7cZ382Dxwi_UvGlUuc8JZ-wnkA>
    <xme:Z9EraqZ3KxzXq_rcFFIIHIw9xkE4LSUuoL7c4Lmc2wT1SMUwQXIGGE7vTGkkE1v8X
    elpNHSGiPbO6fsZxqKl1a0Hwde-rBzc_jBvb53glDl54MuP9_ZtgHo>
X-ME-Received: <xmr:Z9EraoQxBcMenHfQbwaPQFYRxp95hQgnymPdun2V36kzbx6A_lNRFoEzvydDhYwEiOnWYddd89sXXJQyHewrHSp3EPP_>
X-ME-Proxy-Cause: dmFkZTFmt7XQPrcKFOxjpe9IXJ2qzv8C5RwjIl9zfZF3PiQsqnuU2btk1XC9XVKOPTwHpQ
    RlVpbHyPSpr9VvTKDcq2Ac9bgLJ7gZ5BQ6t4/i7DkBUQewe+LYlr0O/ppv4z92nmslPvUL
    28dVw03R2fRMm5txXRYl45IHE1UazDXaNg+fS2JNJyzpaC6Pzwb+Esja+2Gt2peXv4aSEp
    Wy8U3GaxpKo9PVhCOUsIR0j39SSONZZQk0EgILss8Vgap0fe0txwK6tKRgyjUcEEIJmcgj
    oeJVhyptjEEqJeTNSIltIa0KjbTw6fTB4vCXAeMhhT7iIRoECdo9q4QtG/4aplaJqSYipo
    NZXCuBgS2ovBDv0DAeu6eZFJoQPFN+J4rPwKYuDBgPc6N5F1oW7oV9eUdyTpiASyl6dZ9G
    T2N4bgsVnZvL+XS8E8uFzpAockzGxIOLVTEFHJbPEfs6BPqy2WHdhnyORp5unkJF/gCcx7
    Imet7lE5418SvZaePwW3bc4tArNP9W8uOMtGkCfWi8mJnSGheGl33eNuJMcvVEj9pxynlk
    uuNZJs8ZU8PbBAM7TyVbeBQwBsf6OwcXUahz3Wb6L/GvMyF17kEGhUbGauuaUau/ixZga0
    sMlEnkuWZBUMsCAHI8ujHWhIqwf5D59gD2d9kP/gw9CbpZ4145x7mjeCQVeA
X-ME-Proxy: <xmx:Z9EravL4yKKnMFt4CXytVs_RT6D8dbiY1VafHwu06dPNfwFvV0F22A>
    <xmx:Z9ErauWoUgpHd8LBGsAuVtzDr3p1dHxvEjml4F4v41tBGnr1WE12Sw>
    <xmx:Z9ErarglRC48v0foNT6c0rewmKmok_2SNQibtXU-9T6ku9Vx9elHPQ>
    <xmx:Z9EraitlNCFug-N_-A6CLkf8AoRLyrgi1k6wP-kApuVO7X52EUySKw>
    <xmx:Z9ErapUB1kI6kIcAoLLV7b5XmArtlfxpjKTjOeM2HTC5MoAvm9JsLvjl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 05:29:10 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v2 1/3] dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4
Date: Fri, 12 Jun 2026 11:28:49 +0200
Message-ID: <20260612092851.2141782-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612092851.2141782-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260612092851.2141782-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33911-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AA83678585

Add bindings for the R-Car Gen4 gPTP timer. The timer enables accurate
synchronization of the clock in the control system. The timer is
system-wide and used by different Ethernet devices on each Gen4 platform.

  - On R-Car S4 it is shared between RSWITCH and RAVB.

  - On R-Car V4H it is shared between RTSN and RAVB.

  - On R-Car V4M it is only used by RAVB.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Drop 'binding for' for patch subject.
- Drop comment for renesas,rcar-gen4-gptp compatible to match other
  Renesas bindings.
- Drop unused label in example.
- Rename node ptp in example.
---
 .../bindings/ptp/renesas,rcar-gen4-gptp.yaml  | 64 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml

diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
new file mode 100644
index 000000000000..3edd64d40038
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (C) 2026 Renesas Electronics Corp.
+# Copyright (C) 2026 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/renesas,rcar-gen4-gptp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen4 gPTP timer
+
+maintainers:
+  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
+
+description:
+  The R-Car Gen4 gPTP timer enables accurate synchronization of the clock in
+  the control system. The timer is system-wide and used by different Ethernet
+  devices on each Gen4 platform.
+
+    - On R-Car S4 it is shared between RSWITCH and RAVB.
+    - On R-Car V4H it is shared between RTSN and RAVB.
+    - On R-Car V4M it is only used by RAVB.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a779f0-gptp # S4-8
+          - renesas,r8a779g0-gptp # V4H
+          - renesas,r8a779h0-gptp # V4M
+      - const: renesas,rcar-gen4-gptp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+
+    ptp@e6449000 {
+            compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
+            reg = <0xe6449000 0x500>;
+            clocks = <&cpg CPG_MOD 2723>;
+            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+            resets = <&cpg 2723>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cc1dde0c9067..d638c1132504 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22664,6 +22664,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
 F:	drivers/mtd/nand/raw/renesas-nand-controller.c
 
+RENESAS R-CAR GEN4 GPTP DRIVER
+M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
+
 RENESAS R-CAR GYROADC DRIVER
 M:	Marek Vasut <marek.vasut@gmail.com>
 L:	linux-iio@vger.kernel.org
-- 
2.54.0


