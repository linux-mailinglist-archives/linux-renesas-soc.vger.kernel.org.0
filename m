Return-Path: <linux-renesas-soc+bounces-22741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0716BC0E9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 11:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED48189FD85
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 09:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1A754279;
	Tue,  7 Oct 2025 09:45:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236141C28E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759830323; cv=none; b=psKJbE8M3ndPZmDWDr+VmPjtdBzYonFZjdHBQgw0bklXjffHEAzh0NvG1Dk+GrLfGh3Svs7ELiZoatlVrscz85MADvILTmSPMFzSSR75nE/W774fX9HATDd44G19oBZBCKpUNNgrDHY9iCaTKb0sJoL3J0e8iTUWO+mvsK7iXCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759830323; c=relaxed/simple;
	bh=dac0uUtFL0xxBaiFOesg/5LMQtFZgzjMr1cabS9CvCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmIZQkAHrL0Vq1WKF/k5nx0bSqu+2MNiun6fjwk+ykcCwkJXQE8sK5fLdvuI3kLejEpl1NdK2yAWuLPlUVJs2ydM9CfECsWMQ6TFb6nGS8AbphJhwr2xVXzFrYgmDJYuzmMP6mBp0E6Z6Ih0QASNIh3f1FEaaznp0fgkSJ0EuMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B648C4CEF1;
	Tue,  7 Oct 2025 09:45:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: v3msk: Enable watchdog timer
Date: Tue,  7 Oct 2025 11:45:16 +0200
Message-ID: <e30fb396d73307f2538a638cdda06ca58a1a4e60.1759830182.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the watchdog timer on the R-Car V3M Starter Kit board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Remote board reboots fine when the watchdog timer expires.

To be queued in renesas-devel for v6.19.
---
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 332eb908ca0c1859..0caa514df567d7ea 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -294,6 +294,11 @@ user@1bc0000 {
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


