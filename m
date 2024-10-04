Return-Path: <linux-renesas-soc+bounces-9407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35799041F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E9C61C2096B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959A2216A2C;
	Fri,  4 Oct 2024 13:22:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FA4215F5C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048167; cv=none; b=OKbi+LmJoezeG/gX7jT0X9sK+Lsa4Bn/LkCBWBuomNKsBbqZRLzt5ufoeEr4yfkyivFruwkisjyMlCL4e3H7c3nOSPQe7D51F25Al5QtaLv7VJT+6WCnTFLGqlMkjoDGprkrIZQf+hu1skUjpBGnrBj7jc0aCayXi9jEnOlDaqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048167; c=relaxed/simple;
	bh=MXDJ3PfVoktwxFvlshZTkrSsuT1uuqjgomb/PrJrZno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KRAbX7biS06/ButDFsyLIuK8mkguNvlZGF+MNQvg6N8Uc/NXwCRrsYZuC44E5/Fvx1N8ACBwH0nQ86DNYvnlB6wis8hqTLaHiwdI1TIAF7QCFBBxa1BW2hM75HYSEaVGlehxyhOItkUF0pl8J94jah4xU3JpSyxr4cs/e5ydbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by xavier.telenet-ops.be with cmsmtp
	id LDNd2D0074NXpdT01DNdHC; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGK-001Elw-Sr;
	Fri, 04 Oct 2024 15:22:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yU6-C3;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/20] ARM: dts: renesas: Use interrupts-extended for video decoders
Date: Fri,  4 Oct 2024 14:52:48 +0200
Message-Id: <a8610814e31d0562732672f11d2be1404322121a.1728045620.git.geert+renesas@glider.be>
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
 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 3 +--
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 47ffa278a0dfd79e..752feea087afbc93 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -402,8 +402,7 @@ adv7511_out: endpoint {
 		hdmi-in@4c {
 			compatible = "adi,adv7612";
 			reg = <0x4c>;
-			interrupt-parent = <&gpio1>;
-			interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
 			default-input = <0>;
 
 			ports {
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 1a0d2c6ed0e83ce7..e4e1d9c98c617883 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -434,8 +434,7 @@ adv7511_out: endpoint {
 		hdmi-in@4c {
 			compatible = "adi,adv7612";
 			reg = <0x4c>;
-			interrupt-parent = <&gpio4>;
-			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio4 2 IRQ_TYPE_LEVEL_LOW>;
 			default-input = <0>;
 
 			ports {
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 5334af25c10111c8..2c05d7c2b3776525 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -418,8 +418,7 @@ adv7511_out: endpoint {
 		hdmi-in@4c {
 			compatible = "adi,adv7612";
 			reg = <0x4c>;
-			interrupt-parent = <&gpio4>;
-			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+			interrupts-extended = <&gpio4 2 IRQ_TYPE_LEVEL_LOW>;
 			default-input = <0>;
 
 			ports {
-- 
2.34.1


