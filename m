Return-Path: <linux-renesas-soc+bounces-2211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 251578459A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDE9B1F22127
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FA85338E;
	Thu,  1 Feb 2024 14:09:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B395D47D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796566; cv=none; b=NSlpg83zYUsmhiUG+Gra1V1SOs+1h8Uej03Hh4IazU0/Y1wJKJg4T/pOZ1iBPlpTFVhvbkBvBkaCczONE2VeiTVH2NOOG0pRlyzXKxXukRibn5mKdIx89++07NogcdMfqy2KAbvTW58gZF/6E6ACBE8xRFAtCeZyBuVVpI6PyQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796566; c=relaxed/simple;
	bh=cMiqMZnDPkpPLcJCn7WbXMBnx0F3yvH/K4gDkImWz34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qPGUXMNxoDmWKcQgeVWZd7X8jqtFBZnkZEI6tuci0STh137naHtZ5JFOb2MlRCp28Q8b1betHiSAaWbPhvf9HIhqtSu4yRphC1t4FJ0bpCxdSEBefYJ1fEIz5FYykzPkz0U8DHfqsRSWonPoaxHz+QntWkpPQYGZGsjjycSt3LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by michel.telenet-ops.be with bizsmtp
	id hq9M2B0064efzLr06q9MRr; Thu, 01 Feb 2024 15:09:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXjw-00Gv3o-8D;
	Thu, 01 Feb 2024 15:09:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXkn-00AXWm-6y;
	Thu, 01 Feb 2024 15:09:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Enable watchdog timer
Date: Thu,  1 Feb 2024 15:09:17 +0100
Message-Id: <cf6effafd9e0472a457eed9d84a834abc3e1c833.1706790320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706790320.git.geert+renesas@glider.be>
References: <cover.1706790320.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the watchdog timer on the Gray Hawk Single board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 716cb7622f167973..1c84fe7171d3fd85 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -65,6 +65,11 @@ scif_clk_pins: scif_clk {
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif_clk {
 	clock-frequency = <24000000>;
 };
-- 
2.34.1


