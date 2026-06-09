Return-Path: <linux-renesas-soc+bounces-33784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ff27A1mMKGosGAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 23:57:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2B66462F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 23:57:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=Yb7vcxNk;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="H 9lPy0M";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7658C30A3FF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 21:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FCC4C77A2;
	Tue,  9 Jun 2026 21:57:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227A1309EF2;
	Tue,  9 Jun 2026 21:57:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781042253; cv=none; b=iQzB3+XEC70fOlw4nwZq4v2aEL2PqcPf5sRub/oxKjuCTeHC9yJv9Ff3P891frSMNBbMlYYfmyNvPI9pIqM6Ujm36xNX+TzbLjpN4dIvwq9lz+NTDg0badue1GOsvhQSLfZWNW8RwK7/d6r45vyItePqhxOo+86Hi9Hz3QRmhVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781042253; c=relaxed/simple;
	bh=s3apbCutkltudT42swGqJ1WSySdiUFXJoQnLKFBSOH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mas3dThECaWjGwR2IhZYtjE1pcLqEqMWHIeGMGb9b/UW4mUn0tT1Soice619eiG/6mPHDlVrbVJw08hNL2/o+OuHvbwBnMlNYhToqKcO/f8j2rdD7rIDNw6cK/fXc3lGy/inHL0qhDLrV7A1QkUIjLVEZpUBxynaCzTJzKDBg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Yb7vcxNk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H9lPy0MB; arc=none smtp.client-ip=103.168.172.156
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6526C1400102;
	Tue,  9 Jun 2026 17:57:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 09 Jun 2026 17:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781042251;
	 x=1781128651; bh=nZnavKHiNTRkXXcNMq8L8LGzw/3hCX5Rt11iD+463nU=; b=
	Yb7vcxNk362zLqIJtMKTvPC+9xurGQO5eSESfQzLmZj/CB/47Aco3WwTnBJge4lu
	IFUZh9OAd58NDW044mFk2/R+VEDZhadt1JAr5jyMrZUhiu+FKdqV9fefHNSBzQSm
	41Fc+sTxIGr/tsL5kl2VR4P6xJ2nOW5BaM4y6pMTu160qU/i7EyLNPIH/zrKuJC3
	pSSha+WGWb/afG/I6wmA1NY09MLlrarWh5767ZnDbi/9YcVuvobaBMXPA3RuaYDR
	E5+K+9pUT44X2+kLOpZLXqeAOfmcJoeRKvnOUclznDuksE/5pVao1pJnvUNaPiTg
	BuYVyeDQ+UAeHrDSMUAcsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781042251; x=
	1781128651; bh=nZnavKHiNTRkXXcNMq8L8LGzw/3hCX5Rt11iD+463nU=; b=H
	9lPy0MBAg0Pm1RmyN8dvbk/gH9BUSGovlV4kItgOcUgj8d/NUxZlw8zm9wHzpjoH
	PcToQ9R0Js47T6fF8TNcN/c/FblEfwZnBoTD90JSeTVeAc1uoBQa1E6ysuYgAxEx
	PPMozJUjf17Xl45bOxTGxICLxWcMHW4PTN5a/SDZpeqI4rQs3I1NcSA08e8nI1sZ
	eoFcgLgkAyUctPvJk6urUVY0oqKe69/X3gqGj+ELdFrqOXy8s1l7clqH+YFvWNKi
	o/lvNqYUlxKofYxGYTZNE7sn/idt6bWb1IVIWNSdUV64NIABE5+WCriwwsuNw2+v
	hGYMP3d0r9r7JTJSLVdtw==
X-ME-Sender: <xms:S4woaujWOnnDcwDFxRe02E2FJYSPw93A2u5wMnDKYaFI11Tq_aerhw>
    <xme:S4woap4M_j6_ZGhHw9BhXKBHFyrmwI4kDZZ7_LiRZ4zdoZU2glZhjsFIZ0WnL9J7r
    ZjIwJjJAb1rm-pH6Enfw-kfqQFOlZfcXxh17SUXRLlYHA7KXjHFODg>
X-ME-Received: <xmr:S4woagSfj4hrTT8XUtO_jacMveqdkC1HbKTSGv5dPTSB-N81vLC-MJLKyzQtqdL9-Cz9os7fA1cBduO5Sq4eQdTZ1WvGVZ-5zOPm>
X-ME-Proxy-Cause: dmFkZTEz0B3JndYGDDbYwBcE9EHW284vE0y999F80SkFGYuf8sj63e8sG96J7wUwOSOqy4
    msuzB24SN/uBMT/U+fyv/IotM34PUEpEHb2HNWNK+jEsOJs8lfaevhY3NB2sQ/PLx3QDdr
    R5z91hNcKXt7hnkFAmd3DHZCOzj71KPWAtRzQFeYeWafxtd6xba86eaJwtOkv+0fqkv5JD
    QkH7Gq2zn3mxWSo3yUdeVgNsw2o9d7mdu7cYcBro+TafjAJb4YjcS6r5uk1oymZZ+UtHPY
    AdXrOEIRIfkIqGnkA3ZqP5m86o8fNSg9d+nN2ZAAG6NLgnrO+LuJyPHgBmYwk8x/5RYdP/
    P+wDGKfcA1hl0XQDrSEJigVT3PkDnW6BzHbDXV27dfUtek4mzuITsQ7aYH4QL8DhUK04GE
    CEWA4/RmI+D32y5LeiLkMMIFUUqaIxvT9UpV0zPQ6D+DDnDJ5zaTVz97dTCug3PEHCzyC0
    u/vxaDJAC0yRtN8yDDHQh5SoS6/Hyvmk9+LTmT+KGI+JqnwBJDDJyodY0nXc+iOmA541l+
    AlhjO6Vwr5FyPcrByq+DUpT8zvrN34VIAy+tVNN7C++w4vfdTkqHtg2lSsXZKjOjKZSlfY
    1lxlnTMnQ50/+RJsnvLFAIeuIAob48mePOSfRIiRiRiD+CEaD+Vb9guIBuWg
X-ME-Proxy: <xmx:S4woao-Ksw1P7UujcTSHpwDozN2nky635m0SxSBTr9oKY3EivU9kLg>
    <xmx:S4woahr3-h3ym_m140hqDpwM1f4feZMCei4wGT29uPgE4eFZgPb9dA>
    <xmx:S4woauWXgXS6tLqsdPObTurVbI24PsmV3Meuy3anGSzt8a0s66y11w>
    <xmx:S4woam40Q1QOE_FVF1kQWwFPOCU3oVG6gSejk50iK6dVcArYEdWHhQ>
    <xmx:S4woakW6CB7XzMyiehb90Gfpt7igdHJGd7qyRhSDmjYUJSTUxurov4_y>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jun 2026 17:57:30 -0400 (EDT)
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
Subject: [net-next 1/3] dt-bindings: ptp: renesas,rcar-gen4-gptp: Add binding for R-Car Gen4
Date: Tue,  9 Jun 2026 23:57:09 +0200
Message-ID: <20260609215711.2960150-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33784-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,devicetree.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94D2B66462F

Add bindings for the R-Car Gen4 gPTP timer. The timer enables accurate
synchronization of the clock in the control system. The timer is
system-wide and used by different Ethernet devices on each Gen4 platform.

  - On R-Car S4 it is shared between RSWITCH and RAVB.

  - On R-Car V4H it is shared between RTSN and RAVB.

  - On R-Car V4M it is only used by RAVB.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/ptp/renesas,rcar-gen4-gptp.yaml  | 64 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml

diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
new file mode 100644
index 000000000000..99e6e3ca73b6
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
+      - const: renesas,rcar-gen4-gptp # Generic R-Car Gen4
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
+    gptp: gptp@e6449000 {
+            compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
+            reg = <0xe6449000 0x500>;
+            clocks = <&cpg CPG_MOD 2723>;
+            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+            resets = <&cpg 2723>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cf7e92d9e6db..e934bcb8c7c9 100644
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


