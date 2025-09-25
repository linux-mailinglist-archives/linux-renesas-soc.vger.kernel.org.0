Return-Path: <linux-renesas-soc+bounces-22360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F2B9E717
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E647189CE34
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC9F2E9EDF;
	Thu, 25 Sep 2025 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DRaI4itC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A82F28750C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793229; cv=none; b=prfHDFVxFLLrCXtQ58tGmLk1AT9n672l5VkqdhvZ4uK8aOEmrMd1xX80S/4yqbu6l0Itz84L73U3QI+SN+L4F/sPG/FwautU4M1R9bj/jvpok99CCMVMjmhyiq0rGKAPrpLyG/R4b3wvglAZBxPDezWLvdNQNQLwFhJEKePub/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793229; c=relaxed/simple;
	bh=x1Y8aoCJupwDwQAVTOx9/Y3PIdym4uKzghFwswcEjOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5j5KOvrqygbBPu0lLbtdMeTXmqhqc0xB1wK6iDGR0SrDzHUKptUbBf65exq7uddMHb60h1etVdYHiFmiX7uV7tmaSTQ0tZDM5CWOKkE6DaHEw279Q4Wrug/A1INrBmYSWvQluC5SP1NUUfHvICvSRyMEa8bTmaqXX7LqUBFdSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DRaI4itC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xYi+v+bJ8HgqlTESD9nRscBEdw/sv7xKenDH1T8LbvA=; b=DRaI4i
	tCE/2AnihDqkcbjzInkTDaR3jXHeRNagksiyq1kDM+Gh2FvYPTYV2Ry14graNHXq
	YbDW+qCfbxr9UZEFJfM7Hxzmxc5Gy61ceSuO9eUO+yW6wCwiCRmge/D1v1Vc2e8o
	p2SSam6v87nqDfp4+eIwjgWZc7Y490wtmQcxUUo9nOTOZpzF9eqBIQ2UMlvNp0Md
	NAi0GuvDaNVXyGpIiHgCDRtZ4nA+ao/snbkTZcP9RvQS/LQZ17YlMkcpxStElOu5
	+e6REpGs1Eb+wYi4ZajK2rDPkohKVyLUySR7w2aZ8qPLKVohrSDF4G8e7n+4mDSk
	qByBxwakfFgM7OYQ==
Received: (qmail 1813443 invoked from network); 25 Sep 2025 11:40:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:22 +0200
X-UD-Smtp-Session: l3s3148p1@yjM59Zw/WpcgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 10/12] arm64: dts: renesas: draak: mark SWDT as reserved
Date: Thu, 25 Sep 2025 11:39:49 +0200
Message-ID: <20250925093941.8800-24-wsa+renesas@sang-engineering.com>
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
Draak boards. Sadly, it doesn't mark the node as reserved, so this is
added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/draak.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 71d9f277c966..733a55f77cfb 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -722,6 +722,11 @@ &ssi4 {
 	shared-pin;
 };
 
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
+
 &usb2_phy0 {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
-- 
2.47.2


