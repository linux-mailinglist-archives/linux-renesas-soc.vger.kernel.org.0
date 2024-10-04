Return-Path: <linux-renesas-soc+bounces-9400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4537990415
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F07801C20987
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0665215F41;
	Fri,  4 Oct 2024 13:22:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026892101AC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048161; cv=none; b=ZOGNGG+a7eoGHR0CyZMg2YCoruMDiqNnYxiQwc6R1n0lRMVLTXGX31NOLt90LfaBC3UKb8B8NImKsh7MNmHrYkWkvNwnLMOt4cIzu/Oeo1J0cZen0qFTaYaH3tLj51q+iiAetNhhrhUPmghvJK5N9Cm4sr8vvrxkcP57idt172w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048161; c=relaxed/simple;
	bh=lMMu+WORYW0px9ukDBaHFKXv7rJZP16fEMKRmKjMJSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VbdPTqGbH0HbP9uBM9GYmnYQ9h2qbRETZoHO6+osCtj3qRU82Bw5v2b+DjH1kR1eb0iT/sX6LIdeJ4y71t1UdrHCyeNFqg6a5fz0lfPzBrW+BYzfM1uuC9q1BRQYt7oklv/PQuNUiqDA3E8TKlm4uJ+svd45SPbtJPRukuKUy6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by baptiste.telenet-ops.be with cmsmtp
	id LDNb2D0094NXpdT01DNbjK; Fri, 04 Oct 2024 15:22:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGJ-001El9-G5;
	Fri, 04 Oct 2024 15:22:35 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yVE-UF;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 20/20] arm64: dts: renesas: rzg3s-smarc: Use interrupts-extended for gpio-keys
Date: Fri,  4 Oct 2024 14:53:02 +0200
Message-Id: <6214cd8ed068e3fc60a7b972093e4d99cdc0be1a.1728045620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728045620.git.geert+renesas@glider.be>
References: <cover.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 7945d44e6ee159f4..4509151344c430de 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -20,8 +20,7 @@ keys {
 		compatible = "gpio-keys";
 
 		key-1 {
-			interrupts = <RZG2L_GPIO(18, 0) IRQ_TYPE_EDGE_FALLING>;
-			interrupt-parent = <&pinctrl>;
+			interrupts-extended = <&pinctrl RZG2L_GPIO(18, 0) IRQ_TYPE_EDGE_FALLING>;
 			linux,code = <KEY_1>;
 			label = "USER_SW1";
 			wakeup-source;
@@ -29,8 +28,7 @@ key-1 {
 		};
 
 		key-2 {
-			interrupts = <RZG2L_GPIO(0, 1) IRQ_TYPE_EDGE_FALLING>;
-			interrupt-parent = <&pinctrl>;
+			interrupts-extended = <&pinctrl RZG2L_GPIO(0, 1) IRQ_TYPE_EDGE_FALLING>;
 			linux,code = <KEY_2>;
 			label = "USER_SW2";
 			wakeup-source;
@@ -38,8 +36,7 @@ key-2 {
 		};
 
 		key-3 {
-			interrupts = <RZG2L_GPIO(0, 3) IRQ_TYPE_EDGE_FALLING>;
-			interrupt-parent = <&pinctrl>;
+			interrupts-extended = <&pinctrl RZG2L_GPIO(0, 3) IRQ_TYPE_EDGE_FALLING>;
 			linux,code = <KEY_3>;
 			label = "USER_SW3";
 			wakeup-source;
-- 
2.34.1


