Return-Path: <linux-renesas-soc+bounces-11515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D22169F5F7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 08:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D854D7A3621
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 07:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7831C16191B;
	Wed, 18 Dec 2024 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Dya5ZKST"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8F9157484
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 07:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734507712; cv=none; b=pS2MQ4wNJlDkrKsSbTDr/SpZc816FrI0oQ6yuSajRgKIL0ojmDkGzbYKfnXRkwzfIK1lAoEh0GNZa/efbcRAbB/FqbKx1pNpwKp1gfomCkRi6JvyBWYHDpppO9VxCDRA4Ukc1GHuQKwz5HyqDdE6dq2Fjd84SwlTVvW9GDXfBDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734507712; c=relaxed/simple;
	bh=1alsSrtg+YFvHJ0ZC2N88facs3PkqkS2LIwNoe1ZRy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axwhhAQVUh/ofcJqCgNaA7i7XLRSPLFdSjyfNejat5gRzxL0vEg6VH3nA3sDOayYY2MTBqyPKtHeKz7TG788/Hsezm1PSiRtWg4WPZwILDf+24tOlGFSATi9Xf+tnYT1B2pVM428hRiiPLd6CMM2gAUwl7FIKx1hyhHayeLDuhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Dya5ZKST; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=H99eTZ2U99mbsSI7wrJCDQ+VdYBsbWQkx3mJdR9iXSc=; b=Dya5ZK
	STUHRs1eAf4BXBBHoJ6TknmP2nJMZNRiYLGoWRE/OEHcpioX/x9TaG0SX4xNkFCa
	duFSl000Ib46h2A17Zkoedqfx0UD3CZTnCXQ8iVAt0izy+IH066M3I9yrJyYX4/P
	ctmecOP9XxedOmBbl2gAUNSWsPDNMaJUsg9lyJfTF8woI+CC8ZMDF6eU+Ek6pZwd
	nl4pBpAMBhQpI5m6kkOkkr6GPPnGfmsHiVPjM+EnjHiSAVXyjuWqb0MP/t+ZKfMY
	3Wqdo1BkAN3nAfEk3y5NYCOJN/C8Q/YdqrBNwTSapp4qSw6D8BKj8cxySAMUT9q9
	4TBEnjx3Q+QFFDmQ==
Received: (qmail 204858 invoked from network); 18 Dec 2024 08:41:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 08:41:48 +0100
X-UD-Smtp-Session: l3s3148p1@bPfJi4YpTJwujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 2/3] hwmon: (lm75) Add NXP P3T1755 support
Date: Wed, 18 Dec 2024 08:41:33 +0100
Message-ID: <20241218074131.4351-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218074131.4351-5-wsa+renesas@sang-engineering.com>
References: <20241218074131.4351-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add this LM75 compatible sensor which needs a separate entry because of
its default sampling time and SMBusAlert handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1: reworded patch description

 Documentation/hwmon/lm75.rst |  6 ++++--
 drivers/hwmon/lm75.c         | 13 +++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 6adab608dd05..9877ddbbf7c8 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -121,9 +121,9 @@ Supported chips:
 
          https://www.ti.com/product/TMP1075
 
-  * NXP LM75B, PCT2075
+  * NXP LM75B, P3T1755, PCT2075
 
-    Prefix: 'lm75b', 'pct2075'
+    Prefix: 'lm75b', 'p3t1755', 'pct2075'
 
     Addresses scanned: none
 
@@ -131,6 +131,8 @@ Supported chips:
 
 	       https://www.nxp.com/documents/data_sheet/LM75B.pdf
 
+               https://www.nxp.com/docs/en/data-sheet/P3T1755.pdf
+
                https://www.nxp.com/docs/en/data-sheet/PCT2075.pdf
 
   * AMS OSRAM AS6200
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2c2205aec7d4..a8f95bef68cb 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -38,6 +38,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6626,
 	max31725,
 	mcp980x,
+	p3t1755,
 	pct2075,
 	stds75,
 	stlm75,
@@ -222,6 +223,13 @@ static const struct lm75_params device_params[] = {
 		.default_resolution = 9,
 		.default_sample_time = MSEC_PER_SEC / 18,
 	},
+	[p3t1755] = {
+		.clr_mask = 1 << 1 | 1 << 7,	/* disable SMBAlert and one-shot */
+		.default_resolution = 12,
+		.default_sample_time = 55,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 28, 55, 110, 220 },
+	},
 	[pct2075] = {
 		.default_resolution = 11,
 		.default_sample_time = MSEC_PER_SEC / 10,
@@ -734,6 +742,7 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "max31725", max31725, },
 	{ "max31726", max31725, },
 	{ "mcp980x", mcp980x, },
+	{ "p3t1755", p3t1755, },
 	{ "pct2075", pct2075, },
 	{ "stds75", stds75, },
 	{ "stlm75", stlm75, },
@@ -813,6 +822,10 @@ static const struct of_device_id __maybe_unused lm75_of_match[] = {
 		.compatible = "maxim,mcp980x",
 		.data = (void *)mcp980x
 	},
+	{
+		.compatible = "nxp,p3t1755",
+		.data = (void *)p3t1755
+	},
 	{
 		.compatible = "nxp,pct2075",
 		.data = (void *)pct2075
-- 
2.45.2


