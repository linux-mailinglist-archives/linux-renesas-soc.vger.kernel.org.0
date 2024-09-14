Return-Path: <linux-renesas-soc+bounces-8962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB69792F5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 20:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA6C31F210D8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 18:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD26F1D130F;
	Sat, 14 Sep 2024 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jN/kQzvY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251491D2239
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Sep 2024 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726338618; cv=none; b=Ig4o0W5MWdT6VG2C3bgCa1qPOpdvmDcp2KITbO8RmMp4ZaKynrg4l2O9SLFI5p9vVSAqJv3o6AjRcgHNKMIWhSD6vnDOqoVR/yRsMwM2uyzIIbwRvOcH00EUCdj0p7awhukntY2VFY1394q0joq5wtJ6RJQBhVRy6GYQnN0cvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726338618; c=relaxed/simple;
	bh=EQ93nZSDGHLyBey8wgh1gxUSuoEk4PtupfSEChU/0Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSNwi0jWyVWF00FWrt+nDYI+TXsZnhWmYD8PDQO9FhH+nMIKcugQmuPHNexgXF2BJHkJ0AJJ/nREn9E5RarCTjxTt5zzKz1sZXatyHBLi21ID0sktSLyi6agBI3oR40P+IlqS9vK45WBV3INxFbQ6cpFRY55f0oXsKi7a9xXNMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jN/kQzvY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=GvysVu0PhnkMft
	9fkJoOIHZ3G0gRGbte7iX2P5NSMF0=; b=jN/kQzvYddBXxQ5+VA67fKKJQQOeab
	0TIgRjf7sWjhVpHDZXxI5QM1PtCpTJ8tXgu8OND2YssumkU8nfzjxe4pYiKJ3rpq
	uic08txEdMA7ZeJdU3H5oyQQfEVW3p9W3aipkIs8YeguPZxjEMFuULNv8FKO2p/x
	3MMcgiYDb17gV66NWEaHC+R3zJcTqZQ9eRh6ZEJSwJqmDKguwzcTwAlD6zt4dm+N
	oj1J9ncVVFGdHsYon4/jS2hDDHF4dOCJnC/oZ/3u1t1rseX+nUM1K5O/24NKqFx5
	uvVRh1h5gw0f+JbpB7Wsf5wEatd4S1urI83fy9lGQ52IxCm/L5a6gMvg==
Received: (qmail 1531060 invoked from network); 14 Sep 2024 20:30:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2024 20:30:05 +0200
X-UD-Smtp-Session: l3s3148p1@rvdVhxgiUrlQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: genmai: Fix partition size for QSPI NOR Flash
Date: Sat, 14 Sep 2024 20:28:44 +0200
Message-ID: <20240914182948.94031-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Second partition was too large, looks like two digits got mixed up.
Fixes:

mtd: partition "user1" extends beyond the end of device "18000000.flash" -- size truncated to 0x4000000

Fixes: 30e0a8cf886c ("ARM: dts: renesas: genmai: Add FLASH nodes")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

As you can see, I got my Genmai board working again \o/

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 63f9f679964b..c835d61fc20d 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -54,7 +54,7 @@ partition@0 {
 
 			partition@4000000 {
 				label = "user1";
-				reg = <0x04000000 0x40000000>;
+				reg = <0x04000000 0x04000000>;
 			};
 		};
 	};
-- 
2.45.2


