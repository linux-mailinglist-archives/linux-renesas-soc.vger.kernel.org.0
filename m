Return-Path: <linux-renesas-soc+bounces-33832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EvaZNK6QKWq4ZgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:28:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C666B778
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 18:28:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=Rk30WqNW;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B9A8309B1F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 16:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44ED33123F;
	Wed, 10 Jun 2026 16:20:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE9F29D291
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 16:20:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108419; cv=none; b=e8yw8Q0wW6gYKGHUDrTqbmYE/cPi/MlZ1lHVqzRsO7rYELSsQ42KflxaAJfpLHtCsMKTnAeqglAzH/rsecMUEFqB5gHcOLiUrBrSOvdIyuubHiw4awnTLVHxBHRRhbQ03c9f61O1hKMcQh8P31YLPkgE0YZNqFOuGg0fXbPVZSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108419; c=relaxed/simple;
	bh=4de+KiDoZxeYsyv6d0hNJLLBvag4Qjm6eaS5OtVl4NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LjOsLw8qhbx0iCRi8VMSaZUQaT6kbSSv0CJ5V3tV8mAe4W8XZJQ16dwRl0IQaqIMs+gjvIIXCWdulRkJXZrXXOzA0N0vHootAJT0TZrhR+sBNfY3LrRPJiAvTwHHw/q2CLBNnCxLBP/vDhv4Q5yEaIyZudvL1yMQ/Uda32+fBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rk30WqNW; arc=none smtp.client-ip=209.85.208.171
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39677aed4d3so62413111fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781108416; x=1781713216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JViN1TdFkoFUPkrP+DDyY0wa+ZxeG+1QqVsHzZDiXe0=;
        b=Rk30WqNWQ7AqR+AVDkEIFU3bRutvMeMfcEBMkaBZFBjWdKDmGEd/1EbabgxYppbHnP
         gB68pZQxSm5W2P8zI4Oj4fWo14aYEdZ8H3kAWFHunzFyHZcKfTOAbVz5CN3K9WEx6P6K
         ZAIQMq4j9rj5+9oWqFUr8J5NZGb2kG69Zv7xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108416; x=1781713216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JViN1TdFkoFUPkrP+DDyY0wa+ZxeG+1QqVsHzZDiXe0=;
        b=rcHSwWkesl9C18rP9thKHwJX6f0HSyzcdlAbi77PSmT0V9kA2rOvlF/Do+W92xHyWx
         M2rBNmgpDgRznIFqAJkwoWCL5pc8c07yMTk6tLdHf3LOxXHjmEPtscJtaHV9L8sm0IzY
         XLC5MZAEQbqEaBbfP83vrCTNlNf45X9ctj7/eladHdm28sx/8POsBXCbBFSYJfM+YTSF
         TlWORlD9ORh8w6DyoE5XHRFSsPEddmyLfG3VekLFq1/uWk1HDLp/xqiNq/nYUe8j8cPM
         RnSbd2HFReWBYipITM6Jx+9aoqhVNvLqNzRLn7eMLQ+UvB041pxKIrkRf8vJcs9ciq3p
         8oJw==
X-Forwarded-Encrypted: i=1; AFNElJ/9jm0Pfii4kbZLIKq7caThkYUJeUCwo4M7UF0a21uRqEqUA2kRC1mUNyxK2dkIiCsk84hY+BF8pgOp8CQrSlI9Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJh2O578TUHoYe6zkiHezvbeH4/4IfwvfF8iD05dL5IHBiMDbx
	1r6PSRKFFj3hByhagd+O5KFov6jPIlzuSRJDOwe1Lq9JUtZ88xZ2QouApCF6US1Uyg==
X-Gm-Gg: Acq92OH3LYlhyZhY+q+CVuDs8MsU7dXJUTSrDM+2064s87kT+eMZ7sUM7BVb0PwfJXO
	nrl+V9JcBBwSbIYxVrdgfjc7sRXH4kZEcwQxOxqOlo+2DYwlvXHHN5qM9KBWVxDqVOdZXxUv1Dr
	4CnfX+F5jmwletbUOySQeira8OiSSccxBZjvLnPX+18L3i6rcz5PJLaKpwBRz+EiCAqwodGL7Wy
	8KeqtdOJxnxgqcXm9deH1gbdU2ZDeaD3+L6Lg3iU3X7oO7FtdnPnsQGVrffwXl2tLbcljHjQ+BW
	RVvuCCi95xOp6Z1OoQI/ktPO0y7lZnTNck03WhVBWpxB6vW0AJfcKAuHqdatEC9YBHm9AraBZDk
	Y5DHxX3/JssfD/p3Hyw0e9Se29sGiw4Pfpms7C32mFAw00W4B3du5TpcDGJFYWBSwXTcQpK3II8
	l9yWIei5+vWABsnz3ZYcfcF5lciaxeWUy3CKdhmWsoUo5YvCUIF1Iv5XtBuKx1ozhLpxzaSimYo
	eDSPFYUUZKKdfFRYlX6m3THMGd0
X-Received: by 2002:a05:6512:3990:b0:5aa:6b56:77ea with SMTP id 2adb3069b0e04-5aa87b78a9bmr7547722e87.14.1781108415657;
        Wed, 10 Jun 2026 09:20:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ee219sm5608915e87.15.2026.06.10.09.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:20:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Jun 2026 16:20:06 +0000
Subject: [PATCH 1/3] media: ov9282: Remove unused kerneldoc description
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
In-Reply-To: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, 
 Tarang Raval <tarang.raval@siliconsignals.io>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33832-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:ribalda@chromium.org,m:stable@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,cisco,huawei,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F2C666B778

The field has been removed, but the kerneldoc not. Let's take care of
this.

This patch fixes the following warning:
Warning: drivers/media/i2c/ov9282.c:223 Excess struct member 'mutex'
description in 'ov9282'

Cc: stable@kernel.org
Fixes: 0c69a963a300 ("media: i2c: ov9282: Switch to using the sub-device state lock")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov9282.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 5b6f897a74fc..3ba630ec4f2a 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -197,7 +197,6 @@ struct ov9282_mode {
  * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
  * @cur_mode: Pointer to current selected sensor mode
  * @code: Mbus code currently selected
- * @mutex: Mutex for serializing sensor controls
  */
 struct ov9282 {
 	struct device *dev;

-- 
2.54.0.1099.g489fc7bff1-goog


