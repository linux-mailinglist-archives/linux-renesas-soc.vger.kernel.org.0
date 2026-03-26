Return-Path: <linux-renesas-soc+bounces-30333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FNQNpoYxWnr6QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:29:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677B334829
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C018D312D9B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 11:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5962738D004;
	Thu, 26 Mar 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FdBVBEhn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E448391820;
	Thu, 26 Mar 2026 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523902; cv=none; b=eh9RjkCrZScsjgOULQBx+3IyjsDkYLT1p4e3L2hXhERH2TrFluw7r78Fv7n+AURgS0ICriyPgPEh7NLvkPA6rYn1qPRKOo+nOxY3A9HRruxNvUErooAUlsmjIjj+Tq3fdKExnUGJJAxYhq/23zHmQBPRxQnVRi1Bb7Cq598b2V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523902; c=relaxed/simple;
	bh=YuMHGyrzDfm7+wvWkbeGmLgAvNN80q6cdvki+xTCBTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6xxnHkQYZHRpNJBqD3yvJ1APd1wJg0B7eeY3CfU/FDTcG53lg/sMZR7VtZhjjWqWqveIgXqlXAv7uC+Gw4q8diqsbcliVZQh/MsgNYuRGJsQvGrtgdyNIWbPY7tfSM0Rb3G5zcojGBIkZ9fnF9nTVd5m1wtEepG0CKtti3SMTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FdBVBEhn; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=nf+rMiHi6jNbgWaWaj5/gNwKBHvcOV2zQhPWDkDxDaI=; b=FdBVBEhnr8+ZxXqeLS+DtRcTPS
	HrlVaqUHTUl0IGhIWj6bIj6FC2AxqEHiIuOLK6NU1sg2qxa0Bl88BZNmyDNxCcwWvUFwUq0JNB3A6
	NdCAcfM5pnFe1SxX/csuMK/bDRVCgtbxCgQ1PBwNxsoMBpHEqWPE9crolx6qLor3XvylRq3KG1Od8
	vp90GYMNzm6JmNCSUKIhT+adTxBJaeEH4k01X31SvWhKPYKrFm+41VYrrbSbVk7qPMllSvctKsqWH
	xYpuwn5oRnUma/WojDr+vfWBR0xqkv27grMehuiX+TkIzq8aVRbKtybRRYxblvu2lv4EYQrMhkxfA
	ngnYV/4g==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5ij8-000LWf-25;
	Thu, 26 Mar 2026 12:18:14 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5iia-000JmA-2Z;
	Thu, 26 Mar 2026 12:18:14 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxLA
Date: Thu, 26 Mar 2026 12:03:29 +0100
Message-ID: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27952/Thu Mar 26 07:24:52 2026)
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30333-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tq-group.com:email,tq-group.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ew.tq-group.com:dkim,ew.tq-group.com:mid]
X-Rspamd-Queue-Id: 9677B334829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

TQMa95xxLA is a SOM using NXP i.MX95 CPU. MBa95xxCA is a carrier
reference design / starter kit board.

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxla/

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
* Added Krzysztof's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a476a6b11ba06..db8f8a0c87619 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1614,6 +1614,17 @@ properties:
           - const: kontron,imx93-osm-s    # Kontron OSM-S i.MX93 SoM
           - const: fsl,imx93
 
+      - description:
+          TQMa95xxLA is a series of SOM featuring NXP i.MX95 SoC variants,
+          designed to be soldered on different carrier boards.
+          MBa95xxCA is a carrier reference design / starter kit that allows
+          to use TQMa95xxLA via an adaper board.
+        items:
+          - enum:
+              - tq,imx95-tqma9596la-mba95xxca  # TQ-Systems GmbH i.MX95 TQMa95xxLA SOM on MBa95xxCA
+          - const: tq,imx95-tqma9596la         # TQ-Systems GmbH i.MX95 TQMa95xxLA SOM
+          - const: fsl,imx95
+
       - description:
           TQMa95xxSA is a series of SOM featuring NXP i.MX95 SoC variants.
           It has the SMARC form factor and is designed to be placed on
-- 
2.43.0


