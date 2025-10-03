Return-Path: <linux-renesas-soc+bounces-22627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1D6BB66D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 12:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DF2E19C6590
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 10:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0951C2E8DF7;
	Fri,  3 Oct 2025 10:08:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36872E8B9A;
	Fri,  3 Oct 2025 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759486099; cv=none; b=qbjJ6KcRqBjz8HJvk0/prC2+/IVY/xOG0PQ/mr7yyFyx1eruBXTIK+9TgvEIlpFedqsB1PIuqr/ZBU0719q8vbKmb/VxlXIxbV99KkkiL+7P7obmQcp+Q7RdF+WKQN4PYXwH6hp634qU+qROPB4sXu7CDEbGXEzxfIysxXocy/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759486099; c=relaxed/simple;
	bh=kIDAaVBm4hCKZdHyLuxZHTfdOtMs0twtoGrJpSIf6DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhfHSIOxt/4VazeydcP2XPXPj5gYodWCixgJZHq9m9znxpoivuqwAZmqLhVhx5A25usB+acr2TlExrXyS9QH4o6CIVzgF2SQQM0Id4AK37gSX14domDMJK1GDCixxUBWyXH+FBlPP/mDOR3WwfizQwQxv84LRAkde/7LkUE1XIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F85FC4CEF5;
	Fri,  3 Oct 2025 10:08:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
Date: Fri,  3 Oct 2025 12:07:49 +0200
Message-ID: <8e7c7881800827467f1687432751addb822bb85b.1759485668.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759485668.git.geert+renesas@glider.be>
References: <cover.1759485668.git.geert+renesas@glider.be>
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


