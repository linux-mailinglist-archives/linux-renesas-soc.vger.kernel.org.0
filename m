Return-Path: <linux-renesas-soc+bounces-10616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C37AA9D3581
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54B99B21977
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 08:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B31155C87;
	Wed, 20 Nov 2024 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M139WiQr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0321171650
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091650; cv=none; b=ocHScluof0YPbMXt1T52B9DQNQBzDsJnsaAG3zCf1Mlmtqm/als6v9sWBrWFXVIsKJU7NHu76b0UvoE81jFnFlHlb+AL2iDsueqCBIVfjapd7dk8cSI09OWDAOBsk0O1xoqn/OZfbfd7PlIDlaCdMliltovSWT6p+6CZfZRE1DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091650; c=relaxed/simple;
	bh=GRDqG9yY6Z32OOYsdvevy8HmejjBUPykoAD8smWEtKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taengj+FEVjHNo6dhlB+/AH8KH8BXXYPU7HwBRTkEDQH5ZR9Fb4jigUcJtrNQok+V1mCY4qVl6igU4tVyHlljPMMbYMmxnzqYacObjIuyS5c3zELLtbLrYDEb5dsKT+zmguVvvbHzUBcVjafdCYVw6+sLC5LsvvYfvz7d4J4plI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M139WiQr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=BzKhmpSdjWou+wACtFt1L+9aYWsfG8g74XVaa5mSLyc=; b=M139Wi
	QrWASRnXh/ERotb2z4380COf1jGcx/LqmRsQy+/Or1RlST7DlX/wmls7eSkY+NU+
	o5HyRCHK32+RIQHyinBbjNYJJTztHAJGUoe1MkH19a2yFXTS9skJmuw2HzaSV/Wv
	22R24EwuYuhh70GSeuAzmuyyCRh6aMNGU1PX0kfxYApqX9r6TlFYF1sZnrin8ZXH
	PkXlWYze19RasiLjavNQZ9/D1UBVj3ZEg9uxsFHrR8sEqobuPlFfJ2TRd8zg8XTL
	1TwQIkvttMOFlcx+Yvf0xQur6apQv1FendmyoNwONZakcaD9diLh+tURcGAgQjfT
	7Zo7vKgj3r+kfkjA==
Received: (qmail 832297 invoked from network); 20 Nov 2024 09:34:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 09:34:04 +0100
X-UD-Smtp-Session: l3s3148p1@MlEtA1QnyLIgAwDPXxznANR4Jedc6XSv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/3] hwmon: (isl28022) document shunt voltage channel
Date: Wed, 20 Nov 2024 09:33:51 +0100
Message-ID: <20241120083349.22226-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
References: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the upstreaming process, the driver has been extended to report
the shunt voltage as well. Document that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/hwmon/isl28022.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/hwmon/isl28022.rst b/Documentation/hwmon/isl28022.rst
index a7920a884b9f..273ce5460135 100644
--- a/Documentation/hwmon/isl28022.rst
+++ b/Documentation/hwmon/isl28022.rst
@@ -48,6 +48,7 @@ The following attributes are supported. All attributes are read-only.
 
 ======================= =======================================================
 in0_input		bus voltage (milli Volt)
+in1_input		shunt voltage (milli Volt)
 
 curr1_input		current (milli Ampere)
 power1_input		power (micro Watt)
-- 
2.45.2


