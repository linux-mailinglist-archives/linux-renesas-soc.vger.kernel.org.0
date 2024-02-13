Return-Path: <linux-renesas-soc+bounces-2728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1583D853E09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 23:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5ADC2938E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 22:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BE9627ED;
	Tue, 13 Feb 2024 22:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OS9fjj4Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A4627F1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 22:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861785; cv=none; b=bogYBXWJ3BZEeyTSDa2NhXo5tKTxK6pmwsAo8TUohrYuVbIpBHvLXmaaPnhBFYf7JBxLrgOQ/Ohc2wl+O6vBU9Y2aosv8zsLa6rVGcOpDvc+xmrLpzKpRm4G3kafW4g+CtOQce6eh4WMyKIfVw3Cd9lF1l61ijoKFZa1MJWe5Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861785; c=relaxed/simple;
	bh=9BkYvB+uMFeysje96+EWS5EYkFxP2C5VX5ZTt7WVJk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVA/uVBfKoNVq8ktnRElc/acltbi5//lUAVT3kIEXS4l8o9p6vYGONCKjLCZo09hKCPxdUUNrHIhHvZoYNfZSm9qDROGa9HN3lTBk2Ta23Z9HMdi2Vu8zLlYQeZBMvGP/MlR8x+SI4RXQVZP1Suatfce4DWxLDfSMkBCP5FbT0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OS9fjj4Z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4RGadmFK42r7+jXSlrZncVcHuT2aHeZYPed3MG7JgOs=; b=OS9fjj
	4ZZt3P08tRewexJkJjRCtY2el7kSiRedyWwnX0BdgUQucqacWQiy/DToLADzf4YQ
	RjBzjpaW9TO3lz9flsurlOuASgb1YfARdV33lmpSHO1fAZ8iVewHYs43EprpDLPL
	bruB4BsyWY9wy6F3ayRNWoV3hu2F+26g/uWvbzX0kxXtPhg2uvb4GiYnl3OGP44B
	y3wBEFYV6XnQHWWNzYKPzEKXm6qlWGb5tqpnRtndPnA3uoy/Uno664yGZCer+Pyf
	I+hHzqgDFtciCaf2b7heUpxMsryLb6RO06FZ63mcy1sEqQsC4lktk5D+hdYJGSIN
	v61Mib7k0K8v916w==
Received: (qmail 1211865 invoked from network); 13 Feb 2024 23:02:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2024 23:02:54 +0100
X-UD-Smtp-Session: l3s3148p1@FXBhjkoR5N8ujnsZ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] mfd: tmio: Update include files
Date: Tue, 13 Feb 2024 23:02:23 +0100
Message-ID: <20240213220221.2380-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove meanwhile unneeded includes, only add types.h for dma_addr_t.
Also, remove an obsolete forward declaration while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 include/linux/mfd/tmio.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index 4223315d2b2a..f71d4e507dcb 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -2,13 +2,8 @@
 #ifndef MFD_TMIO_H
 #define MFD_TMIO_H
 
-#include <linux/device.h>
-#include <linux/fb.h>
-#include <linux/io.h>
-#include <linux/jiffies.h>
-#include <linux/mmc/card.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
+#include <linux/types.h>
 
 /* tmio MMC platform flags */
 /*
@@ -59,8 +54,6 @@
 /* Some controllers have a CBSY bit */
 #define TMIO_MMC_HAVE_CBSY		BIT(11)
 
-struct dma_chan;
-
 /*
  * data for the MMC controller
  */
-- 
2.43.0


