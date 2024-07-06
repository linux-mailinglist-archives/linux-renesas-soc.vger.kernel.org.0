Return-Path: <linux-renesas-soc+bounces-7135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE192932A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2024 13:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 092B51C21617
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2024 11:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F2116B39A;
	Sat,  6 Jul 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ka0BtGaI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241BF1667F1
	for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Jul 2024 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264934; cv=none; b=eYKEsJK6ejTLmSufr87OFjQdbUQJfdE6AqKUSw3PbIq5y7T/kBOVc9UYsRXd77COebw1hnndhB4THHd6NEIauCA43XblIYRGoiCep2I8wO7Wgh3hdi9AJpfuFsETCyDLhJ/Fe2UlHhAD8gmNJ+HAikxLBafuNr6MP5MgBo+IIkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264934; c=relaxed/simple;
	bh=V8GzMYxUk0jHdZK4zpgyxLvV94uulnNsO+n9pA51jpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+i98IxN5we4COzA9gJdiileGAyvmnHFobkszNXKEaN8npsFbJQztqiXubMHuQ9IfeB7NmPbg6mjrrvsg/aJ5ZCMUn4FsrLmp7vJdKQ4aC+S1aXnbxRXZ6PY0TAN4HnwcEezY+Rkbfgn/AdtahQsER4d1k4TURieW3hg3x6hVPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ka0BtGaI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/P4DoAP5gYAxjEHPsExZWYzXzNikF5f0sRGxYHSLQ98=; b=ka0BtG
	aI9yT89bk8EFs1JvtMldAVVSg8CFFNBeR2UiwyHQHn9Bt+H1LSLmD2CmQr2rx3GJ
	InfW0SZ8Hb2a4kyVaQMmU/TflcKyPnuPpNDOrm3xqk1EGygZ7ENnSO05l6I5Ga2P
	gSbfPNP7tzt24Xr7gtDAxE+N+tf3qIW/9TDx9uo/yYuxBqTqUEpX2HjLhb3aV0cL
	7qMbD9X4KKY5anQs7k7Yb0zZaXUmR1eSgoEjnwyDh8Bib3VJmrVwY61ESI/eLE3m
	37iADGECWFPQkFi6SqvqxpZwQhfTlJR324WTAPtj0efDu9vylxvRg3+aCikzRTOj
	Bf5kdQGtfUS1ZSuQ==
Received: (qmail 3810807 invoked from network); 6 Jul 2024 13:21:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:53 +0200
X-UD-Smtp-Session: l3s3148p1@x9gSY5IcZMJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 44/60] i2c: rzv2m: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:44 +0200
Message-ID: <20240706112116.24543-45-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rzv2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index b0bfc96b9ede..8380a68538ab 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -321,8 +321,8 @@ static int rzv2m_i2c_stop_condition(struct rzv2m_i2c_priv *priv)
 				  100, jiffies_to_usecs(priv->adap.timeout));
 }
 
-static int rzv2m_i2c_master_xfer_msg(struct rzv2m_i2c_priv *priv,
-				  struct i2c_msg *msg, int stop)
+static int rzv2m_i2c_xfer_msg(struct rzv2m_i2c_priv *priv,
+			      struct i2c_msg *msg, int stop)
 {
 	unsigned int count = 0;
 	int ret, read = !!(msg->flags & I2C_M_RD);
@@ -351,8 +351,8 @@ static int rzv2m_i2c_master_xfer_msg(struct rzv2m_i2c_priv *priv,
 	return ret;
 }
 
-static int rzv2m_i2c_master_xfer(struct i2c_adapter *adap,
-				 struct i2c_msg *msgs, int num)
+static int rzv2m_i2c_xfer(struct i2c_adapter *adap,
+			  struct i2c_msg *msgs, int num)
 {
 	struct rzv2m_i2c_priv *priv = i2c_get_adapdata(adap);
 	struct device *dev = priv->adap.dev.parent;
@@ -370,7 +370,7 @@ static int rzv2m_i2c_master_xfer(struct i2c_adapter *adap,
 
 	/* I2C main transfer */
 	for (i = 0; i < num; i++) {
-		ret = rzv2m_i2c_master_xfer_msg(priv, &msgs[i], i == (num - 1));
+		ret = rzv2m_i2c_xfer_msg(priv, &msgs[i], i == (num - 1));
 		if (ret < 0)
 			goto out;
 	}
@@ -408,7 +408,7 @@ static const struct i2c_adapter_quirks rzv2m_i2c_quirks = {
 };
 
 static struct i2c_algorithm rzv2m_i2c_algo = {
-	.master_xfer = rzv2m_i2c_master_xfer,
+	.xfer = rzv2m_i2c_xfer,
 	.functionality = rzv2m_i2c_func,
 };
 
-- 
2.43.0


