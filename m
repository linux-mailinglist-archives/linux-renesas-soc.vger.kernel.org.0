Return-Path: <linux-renesas-soc+bounces-9075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1F987256
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 13:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5465B1C24B24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 11:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520B61AE86B;
	Thu, 26 Sep 2024 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hCAC4QC0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B221AD413
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348853; cv=none; b=H7TLpH0SODUXXFUtVebgDSW8fGwizqraw27KtZYzH/5mVpNucha5zCXzGmJ4cdJayYMW9FEPvYG8h5grhpCQ77s8h69gi8COeYrqqXcrIzrgE7laot2cPVN+8Y+FT/YvVEM+TO3NVSr0ie7PZ71+4DrK1qLNkZK1dxe/wFIS0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348853; c=relaxed/simple;
	bh=edJHwksCZnYmluxmnPv7cCA4TzlxbJw+/a1qjku+NwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7ZBFAv3PgYqumx3mTwA3zNb+4qgpkAi7nEawRNGuZr9rlMImbOUzucETZOuo8oDYFluKSKciN2WZaZb7i+tdLxT0jprnkVcu3hY/Usjk+WyF5upGEoUcS/3ZLVtpzNAl5cIVJObePemcw2WAdT75EfqarOOWg6puo1qXAk9HIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hCAC4QC0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1LRJzV7Akg97hUhq7KhF1S6Gs7cXHnyKWjNpI4zDI/s=; b=hCAC4Q
	C0D1m5zVZvGbAekxjVRg6Bo4Frwe9e4xkPMANe+EfJ+xhjqo6Wq+KgjsMs9Q5urH
	fkLan1Ttw7yupYM86SmfgVfJbK1gHt0LqYOh84ir5jMxbOjwi2CUmgPEITIelkTm
	T1GwMkLLac6UqmvfunkIlrTfN7jVjBZXgK0vrVE3eDg0FnUJW3hFZBaZ8dZUeiJ6
	MKluir5Pz5i7SObr+j+j2W2pADoDgldF7ZA9aPCwk89iaqe8x+iwZwEjik85DKA2
	UorN01sGRNEb+SDfvVDZSVICzz0pth8eu0m7gtQirDvysCCVEZSjVGAtyWOE4Vdb
	mZ+0APBf69KHhjyw==
Received: (qmail 960780 invoked from network); 26 Sep 2024 13:07:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 13:07:28 +0200
X-UD-Smtp-Session: l3s3148p1@7od/vgMj2swgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: renesas: lager: use proper node names for keys
Date: Thu, 26 Sep 2024 13:07:19 +0200
Message-ID: <20240926110718.20519-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926110718.20519-5-wsa+renesas@sang-engineering.com>
References: <20240926110718.20519-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoids 'keyboard: 'four', 'one', 'three', 'two' do not match any of the
regexes: ...

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 8590981245a6..d4e8140a762a 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -79,28 +79,28 @@ keyboard {
 		pinctrl-0 = <&keyboard_pins>;
 		pinctrl-names = "default";
 
-		one {
+		key-1 {
 			linux,code = <KEY_1>;
 			label = "SW2-1";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 		};
-		two {
+		key-2 {
 			linux,code = <KEY_2>;
 			label = "SW2-2";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 		};
-		three {
+		key-3 {
 			linux,code = <KEY_3>;
 			label = "SW2-3";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
 		};
-		four {
+		key-4 {
 			linux,code = <KEY_4>;
 			label = "SW2-4";
 			wakeup-source;
-- 
2.45.2


