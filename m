Return-Path: <linux-renesas-soc+bounces-9349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A798F0FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 16:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F9C281E87
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 14:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8294A19CC04;
	Thu,  3 Oct 2024 14:04:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA019CD0B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964283; cv=none; b=DQAuUPtp17MNAQ7k8409+o82XfmtVYfPTS9IsvfHnZHDgMjDlkjx4aZ0sYafVSd8Y67tLcHWLhXwkZwIuqVPW4B77DWmdHR2yVcwDB8ashgNDyYE1IZZkIwjduybGByhlA9SLUcL8NMNG9rTnLrJVVZAVe75cxuW/kxty7T8oq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964283; c=relaxed/simple;
	bh=cnqWTpDQyDMAetZAw6MLJ8dI8Id06dyIeRu+kxRfc4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lBAx+Eq17hdmjnoi8eYNpfEtBtLMq/Uk3m62ZuoXIc7CW4zNh8ja7RWNYpIhRt10lJ0ecDiSjKxifiA2Lhd9P8iPwJrZkT3ZS6R52b6dB4jb4TgWKw9B/uuKCFTfBF3uIdmt1zSYU7jqLjxsMBU23qehj+IpMH6UgTcJ2PXHBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by albert.telenet-ops.be with cmsmtp
	id Kq4d2D00H5K8SYz06q4d4F; Thu, 03 Oct 2024 16:04:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRR-001CGi-6H;
	Thu, 03 Oct 2024 16:04:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRZ-006e9r-E9;
	Thu, 03 Oct 2024 16:04:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 resend 4/7] arm64: dts: renesas: r8a779f0: Add E-FUSE node
Date: Thu,  3 Oct 2024 16:04:28 +0200
Message-Id: <cdd2e25d1f60a720c0a64f0c42e58aa81a6150d6.1727963347.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727963347.git.geert+renesas@glider.be>
References: <cover.1727963347.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device node for the System Group Fuse Control and Monitor block of
the Pin Function Controller (PFC) on the R-Car S4-8 (R8A779F0) SoC,
which provides E-FUSE services.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v3:
  - Fix reg size,

v2:
  - s/r8a779g0/r8a779f0/ in one-line summary,
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 9629adb47d99f142..054498e54730b49c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -377,6 +377,14 @@ gpio3: gpio@e6051980 {
 			#interrupt-cells = <2>;
 		};
 
+		fuse: fuse@e6078800 {
+			compatible = "renesas,r8a779f0-efuse";
+			reg = <0 0xe6078800 0 0x200>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+		};
+
 		cmt0: timer@e60f0000 {
 			compatible = "renesas,r8a779f0-cmt0",
 				     "renesas,rcar-gen4-cmt0";
-- 
2.34.1


