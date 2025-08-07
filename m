Return-Path: <linux-renesas-soc+bounces-20098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8689BB1DAA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 17:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934F7580A62
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 15:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE5F2676C9;
	Thu,  7 Aug 2025 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bt4rXMXH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C572B265298
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579701; cv=none; b=JwLXSkkk99hXXJ9rdw7b7khiA8DuVjXp43wPYQXK8Pa3lnLkjsbZqvZkuVSrF7WAIFsoCjUwZa6ypP6ELzvev7NbjvgOlvibhiBGx3mMNvuc9j1ij9qqmlYA2tmK4Ta5hXzPiWJQ2mvg9hMyX+TD3aBKNIsaS7S8Vw9YREIvgRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579701; c=relaxed/simple;
	bh=x4qdmxT1Ost5oyIV1rVorqVh7p3ri+z+RtJZwtZRklY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3wEj+jM8XaqFRTOb4Sd/cuyZt44QXZs4VnAbF7oE7BVIitPOGPaq9AZP6PWtNq0EPHQnPMlUId/VJQmApdaiQk+YV0eVLlnv6Bf+KmrrVj+Xr4FD39M6WBUO5doc/9FjWRa1MhltlgkReRKtV/sYcT8L2/43PQZkRWvajabg1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bt4rXMXH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZEubDHJ+BebnIZ1jigGMZHhyzzsvDLFs7dGmp5GuKFo=; b=bt4rXM
	XHrGYeo0aNOtQkQRWAZMY4VdP7ERkc8BMthPH6ozbermU7NdDoPSP8WnTFEZidM9
	HWLLWaihGoCZRiMUwjhjbS3TCGR5PpcA5nsEFGmiIB07wpRmlzNxCKeFY06UHN+2
	YzeCqgaPVpR/TW7/uhsArU9HhsdG09pPRTWJ0N+odkzVycPZZuFV/Bj7Ppn0Bi4+
	S0hO2cfG9V8dN5Ao+eNE8VgmS81NDRECV7ycPc9xVWKqL9VljY+JJkKuccNfKDmH
	hvSnOFeh3Hg7uCMew0IVmXki7gPv8QRLZBCsIHzKEopmcVgH+MFXgB4hx46WciBJ
	WMLw2BHcQ8eQFvlw==
Received: (qmail 1277673 invoked from network); 7 Aug 2025 17:14:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2025 17:14:55 +0200
X-UD-Smtp-Session: l3s3148p1@RqBx68c7fIlSwKum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
Date: Thu,  7 Aug 2025 17:14:38 +0200
Message-ID: <20250807151434.5241-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable I3C on the dedicated connector of the RZ/G3E module. Provide
safe defaults allowing to connect even to slow I2C devices.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 7faa44510d98..0c3156129aae 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -5,6 +5,8 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/i3c/i3c.h>
+
 /*
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
@@ -122,6 +124,12 @@ raa215300: pmic@12 {
 	};
 };
 
+&i3c {
+	i2c-scl-hz = <100000>;
+	i3c-scl-hz = <12500000>;
+	status = "okay";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640",
-- 
2.47.2


