Return-Path: <linux-renesas-soc+bounces-11335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF3E9F1DA1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 09:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AA447A05C8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 08:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E11A17A597;
	Sat, 14 Dec 2024 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ch0UNMRd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C0161328
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Dec 2024 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734166731; cv=none; b=lRrld9ICMptaWVwVjErylXqy+zOVialXmiQTfWl73dvhrj9o/ivqLllucgy3D5wu++joIkPmPw2OARtcLZgcP0Sr5U0AVj77Q6fGWFSJMXVB45f0iCPivR2A8Ei/5x+H6mkWQVsp6M1MIOq1UgoeMlLO2tQmYKTZv5XfS73Xom0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734166731; c=relaxed/simple;
	bh=AmlVvrQ8iOfKbH3YXZgneXCCi7K2VfqQc3W7DMkumpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9nUiUldXaKayu8a+/IhJ27ijLtOi1wjn5WzHCm56gygSbq4joDxAoKt7hwhlXSCGBD45kWB21ngeUnrUKa7HRwLpWYcNShO/p22zNkH6PQ5V0HKGAvwHSmikm0NvesqtN5Lx0awlgpDqAGVM6Cv1Cgmay4woH2KppAIULPXDME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ch0UNMRd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=V/U1WDJaY7VuSaVdnDsrNgusQyOaSAv9Mkt7sm9FcRo=; b=ch0UNM
	RdctcsuKdT0jzhUWxGFPyqjFXA+nUbxMmmHzwUtm0u5pHecp5wepmPxC50xs3qfw
	DAPCoCcoaoa+7xQmGlQszhrvL9rpPGEZF4tX7XRrciGNCEmJ2UEqp0Qiy0clDAF3
	iMygep41I/j74Aq0ml9RfscLW4M52qIXFpglqDxcJBJ5jjIy2q/HO4HQyf+yG4a5
	q1P+D1ItmouATvjDIO0hx2fu1bwk1ABKCVWdkmSRLEfhHdLxZhPZIvfVu8OJKZDY
	ti6RrFKx8HxgdDr8aiauA1BNqaLh0rLq/F7ZPomUncnclfWnmMKr74M1NZ2ICGe3
	zqXg/C3+DYnjyE5w==
Received: (qmail 3036721 invoked from network); 14 Dec 2024 09:58:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2024 09:58:39 +0100
X-UD-Smtp-Session: l3s3148p1@zTtCJzcp3oFehhtJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 2/2] hwmon: (spd5118) Use generic parity calculation
Date: Sat, 14 Dec 2024 09:58:32 +0100
Message-ID: <20241214085833.8695-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of the new generic helper for calculating the parity.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/spd5118.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 6cee48a3e5c3..07ab3a47b00c 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -291,12 +291,6 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
 	}
 }
 
-static inline bool spd5118_parity8(u8 w)
-{
-	w ^= w >> 4;
-	return (0x6996 >> (w & 0xf)) & 1;
-}
-
 /*
  * Bank and vendor id are 8-bit fields with seven data bits and odd parity.
  * Vendor IDs 0 and 0x7f are invalid.
@@ -304,7 +298,7 @@ static inline bool spd5118_parity8(u8 w)
  */
 static bool spd5118_vendor_valid(u8 bank, u8 id)
 {
-	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
+	if (get_parity8(bank) == 0 || get_parity8(id) == 0)
 		return false;
 
 	id &= 0x7f;
-- 
2.45.2


