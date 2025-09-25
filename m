Return-Path: <linux-renesas-soc+bounces-22361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78050B9E736
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA55916C242
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374162E974D;
	Thu, 25 Sep 2025 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bovWArHL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB632D9EF5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793230; cv=none; b=LUq+j1SR5yuNHgy1YGRiJ3Zl4Dl+WarSj3jzZOsmcPguqFGK4WZU0Y+gGQB3JCwWJRskcTbul9wwYkd8bQ+S6SGEPxZxhnreFgLYxKIfY7YUUfntL5dDSoebcyHEOQPJ19d+wihiPmuGF+ZYPwTCjnOtU9iZzlMKS9qjTpYr77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793230; c=relaxed/simple;
	bh=chevXzDWxiDc5NjvW1jS3McWco5XHwb0pQPYDjacM0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1RDsgle4mpqoX2TPkoR77a06JxlsH0zixjrHJLtjcGm/Qvl9TxuYaN2s3JsKaVUvFRNgLeD0fzb8uBNqzJ8TpAwMWVSSCjdqwqNIy+tGUl0c2Or9rFvxND7CsvfwYoSo16SEenb6MbGp7r/bIbwBxKCmV9MObqqhugt4x54AIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bovWArHL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Kt20yLrRAoDx4ifDqf6L66+TKyOHr86yM3q6sZyS+cU=; b=bovWAr
	HLxXlnvKcQg2Q7zOBzPy76UZkcAB8GtIihkbDIktQEYl6DMpwrpUE5TQ7CevSZ1v
	hBRzyG+S9VlKJFAJ5vcU0xjvIX8GN1lhlfSGFO5MeEEvTgPOxj0qeV/QKMct1WH9
	sLazCauRRwFKTKOpCpdeP7+fULBq6HhO/x0q4weSkfQ5rD9yqD7xgHiCHDStJ98V
	S26IbOrwSJsinZ09kPxQdrF46stMMupCcYkYukjwSIK7IyGvUsmc/CveAexdDwNR
	Xblc059kGLUb43PrzMvRkfEDYDtlvcPIzhzJPw8VpJEvrgYAzag/ivdBLpOnIyPR
	EqNtf4jJDNId3BaA==
Received: (qmail 1813493 invoked from network); 25 Sep 2025 11:40:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:23 +0200
X-UD-Smtp-Session: l3s3148p1@lCdT9Zw/YJcgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 12/12] arm64: dts: renesas: eagle/v3msk: mark SWDT as reserved
Date: Thu, 25 Sep 2025 11:39:51 +0200
Message-ID: <20250925093941.8800-26-wsa+renesas@sang-engineering.com>
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
V3M boards. Sadly, it doesn't mark the node as reserved, so this is
added manually here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 5 +++++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 8b594e9e9dc1..b7328f9f7d4b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -417,3 +417,8 @@ &scif0 {
 &scif_clk {
 	clock-frequency = <14745600>;
 };
+
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 445f5dd7c983..562cbd21e55f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -300,3 +300,8 @@ &scif0 {
 
 	status = "okay";
 };
+
+/* Firmware should reserve it but sadly doesn't */
+&swdt {
+	status = "reserved";
+};
-- 
2.47.2


