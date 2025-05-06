Return-Path: <linux-renesas-soc+bounces-16713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F05BAAC38C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 14:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A414635EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804FF27F729;
	Tue,  6 May 2025 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XbpN9rFB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9827F4CE;
	Tue,  6 May 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533596; cv=none; b=MvJXvstVub6yp2K196BCimuQ2kluefrTZUavf4k33HKcCdU39vNG+JpGO5RDBV4GKNf2LMuyDIZhHS+P1GFdnkhuOjLph2NnjsAu+gE1vBIyOzcpiYfOb1an0CQ/GmNHhIrCysW9wNyoFXjej8squiOcqkPd6EqVP2wjm0fpdXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533596; c=relaxed/simple;
	bh=IXyvpT9SEmyEBrmWPBT6ydcS2pZ9Fk/B1rYQy+3PxCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jKikn6MSvjbQbz5LhzsJDgz3bO7tr0wVnwyzz2o+5roNn0ZutFjY0mr3rKV+KwVIr+OYpeeMjWqvNX+jrTzFNnbJiAJr29wiiReEp2JjhepNLqoSt7Yo+rWUXPw6/ethq5bFajyki/mHd04KJJN7lvRFKQaiT8YWX7Xn+b7RYgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XbpN9rFB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41A7A6B5;
	Tue,  6 May 2025 14:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746533575;
	bh=IXyvpT9SEmyEBrmWPBT6ydcS2pZ9Fk/B1rYQy+3PxCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XbpN9rFBCDHzriSXFLlSSug+KDXKLmN61cUaibvaxl0s4yhpABXR/5qpJc6QxXzvK
	 NRsvgqbu6KGB28x04+no9mZzhGEwzrg0aVf6fNLFhoG2Fm5gTd3u7zDDS6Vt1nE16K
	 YMp0RU+gkGMatJLDJvDNpNco9FE6vYWtmboBTB5E=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clocks
Date: Tue,  6 May 2025 13:12:49 +0100
Message-Id: <20250506121252.557170-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506121252.557170-1-dan.scally@ideasonboard.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Add macros for the RZ/V2H ISP clocks so that they can be referred to
descriptively in the drivers.

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
index 541e6d719bd6..cb2ccd9068db 100644
--- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
@@ -17,5 +17,9 @@
 #define R9A09G057_CM33_CLK0			6
 #define R9A09G057_CST_0_SWCLKTCK		7
 #define R9A09G057_IOTOP_0_SHCLK			8
+#define R9A09G057_ISP0_ACLK			226
+#define R9A09G057_ISP0_PCLK			227
+#define R9A09G057_ISP0_VIN_ACLK			228
+#define R9A09G057_ISP0_SCLK			229
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
-- 
2.34.1


