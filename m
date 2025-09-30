Return-Path: <linux-renesas-soc+bounces-22475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A36BAC6FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BABF3A3E6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA3925A2D1;
	Tue, 30 Sep 2025 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZrNq+nrx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4261E2EBDF9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227446; cv=none; b=jdto1RtRcPDssSXIhwohCuBWdNY48XSjzvAZyBGk/Yc3XmmfI5+AWxgVZ4LdIcUWWQd4j5dZfOX72MAVqH1ZdcxdLaWB5MO+0BE96Ad0yQXrH4fd1ifowuX0uIvkf6H67T6mRbMx+AF4vzqmmY0d/G19J+kIiA7mK9T0S8Nte1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227446; c=relaxed/simple;
	bh=+5za5JUaLN0Sg+IT9qT/KHfihRy0IEDnGr1cDJ4uB7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7/APiJAkvR3dICdGJh0a2PdFBxkmx3vdSHczrM4CoLawllkrxReDG/FVxBESJbLNw7aYiFduULD/As4EvIEr+Wi9px1PUlFtAG2gUq1hwRec20jOISXgNdDaJ7Sb0TLIyHb6vLYL6DfKxX+b+gN7d927tFb0z+vwZJYZBz3wdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZrNq+nrx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ePKEx+u78sTlBDV2SI8ge68ycN2xPpY6ldmedjbXsoc=; b=ZrNq+n
	rxZDBUH5LEK8KZdJQpbd9wl8N2lLE6DYGFAe5+izBhKItR1ShbUKooM9SLs0Jvg1
	1MGn1drqovMqlUbs/7xz0sEr03a0vuRwgF14l5L22Nel/ELqiFtLvGMudaaSitV0
	coiHuqqXkZcbUL9TwIQuzELwP4m3Moa894Ui6o5LHBzpcgXXuTGV+ymH56ymYdc+
	bFfqWnNUvYBZmnP92b5r6RvsPsHtsZoRhuDsqI+5r1t82IrbXeU8lPRkMr/ckjmn
	75SgikzRgNIqMKaB5DOm5B1JJRl0qiEGkD/jzKV6P+YWhJOh/gtEj5LzrV1DWNJl
	x0bu7sm8AZl+iTpw==
Received: (qmail 3595849 invoked from network); 30 Sep 2025 12:17:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2025 12:17:15 +0200
X-UD-Smtp-Session: l3s3148p1@KBBUDgJALosgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 1/4] clk: renesas: mstp: mark 'spibsc' clocks as critical
Date: Tue, 30 Sep 2025 12:16:57 +0200
Message-ID: <20250930101656.33435-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
References: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They can be used for XIP (grpeach) and we cannot define them in the DT
because MTD physmap does not allow clock properties.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/clk-mstp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 2f65fe2c6bdf..5601e104d167 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -157,8 +157,11 @@ static struct clk * __init cpg_mstp_clock_register(const char *name,
 	init.name = name;
 	init.ops = &cpg_mstp_clock_ops;
 	init.flags = CLK_SET_RATE_PARENT;
-	/* INTC-SYS is the module clock of the GIC, and must not be disabled */
-	if (!strcmp(name, "intc-sys")) {
+	/*
+	 * INTC-SYS is the module clock of the GIC, and must not be disabled (r8a73a4)
+	 * SPIBSC<x> is for memory-mapped flash which might be needed for XIP (r7s72100)
+	 */
+	if (!strcmp(name, "intc-sys") || !strncmp(name, "spibsc", 6)) {
 		pr_debug("MSTP %s setting CLK_IS_CRITICAL\n", name);
 		init.flags |= CLK_IS_CRITICAL;
 	}
-- 
2.47.2


