Return-Path: <linux-renesas-soc+bounces-19614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA628B0E3E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 21:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA30A6C555B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 19:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5E027FD5B;
	Tue, 22 Jul 2025 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H3Yw1q8t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A78278E5A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753211285; cv=none; b=l9ceCi02uuhHWs3rSQfmaW23GFK8olhUj9owiXuqiQrB2/ZinZAeNxd63WQtXa6IOTP9l90Mvwqhw4cUvgHjci2F1N2GQD1iIv+nkzDrkjwMyC65oucMnsKuWyLFRW1wWrNDN43FwQbJevTiXzgg+INPR7esy39HP2Dg99kOJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753211285; c=relaxed/simple;
	bh=DLySnfSBf3BqI0nefr/s3Wpa2vX24rLJT4Tc1cOG+hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvHRzou7LljUZv1uVmf/R+F7sMlMZcCK/YPz9R49Z5GISh6ATS3TjGrf+CsjpUeFpCkyggGfwYLzM5GI7Z1oKRcFhH+umEWX5GfXWY/h2Ra831M9fgeB8BMZdloxSEfcySNhzx/sASrrNyCk2YEKc5guZbV0ON68RaB4YWJlxoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H3Yw1q8t; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=yLh6/Ha74QQyQnKXyPs9FdpH1ooGIVAq9G57csfFbtw=; b=H3Yw1q
	8t9LmzwtTLVqhZYbneiNv9okCAiuoxx9PX60U9q9jH3wNFQRhDsCEvu3+1WUoVZJ
	5ZoBiU3b10AhPbs8ocU1iliVEASk9F7GInmE9dj6E+XSgHnDvMuYL5VvJ9z/QMTY
	zK/3/EsRiRzSCudlMpytC57n3OlLDNn6MQzxcam3HnD23TJunT6bNqan32SDaU/Z
	y4CPEOxg9a2yH2cYuLOUVDVp6BtN4MFhhRa4fk0n9sYtPzyf2vO1HV8L7PD0Y7iz
	zWQzraqa0JeLtmPhdlA/Sgt6WKIAWkHkt8G6N2r9MjYneLmtr3apf5AmhZRiD9Us
	+NZ4p6IBRpeWL+Jw==
Received: (qmail 1427078 invoked from network); 22 Jul 2025 21:08:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:08:01 +0200
X-UD-Smtp-Session: l3s3148p1@gJWfT4k6jqIgAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v4 2/4] i3c: Add more parameters for controllers to the header
Date: Tue, 22 Jul 2025 21:07:44 +0200
Message-ID: <20250722190749.6264-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add standard timing value defination from specification.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v3:
* Reworded commit message

 include/linux/i3c/master.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 7dfcbe530515..8375bee69817 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -254,8 +254,15 @@ struct i3c_device {
 #define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
 #define I3C_BUS_I3C_SCL_MAX_RATE	12900000
 #define I3C_BUS_I3C_SCL_TYP_RATE	12500000
+#define I3C_BUS_TAVAL_MIN_NS		1000
+#define I3C_BUS_TBUF_MIXED_FM_MIN_NS	1300
+#define I3C_BUS_THIGH_MIXED_MAX_NS	41
+#define I3C_BUS_TIDLE_MIN_NS		200000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
 
+/* TODO: Document a reason for this value */
+#define I3C_BUS_XFER_TIMEOUT_TYP_JIF	(msecs_to_jiffies(1000))
+
 /**
  * enum i3c_bus_mode - I3C bus mode
  * @I3C_BUS_MODE_PURE: only I3C devices are connected to the bus. No limitation
-- 
2.47.2


