Return-Path: <linux-renesas-soc+bounces-34656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CF/LJwFgRmpFSAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:56:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E3F6F7FD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:56:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm1 header.b=6FkfO2e2;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="F yLG+DT";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D827930174EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F372348B373;
	Thu,  2 Jul 2026 12:56:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4279748AE3C;
	Thu,  2 Jul 2026 12:56:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996962; cv=none; b=Bo5YotH5iyIcLLIs+X6+4uagFFCdapKiPkfIGxObllz4SRQdMPVckf7QxjGFpDcfp0+sV3YuNuEzVqf1tyekGEvRY6csXYEqzMQZ+/d2/SV1mfpwjzsck2GqThT5J5YsSrG++FNBRCt6OF4IrVjcqXSprw+RFu3ifydSdezwQfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996962; c=relaxed/simple;
	bh=rykKa1icV/JrCkWGNeioXd57lQrQTnPbXyjwOzvIgsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OS1/yf7a7BUHM/tDw9JaI3QrLRBzg8q12WFv9VNzUMwx1ph8rkjsp+ghkCZ3DUg1GbDMdNImwDxPJK4xC7dwquqprNDqBXq1BlX5c8nvWAp99Ui5hHZpoeo1nbuzAwTgwDn4TSZbB0iVaQHTz1Hiiy9zTVseMrhph7GNc0UsUbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=6FkfO2e2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FyLG+DTW; arc=none smtp.client-ip=103.168.172.149
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 5AC6DEC0228;
	Thu,  2 Jul 2026 08:56:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 02 Jul 2026 08:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782996960;
	 x=1783083360; bh=RY71qZ1/mTMhQJKHTcMYAxKIoqb7zdEicrCDzqr/cbM=; b=
	6FkfO2e2pgSTBs69W0OlMj5mKjrXlnzGGmVbYmY0rbhbERKO77Ouw/GWOU74vQav
	dXRj3YB5ZyeyKNbXdefZoDI6KGfz1omzQo1UC/w5YPilgJ5VNqRKh7k1nNWwQZpV
	92A4Dts8mtm9ferqFo42gg9FF5m71DxS2/kl71s04SyNlTYl561GTxF6zEFV9diq
	oXGsuEPfThK8cxRbBQnMRV46ZjtHH72M49jOhPnP3OCSrUe+1PnWR9VUuRE+zSUi
	Xa3WIboUm5gAQzKLqdCEM+QRV0uy/kXU9G2gR3emdKOBl4pJY54uPqinywM7kGZi
	QliwXIXm6iZOAQUMDHF5Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782996960; x=
	1783083360; bh=RY71qZ1/mTMhQJKHTcMYAxKIoqb7zdEicrCDzqr/cbM=; b=F
	yLG+DTWtopss2XrJwofj6Jhok7NtApZ1sDkgNOamvHlHAxkCCex1R58JBW4nCyyu
	Y2lVQ5LmpG1PGqFZLeHWdePffvmlbnbr6qKzI5jLgaRRbNS+3hA/EQ5IPkMh7OYf
	FrMy5ByrktGRwDYFIuWQTwMWCaljIBKjwI698fFOv+urY/jqQxQlhBLliGnzO3pM
	PmS5uuuzSQKSZK5tar1fx7HrMOqKfC08eG+Z4Lf4MfZLZqgcntd1m4UNlGUwvLHZ
	xY8Y5OulqLFcCneKrq+pxbEvgmMnFeWg85LfA2qhGUXBTEa+TV5pxclygRdT/X4t
	sjaM6F4wyN27cGvnx4G0g==
X-ME-Sender: <xms:4F9GatK_gmMw9aLBwOiT1TNviPH05csL6wYxviz6lMVy7GNq-QEyqQ>
    <xme:4F9GalEX3xEot5ujLTwRhP1Onme8JZrVr0F3Aq-zWZ0Eljrdm-_L6eTEIgp7JtJJo
    X7GnE7TZH6wB5V-C2iiIS1l0PvdxmaaL1pb7jcO67k3zT0Ijv9V3TM>
X-ME-Received: <xmr:4F9Gar1PfYr0rzKohXr2JeqH6ZUCpr6kZtTVwxMO-0CQIL1YBnOtA8xiXAWZ_s68QTcTckyOaCxYBH-twfOaPatiwHaflQY>
X-ME-Proxy-Cause: dmFkZTGGjZvNZAVR9nFw9AsEV7UYpRZcoaOjCjVUDpsujuVqv8g3dw7ttyOiYWEvpmpH6L
    NZh6z8tbDtj40oD3GkDhAVdCr4W3lRdM9vEJeVZke194+xySfrqPFo/XcVikZrBPc2W/rl
    zDXwbpWsFiL8rldSb/ciKVDrEo0KWMFbCNfzpV0P0nAYNRXhacDaCezUnR6aJAQEMTLyH2
    eeKORfmaZldhazfwn9WVmtqbElbbM0nFBdv9+kuEKQ+iqGHWWvwIwBi7QSA5F8ZThkw1Xf
    Y5d+mONF9iTmNycZvA2RgMC6TSKRS0Adga5gVhUHdfrvljDCMjMFgcXmEFmhwoqcGuJkse
    BPU2fV5cmRa0DUaIrRNa/YcuxbWcRi58fDfUCuqpXg1Z50q85BFxR1kmWUQhHSI8Yscpyx
    9BI0NUNidUkTWSXTyP2WAt8vLXybGP8Xyf+LSrKnTVZIFBs2QMg1LJ5onbVdggSOjl9Vw2
    hBAuWvESAchptApROYL0vtYx+H1zLa5bBSSonGitnbFgLn8qHZ4FG3j6DU9+zniR0A0yfQ
    ftZv8OM9foZ3niNEFnGQgGscl1qdYOFuZvVFgg41+c8tn8Q5NyJKyjhlzGVSCZoIb8iSfs
    M4MRwBntt0xtH30h3Jf79DbzCYaMTgWVn6kolNpvUnp/qmisbuGLC+Zr+Ppg
X-ME-Proxy: <xmx:4F9Gakya4Bfq0iZX8IQILcB4oYENOVjlHu2weiPdhWTrDuVW9BGu4w>
    <xmx:4F9GaiitESjB7SytBvBdXpYSM0Uw0jtFcscKRV8PkNt_CGv7RfZSiQ>
    <xmx:4F9GarxFId8DnJ5qcu5EkzMnfRqL8ozZQA3-CydaaK98sncZfdAQww>
    <xmx:4F9Gaoy4wIGWDOK2Z2IUPMrA2EQCkXIrFX4d09TP9Ka2n-TnDtwf9w>
    <xmx:4F9Gah6pjzsxB-i0PP80esNFzWID67I_uX727TpaAFHaxDsN6VzqUXDs>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 08:55:59 -0400 (EDT)
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
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next v4 1/3] dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4
Date: Thu,  2 Jul 2026 14:55:23 +0200
Message-ID: <20260702125525.2230427-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702125525.2230427-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260702125525.2230427-1-niklas.soderlund+renesas@ragnatech.se>
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
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34656-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,messagingengine.com:dkim,mailbox.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25E3F6F7FD4

Add bindings for the R-Car Gen4 gPTP timer. The timer enables accurate
synchronization of the clock in the control system. The timer is
system-wide and used by different Ethernet devices on each Gen4 platform.

  - On R-Car S4 it is shared between RSWITCH and RAVB.

  - On R-Car V4H it is shared between RTSN and RAVB.

  - On R-Car V4M it is only used by RAVB.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
index 15011f5752a9..ef17128d6f3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22901,6 +22901,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
 F:	drivers/mtd/nand/raw/renesas-nand-controller.c
 
+RENESAS R-CAR GEN4 GPTP DRIVER
+M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
+
 RENESAS R-CAR GYROADC DRIVER
 M:	Marek Vasut <marek.vasut+renesas@mailbox.org>
 L:	linux-iio@vger.kernel.org
-- 
2.55.0


