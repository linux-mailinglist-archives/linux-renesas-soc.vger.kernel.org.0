Return-Path: <linux-renesas-soc+bounces-16115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCA2A91A63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 13:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD7BB1891388
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 11:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC32238D45;
	Thu, 17 Apr 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c5REP31x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E08E238D43
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Apr 2025 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888609; cv=none; b=C202ede3Ama/cxCAhnMZ0l0bdl+PncAKwmr6hwWC9cIbwDRs3xdHr8BOKNWchfFnp6N9y2bC3OVcHu3+Dsu/0M1wOyKkoue8DdApk2UQ2GkX7OHFTiA+sHZImvYNp0FVxYSrssYqllTDpe5ePMoTnw58AH8B21J4X2viezwn1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888609; c=relaxed/simple;
	bh=EMpv3jolt945KdxEwM+fpv4lTRMv1TR/RhfjSpJhFiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TFBNzEW3GcpewkLpxSwZUZjcwqWVYASwfxGc6cOVEDZdpVIdBa7cYLZIj61yAtRzy4FXwyrHNvc4WOnA1VJVNC6jac7SSxo3erI7BFP06SaQVJemsh5Ivf6Uv+N7HmZ0q0PUAeUv/R7L1CAiUif8qbwKT8Ygqh+02pkcepxBMq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c5REP31x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=gRDp2fEIK8ZrD/
	Qsr9hnUov7ClwJjL4bpJhLFXq0ZH8=; b=c5REP31xe4AIzkoh5NJ5nbCX4NaRvv
	pj/VTMIf3oMsFrJN2ee9wUZVVKqOop2X7bdrog1XlfHDUzyCJ9BGIADIkXkYRCiF
	C9wpEZ+7D0S+hMukwiDsZp3BszwLPBlf1N63sTsNDXxyiuqp1G9r1wUJwb3VN7rP
	yr6fvc29HhrdNPeFgeaRdptkgSh0mMkbjL6xzpXYEBUMcMiaoyGr5619Cex4Rdwc
	3yLBzJVpMoBh02h9ABHGHu8cvQTQiMA5zH4sLqZsuW9b/LvkdJWzX6oC0emoHbJ2
	gG1IS2Vh3M2ey88sNquE61tW5ZuQG+qZzkIJDjStMxdwPqanZP+yD8jQ==
Received: (qmail 1071622 invoked from network); 17 Apr 2025 13:16:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2025 13:16:42 +0200
X-UD-Smtp-Session: l3s3148p1@EcVIifcy5pcgAwDPXyfYALbiJ46yNPq3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] spi: dt-bindings: Fix description mentioning a removed property
Date: Thu, 17 Apr 2025 13:16:31 +0200
Message-ID: <20250417111630.53084-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'spi-cpha' was removed from this file. So, replace it in the description
with an existing example. Reformat the paragraph to adhere to max line
length.

Fixes: 233363aba72a ("spi/panel: dt-bindings: drop CPHA and CPOL from common properties")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../bindings/spi/spi-peripheral-props.yaml          | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 0bb443b8decd..8fc17e16efb2 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -8,12 +8,13 @@ title: Peripheral-specific properties for a SPI bus.
 
 description:
   Many SPI controllers need to add properties to peripheral devices. They could
-  be common properties like spi-max-frequency, spi-cpha, etc. or they could be
-  controller specific like delay in clock or data lines, etc. These properties
-  need to be defined in the peripheral node because they are per-peripheral and
-  there can be multiple peripherals attached to a controller. All those
-  properties are listed here. The controller specific properties should go in
-  their own separate schema that should be referenced from here.
+  be common properties like spi-max-frequency, spi-cs-high, etc. or they could
+  be controller specific like delay in clock or data lines, etc. These
+  properties need to be defined in the peripheral node because they are
+  per-peripheral and there can be multiple peripherals attached to a
+  controller. All those properties are listed here. The controller specific
+  properties should go in their own separate schema that should be referenced
+  from here.
 
 maintainers:
   - Mark Brown <broonie@kernel.org>
-- 
2.47.2


