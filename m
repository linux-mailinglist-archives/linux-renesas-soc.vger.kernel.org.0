Return-Path: <linux-renesas-soc+bounces-9078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A6987266
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 13:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CA17B2B6EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 11:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904AC1AD402;
	Thu, 26 Sep 2024 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qh393lcb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9741AD9C1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348854; cv=none; b=uJ77hqi8ac/Mbw9MUDVGA5F89EG3DJaRLOq2ZamsZVULvLiL5qca9DE5xxuSKaU5+PP0bLyYmUZbD4XSDfrLrc1jEBdPl/E7zLANsHztnDXbhofTj6jmyc2BPjVfZdpT9hVTZKQ0cciN3ZwF9gLZ0QqQInHNAtebTv4hixQgq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348854; c=relaxed/simple;
	bh=V9Ay8JAq4S8DENcsrnoXGlS9vimeAb8wlGRwmXwfMJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhGM4s+5fwsPBuS+UYPKeLJq9E7wFsg7zzP04aQ9+gtzoy8ke1I2P/3pn6Q2/UIQgRpIREgOLRW6N0ApeZag/XMQWDaQNgxdkzlGO7Uly4OKQhuwvSBzzjJeXiEEZavDqLBFNXXLDzTYBCAK16GgQRGPEwOqncAM8EQ1DctgR1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qh393lcb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=a8DjMxCm0od+c3OPWc76GqeF31DstQ8paL8D6K89IPk=; b=Qh393l
	cb+cxYXD42iwJqU1LQh8VQHmWSxvgM0agIDp6tAahytdkbG/8Ap3E74GanXiV+K6
	cZzBG2QiKP2qoEYfJKU/ONus56SaETr4ZILubbNLShF9xtYmCmgFDm40TZ6VBwRx
	soavKhH3mtrVdnmqMQezDVu4bKK2TniBTXm0hq3PTAZP451cMmIdz2L6yCLo3pXV
	1n+Unia8rI0zNzfXpJ2PqI1OaJUmHHrq3rz3hLw0UplWlAV6hhmfet3xV8t0YFg1
	357yo81TN4AzDfCkgk8i7SO2PS3EhYm3FPsf37JIW0DLSQvvKnNOpO33jcxjOBv1
	t5qAw6K3wkz1QJRA==
Received: (qmail 960836 invoked from network); 26 Sep 2024 13:07:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 13:07:29 +0200
X-UD-Smtp-Session: l3s3148p1@B6yKvgMj6swgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: renesas: alt: use proper node names for keys
Date: Thu, 26 Sep 2024 13:07:20 +0200
Message-ID: <20240926110718.20519-7-wsa+renesas@sang-engineering.com>
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
 arch/arm/boot/dts/renesas/r8a7794-alt.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index b5ecafbb2e4d..ac541c2af798 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -96,28 +96,28 @@ keyboard {
 		pinctrl-0 = <&keyboard_pins>;
 		pinctrl-names = "default";
 
-		one {
+		key-1 {
 			linux,code = <KEY_1>;
 			label = "SW2-1";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
 		};
-		two {
+		key-2 {
 			linux,code = <KEY_2>;
 			label = "SW2-2";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio3 10 GPIO_ACTIVE_LOW>;
 		};
-		three {
+		key-3 {
 			linux,code = <KEY_3>;
 			label = "SW2-3";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio3 11 GPIO_ACTIVE_LOW>;
 		};
-		four {
+		key-4 {
 			linux,code = <KEY_4>;
 			label = "SW2-4";
 			wakeup-source;
-- 
2.45.2


