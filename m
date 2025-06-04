Return-Path: <linux-renesas-soc+bounces-17849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74382ACE180
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABD303AA12A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 15:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215131DDC1A;
	Wed,  4 Jun 2025 15:30:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF01DDC0F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051002; cv=none; b=aixMrkBSYrfJepNrmv0A5eBJyPkdE+SvEiIchoDtOvLjioHRJDMY2C6Lf6Lo/KUOW2SsjjC3gY54RdDetvcYI0/Hy65AHcEwnAmX5GsnzD5hjqAAUffwtA/JRkeVRw2PcWdW+nvbvyM7jHFEcKRoaUDfHU7qMwnwgAx3sVjJeYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051002; c=relaxed/simple;
	bh=4+miKwEBWkyghsFwUkQ1xfsGAFB+7mzNF3FJfzihDgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kI/dPmN4XIopEqSNNexj7YUsODE6l4DooexyFbgJTuTRdsAxuyeQcCTY8JEBb5htYE1rgof0FFA6gRAnFbn1s7UGkx4SjjBSfntPA2cNtpcmKdB9rFtVFLSI/IBbr0jDL9uyVE07bl+5N50xOdVcsRqVFNSU8ScJ001TYmpoNaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1AFC4CEE4;
	Wed,  4 Jun 2025 15:30:00 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 5/6] arm64: dts: renesas: r8a77980a: Update PFC compatible
Date: Wed,  4 Jun 2025 17:29:50 +0200
Message-ID: <faf9b8a28ae0c8664b1c99cd70e9c4ec6e4302d5.1749048734.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749048734.git.geert+renesas@glider.be>
References: <cover.1749048734.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pin Function Controller in R-Car V3H2 is an extension of the PFC in
R-Car V3H.  Override the compatible property to reflect this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77980a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980a.dtsi b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
index 83f5e21111c9c04a..b86d86eddd085b65 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
@@ -9,3 +9,7 @@
 / {
 	compatible = "renesas,r8a77980a", "renesas,r8a77980";
 };
+
+&pfc {
+	compatible = "renesas,pfc-r8a77980a", "renesas,pfc-r8a77980";
+};
-- 
2.43.0


