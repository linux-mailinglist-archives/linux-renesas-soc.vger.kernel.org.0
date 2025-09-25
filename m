Return-Path: <linux-renesas-soc+bounces-22359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B69B9E715
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8921E3B200F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8182E9EC6;
	Thu, 25 Sep 2025 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DENqiGmI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34BE2EA143
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793228; cv=none; b=W7GrON8cxLHz/AfrWJaafe3dBQ9a6xFTwdN2NbBAqvyRoLqSsaY2ypNu8bl4ELyugurnC7h/T01td2A3rW2SWVRoTX4SXpwqg9RtIUsRdrZ/Tv5+NmXHpHM+9O/w+HeD+yckaEtIYIRAqoI2dF2yqFBDEWspaMzzdr4zWRlOoCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793228; c=relaxed/simple;
	bh=GOOW/d/ss8up/fz43pypDl4Y02NWzBsQZ6XqY2/VBCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHHFGdS55cdnpEmbAFKZtPaixDqX5A3mEFmwR2v+0cIwHuou5uIv/YGxE5gXokoQ55K8A5Z/XXb9MzJsBj/FeSgXzJZUhLhFTGNjs1WT5t9aL61nVoWURIiNMFD++bhmkZ+SEWzBDvyGuKzWkVUEkYs17GtsUDeB3sOcElSQod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DENqiGmI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tAQzM1sJbeBSeptPyMrJdNzl+tol7KBGvjuoPdcZrVc=; b=DENqiG
	mIIIfLMvTnGyErpv+Yd1sMh9xrwnpWl35zO1njCrje/4x9+uqE8z8w7AMPLUMk8W
	Q0g0tEwgJT4Vvdg7upicYeps6hWLoyFHA0SiNC772/vs6e1I470egH7/FD6Y6pWx
	OcmBEoJSYSn1HO4bGANM/i98z57WP+eBssHKya2xrmBJOJ4wYi40UWMdz8v9heWi
	wGx1F06lxNIZPgAATAcNT9KzoCYdiZ6EPf1oglhh5YgsDDl+zwuQwYPT2Wfuu8Ut
	+8V7M7LroFEGFO5NlcZkt0G4cjfThG+QzG5lUiCwR0jeozUFH6syDeZ2UIqtiEOf
	CB6xGjis9Mj52JBg==
Received: (qmail 1813355 invoked from network); 25 Sep 2025 11:40:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:21 +0200
X-UD-Smtp-Session: l3s3148p1@z+os9Zw/WJcgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 09/12] arm64: dts: renesas: ulcb: mark SWDT as reserved
Date: Thu, 25 Sep 2025 11:39:48 +0200
Message-ID: <20250925093941.8800-23-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This watchdog can't be used with Linux because the firmware needs it on
ULCB boards. Sadly, it doesn't mark the node as reserved, so this is
added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 8a30908992ab..a9e53b36f1d9 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -495,6 +495,11 @@ &ssi1 {
 	shared-pin;
 };
 
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
+
 &usb2_phy1 {
 	pinctrl-0 = <&usb1_pins>;
 	pinctrl-names = "default";
-- 
2.47.2


