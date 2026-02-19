Return-Path: <linux-renesas-soc+bounces-28316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA3sE/MYl2nKugIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 15:06:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B04BB15F507
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 15:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D44B30156D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 14:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785FA33DEF7;
	Thu, 19 Feb 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcMDN2W9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C133A711;
	Thu, 19 Feb 2026 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509998; cv=none; b=aUJduGdIc29i8u3FfnEk9N4PnwPtwIctGBTSRLAHLS+BYSbgw3qTjO24EhVxGMr/mtgAgipS3qpPcLovvzf9XfimJlBxHSf+pfMK5okUD0+prXiFSvfOTkWmp0G2Du63qwz01V7b9fuyaMNNOalqVZJa52yaIlXNKYIxn8mhP+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509998; c=relaxed/simple;
	bh=IhI3L3rAWYl4pNKbiKS7sS+Pb5jF4gnLyZSTl98SmpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VAH+Yep3p9qzi+KpTfTyLDfEkRW0kSIGY+52ZNT9QU8tK1nvTkR5Y7Wt2kpGOpVDiLSFWYX0+74GX3buS6AeMnWcO4N5SfXjdQQe3dD7Lw5hRnHv/Tbh8nXnkZwOsREG1TyvwlH+cxRtq4MUkyUSgya4lWjqXYmYy3PA6W1mm0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcMDN2W9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771509995; x=1803045995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IhI3L3rAWYl4pNKbiKS7sS+Pb5jF4gnLyZSTl98SmpQ=;
  b=kcMDN2W9pr94KuedpELk5NBK+8QZOUyc+DxTEx6SLYa4xdnvAPpZEGDp
   SG94N3FoNehAMXrFrvL3LQmU5Fq7E9OC4+swajO/vSaPspzM2V/1EGVMJ
   EsLiYyu77sodafEnBDw3B+bQ3x4nW94nnb5MZ0SdtN55nsOXgeYcDLab0
   B9S1cjXDOnYpdJxt1E05d6AJVjBUimg6DRSLrBnbTINZBj/5Zm0mMbj2M
   TnhTwGO8YWGk25vxK/1+oeWvKrALYj468YHJII0XIfRDkDLNXTCktyQd5
   Ir5PTcYmzmvLFP06W7aAFAXODTWF6/LcR43y0lZUQyqi3hlGHc+zV5lOk
   Q==;
X-CSE-ConnectionGUID: sOb+qwSnRqW8KMQgc7l/DA==
X-CSE-MsgGUID: mjfBSSrXTPCzTz8lrjasdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="95212441"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="95212441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:06:17 -0800
X-CSE-ConnectionGUID: lqT8Vh8kQQOEufhfyOw52g==
X-CSE-MsgGUID: mLgUEBQ3QHmEaf0HUQLCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="218656746"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 06:06:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5F82795; Thu, 19 Feb 2026 15:05:33 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors when parsing properties
Date: Thu, 19 Feb 2026 15:05:32 +0100
Message-ID: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28316-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[carsten-spiess.de,roeck-us.net,glider.be,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: B04BB15F507
X-Rspamd-Action: no action

Instead of checking for the specific error codes (that can be considered
a layering violation to some extent) check for the property existence first
and then either parse it, or apply a default value.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwmon/isl28022.c | 42 +++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index c2e559dde63f..c69ff4a46525 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -337,21 +337,28 @@ DEFINE_SHOW_ATTRIBUTE(shunt_voltage);
  */
 static int isl28022_read_properties(struct device *dev, struct isl28022_data *data)
 {
+	const char *propname;
 	u32 val;
 	int err;
 
-	err = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
-	if (err == -EINVAL)
+	propname = "shunt-resistor-micro-ohms";
+	if (device_property_present(dev, propname)) {
+		err = device_property_read_u32(dev, propname, &val);
+		if (err)
+			return err;
+	} else {
 		val = 10000;
-	else if (err < 0)
-		return err;
+	}
 	data->shunt = val;
 
-	err = device_property_read_u32(dev, "renesas,shunt-range-microvolt", &val);
-	if (err == -EINVAL)
+	propname = "renesas,shunt-range-microvolt";
+	if (device_property_present(dev, propname)) {
+		err = device_property_read_u32(dev, propname, &val);
+		if (err)
+			return err;
+	} else {
 		val = 320000;
-	else if (err < 0)
-		return err;
+	}
 
 	switch (val) {
 	case 40000:
@@ -375,20 +382,19 @@ static int isl28022_read_properties(struct device *dev, struct isl28022_data *da
 			goto shunt_invalid;
 		break;
 	default:
-		return dev_err_probe(dev, -EINVAL,
-				     "renesas,shunt-range-microvolt invalid value %d\n",
-				     val);
+		return dev_err_probe(dev, -EINVAL, "%s invalid value %u\n", propname, val);
 	}
 
-	err = device_property_read_u32(dev, "renesas,average-samples", &val);
-	if (err == -EINVAL)
+	propname = "renesas,average-samples";
+	if (device_property_present(dev, propname)) {
+		err = device_property_read_u32(dev, propname, &val);
+		if (err)
+			return err;
+	} else {
 		val = 1;
-	else if (err < 0)
-		return err;
+	}
 	if (val > 128 || hweight32(val) != 1)
-		return dev_err_probe(dev, -EINVAL,
-				     "renesas,average-samples invalid value %d\n",
-				     val);
+		return dev_err_probe(dev, -EINVAL, "%s invalid value %u\n", propname, val);
 
 	data->average = val;
 
-- 
2.50.1


