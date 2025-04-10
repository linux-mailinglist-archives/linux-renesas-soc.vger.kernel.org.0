Return-Path: <linux-renesas-soc+bounces-15742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6181A841C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 13:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B8A6189C7F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 11:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C039727EC9D;
	Thu, 10 Apr 2025 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="V1GiciCX";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="S+Mp5tI6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC4267F7E;
	Thu, 10 Apr 2025 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744284803; cv=none; b=lf94dkE9/NqW3Mqbuvnh9AFEVuk21dm9eRE9UjWIDJ160IaURAkoCObWJ+Y+yIiYJHTUdEvErZv1yk7/2hJhKL2HNMT6fc7UQKp4Foh0mH3gqx4x1tVPuSznmL+6uA772xwBkmAegKYVrBdL4qytflRGnJTeUAC08QMSfrSeRq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744284803; c=relaxed/simple;
	bh=R1RamiOYBsgQqyvpemeNTw9ZpeHXuxKV9XyxkITm2QE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7Kl7XVRLGsK2zZreD65U2ZzgkTiaOzFqrPLgUm9GnhIIt3BUkZgYVcXCvtRb+PJJWnC0JZPLf2Uc/Juxthc4HHnwibzP61Y6ivRTSp67rWVqer5yPbbaqx7n31csHU7c6RWQRpE63lZD0/imD0fA++yqtf8pwkbKJO/CJ/wjv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=V1GiciCX; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=S+Mp5tI6 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744284800; x=1775820800;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MD88gCL7rQbK+pc439u9tVo7TJPofOErBFBWtlbIJ60=;
  b=V1GiciCXGNHp8oZeRyzmKMDMw8dw+qJQMB1PFZzi6wlW61OVWqMPf/Iv
   l2CdjDkURQMzHq7oYhjVeIdi7mwFp8RJFEP3dS5rWiGTY1TS4yC6OYrOU
   rn22tTGMPB0gSYYNGPza55EL0Cxq0giO1YkZkFnLFOaS0/LbwRCuAafVT
   CAK9NubhPG4UaowaCmLBAL2aelrdeoJ4g7sBZrhZi4EcQS80QZykDNECb
   1TMHa5e5vCTl6FgSSj8s7O4aABl8TqQaKv4e8ZIXt+i89GHxlPE9PimL3
   O5BQG27l5BGM+8+lliV7xKbKRAmaI1TIZrXABxXMM1DtlN7Q3DXgipA1K
   A==;
X-CSE-ConnectionGUID: ftrXZWfaQzG4fZ8Xgk4A5Q==
X-CSE-MsgGUID: GfBzyNicRKeXSWTt2uBJoA==
X-IronPort-AV: E=Sophos;i="6.15,202,1739833200"; 
   d="scan'208";a="43454829"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Apr 2025 13:33:11 +0200
X-CheckPoint: {67F7AC77-9-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 657CAC6F24C51A7ADDCC0D077348AF1F_4
X-Control-Analysis: str=0001.0A006370.67F7AC82.0092,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF0641677C0;
	Thu, 10 Apr 2025 13:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744284786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MD88gCL7rQbK+pc439u9tVo7TJPofOErBFBWtlbIJ60=;
	b=S+Mp5tI6t7kJ68kZ/rvlJx8BpAETCS6IW87/LY6TRHbRBv2J0YSWKKXpn3Bnif0ObnP+iF
	9kl5Pi35qEjdIdv2/DABsbTBqSn/IkVNTrygGy35csBEhLPB9VQ+SjJVTeNIj9BzEADMBT
	u+9lLLJEW5ILPS0CBhnoqu9q5quCRW9+M1neL0SzvMrnphplbgNow2zwjv4cH/mURqm9BI
	dopeahZjfiRR81vAhSKzYKLN1S11JMUmSN7w90hfjLx7fVCs61ge5QjQFNrB8tNTs9okJC
	zYI7M0N/wZCp/+mFoFghlrBXPniurliee3paZ614Rz3bjqxltPi/DR9tuPAk9Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Date: Thu, 10 Apr 2025 13:31:02 +0200
Message-ID: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22..0ce2653066e91 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1403,6 +1403,16 @@ properties:
           - const: kontron,imx93-osm-s    # Kontron OSM-S i.MX93 SoM
           - const: fsl,imx93
 
+      - description:
+          TQMa95xxSA is a series of SOM featuring NXP i.MX95 SoC variants.
+          It has the SMARC form factor and is designed to be placed on
+          different carrier boards. MB-SMARC-2 is a carrier reference design.
+        items:
+          - enum:
+              - tq,imx95-tqma9596sa-mb-smarc-2 # TQ-Systems GmbH i.MX95 TQMa95xxSA SOM on MB-SMARC-2
+          - const: tq,imx95-tqma9596sa         # TQ-Systems GmbH i.MX95 TQMa95xxSA SOM
+          - const: fsl,imx95
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.43.0


