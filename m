Return-Path: <linux-renesas-soc+bounces-22476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B5BAC6FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A1194E2632
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC8A2EBDF9;
	Tue, 30 Sep 2025 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XSDyEYQR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ADE2F6188
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227447; cv=none; b=F6R9JrL0RG88qCuaeBdZeuEDSihIfasGlaGZ1BWjp3KTOI7NqdHJMsA6+W4Axv+H1p/WiLiVr0xInBZ/QA/+jkvduM1TuQUABSQ/xL1B2U/mimCTcDyzfUVFbENc2VcrqazdyWr4VvtWGZ1soSnZrqJUW1FE/f7KCbRAncz82dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227447; c=relaxed/simple;
	bh=x7iuKz80hASEWU601nu1vww6xtokc2dYyAI02LbGiIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yq8L8nIzlWdJV3LgU2E8yYZKMy6BNpx+AFqIIUalAEbIW3vkwZF/5JuvSQffx/2A9nkBoW1E/Hrbeh9EJ3OLkwJEyPlu6rUVe2auOYIbl6SXdvFqoQ94ZRdbgb2PR16+XOsEjUA7hO9N5p9aWE+s9XEvZAXNDOY/qTz0iV445yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XSDyEYQR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=L1LGVJvqyhsbZX3nky+F3f5CKdqxrKkG2gY/WcL/KZA=; b=XSDyEY
	QRxoQ6C3QYXtxGSFUY+yBOQRUJ+YpZc20GSBld8X4xOvBZUPmwVpm4OUZZHHnwDZ
	pOLNDE7YW5PWXem3eLxxKXUoJnvOMg+mg3sH5rjvuL6bo1HhuFsiaDso7ey3YJ/a
	akV1C0qseh3g33iOVMSmWkTHO6ntLEMhVsvrq7w3L9GXFhsDgLdVhKXvLQxrW/m+
	xnjX+PZ9XMqJfO4cVFK5h50nlSJRAd05MYD4jjsgHiJrrT7ihHf6qGKU3o2kIix+
	qGrJHbPCMc4+5BSTS4BLLgRy51kYNilF5k4djNUM4MyoZr/xA3ACFrdq0G47sfC5
	/nCOvwCdy9lpNflQ==
Received: (qmail 3595923 invoked from network); 30 Sep 2025 12:17:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2025 12:17:16 +0200
X-UD-Smtp-Session: l3s3148p1@IdBuDgJANIsgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/4] ARM: dts: renesas: gr-peach: mtd-rom has no clock and power domain
Date: Tue, 30 Sep 2025 12:16:59 +0200
Message-ID: <20250930101656.33435-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
References: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clocks are now marked as critical to avoid regressions with XIP based
systems.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
index 23ddec217685..3b2667be9056 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
@@ -35,9 +35,6 @@ flash@18000000 {
 		bank-width = <4>;
 		device-width = <1>;
 
-		clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
-		power-domains = <&cpg_clocks>;
-
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-- 
2.47.2


