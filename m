Return-Path: <linux-renesas-soc+bounces-17498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2393AC3D7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 11:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311583A324F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 09:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F241DC994;
	Mon, 26 May 2025 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="al/bBiKa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259D1DF73D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253505; cv=none; b=rc3lsFqqqEgUbgjVao6wsQhW/0ugSBc2caxT1DaiYkKMlp3sQkf2D5Zz+PP2gT8Nn2UgON7nm69zMTY52PDfMUwE6hiKbKZLVXRfJYTrf2Q6YprvPbSVypYqjH1t78rHg4t25hsKpsu2Y4B1okREOL7SBCxnVbUifqzphxeAZl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253505; c=relaxed/simple;
	bh=Zp0t0gQ6zql+cFVYTxXqEnlb1HEvtlvL8MztF4/90kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y48Rg2fWU2LBuq54BRTBaSZ2nmJ7UsruPKvaeZy5TcrTqIAJxp2fSSE2Ury+zuVk1K/1N8Z4wfivgS4Z2NOBpAviCoWw8T3YARE2b3RKAZZKopua6LYIzXoMhiRO49d6ozbIdx1oPO+HR4Z1E9zJV3Dsu//0+tPNfsvE32wXac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=al/bBiKa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=X1MZQtiVYV42gbzU6x0arb0j058JD95C+Gy2A3dJf1U=; b=al/bBi
	KaMazzq9JLAmA5jocU4g10S6hkMYx3wx7vVcBCY4B9d8KjIh+ztGm+hZncnIu07u
	OO0L9R+VcbNsWmxPxwvfG7VwCTrevEekrR4GFmkZL9NjD247EFQT9E8/Stk61/NT
	QI53uNKG4q2UObqygVg6XE3Vn1k9zGN19Utdv/I1I9PxNJRmiKpZY2DMECHpJ/Nl
	0YPuEAdO3C0sbYCmyeq7LvamlEBEdCfQJKOsLa7jNbp96vtJNV3cD8Lclw0YzlD8
	sOr2cuBxKgfNa9rBnCCcEU8v609SHUBVQPeo+VZU+ofDnASzqN87AG/5GB+QifPE
	kE429loxtOCsYtbg==
Received: (qmail 769201 invoked from network); 26 May 2025 11:58:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2025 11:58:17 +0200
X-UD-Smtp-Session: l3s3148p1@Prit/AY2pAltKPCv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: rtc: rzn1: add optional second clock
Date: Mon, 26 May 2025 11:58:02 +0200
Message-ID: <20250526095801.35781-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
References: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The external crystal can be a second clock input. It is needed for the
SCMP counting method which allows using crystals different than 32768Hz.
It is also needed for an upcoming SoC which only supports the SCMP
method.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/rtc/renesas,rzn1-rtc.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
index f6e0c613af67..f6fdcc7090b6 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -33,10 +33,14 @@ properties:
       - const: pps
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    const: hclk
+    minItems: 1
+    items:
+      - const: hclk
+      - const: xtal
 
   power-domains:
     maxItems: 1
-- 
2.47.2


