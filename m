Return-Path: <linux-renesas-soc+bounces-19604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EED47B0E092
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 17:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A66C56093E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 15:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B497278E47;
	Tue, 22 Jul 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dwmZNs8L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D1278768
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753198507; cv=none; b=Q8UX5GzU7nN8idVFNzazF4DB1LKNqwJ26kp9hCewYsdFVUUSN/rhQdl+fimV2E1/uSqtUJ3qsaAvsf7mjdmwXLfwJ90/usMRoSorPwFCyN3XmDfuhAgcuC7IWG+vK2nNmA0oN+RNoxaF0D8YcfZ3UIzjvYRWKwiZvHP2Be3UDl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753198507; c=relaxed/simple;
	bh=CXs1yx74+Lp+U1ZXwXE4iv6KTAZ3lZ/s4HaT4ZgvqTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+3iUD3BOKyO6RJgCmsW2iXTiAeg+IGz7hWc6YrLAKLF8HdITtHbgI7QBYUeRtyHYTmZGxZ7LXLsN565NrqKveaKTURXbsWbVMfOKnYokAiYK3Hx5V0lN9BaRKYDCiGVsjwQ+AnE35Qpq26Cq1UlOasQRbGw2PrU3awmYCrPQAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dwmZNs8L; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ckszbpq3/7g1ZYj8jHZ37hCD4FjkSO3vSWUJBQPvMS0=; b=dwmZNs
	8LQYqBtlAsmBNorR9TG2sJzQtJqvxTmjrz28vIiAp1hSRHQv5OfXwcEVv05jDQcW
	Dcs0O7s/Pjej+Ru0BK33elZMXA9PRVgotDXiSg1FYk1O/lyJzNqKiK2Ol9H0kmUp
	KEJN04xgWYqBcbWVPGDV2o1qTaWXe+SjjWTUxfCY40WDv7ObuyXGb9cI4oKMIQhf
	2SpfoPk6hBauUWXBWfrFDcvNPMYScOJtwtu3urW8WOuoejQ1IaR5ZAKoZxifkUgt
	ks7qFuiUl5sawaDqzbAJIDOwvD9Hujl6FDSN57+jO3Y35p2S128szC3FI0YdCHwz
	2AD7mgKwbnC9dnrg==
Received: (qmail 1374484 invoked from network); 22 Jul 2025 17:34:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 17:34:56 +0200
X-UD-Smtp-Session: l3s3148p1@0zaXVYY6mqggAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 2/4] i3c: Add more parameters for controllers to the header
Date: Tue, 22 Jul 2025 17:34:40 +0200
Message-ID: <20250722153445.5003-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
References: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Timing values from the specification and a subsystem wide default value
are added to be consumed by controller drivers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Change since v2:
* new patch

 include/linux/i3c/master.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 7b8e7f22f013..da6754bc254c 100644
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


