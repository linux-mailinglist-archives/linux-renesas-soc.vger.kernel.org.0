Return-Path: <linux-renesas-soc+bounces-19800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B37FCB16DA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 10:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D7CD1AA7CCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 08:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C4E273801;
	Thu, 31 Jul 2025 08:37:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC06C21B9DB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753951026; cv=none; b=VtBZRzBgU1qkdnHjPGs2ZdeBRZSJ8hesp2E+INTx2++4NJqqUGg/nXjEacieeiwffFO+Pf0+qUf7Pn7L4ZKzPa58l1V5/7Jb36RzSB7PlJziXe8XweCCwCVcBF7qFEYfCy7t7dQyZRQc4uywbEfpmhc89xdcoaMYqZX9CrXm55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753951026; c=relaxed/simple;
	bh=z3TDhO2FWUnaAXostj600HH1JxG7wfJF4eLzVDY53DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VkSrZMXaW2cX9ajWyfkrUYkbJ+hMQtLOwRXNx9EXmBvHl386xOlaGS0iV7K9EYK7NOCnkND3HMWIwkmyBFr1hwFBOwkJE6uzaMqiWBjpaWSi0wj8Zj6ia//vYlZCVDVE+PwW7n+HfBUhTaplg4dxkOT9u20LsFu9+3RH1pnNSOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D6DC4CEF5;
	Thu, 31 Jul 2025 08:37:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Fix misplaced article
Date: Thu, 31 Jul 2025 10:36:59 +0200
Message-ID: <280176885acf46d117a0ab9a02c314e2b5cf250f.1753950938.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the article "the" before the full name of the board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.18.

 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
index d2586d278769e279..f6f2cb7d2d25be5a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for Yuridenki-Shokai the Kakip board
+ * Device Tree Source for the Yuridenki-Shokai Kakip board
  *
  * Copyright (C) 2024 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
  */
-- 
2.43.0


