Return-Path: <linux-renesas-soc+bounces-11589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C35C9F8823
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 23:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 910027A330E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 22:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277001DC99E;
	Thu, 19 Dec 2024 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MgBBkrgO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC71C9DF0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648953; cv=none; b=oVmnZg/ewcn5F8gTHPViJ0PnnUT8kouLnrfqKfk+hSuv9EwGL2jNRr1JFpUsZU6ODim47BeiRAslrEseqQLo5noF6VKbgbX1gMatFIK2stOBywxLuNA60QgFKatNWsLxRs01Zd0+rgzCNF29TzFnOMPeHcxo7o07FQI4L1dbYbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648953; c=relaxed/simple;
	bh=fRaBiCoerYtSXXFqhmhM8BO1GEchg6Xp0E+QB3DJQ7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXFdpe76jknaKuzPXAw/V6a30wsXAUdumdpWa/T6Jm9n4AYZYlPnXcaLM19EnPzIeMqiiNhKWg23cxbZqubZb2MaR0enyTKyb9ExtBNHEPXMv+mB1i0pV0MPRYLiNNEHSiMsM+hRBrCmBzadqfQLdC+vhs648pQ8vIKQIdIfu2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MgBBkrgO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PltsfRgtPshB11QnLxkk5tBvWzyj5OepdzLg0lgkrMg=; b=MgBBkr
	gOafqD55q41NXV3mUTZ2ktb7zze4pdzooD21gDjZ2i70dsPq/AWa6RDrHy6rFLEj
	T23rchTdUAzXNpQg4lFVPlzpuSyc5G5HbuMW+Vi7G/7FNCds1NrIkk6u9+oajBqh
	T70wRmJvkAVf71G/G2EExzC/mP1Ykv/xyHsWyLYlydDr0jO598tBJN1PukT/QaVj
	8FRHUowzH//pAn5On1LtSiZl0dS8B7jm7ua24tful/qd7LkOfVps/G06U+QgSVKC
	cL2+02qMmriS+5Lkllc0gLpoZw1noRTu51DwqKiTjLmC0cFT2Vi2JAHbGvDwPM2R
	r4F+OG2pQWqxbEDw==
Received: (qmail 826593 invoked from network); 19 Dec 2024 23:55:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 23:55:48 +0100
X-UD-Smtp-Session: l3s3148p1@X1Rhbqcp+KgujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH 1/5] hwmon: (lm75) simplify lm75_write_config()
Date: Thu, 19 Dec 2024 23:55:23 +0100
Message-ID: <20241219225522.3490-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After previous refactoring, it is now possible to make
lm75_write_config() a simple inline function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/lm75.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index b8889392d5da..b03e760cf3a1 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -340,17 +340,11 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
 	return ((temp >> (16 - resolution)) * 1000) >> (resolution - 8);
 }
 
-static int lm75_write_config(struct lm75_data *data, u16 set_mask,
-			     u16 clr_mask)
+static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
+				    u16 clr_mask)
 {
-	int err;
-
-	err = regmap_update_bits(data->regmap, LM75_REG_CONF,
-				 clr_mask | LM75_SHUTDOWN, set_mask);
-	if (err)
-		return err;
-
-	return 0;
+	return regmap_update_bits(data->regmap, LM75_REG_CONF,
+				  clr_mask | LM75_SHUTDOWN, set_mask);
 }
 
 static irqreturn_t lm75_alarm_handler(int irq, void *private)
-- 
2.45.2


