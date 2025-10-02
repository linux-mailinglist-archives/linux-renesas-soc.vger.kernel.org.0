Return-Path: <linux-renesas-soc+bounces-22591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9280BB42EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DAF019E0B1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA983115B5;
	Thu,  2 Oct 2025 14:40:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D334B2C027F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416052; cv=none; b=IvxyZyTp+O0QXtXTUJCi7GgznxOh1DUjnCW23u6Na7azSMja3U3LTO3FNWjveeHqF0IHA3mwHb6OEtLgkRJDNY3N1lfkoy3qV1FGNkcEEva+B7Z0m1iMHJ+z96psF7+dyZPV5gJXxK6QGfijKEr4z7i5PxWrBitsjo/kwi87nSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416052; c=relaxed/simple;
	bh=Eke5/ZqvjLLw+Jw9LAnbWJFZ7cYU6v2hUjyH5H0+xpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iH8Sql5d7aAuIhwHa9vARZd9EcnQ2TAOupi679dLbtfcaYJmz2AALocywN1R0YJVppZFQ8Q+VHIGkcbDTEqexFN0gfxmMbdVAoXaZhxQwfZ1v/s3UstvY+KjnszJpw2ALdgEB+bfxos3w/lvvDu5obtWhh3h+0K1uENvST/EGB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49832C4CEF4;
	Thu,  2 Oct 2025 14:40:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/13] ARM: dts: renesas: r7s9210: Remove duplicate interrupt-parent
Date: Thu,  2 Oct 2025 16:40:30 +0200
Message-ID: <ef9e56dfb55da092bdc489309309bf4262651042.1759414774.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759414774.git.geert+renesas@glider.be>
References: <cover.1759414774.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two identical interrupt-parent properties: one at the top
level, and one under the soc node.  Remove the latter, as it is
unneeded.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r7s9210.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r7s9210.dtsi b/arch/arm/boot/dts/renesas/r7s9210.dtsi
index fdeb0bc12cb794d6..2b349b51003b58f3 100644
--- a/arch/arm/boot/dts/renesas/r7s9210.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s9210.dtsi
@@ -52,7 +52,6 @@ cpu@0 {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.43.0


