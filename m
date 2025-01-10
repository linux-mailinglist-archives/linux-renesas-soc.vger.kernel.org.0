Return-Path: <linux-renesas-soc+bounces-12043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00DA0909A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 13:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E90DE7A07F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 12:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07B520B7F1;
	Fri, 10 Jan 2025 12:37:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDCF20B21B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jan 2025 12:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512667; cv=none; b=DE2iv9veuAAaSiW8MFTXCykiosz/d7EthJsww+sEtXXcz3LOv/yhelUvraXjBLQjGOs3X+kGGHpybmnFaq6LrVMbvtyC8Zvi1111vJly180PrrZ5KfHvsaMXYCmwtXQa0UUaKllHCNgdBrVL8utbZoIYoLn4KyCdS0DII/jPheg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512667; c=relaxed/simple;
	bh=nGTRjqB3mS+quReKY9Ss0zsQjxUoqnu4HwvNB2JSbMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzKzGWAZcKWjdxVCtdxdMpHdBxPr/FyxVW3qQWuyr009hfq5+x1F5DQohzbqCYvw1yYucdPjfxYJCAaTqMbbgZhNVNbrhMkgJXSeWjY36yWOiEa0i0e4wsxLFPtBjP6tR/BGWp42/XDq48+eL5/5PE421XGOAlmX88p1KjMyars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6c20:7f6a:9256:3ead])
	by albert.telenet-ops.be with cmsmtp
	id zQdc2D00h3H2tNK06Qdc9w; Fri, 10 Jan 2025 13:37:37 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tWEGa-0000000A4nt-2ruU;
	Fri, 10 Jan 2025 13:37:36 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tWCpP-0000000AN7u-2K4u;
	Fri, 10 Jan 2025 12:05:23 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: gray-hawk-single: Restore sort order
Date: Fri, 10 Jan 2025 12:05:09 +0100
Message-ID: <4f3e057b9a73d7ee7ff073f51bb9a4c30bdd0c84.1736506813.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alphabetical by label name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.15.

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 18fd52f55de5b75b..d58f64d927feb17b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -233,25 +233,6 @@ channel1 {
 	};
 };
 
-&dsi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-
-			dsi0_out: endpoint {
-				remote-endpoint = <&sn65dsi86_in0>;
-				data-lanes = <1 2 3 4>;
-			};
-		};
-	};
-};
-
-&du {
-	status = "okay";
-};
-
 &csi40 {
 	status = "okay";
 
@@ -292,6 +273,25 @@ csi41_in: endpoint {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			dsi0_out: endpoint {
+				remote-endpoint = <&sn65dsi86_in0>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
-- 
2.43.0


