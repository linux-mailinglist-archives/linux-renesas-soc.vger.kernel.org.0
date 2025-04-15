Return-Path: <linux-renesas-soc+bounces-16008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CF5A89F79
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7B5E17E6FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 13:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134DD1EA91;
	Tue, 15 Apr 2025 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Riz0HDuv";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Aye+2S9O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F2EA932;
	Tue, 15 Apr 2025 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723999; cv=none; b=tUHxX8di39B2eACZHXb9bBU0DC48hrxnGixc/UjBhc5BRtXDoqwYF20O05LjSweuBZibakfF0LyPZGPETvNLBQ+iQBFaJPGDNIyKl6//qjrio6y6eBejRLBmJ121jEMRAPtVI27m3jbC5XpalhmUr1qplVsQJEf+FWmLCvKne18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723999; c=relaxed/simple;
	bh=IBF9J0ep9cjAC9XCYOJFD2EZwlaLg4Ku/1yVlWlYkPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYUEMYrR1otZ4sM0Hxlcsi7VXx0arjNBDPBlkMOo84k9pbu0CqqQWBJWhI5bUESuJbetgacbSiwpbSKwMNSRSjuO0zW1j6cm8QsICh1ef7Q9JeZ2DRWdr4Qiv0Or0EyRPd+tSFZfzCqm1+RGPrwAxer3EeWC/1cNGkdL+wvHryw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Riz0HDuv; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Aye+2S9O reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744723996; x=1776259996;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R2SZvhgWOcXu74APsWOF5IGVz2bjc0yiT34pBzEhPzg=;
  b=Riz0HDuvtBiuXTfAo5GRjnCc+OHY7Lzkgq2SEF2jqi2RpsJnHLRHXGK6
   gisPoH0WlX6YRO1LQ8EVxsMlRDw0dfPzT72iUlW2buoJY/ovrJ7eCexPq
   2DBDFKfGSQZreqURqLUaTng6GD03lYw5xcIWR2eYQhHdKR95kcfVV8YA7
   0nfuPbyEOjjx7JyMrEEFokyL/IW99bMWvoXap3rlextocqchIDkdLDzpP
   aMcqngfnbd5PSP8hXza5kSPPmVrM4LbSyAWzUmV8oxZ1MnJFlSwq1hHMZ
   TsPfdg2xmZiH5YNwhlaN1/+E3FWzRqqeNO+WhM7SwAg9Cq93pHIW2e/pB
   g==;
X-CSE-ConnectionGUID: FzvENSeBT/eNc8+aXFsG1Q==
X-CSE-MsgGUID: iKjBA6smT3i4jVEC3eJDkQ==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43543921"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:33:12 +0200
X-CheckPoint: {67FE6017-19-903EAEAC-E04C76C8}
X-MAIL-CPID: 41A4BAF9440150BB2E011C50814F7D8B_5
X-Control-Analysis: str=0001.0A006397.67FE6014.0029,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 072EA16352A;
	Tue, 15 Apr 2025 15:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744723987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R2SZvhgWOcXu74APsWOF5IGVz2bjc0yiT34pBzEhPzg=;
	b=Aye+2S9OSazLcxSrARooQIIqEveTec8F0AuUZg7N0qxWL4N3rFbkLV0m/aKsaWjujxk4KJ
	iVbqYFijDFu5vULgJ3uzsKQI6FeOpEV+cWnb2ocKKBc5EYWUGOftgpoXCUhRPcaDbvOTQ8
	QLsngYPwAJDruKTEh2ffEyatPXO17Cl4Swmi/H9PpurvFivHiuUAWLQ1YwVThexqDYj+EP
	B+z3T+aXfrcaWgSvHxXSrsx/9yHiC8dit59WZCd04ziXxRkpJFSD0cyA5qDAfrAe5ATeFG
	o5cx6e2F+E7h8wbwrElMBJo0vtNblnMYym0EF3LEpGkZefwH9FNGInu1HGsfsA==
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
Subject: [PATCH 1/2] dt-bindings: arm: add TQMa8XxS boards
Date: Tue, 15 Apr 2025 15:32:58 +0200
Message-ID: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
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
---
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


