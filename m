Return-Path: <linux-renesas-soc+bounces-17955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476CAD1635
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 02:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A0A3AA2C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 00:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BD880B;
	Mon,  9 Jun 2025 00:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R2Ecutie";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gSyynzV1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED7A1FC3;
	Mon,  9 Jun 2025 00:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427699; cv=none; b=lMyEHOC1lYqRB6peg94qSWrLOnORw//vmqZtshT9z4yrgeANwq4pMBb/kfmQI7zaHGn0UydyaI7ef6O3lJFzExlc40Wx93wA/+sNDjo1VOB8F45hJIRDH6VLb9m2hfjZ5yVth0IF+obvub+iHE/ML6gk+aBEAkZDw+Vuxh9m53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427699; c=relaxed/simple;
	bh=3KLqp3CQ2N6JDTp3vX8ROIaoJLcuTgZ19RRjm7pzNN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VnDuZRavwXJIiQdRF5/iZB6wQKTXty4v+hu1px1dJEl+tUnOuberxp3SeTZws//BUZFfLsBpHkjYt31XOWucCyh6Y7gazg3h90zUeSI6Xz+Vq8sa5Y4rv/+ZdXULigK/PIFTyFGvBGQ0yJoOwKwFSSMd1JnYPwHZPDmbm3/hf08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R2Ecutie; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gSyynzV1; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bFshH5Lgbz9vHy;
	Mon,  9 Jun 2025 02:08:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749427695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=47TFo7IpbVAx04igIuRTtk49M4nFiyROCVNhC4tKtD8=;
	b=R2EcutiekaaS7uiENVeyKDkfyTPuUD2xLV59tNLz4eM5+sxmkADuGEkCPanrjKqmWm0yZT
	WG7aqNIooGnj1T8JfRf0qS4FVz+0oLaxEbZ2oK4vsmcxCMrgDMRQ6q/KLTLo9U17x80Dvf
	6+qAXTOyI3XTb9bHHqMoHdpdZfSYV6n14TZbWsdwXm7GX1IKe+GAWf5NAWXJ6E5/PZYVxW
	idWWvtygZTvUUCeyCWlUVIkT3lA/YI21x4QG3t3uVlXZ2P1AakdyhDPFimIwI3Csn2GTCc
	CdlJrK/bc17E+q0IlMbv64M4ZNwEzGafj2Xa5O3JozKYSTRdbV0ojn/4GyF1qA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749427693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=47TFo7IpbVAx04igIuRTtk49M4nFiyROCVNhC4tKtD8=;
	b=gSyynzV1Qmufr9AwZ0RApkSA+3IYGMe4m4rwXQh+MgZYfqOMh5Mib0O2ZKJVOeKSHrujj8
	Y1sSp0gQtf+ZXKNsYT8LsoyjNOCvIa8osqEMjfPBFCpaWtn1nLA0lgTVV4LOEujeQQv/oC
	biFXdJ8rz4u91+ehqdl41KQTt0ncOqGH/2gfjPHvGCB+KPU37mkY7LGIScllcEwxS7gHRC
	vMENBzdTV33vV7fXnkrNgv6RyxqDNE2N9g4hcljKxWd7TKrpZPT6S68UYntLV/cbN9yv2Y
	YtBWLhNawxCJUD4dmaSijNft1k4Gv0CJdODyqQVrAJPsUH7dWSinhLTz/Zj1Xw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH 1/2] regulator: dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280
Date: Mon,  9 Jun 2025 02:06:41 +0200
Message-ID: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ocs6tgytgjjnxp7wr41s4qu4wjhpe1as
X-MBO-RS-ID: 8ac122bcd89682afde3
X-Rspamd-Queue-Id: 4bFshH5Lgbz9vHy

Document regulator compatible string for the 7" Raspberry Pi 720x1280 DSI
panel based on ili9881. This is the Raspberry Pi DSI Panel V2. The newer
Raspberry Pi 5" and 7" panels have a slightly different register map to
the original one and offers PWM backlight control.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 .../raspberrypi,7inch-touchscreen-panel-regulator.yaml     | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
index 41678400e63f..18944d39d08f 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
@@ -12,14 +12,17 @@ maintainers:
 description: |
   The RaspberryPi 7" display has an ATTINY88-based regulator/backlight
   controller on the PCB, which is used to turn the display unit on/off
-  and control the backlight.
+  and control the backlight. The V2 supports 5" and 7" panels and also
+  offers PWM backlight control.
 
 allOf:
   - $ref: regulator.yaml#
 
 properties:
   compatible:
-    const: raspberrypi,7inch-touchscreen-panel-regulator
+    enum:
+      - raspberrypi,7inch-touchscreen-panel-regulator
+      - raspberrypi,touchscreen-panel-regulator-v2
 
   reg:
     maxItems: 1
-- 
2.47.2


