Return-Path: <linux-renesas-soc+bounces-29500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLt+J04cuGlYZAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:05:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C9A29BF69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8CBD30008BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D644E39E166;
	Mon, 16 Mar 2026 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qJOBzull"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68271287269;
	Mon, 16 Mar 2026 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673547; cv=none; b=BWU2p35DTdvHzHCvG1FSyQYYo7yKLwb4Rgt2lZ4dqXDKKDa4X8zr/WISzYygZPPZWhybaql6zqL0aWWgIWG3lglSKbOoNukTkNzpIuGO46SBNdfh802x6rXdwIJYZs3BLpD8f2cUL4gj2/1Ki3X1Y5YLhH3CDHs5YwNMQNZnxug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673547; c=relaxed/simple;
	bh=8hTof5jN6DSzCuSyhEMauMQI+p0iC2X8rb+MKRGxgOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VHZ66Shb7bESNwgMa9PWqF3048Pe4fxbSTEIr6DACtFI+/FJbWENG9RFzDEHrfXz1YUOILZPmRa5KIaFFPmOiEyQhKj2jFNY0m1veAtJ6LLI9fxKlZ0PN4i73KKf3vkAOPhXWfI7iytqLFZzst8wE7JcdKdBzzvbAOS4VICHB2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qJOBzull; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=9OU9GJ7hTS0RTZZlRjvrompDSYq9g4Wd7DryiX4nbMg=; b=qJOBzulltHEwDL4ghoZ1Ss4VLg
	lXPWYJiMR83par5sIzq1BYZJ3sFA/IZMgbuqQmYcOqQ/lIeNrzH0CP73aIy0/GD8SMld9d1Cbdjx3
	kJCIqDPUIAYh4SsXjR4KYLPBsSJcX5oqznaRVFIu+v1KSJPPTnG5WrAdQP3fDeTXbot4lLhWV1M51
	IFsXKZvIE29PTA4S5dGsEKgy1OmW+ZcSWnJ1QmRtSSbu+8L4N1+R0pR+jmJkAHE0k9TvTgixilLHK
	kO7OouK2mRa7vD30MmSWiybqU55CAiyDq2YqfKzNyWlddZmgSr/EUKScL3XE/X/3wkEjdyl1Uj0qb
	O3iwbKlg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w29Vm-0009Kp-1I;
	Mon, 16 Mar 2026 16:05:42 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w29Vk-0003GC-37;
	Mon, 16 Mar 2026 16:05:41 +0100
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
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/3] dt: bindings: arm: add bindings for TQMa95xxLA
Date: Mon, 16 Mar 2026 16:04:51 +0100
Message-ID: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27942/Mon Mar 16 07:24:14 2026)
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29500-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ew.tq-group.com:dkim,ew.tq-group.com:mid]
X-Rspamd-Queue-Id: 44C9A29BF69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

TQMa95xxLA is a SOM using NXP i.MX95 CPU. MBa95xxCA is a carrier
reference design / starter kit board.

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxla/

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5a7a75ede0a87..1559ae22c10c9 100644
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


