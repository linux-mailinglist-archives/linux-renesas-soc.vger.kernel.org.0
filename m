Return-Path: <linux-renesas-soc+bounces-25725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4092CB9C7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 21:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 443D5302318B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 20:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823612E3B0D;
	Fri, 12 Dec 2025 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7opl20V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E12D24AC;
	Fri, 12 Dec 2025 20:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571593; cv=none; b=UKC/vTOe6fEyTUXieRDa5LDpwD4Vgxo+Ngy9qSgkvkMNflbAs9/Pq/vubPO0M/QxTGTfu1zAZ/TY4wT/o8XGJKhYKNkgUGHkMxyWY89HZkaOXTj7Drc8gX/kbSAxQXeOt7ndWctiweWcOh23j5O6TnvhkFKd3By6XdhellzQcjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571593; c=relaxed/simple;
	bh=Za+VH2mP6LlOpJnVFFFMobdkQoGnZuDcZFwmn6Mewrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gzWUkDduQccgiCC829zU3sfwQNRKMXehCkxoRzNZO/8wZwYiz6p7iXoYqI2BFPvjCON7ItIW0AqKdqI6OQCKOiBZLv2Ry/Bx4veT65qsTZhxfMh3eZ6wBLkvT2ZUCv2pnyE0YgorSBmMQrg23M/4fmPgXtST32VMVb9QMIYwAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7opl20V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECF5C4AF09;
	Fri, 12 Dec 2025 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571592;
	bh=Za+VH2mP6LlOpJnVFFFMobdkQoGnZuDcZFwmn6Mewrs=;
	h=From:To:Cc:Subject:Date:From;
	b=s7opl20V4g4vLQe7GHBlFzJlRwQMLfPrq7gSBYz98f5JPyTeULtjuzQdCms2YU02C
	 dwTEZXOZnzQg8+N4G3TLaHm27atzDK7F7xLJvfpID42qTp79nzEzNzh6LzkiouJAd5
	 fFkya8SSznQj6KjRFkCxph4AakRGXI+GgSlXNb26rQNhvE7pxJM74M7vABhCNFAgjQ
	 QZGWIy4IO6rmBuf0i6/ga4SLrzQ2/MVo3c9r0zY4EniH4KAzLMcQ/qwzH+betxRWEl
	 cmgL1BanKl8m09g4ObViOSQx5yKadzIwdKHOR8h7u0XP9EklkWc/rafBB5DT6yAiAp
	 3JPsCR34+eiCA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: samsung: Drop s3c6400.dtsi
Date: Fri, 12 Dec 2025 14:32:13 -0600
Message-ID: <20251212203226.458694-7-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This .dtsi file is not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/samsung/s3c6400.dtsi | 38 --------------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 arch/arm/boot/dts/samsung/s3c6400.dtsi

diff --git a/arch/arm/boot/dts/samsung/s3c6400.dtsi b/arch/arm/boot/dts/samsung/s3c6400.dtsi
deleted file mode 100644
index 7cc785a63866..000000000000
--- a/arch/arm/boot/dts/samsung/s3c6400.dtsi
+++ /dev/null
@@ -1,38 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Samsung's S3C6400 SoC device tree source
- *
- * Copyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
- *
- * Samsung's S3C6400 SoC device nodes are listed in this file. S3C6400
- * based board files can include this file and provide values for board specific
- * bindings.
- *
- * Note: This file does not include device nodes for all the controllers in
- * S3C6400 SoC. As device tree coverage for S3C6400 increases, additional
- * nodes can be added to this file.
- */
-
-#include "s3c64xx.dtsi"
-
-/ {
-	compatible = "samsung,s3c6400";
-};
-
-&vic0 {
-	valid-mask = <0xfffffe1f>;
-	valid-wakeup-mask = <0x00200004>;
-};
-
-&vic1 {
-	valid-mask = <0xffffffff>;
-	valid-wakeup-mask = <0x53020000>;
-};
-
-&soc {
-	clocks: clock-controller@7e00f000 {
-		compatible = "samsung,s3c6400-clock";
-		reg = <0x7e00f000 0x1000>;
-		#clock-cells = <1>;
-	};
-};
-- 
2.51.0


