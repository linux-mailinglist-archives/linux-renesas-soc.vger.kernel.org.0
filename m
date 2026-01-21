Return-Path: <linux-renesas-soc+bounces-27223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFDSJG8vcWmcfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:56:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 399035CAB0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF1D982F71E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913A248C8C0;
	Wed, 21 Jan 2026 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DjKrTtP5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202FE48C8AB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015122; cv=none; b=KiyUxff3XbLhO2urSmLxck+sXN1kMlj5GHD/PM443fGDnlerAYQzO5jLUSjrH5RZ6j7lKlPLTDpZQd15wDq1oLjN3qKTDWU6RaVHLa4Ta3qPZoh/Srs35NPIAeI1IgLZS+FWUCZcGfsV90GEAvRd5tLoE9MfZYwkbgYmDIi0WNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015122; c=relaxed/simple;
	bh=JWhcKkvU8yD+gzDYy910G6kF2d2VDDoSVPZaBn7jQ+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mX6KvvciDXOVroNfJ0Yu9zZYKH0xurIav5xwithAOQ/DxSu8MQ712kZKchcJa98mjr21is0QNZ6xHPqOi7QD5tGXXJsKga+ZiisLhHVeNPlS6GBDYZVBOO/J4BrIUAgZ3mtJpTnhtnyM8P28mg9LcPNaz+sBkU3Mqz2c1IDjhiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DjKrTtP5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 11CE11A28FD;
	Wed, 21 Jan 2026 17:05:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCE0C6070A;
	Wed, 21 Jan 2026 17:05:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95EDF119B1746;
	Wed, 21 Jan 2026 18:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x2AlFWyc4Ip33zPaUlGPLmdBouK0MOvwiZBD25BSZIg=;
	b=DjKrTtP5crl1p8AAZ0noKrnf+YJi0CG+AoB1aY7R21kMddxR3QD9V5bIiK8Oz7pRoUNsoY
	3crNIkY/7UTrrEbsaaQ2FX7llN0dDAr88q9qBCPQzgxzcTEDylurK8mFd/JB68EC2NISQ7
	bDOo+tbpM1FfAGFSLQw8gv/QSOQjTuByaxh5ljr8I6oW6HDqQ6pnEHSh0Qu9WoN7OSFCVR
	KT4P3IJdPd3RqzH6iN6vIBP9RskKrlCZik8xG/Hwv94JsP7GJoYm2NhT+YZ6iVWjfJfmC2
	qY7Mefi+yJj8BXNwl8HLNK9cl3WMmmzR7Tna//O1zYSsoHgjIe+QGvXJ+amOIQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Wed, 21 Jan 2026 18:04:59 +0100
Subject: [PATCH v3 03/17] spi: dt-bindings: cdns,qspi-nor: Add examples for
 testing the specific cases
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-schneider-6-19-rc1-qspi-v3-3-43e70fab4444@bootlin.com>
References: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
In-Reply-To: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27223-lists,linux-renesas-soc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.9.96:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,0.198.132.80:email]
X-Rspamd-Queue-Id: 399035CAB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It is very painful to modify this file because the core IP described is
so common, it has been implemented in many SoCs from different
architectures. Both `dtbs_check` and `dt_binding_check` are rather long
commands, even when restricted to a single schema files, and letting
this file evolve without risking to break other DTSs is painful, because
there are arm, arm64 and riscv platforms impacted and no way to check
all of them at the same time.

Instead, we can identify the few specific cases which may need extra
testing, and fill the examples section to cover them all.

Add examples to cover the Starfive (resets) and Pensando (fifo-depth)
cases.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index 123caef8f61e..62b97ab607f3 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -189,3 +189,38 @@ examples:
             cdns,tslch-ns = <60>;
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    spi@13010000 {
+        compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
+        reg = <0x13010000 0x10000>, <0x21000000 0x400000>;
+        interrupts = <25>;
+        clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>, <&syscrg JH7110_SYSCLK_QSPI_AHB>,
+                 <&syscrg JH7110_SYSCLK_QSPI_APB>;
+        clock-names = "ref", "ahb", "apb";
+        resets = <&syscrg JH7110_SYSRST_QSPI_APB>, <&syscrg JH7110_SYSRST_QSPI_AHB>,
+                 <&syscrg JH7110_SYSRST_QSPI_REF>;
+        reset-names = "qspi", "qspi-ocp", "rstc_ref";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cdns,fifo-depth = <256>;
+        cdns,fifo-width = <4>;
+        cdns,trigger-address = <0x0>;
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    spi@2400 {
+        compatible = "amd,pensando-elba-qspi", "cdns,qspi-nor";
+        reg = <0x2400 0x400>, <0x7fff0000 0x1000>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&flash_clk>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cdns,fifo-depth = <1024>;
+        cdns,fifo-width = <4>;
+        cdns,trigger-address = <0x7fff0000>;
+    };

-- 
2.51.1


