Return-Path: <linux-renesas-soc+bounces-26330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA3CF99E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 18:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E970C305CAB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 17:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B243433A01E;
	Tue,  6 Jan 2026 17:14:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B2C84039
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jan 2026 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719646; cv=none; b=MLx8PpyLWZ45MZ+37WAfOumidkv71e2X6HZgjHHw24KakoMFw5h15BpNCptmu4cLn5rp0AJNcqBes2EWzCSiRRfjfDMGhgaUI4m0XOMWNsJEHTOWNA6PZybecUbwuh7JT/gOR9+Z38cqonDYp9nzOfKYIQe0s5ajYD4PNRzxLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719646; c=relaxed/simple;
	bh=ns18kJWFnl4yJRi93wWNV1eduYBuZphrjrqveTBLdaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbau2BYN+XMAKGF5CPtFUrtc6enlxBVfAC4nTEjJzq2YVjK8sa7V20eQ7+RRkcGlwMeDVD5GPUQb5+5iOVnxQrjE6y10Ot9UZR0qCOASIvJzLZ9NeFGW5HG7PxmgCLx1pXK1uA0K9rx02aUPKVgUNVv0OhCDi0Qm2PgsSQHL6gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AC7C116C6;
	Tue,  6 Jan 2026 17:14:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
Date: Tue,  6 Jan 2026 18:14:01 +0100
Message-ID: <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the "interrupt-parent = <&plic>" property from the soc node to the
top node, for consistency with
arch/arm64/boot/dts/renesas/r9a07g043u.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.20.

v2:
  - Drop RFC, as commit 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt
    parent for nodes without interrupts") is upstream as of v6.19-rc1.
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index a8bcb26f42700644..571de3cafa8214e4 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -12,6 +12,8 @@
 #include <arm64/renesas/r9a07g043.dtsi>
 
 / {
+	interrupt-parent = <&plic>;
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -52,7 +54,6 @@ &pinctrl {
 
 &soc {
 	dma-noncoherent;
-	interrupt-parent = <&plic>;
 
 	irqc: interrupt-controller@110a0000 {
 		compatible = "renesas,r9a07g043f-irqc";
-- 
2.43.0


