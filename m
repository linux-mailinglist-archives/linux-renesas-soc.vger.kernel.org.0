Return-Path: <linux-renesas-soc+bounces-16298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A53A9A4FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 09:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB1941627FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 07:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29C01F4187;
	Thu, 24 Apr 2025 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="i3YNG1ie";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pERHcMbu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A5F1DCB09;
	Thu, 24 Apr 2025 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481346; cv=none; b=GTAHWPwUZv6yYS7wqI0PGcrxiW4yw8IzSm1b2qAPN+VQtW47GjnHQMCCQfZkPm9Y39Bk3xjhhBzVMh1gGJBAp+vip+QXXf+ow3gDjev15njbtzPMrZq75bTLbYMc5aEfMLBsP5v8prfIRD5laJFr3OgSz3CIj3dzDO9XqJrM43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481346; c=relaxed/simple;
	bh=aAvQCc0R298w7RYGrKPrriQWJO7VY/0/BcobWu2OJn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HGdrKkY/jzmZSxSUYE4gsWMpw8W1MuByElw2NOxEeBmuosAoJAQDDQ2YddKc93pFlNn7zAKDbnLrFmlFAPJ95dJxAFHejUbplXbvEpF1H1/Eho+KrguZ0dqArC1mJ6aU9jTAls3aOuiF/qAFbFbLphqvLreceK8wJ5yv8kbHyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=i3YNG1ie; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pERHcMbu reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745481344; x=1777017344;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ziXtyaZN5bmoBDmr/R61NXBEs5KsMcbVvQqVoZIm3Nk=;
  b=i3YNG1iezNdsMmjhSqBi854HeRBcLSTcn3VA2NmcCAGBRCEgtej0QB5m
   22N9xiVwIHrdPPPabiqWTPEl/KMKJEUJcAIqA5x/r3jkJOT6LegO6PMr+
   q7VAWDAIViPkAsfOBv/YZ2MfVZT0YoxkGCWDYxUNs+opprPegUI+51Qju
   Baj6SmvSyC7uDE0V0wrVajz2gZEYEej4BgCMOqpUH56ckGLEyNXAxSZW4
   Se/8L0t4m9rS800S5vju8Ae3vjCwWnt1HbH0OSmv2UAwEWbDe1WBSJ1ju
   yeAUTW9bP120xEc6ksHZXxPi2kZxLzP+vUwiUi5XO54dBOmmk1lEsZagj
   A==;
X-CSE-ConnectionGUID: 8Fe9Dkv8QgOz+fFRgcfRoA==
X-CSE-MsgGUID: U06klpP9SjavAFBgeWvsbg==
X-IronPort-AV: E=Sophos;i="6.15,235,1739833200"; 
   d="scan'208";a="43691655"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Apr 2025 09:55:41 +0200
X-CheckPoint: {6809EE7D-6-2417938-F0170C2B}
X-MAIL-CPID: 70C2A69BD9BA4968A346425B2DD05DE9_2
X-Control-Analysis: str=0001.0A006371.6809EE7E.0070,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11AAC16117A;
	Thu, 24 Apr 2025 09:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745481336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ziXtyaZN5bmoBDmr/R61NXBEs5KsMcbVvQqVoZIm3Nk=;
	b=pERHcMbugIBYZirMjTG3JOmUw/cYZ9K7rko1CiSmwZZn6eaJQ3RDNXmAvs3gpj7YiR74ws
	SPxXvUkuO7Dg/fcow7b8q1FrnlUzpWvQcsLFVNU3iFoT0eKoAKxX6B7F1+2ZCEQTNm5Jtu
	ECGS0S+MMOZUxdVLmmFxSO29VZWPLlN3iNx6yREJyrqOSAR5ecBO8oWUKOx38wnMa0vNQX
	SFRVpZwtOJA8OTyubF/LugRhcirZpkxPRCz2Xxrq3eOKEN4z7C4OuumsBROvBVs1mH4j1M
	gvUavv4eXCMTrMoyf0wkA9DLeBj5+H/bB6XFdiH37rdl2yQQT1O2exn5klgQYQ==
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
Cc: Markus Niebel <Markus.Niebel@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: add TQMa8XxS boards
Date: Thu, 24 Apr 2025 09:55:29 +0200
Message-ID: <20250424075533.1266435-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@tq-group.com>

TQMa8XxS is a SOM series featuring NXP i.MX8X SoC.
They are called TQMa8XQPS and TQMa8XDPS respectively.
MB-SMARC-2 is a carrier reference design.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v2:
* Collected Rob's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a6fd347de03fe..1c5fcd69e93e6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1333,6 +1333,22 @@ properties:
               - const: tq,imx8qxp-tqma8xqp     # TQ-Systems GmbH TQMa8XQP SOM (with i.MX8QXP)
               - const: fsl,imx8qxp
 
+      - description:
+          TQMa8XxS is a series of SOM featuring NXP i.MX8X system-on-chip
+          variants. It has the SMARC-2.0 form factor and is designed to be placed on
+          different carrier boards. MB-SMARC-2 is a carrier reference design.
+        oneOf:
+          - items:
+              - enum:
+                  - tq,imx8qxp-tqma8xqps-mb-smarc-2 # TQ-Systems GmbH TQMa8QXPS SOM on MB-SMARC-2
+              - const: tq,imx8qxp-tqma8xqps         # TQ-Systems GmbH TQMa8QXPS SOM
+              - const: fsl,imx8qxp
+          - items:
+              - enum:
+                  - tq,imx8dxp-tqma8xdps-mb-smarc-2 # TQ-Systems GmbH TQMa8XDPS SOM on MB-SMARC-2
+              - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
+              - const: fsl,imx8dxp
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0


