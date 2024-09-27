Return-Path: <linux-renesas-soc+bounces-9109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F04A19881EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 11:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3D41F220F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 09:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559941BB692;
	Fri, 27 Sep 2024 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YgEDxGie"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4592AD31
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430873; cv=none; b=EV6kGQvHDs5GrCoFeg4rHGAzykSC7rNRFbqH1jea6uibpc5n/vly+ponxJavsePcA6/L2xe5ySUbm1z6Q1hlVVrXsJaIxd8z35cNGo0ncMRIuGOaTXE+QphLmL59aOHjkcCp9KjbEVK2XNpEh38uNXr7CQQyTn3nXwx21+efrLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430873; c=relaxed/simple;
	bh=5axcWPbEb0x+VIIWN535+xhEtrw7AucW68gd5TpUBfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAtZm6Whfa4V0bnrJqj5mivEsZmJgbMIWbiLLhTNFof2P2G8SlSrUROAtK3cKhVXf2K+80AJW4mTPxvt1CQ7pG/mEuUOyJbvs/SvLAeEkwUxVocyDUJ7AQ545MyLi5f4kmlSVICHwnAc1HeTy6Au6D9NzdQfaklg9uu0Qd02vwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YgEDxGie; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4gL1fOCjS1lQsADp7GzCdvV9np2yt6piuUaHJ9SRsL8=; b=YgEDxG
	iescSibFL14IJWuo2eSbH+IvjKRrssYfwMjkovbY2weHhU7DdqrSWIp4Qv1mLkAL
	TmN9QzIwc7jjq5ZIyuCWd25AM2viezXeRiPAt+UuheQNiAhCJH4olfpICTLwBUOQ
	cd79R3t4hWD3+amgjNfFN/kGwaxccWqExVlHGghXKl8cThrHB33owWOPMZOrwIEA
	qRi+H8LCFOUyG3Pdvx+wGg/rN6S8MpuTrkk7Pn39sxP7WR098ksYGdBYvVEogFhO
	2i6tFyRX0qQ63CTYCUp8dbynxHGIGlk0pPnb9P3KZEvQSD4zEZpH1RzjrnUVAELO
	yg/zt2o7JWm/kAZw==
Received: (qmail 1283507 invoked from network); 27 Sep 2024 11:54:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2024 11:54:29 +0200
X-UD-Smtp-Session: l3s3148p1@hzNR1xYjkwdtKPLv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: renesas: rskrza1: use interrupts-extended for gpio-keys
Date: Fri, 27 Sep 2024 11:54:17 +0200
Message-ID: <20240927095414.10241-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupt.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index b547216d4801..9ff3f04c1b02 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -78,24 +78,21 @@ keyboard {
 		pinctrl-0 = <&keyboard_pins>;
 
 		key-1 {
-			interrupt-parent = <&irqc>;
-			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
+			interrupts-extended = <&irqc 3 IRQ_TYPE_EDGE_BOTH>;
 			linux,code = <KEY_1>;
 			label = "SW1";
 			wakeup-source;
 		};
 
 		key-2 {
-			interrupt-parent = <&irqc>;
-			interrupts = <2 IRQ_TYPE_EDGE_BOTH>;
+			interrupts-extended = <&irqc 2 IRQ_TYPE_EDGE_BOTH>;
 			linux,code = <KEY_2>;
 			label = "SW2";
 			wakeup-source;
 		};
 
 		key-3 {
-			interrupt-parent = <&irqc>;
-			interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
+			interrupts-extended = <&irqc 5 IRQ_TYPE_EDGE_BOTH>;
 			linux,code = <KEY_3>;
 			label = "SW3";
 			wakeup-source;
-- 
2.45.2


