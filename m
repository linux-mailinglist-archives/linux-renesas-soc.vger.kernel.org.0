Return-Path: <linux-renesas-soc+bounces-17198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA5ABBD80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58E117A30A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 12:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F43278174;
	Mon, 19 May 2025 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qh+mbnzF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971F278169
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656938; cv=none; b=cdFBcu2q3DtpKKrtLokJkqIZA1jiXUXM46QYqozeV8P6q458SlGbewjt+5HuffAsWysa/n6EzMecGAkI8Q4hb8O+JLMQsyY07WDGPc5DT5D+/LzgjHu7mrSXE2EPAinyEZP4iOClDgJI+vvTws9ViF0jCQJk+2Vxhvk4+mQm5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656938; c=relaxed/simple;
	bh=YN8bSpkiGx4dLXHo1lqMhySq1wMcMv4ZuTPfou6B6xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szsJsJcnH0ZZ9iHKU/uh8L+nHWsm5sz7iNZGB52PnNleruBKjevOX9PylDJu9kbI5nAyPuAnd7PtANcg3eXoTwkVeyrzfXJH5U0q77n61BKEL1c9EgNacLtF/bZs1mGYEuoXVJOtquGC0Lxt6qXQBwkwDumZsJEOOe36FIKGHms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qh+mbnzF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PmTUCqIdUyvmW7PWX4aAOOzNodfH1u1N7Kcy3QmzJPc=; b=Qh+mbn
	zFLY0hpDPfmflH6PF98+Q0hLr3jjcnPR81neRsOJDI2nmqdqQiLlT+0DiycM6MEN
	59sUq4vijLtpXh2WOzvaFF0aTCzpze0mpXc/gpuvjRy8Fq0qM8ehKyAPzU6UgFP+
	aRrns7f7b7vg5z8g+bDWGCL2+HDTrn1cxAQnpqEBvkgeJhld2CxrupL7GrpyS0tG
	l19dsTnUAHhK0NpBIeUatzSVCII7sIwMpVo3Pte78XNxTZuPpr4Ln2U90neHP9cx
	mje4qDk1WL3W2xY/QWgYGwZdXZgtjRce5fQ3sA64JWml3GQsEkpdMwcvNNWascyg
	gwlcSAKBLJP31Rfw==
Received: (qmail 2475372 invoked from network); 19 May 2025 14:15:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:33 +0200
X-UD-Smtp-Session: l3s3148p1@E1OzFnw1RLBZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 7/7] riscv: dts: allwinner: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:07 +0200
Message-ID: <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
index bc5c84f22762..6d84efaf4b84 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
@@ -17,7 +17,7 @@ fan {
 		#cooling-cells = <2>;
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 3 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PD14/GPIO44 */
 		scl-gpios = <&pio 3 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PD15/GPIO45 */
-- 
2.47.2


