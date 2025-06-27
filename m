Return-Path: <linux-renesas-soc+bounces-18844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D15AEB937
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 15:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EFDB3BC22F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 13:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319C12D9782;
	Fri, 27 Jun 2025 13:50:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B47283FFD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032211; cv=none; b=RSAvUe3kezPG6Q7/WBjyFYdBzaSPgghv7GuP/smESdS9bGT7BhzcIC0zWoa3qk8p1yoHBlxBUfci0PbRkdDbDNcEwi2qFOzctP1smTKgRWFGT1PTKGWQ/o/s3MWTpRzEtQkgTm8/idxBO/f36AuI1aUvuBvRrdvY3rXlw9OgZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032211; c=relaxed/simple;
	bh=QBhF8Gsxq2sjUeIfrmo5Mn86kgZlhZYRPpDlLtwB8hM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxqHv0bSZu6kEnwgWGrh1QSD+raatV2d9Q8RL/kzWjlRA/RQzismwhKhZFjeA6lxfeRHyQALnl9ihTkRy7Xk9A7y5Z/U5xoN5h0h3A2JzheCpoz9WTZT3NPscWaO2yItDUw2puta71XLNcfjQ+cKorVnTguCz7TKXsQuSQfxX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4B5C4CEED;
	Fri, 27 Jun 2025 13:50:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Simon Horman <horms@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: porter: Fix CAN pin group
Date: Fri, 27 Jun 2025 15:49:48 +0200
Message-ID: <70ad9bc44d6cea92197c42eedcad6b3d0641d26a.1751032025.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the schematics, the CAN transceiver is connected to pins
GP7_3 and GP7_4, which correspond to CAN0 data group B.

Fixes: 0768fbad7fba1d27 ("ARM: shmobile: porter: add CAN0 DT support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware.
I did verify that the CAN0 bits in the pfc driver match the
documentation.
---
 arch/arm/boot/dts/renesas/r8a7791-porter.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index f518eadd8b9cdad3..81b3c5d74e9b3a60 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -289,7 +289,7 @@ vin0_pins: vin0 {
 	};
 
 	can0_pins: can0 {
-		groups = "can0_data";
+		groups = "can0_data_b";
 		function = "can0";
 	};
 
-- 
2.43.0


