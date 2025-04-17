Return-Path: <linux-renesas-soc+bounces-16126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9AA9226F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 18:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1327188B8C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 16:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44B1254B18;
	Thu, 17 Apr 2025 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6ojHJFO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092C8254865;
	Thu, 17 Apr 2025 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906442; cv=none; b=UZDf2n1zUayvLj2MHRxp1nHl5Oa+ElttsXFNIVjrwfUs2xMLKgZML+48fdi6tSKtdo8xGAXD5ro1gNJCZ6Yg1vome4m6f4NY0SoXCSI2j+NCY+Ky7Mxm9O8dPWYy16XIA+pqFy6ipdui2U3AkiiDA5Pqzy4Hl7qA8Y3RGZ0SABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906442; c=relaxed/simple;
	bh=YCzwwRBpU8uIRwG4lid25+7Je7mDkHsATgpmYDGnbRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IUe9SgQT5rVOSn9Qal65gcqbnTPubsU6r4uD1WtrqdxoDbLKes1vp+HUkzswxv5vtDdkBMfEnI344qMKMUzxGTeDmecWbhTUxszIkDqFMhLrukeFQQ5F5GEZKmV1nWhdVFJiNZkdyjx9lgxmnRNyVxqstuCpcGAiN5Qih+aDeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6ojHJFO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe574976so7845695e9.1;
        Thu, 17 Apr 2025 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906439; x=1745511239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+N9oL8Syh9HanktdiC8rZhaQzJdfC5gzurJT/+esEes=;
        b=l6ojHJFOgfAGysAD0IkjNKNqNUPCPNOqYWB03XXzllAn7yweCyW3ax/L/rn3HyTdoJ
         /S67uKrWPTBMBDUPzOVh2iXi05F88E1cDYPNMol1qpnq17MnZAF8DzhQ8j8WZGJ9m5Hk
         r3cr/N42bk/RwveHfo0NKY5sRF6eR5DhKeVfjD28VythJLZx2keEojb4JbqAYeSnfcOh
         T4fs//ii3ThnuIXMfcQqKHpVgELB7GTcXMAlHHSPEYumnsQne6nmHLDA52zrAyZBW9PF
         6u4lp3gOKYLvpJxwMqyqYJxDJez+3op/8W65LKP5vwGb9cEowM493eISzUkuCQ+yHcQS
         E7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906439; x=1745511239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+N9oL8Syh9HanktdiC8rZhaQzJdfC5gzurJT/+esEes=;
        b=up7GlFQkrzf0//BA8TsX6t8xJuB7pS9xlDpWoIGcZo3hz7r6xVV/Bd1PDXPqVjHZ8s
         U5tpqP1H2VLts215Plh90+CTqJM34fF1XN5DcwkAJK1gG5ITLro6pwwRU5Dep79Zp9Fv
         8U7z5/w7/Ujb204FLhjDN0uUJ6I1Mp+f92WDMKEIQEe7GdLzdtzEqQwAjXzMYfCGciVV
         UeNSs8zBsa09xBxSfu8vRRakH8D1TGBF2cfxM3itf68fsPCOyda4nNVAGeL6LJeiw5zQ
         mzW8F1JdM+Sdbkg0IFBWf8HCow0HiQdaeJys9Zs6+9+4gKeRb6hVBUyPQY11D4Kbb+do
         /8gw==
X-Forwarded-Encrypted: i=1; AJvYcCWIvD0uL4JfXDvR3HVGOcT/tH/jk3McpAByPFbIqCcq6DA+CLWJUpdyVvudR37NoSLQPw2z9XrSfzRSmmk=@vger.kernel.org, AJvYcCWrbvI3vi+mruoCBlWKZV3UwzPRSJ1S0XHPabdEbmrBzXXs4JMsgJqmouzeU6MxKuimc3IFJH6p@vger.kernel.org, AJvYcCXihnjW3ERnGhtdhaTHzH52EZkwHkkRA9zTqn+U9JwpBQuv4lZ0TBbOafho9wh9ckKDHafPdoXZW307LHlRwwq4p8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQToBnWDtdSuunSQ2jbsXQRXGC4DWp40NQp2BwlRNyXz9pvaz7
	cNaqd2ew6hR1haNzdtXGWmqN7nwtbt9Eb8rJYgVSIXIDdTvhhoRo
X-Gm-Gg: ASbGnctTTKP1fkXuslZPGzAzfyNe67MKxC8WTK1WW4ITMGOHCUI61sOIYnCX60LNxe+
	R8xgpc+HSpQPVxeWSgyJ0h1gLdhDIS7pATtJxrAcgxov/waqsjB1xng2oHdGTiW5g150j0mFnvk
	DC3R4TVoFwMCsyvRtqzGsmp0t8frUkFEVMh4WD+H5nM4+Yire6Gouhmv8I2vXgXkf5ajtxbLsRF
	4CMSm91LuunUt5OH4nIBSgQnv2XGFkmGP6tQNYkMs6PVIh+iX4lyAoGon7FnXptmIFsKd2VjLYO
	4bTtI2Ztm1y/hAplIH6zkUXGiGeXCbh4Awsg5FZy3A==
X-Google-Smtp-Source: AGHT+IEKjAUSYNJlTKtNz+WiLYSx9O1vajCtYdzh0IuzBc7i+kI+QT2MiyU85fir+3glkbBBr8zTEg==
X-Received: by 2002:a05:600c:1e8d:b0:43d:7413:cb3e with SMTP id 5b1f17b1804b1-44069f75556mr590055e9.1.1744906439014;
        Thu, 17 Apr 2025 09:13:59 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b58cc4csm61812485e9.25.2025.04.17.09.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:13:58 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] net: dsa: rzn1_a5psw: Make the read-only array offsets static const
Date: Thu, 17 Apr 2025 17:13:52 +0100
Message-ID: <20250417161353.490219-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array offsets on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: Fix commit message

---
 drivers/net/dsa/rzn1_a5psw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 31ea8130a495..df7466d4fe8f 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -337,8 +337,9 @@ static void a5psw_port_rx_block_set(struct a5psw *a5psw, int port, bool block)
 static void a5psw_flooding_set_resolution(struct a5psw *a5psw, int port,
 					  bool set)
 {
-	u8 offsets[] = {A5PSW_UCAST_DEF_MASK, A5PSW_BCAST_DEF_MASK,
-			A5PSW_MCAST_DEF_MASK};
+	static const u8 offsets[] = {
+		A5PSW_UCAST_DEF_MASK, A5PSW_BCAST_DEF_MASK, A5PSW_MCAST_DEF_MASK
+	};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(offsets); i++)
-- 
2.49.0


