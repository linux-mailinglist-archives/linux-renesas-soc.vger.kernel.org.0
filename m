Return-Path: <linux-renesas-soc+bounces-17850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA2ACE181
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5A663AA138
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 15:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3AE1DE4DB;
	Wed,  4 Jun 2025 15:30:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D4C19E819
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051003; cv=none; b=ge95HHOA8i9265oe+fCWsiVjLx75MPx3Hu8WgHP8W8w7GtYvncHT8KZtfRPtEW3B8hD9TOl4nS6Y2PyE8zUWfsVyAw0WLIHxbVVOFhM9sbmV3n22hjpScZQnbBfimgL+19+T3Q6TKNJ5t30NRFz5wIiE0YVEDd8aCTjKGuaoNaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051003; c=relaxed/simple;
	bh=3hJkR+L5aZIW5SXoQyHwdF0tCsVN1wBVlFeWzm48ovc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEKMV652ytDQS/oFiTkZyUC92/mBZ3UFmCkw6js3U8s6Y/LALAIQrIBcM9AeuMAwhMwrhWNa/d3ESh5ODVK/ApQJ/KRDrM8BZcSVAhpx1Y+DjQnSLWjoeUqnpdjwvtTBbxuwFgaAPGJiw+NAhZCmfNOMs4oRTkmmdB/YQ5HcAFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7BDC4CEF0;
	Wed,  4 Jun 2025 15:30:01 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 6/6] arm64: dts: renesas: r8a77980a: Add support for CAN-FD channel 2
Date: Wed,  4 Jun 2025 17:29:51 +0200
Message-ID: <aa15d3de8751cc7c126995e995473aa36e664e1a.1749048734.git.geert+renesas@glider.be>
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

R-Car V3H2 supports one more CAN-FD channel than R-Car V3H.  Add support
for this third channel by overriding the compatible property in the
CAN-FD node, and adding a subnode representing the third channel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77980a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980a.dtsi b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
index b86d86eddd085b65..caa3097330d006bb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
@@ -10,6 +10,14 @@ / {
 	compatible = "renesas,r8a77980a", "renesas,r8a77980";
 };
 
+&canfd {
+	compatible = "renesas,r8a77980a-canfd", "renesas,rcar-gen3-canfd";
+
+	channel2 {
+		status = "disabled";
+	};
+};
+
 &pfc {
 	compatible = "renesas,pfc-r8a77980a", "renesas,pfc-r8a77980";
 };
-- 
2.43.0


