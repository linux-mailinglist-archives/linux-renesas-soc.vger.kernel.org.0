Return-Path: <linux-renesas-soc+bounces-34978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0r1kHGbVT2rJowIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 19:07:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D551E733B31
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 19:07:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=MpbNZ1hw;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DE1830F928B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 17:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039BF4343F3;
	Thu,  9 Jul 2026 17:00:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490E432BC7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 17:00:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616428; cv=none; b=a4NDy9/NzjZRHp7/4R2EMAMnwBjIjg/wKvsGcN4hMP2BqWfEgsvQDBQrrQkrkgG9UuEW/IybnfxF3nIUSutOhc7c82G0Rk/aIzU6KvjuE3dtDepJPPXr2FFiMMDvVf2NQPOL0/zmp/RgpXNDpP+JhgrZYKJIhdTYoSQ/4UXFt8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616428; c=relaxed/simple;
	bh=kqa9rkKU8e1DAzlqj9RiWBWbDQNQtGCkxs+jZ7kjAzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eWFB497dUrKQFSHTa/v+Vc8oo3KslEYjNvucIGkBmT194XHmhJNtNr9Py4lcUYBzd5NdV99/qfsxDYSdTLev/n/sXuLP+YczEGckySTKEWhkTCo+lXtn0mHTs607y44rBAVVxWKCWP5gL64U1zxLN+sC9jKEcjzoZ7wDexgnwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MpbNZ1hw; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso169675e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 10:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616424; x=1784221224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qB7JHhpKAhyR9tE3RiMspCE+e3U1eYxkFferU7QzZME=;
        b=MpbNZ1hwDdtaPK3QFEwubzkR7XZWFW7AUDvbFxxjZaUt5Rgbm7ekhpBvA2y4aEPhL5
         51HBeMwzgZD5TF8HgwIYXOCdqHfjC20MqhGDvsqgzTR+WilJJkRIhQE1jYn9Ez2PF7dV
         BMBmFtHlHHSM01xfqZYCRnZpXmEDU7Tmv6+Dbd/yX+kjaqsRgrewzcmLhdYmhT87KZlQ
         5McSLbrdCvbSTXYgISfkbTHcREF8GyspQT0wrEwfXmcqIokSgZ20oqXaiyD+LFng62MT
         9XM0H1AgMxI/L3jpOQ+j+TI9l6FwuAQmhdSXzsKkApP73/P68ioFJN0DvnXZwP5rBTNT
         TkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616424; x=1784221224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qB7JHhpKAhyR9tE3RiMspCE+e3U1eYxkFferU7QzZME=;
        b=qWSZ2oxvBWasy16vZgU4Ce3KmZ5Yatb7I2/AtMOaNDEGR2t9ckFt8Ee9vr1wn9d+Ng
         cWGI555Zo08IOjMHDt/OPtNlsy0ri1RO2jXDnP2PuY0ivzg52kk1bK3hgkkFbBnzYXiK
         gcKTcz/mQJQ16YN2QCnE9IYsr3A9aCUDeCy/l4Y4CblKeWHXzNcam0hjpQXgJOuZjr/j
         n8LPx8yZq+j6dZM/dIcQWJX5YhH2PONUrQxRiztSRDWmlh+r66Ilie62LsFOXtSBWOkq
         6eOh4WdC6TtMmj7vw9gCRGE1r4jOzKbN0DPVOf+BezOvbziCMvVCMroJ3WRGUKMo/1om
         aN1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rql/T91NTQ+Od3rSfGNqVHgQgA3kCgB6ezDqnqeDfCPRuWEuVYUJXf3ezVLsNK4XqtT8GyF0mGdyYBRut/wUXNTMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyih1BQREkUmEqUhrQHhPZ5TpmPfupo5spHqtSB3RBZ0XrsnH7
	hpUHeT41UIxbrokPn5Yh2gQeu59u072qz2K7uXkf66msCiUso5oJ+IIw/OBEKa5QQD8=
X-Gm-Gg: AfdE7ckhS3yN4d+kcZsRkL0+Q23KgTTRF6o8Sl397UNkGjWojjqm+s5P8d9aoWXTwXb
	QJv7ZceYeofNiFvSQDZZcHvfxdHyecDjEakOkPWx89JdtlYk5IkI/06qqrWEWPiGpu4K9YUkmYH
	i1iBWvF9ISZUY60y1x7ftrBS9Vqja5MdIwCaazD4ieMrmZpwz5JPgse40D4hoknM5dXWPLfvxzx
	NqShmot0tInw8EEyNKZav/C+HBa0+swOCs+IVc8dbn07nw5MAnbAtCqmXh2vYKhTqF9wFRBeSAx
	wDz2PDycN5Scm27B64UFmOArZrAw6g1kY9hcWtT41eBuc5ASJVIv0lYgsLwoZwLXqe0xfA+YH5l
	gG+4graOZZFHv+S6MNqBF2NLY6QS3kJ3Bh/pOgLB9ozkshNeNttHUYl8DgKyAJAQTO1KCZm6Q2N
	s3RSX4EDcM8JMfdQBrQ5Yd+eoxwusZeUFhnDihJ5DLAs9kGKD5FG1lXMIW6dyDVw==
X-Received: by 2002:a05:600c:1385:b0:493:e7b8:fd3d with SMTP id 5b1f17b1804b1-493e7b8fd4fmr73460245e9.25.1783616423336;
        Thu, 09 Jul 2026 10:00:23 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6f3c42sm75468195e9.1.2026.07.09.10.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Andy Shevchenko <andy@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 13/23] mfd: Use named initializers for arrays of i2c_device_id
Date: Thu,  9 Jul 2026 18:58:32 +0200
Message-ID:  <244319440376f5f34b213c5df3ae3996dec5e732.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=39604; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=kqa9rkKU8e1DAzlqj9RiWBWbDQNQtGCkxs+jZ7kjAzQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NRIrQbBrDl1nMaMDzQduRBuWY7Js4j+EOD5 cAsy+64KTGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TUQAKCRCPgPtYfRL+ TkhKB/wJCeSM18M4oqy1i2maUTgyq8WWSWT20rKOOq1VcdmvBPc/2ySFbFnl1S9G7eRtrhrjXJZ S4eLTi0QrVYKj3GoYezBoLcIKFDYP6KFINjQrltkdKcheOrPoqhUclHDighdnJ3KA4Pald8rVcm QIyNSnsgGq4J72yqB54WT4cu0Z3fXH0Ri9+4ek9z/rhgxzNIX1WRhyExD50+w57G/di2muBh2O0 37ALa492CSVTde40RvWWw0gbwrtpOLVBl7+XtrCKKgG15FLIMi7kfvT3psiVfi5p4vPkpCprjjv apXtaUrlVNYAEXwDjU1iEC0f1nMXwVaQ5k9nUw3ZrfllE5eh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:michael.hennerich@analog.com,m:wens@kernel.org,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:support.opensource@diasemi.com,m:andy@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:cw00.choi@samsung.com,m:krzk@kernel.org,m:andre.draszik@linaro.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:samkay014@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-renesas-soc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-omap@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	TAGGED_FROM(0.00)[bounces-34978-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,samsung.com,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,foss.st.com,lists.linux.dev,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,cirrus.com:email,vger.kernel.org:from_smtp,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D551E733B31

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/88pm800.c            |  2 +-
 drivers/mfd/88pm805.c            |  2 +-
 drivers/mfd/88pm860x-core.c      |  2 +-
 drivers/mfd/aat2870-core.c       |  2 +-
 drivers/mfd/act8945a.c           |  2 +-
 drivers/mfd/adp5520.c            |  4 ++--
 drivers/mfd/arizona-i2c.c        | 12 ++++++------
 drivers/mfd/as3722.c             |  2 +-
 drivers/mfd/axp20x-i2c.c         | 22 +++++++++++-----------
 drivers/mfd/bcm590xx.c           |  4 ++--
 drivers/mfd/bd9571mwv.c          |  2 +-
 drivers/mfd/bq257xx.c            |  4 ++--
 drivers/mfd/cs40l50-i2c.c        |  2 +-
 drivers/mfd/da903x.c             |  4 ++--
 drivers/mfd/da9052-i2c.c         | 10 +++++-----
 drivers/mfd/da9055-i2c.c         |  2 +-
 drivers/mfd/da9062-core.c        |  4 ++--
 drivers/mfd/da9063-i2c.c         |  4 ++--
 drivers/mfd/da9150-core.c        |  2 +-
 drivers/mfd/intel_soc_pmic_crc.c |  2 +-
 drivers/mfd/lm3533-core.c        |  2 +-
 drivers/mfd/lp3943.c             |  2 +-
 drivers/mfd/lp873x.c             |  2 +-
 drivers/mfd/lp87565.c            |  2 +-
 drivers/mfd/lp8788.c             |  2 +-
 drivers/mfd/madera-i2c.c         | 18 +++++++++---------
 drivers/mfd/max14577.c           |  4 ++--
 drivers/mfd/max77541.c           |  4 ++--
 drivers/mfd/max77620.c           |  6 +++---
 drivers/mfd/max77693.c           |  2 +-
 drivers/mfd/max77759.c           |  2 +-
 drivers/mfd/max77843.c           |  2 +-
 drivers/mfd/max8907.c            |  2 +-
 drivers/mfd/max8925-i2c.c        |  2 +-
 drivers/mfd/max8997.c            |  4 ++--
 drivers/mfd/max8998.c            |  4 ++--
 drivers/mfd/menelaus.c           |  2 +-
 drivers/mfd/menf21bmc.c          |  2 +-
 drivers/mfd/palmas.c             |  8 ++++----
 drivers/mfd/pf1550.c             |  2 +-
 drivers/mfd/retu-mfd.c           |  4 ++--
 drivers/mfd/rsmu_i2c.c           | 14 +++++++-------
 drivers/mfd/rt5033.c             |  2 +-
 drivers/mfd/si476x-i2c.c         |  6 +++---
 drivers/mfd/sky81452.c           |  2 +-
 drivers/mfd/stmpe-i2c.c          | 16 ++++++++--------
 drivers/mfd/stw481x.c            |  2 +-
 drivers/mfd/tc3589x.c            | 14 +++++++-------
 drivers/mfd/ti-lmu.c             | 10 +++++-----
 drivers/mfd/tps6105x.c           |  4 ++--
 drivers/mfd/tps65010.c           | 10 +++++-----
 drivers/mfd/tps6507x.c           |  2 +-
 drivers/mfd/tps65086.c           |  2 +-
 drivers/mfd/tps65090.c           |  2 +-
 drivers/mfd/tps65217.c           |  2 +-
 drivers/mfd/tps65218.c           |  4 ++--
 drivers/mfd/tps6586x.c           |  2 +-
 drivers/mfd/tps65910.c           |  4 ++--
 drivers/mfd/tps65912-i2c.c       |  2 +-
 drivers/mfd/twl-core.c           | 22 +++++++++++-----------
 drivers/mfd/twl6040.c            |  4 ++--
 drivers/mfd/wm831x-i2c.c         | 14 +++++++-------
 drivers/mfd/wm8350-i2c.c         |  6 +++---
 drivers/mfd/wm8400-core.c        |  2 +-
 drivers/mfd/wm8994-core.c        |  8 ++++----
 65 files changed, 162 insertions(+), 162 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index e9941da58b18..74dc419402f9 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -116,7 +116,7 @@ enum {
 #define PM800_CHIP_GEN_ID_NUM	0x3
 
 static const struct i2c_device_id pm80x_id_table[] = {
-	{ "88PM800" },
+	{ .name = "88PM800" },
 	{} /* NULL terminated */
 };
 MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
diff --git a/drivers/mfd/88pm805.c b/drivers/mfd/88pm805.c
index f5d6663172ee..2eb3380a5207 100644
--- a/drivers/mfd/88pm805.c
+++ b/drivers/mfd/88pm805.c
@@ -30,7 +30,7 @@
 #include <linux/delay.h>
 
 static const struct i2c_device_id pm80x_id_table[] = {
-	{ "88PM805" },
+	{ .name = "88PM805" },
 	{} /* NULL terminated */
 };
 MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 77230fbe07be..1b201ad129c2 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -1232,7 +1232,7 @@ static int pm860x_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(pm860x_pm_ops, pm860x_suspend, pm860x_resume);
 
 static const struct i2c_device_id pm860x_id_table[] = {
-	{ "88PM860x" },
+	{ .name = "88PM860x" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pm860x_id_table);
diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 34d66ba9646a..43fbf9cb1713 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -437,7 +437,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
 				aat2870_i2c_resume);
 
 static const struct i2c_device_id aat2870_i2c_id_table[] = {
-	{ "aat2870" },
+	{ .name = "aat2870" },
 	{ }
 };
 
diff --git a/drivers/mfd/act8945a.c b/drivers/mfd/act8945a.c
index cafefb4451cb..bb1b4e4fb288 100644
--- a/drivers/mfd/act8945a.c
+++ b/drivers/mfd/act8945a.c
@@ -54,7 +54,7 @@ static int act8945a_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id act8945a_i2c_id[] = {
-	{ "act8945a" },
+	{ .name = "act8945a" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, act8945a_i2c_id);
diff --git a/drivers/mfd/adp5520.c b/drivers/mfd/adp5520.c
index bd6f4965ebc8..a4b58f431f92 100644
--- a/drivers/mfd/adp5520.c
+++ b/drivers/mfd/adp5520.c
@@ -329,8 +329,8 @@ static int adp5520_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(adp5520_pm, adp5520_suspend, adp5520_resume);
 
 static const struct i2c_device_id adp5520_id[] = {
-	{ "pmic-adp5520", ID_ADP5520 },
-	{ "pmic-adp5501", ID_ADP5501 },
+	{ .name = "pmic-adp5520", .driver_data = ID_ADP5520 },
+	{ .name = "pmic-adp5501", .driver_data = ID_ADP5501 },
 	{ }
 };
 
diff --git a/drivers/mfd/arizona-i2c.c b/drivers/mfd/arizona-i2c.c
index 10e76fc8f12e..1ea8a59948b6 100644
--- a/drivers/mfd/arizona-i2c.c
+++ b/drivers/mfd/arizona-i2c.c
@@ -85,12 +85,12 @@ static void arizona_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id arizona_i2c_id[] = {
-	{ "wm5102", WM5102 },
-	{ "wm5110", WM5110 },
-	{ "wm8280", WM8280 },
-	{ "wm8997", WM8997 },
-	{ "wm8998", WM8998 },
-	{ "wm1814", WM1814 },
+	{ .name = "wm5102", .driver_data = WM5102 },
+	{ .name = "wm5110", .driver_data = WM5110 },
+	{ .name = "wm8280", .driver_data = WM8280 },
+	{ .name = "wm8997", .driver_data = WM8997 },
+	{ .name = "wm8998", .driver_data = WM8998 },
+	{ .name = "wm1814", .driver_data = WM1814 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, arizona_i2c_id);
diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
index 7ab6fcc9c27c..2f58709ffd9a 100644
--- a/drivers/mfd/as3722.c
+++ b/drivers/mfd/as3722.c
@@ -432,7 +432,7 @@ static const struct of_device_id as3722_of_match[] = {
 MODULE_DEVICE_TABLE(of, as3722_of_match);
 
 static const struct i2c_device_id as3722_i2c_id[] = {
-	{ "as3722" },
+	{ .name = "as3722" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, as3722_i2c_id);
diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..2f595e2b883c 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -76,17 +76,17 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp717" },
-	{ "axp803" },
-	{ "axp806" },
-	{ "axp15060" },
+	{ .name = "axp152" },
+	{ .name = "axp192" },
+	{ .name = "axp202" },
+	{ .name = "axp209" },
+	{ .name = "axp221" },
+	{ .name = "axp223" },
+	{ .name = "axp313a" },
+	{ .name = "axp717" },
+	{ .name = "axp803" },
+	{ .name = "axp806" },
+	{ .name = "axp15060" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 5a8456bbd63f..85a906b54541 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -160,8 +160,8 @@ static const struct of_device_id bcm590xx_of_match[] = {
 MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
 
 static const struct i2c_device_id bcm590xx_i2c_id[] = {
-	{ "bcm59054" },
-	{ "bcm59056" },
+	{ .name = "bcm59054" },
+	{ .name = "bcm59056" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bcm590xx_i2c_id);
diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index db8c2963fb48..2b6fe6fd9806 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -268,7 +268,7 @@ static const struct of_device_id bd9571mwv_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, bd9571mwv_of_match_table);
 
 static const struct i2c_device_id bd9571mwv_id_table[] = {
-	{ "bd9571mwv" },
+	{ .name = "bd9571mwv" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, bd9571mwv_id_table);
diff --git a/drivers/mfd/bq257xx.c b/drivers/mfd/bq257xx.c
index 054342c60b73..8ad9f0ad6512 100644
--- a/drivers/mfd/bq257xx.c
+++ b/drivers/mfd/bq257xx.c
@@ -119,8 +119,8 @@ static int bq257xx_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bq257xx_i2c_ids[] = {
-	{ "bq25703a", BQ25703A },
-	{ "bq25792", BQ25792 },
+	{ .name = "bq25703a", .driver_data = BQ25703A },
+	{ .name = "bq25792", .driver_data = BQ25792 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, bq257xx_i2c_ids);
diff --git a/drivers/mfd/cs40l50-i2c.c b/drivers/mfd/cs40l50-i2c.c
index 639be743d956..6043eb6639b5 100644
--- a/drivers/mfd/cs40l50-i2c.c
+++ b/drivers/mfd/cs40l50-i2c.c
@@ -40,7 +40,7 @@ static void cs40l50_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id cs40l50_id_i2c[] = {
-	{ "cs40l50" },
+	{ .name = "cs40l50" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, cs40l50_id_i2c);
diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
index e86b39de3303..c949ebc57b18 100644
--- a/drivers/mfd/da903x.c
+++ b/drivers/mfd/da903x.c
@@ -439,8 +439,8 @@ static const struct da903x_chip_ops da903x_ops[] = {
 };
 
 static const struct i2c_device_id da903x_id_table[] = {
-	{ "da9030", 0 },
-	{ "da9034", 1 },
+	{ .name = "da9030", .driver_data = 0 },
+	{ .name = "da9034", .driver_data = 1 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, da903x_id_table);
diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
index fd000a21bcba..b75cfe805d5e 100644
--- a/drivers/mfd/da9052-i2c.c
+++ b/drivers/mfd/da9052-i2c.c
@@ -103,11 +103,11 @@ static int da9052_i2c_disable_multiwrite(struct da9052 *da9052)
 }
 
 static const struct i2c_device_id da9052_i2c_id[] = {
-	{"da9052", DA9052},
-	{"da9053-aa", DA9053_AA},
-	{"da9053-ba", DA9053_BA},
-	{"da9053-bb", DA9053_BB},
-	{"da9053-bc", DA9053_BC},
+	{ .name = "da9052", .driver_data = DA9052 },
+	{ .name = "da9053-aa", .driver_data = DA9053_AA },
+	{ .name = "da9053-ba", .driver_data = DA9053_BA },
+	{ .name = "da9053-bb", .driver_data = DA9053_BB },
+	{ .name = "da9053-bc", .driver_data = DA9053_BC },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, da9052_i2c_id);
diff --git a/drivers/mfd/da9055-i2c.c b/drivers/mfd/da9055-i2c.c
index 6c1981832aaf..e85db66f79a1 100644
--- a/drivers/mfd/da9055-i2c.c
+++ b/drivers/mfd/da9055-i2c.c
@@ -54,7 +54,7 @@ static void da9055_i2c_remove(struct i2c_client *i2c)
  * and CODEC, which must be different to operate together.
  */
 static const struct i2c_device_id da9055_i2c_id[] = {
-	{ "da9055-pmic" },
+	{ .name = "da9055-pmic" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9055_i2c_id);
diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 637c5f47a4b0..a90723d33ad9 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -711,8 +711,8 @@ static const struct of_device_id da9062_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, da9062_dt_ids);
 
 static const struct i2c_device_id da9062_i2c_id[] = {
-	{ "da9061", COMPAT_TYPE_DA9061 },
-	{ "da9062", COMPAT_TYPE_DA9062 },
+	{ .name = "da9061", .driver_data = COMPAT_TYPE_DA9061 },
+	{ .name = "da9062", .driver_data = COMPAT_TYPE_DA9062 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9062_i2c_id);
diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index a803b7440f09..b57a6ee90aa9 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -476,8 +476,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id da9063_i2c_id[] = {
-	{ "da9063", PMIC_TYPE_DA9063 },
-	{ "da9063l", PMIC_TYPE_DA9063L },
+	{ .name = "da9063", .driver_data = PMIC_TYPE_DA9063 },
+	{ .name = "da9063l", .driver_data = PMIC_TYPE_DA9063L },
 	{},
 };
 MODULE_DEVICE_TABLE(i2c, da9063_i2c_id);
diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 5c59cc869fb3..ab2335b73a63 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -494,7 +494,7 @@ static void da9150_shutdown(struct i2c_client *client)
 }
 
 static const struct i2c_device_id da9150_i2c_id[] = {
-	{ "da9150", },
+	{ .name = "da9150" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9150_i2c_id);
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index d3db727c08de..c1c02700ef08 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -258,7 +258,7 @@ static const struct acpi_device_id crystal_cove_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
 
 static const struct i2c_device_id crystal_cove_i2c_match[] = {
-	{ "intel_soc_pmic_crc" },
+	{ .name = "intel_soc_pmic_crc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, crystal_cove_i2c_match);
diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 0a2409d00b2e..1602d96987c5 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -604,7 +604,7 @@ static void lm3533_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id lm3533_i2c_ids[] = {
-	{ "lm3533" },
+	{ .name = "lm3533" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
diff --git a/drivers/mfd/lp3943.c b/drivers/mfd/lp3943.c
index 6764553147e4..503615a8d420 100644
--- a/drivers/mfd/lp3943.c
+++ b/drivers/mfd/lp3943.c
@@ -126,7 +126,7 @@ static int lp3943_probe(struct i2c_client *cl)
 }
 
 static const struct i2c_device_id lp3943_ids[] = {
-	{ "lp3943" },
+	{ .name = "lp3943" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp3943_ids);
diff --git a/drivers/mfd/lp873x.c b/drivers/mfd/lp873x.c
index d2c90302bf59..46444696f2f4 100644
--- a/drivers/mfd/lp873x.c
+++ b/drivers/mfd/lp873x.c
@@ -67,7 +67,7 @@ static const struct of_device_id of_lp873x_match_table[] = {
 MODULE_DEVICE_TABLE(of, of_lp873x_match_table);
 
 static const struct i2c_device_id lp873x_id_table[] = {
-	{ "lp873x" },
+	{ .name = "lp873x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp873x_id_table);
diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index efea1ba82811..14e80588efac 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -108,7 +108,7 @@ static void lp87565_shutdown(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp87565_id_table[] = {
-	{ "lp87565-q1" },
+	{ .name = "lp87565-q1" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp87565_id_table);
diff --git a/drivers/mfd/lp8788.c b/drivers/mfd/lp8788.c
index 32f255378f5a..48fe99a2b982 100644
--- a/drivers/mfd/lp8788.c
+++ b/drivers/mfd/lp8788.c
@@ -216,7 +216,7 @@ static void lp8788_remove(struct i2c_client *cl)
 }
 
 static const struct i2c_device_id lp8788_ids[] = {
-	{ "lp8788" },
+	{ .name = "lp8788" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8788_ids);
diff --git a/drivers/mfd/madera-i2c.c b/drivers/mfd/madera-i2c.c
index 0986e4a99f4a..762f668ed20c 100644
--- a/drivers/mfd/madera-i2c.c
+++ b/drivers/mfd/madera-i2c.c
@@ -112,15 +112,15 @@ static void madera_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id madera_i2c_id[] = {
-	{ "cs47l15", CS47L15 },
-	{ "cs47l35", CS47L35 },
-	{ "cs47l85", CS47L85 },
-	{ "cs47l90", CS47L90 },
-	{ "cs47l91", CS47L91 },
-	{ "cs42l92", CS42L92 },
-	{ "cs47l92", CS47L92 },
-	{ "cs47l93", CS47L93 },
-	{ "wm1840", WM1840 },
+	{ .name = "cs47l15", .driver_data = CS47L15 },
+	{ .name = "cs47l35", .driver_data = CS47L35 },
+	{ .name = "cs47l85", .driver_data = CS47L85 },
+	{ .name = "cs47l90", .driver_data = CS47L90 },
+	{ .name = "cs47l91", .driver_data = CS47L91 },
+	{ .name = "cs42l92", .driver_data = CS42L92 },
+	{ .name = "cs47l92", .driver_data = CS47L92 },
+	{ .name = "cs47l93", .driver_data = CS47L93 },
+	{ .name = "wm1840", .driver_data = WM1840 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, madera_i2c_id);
diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index da275a04a1ef..f3325d015ec6 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -463,8 +463,8 @@ static void max14577_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max14577_i2c_id[] = {
-	{ "max14577", MAXIM_DEVICE_TYPE_MAX14577, },
-	{ "max77836", MAXIM_DEVICE_TYPE_MAX77836, },
+	{ .name = "max14577", .driver_data = MAXIM_DEVICE_TYPE_MAX14577 },
+	{ .name = "max77836", .driver_data = MAXIM_DEVICE_TYPE_MAX77836 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max14577_i2c_id);
diff --git a/drivers/mfd/max77541.c b/drivers/mfd/max77541.c
index f91b4f5373ce..5f5b2ff181d3 100644
--- a/drivers/mfd/max77541.c
+++ b/drivers/mfd/max77541.c
@@ -199,8 +199,8 @@ static const struct of_device_id max77541_of_id[] = {
 MODULE_DEVICE_TABLE(of, max77541_of_id);
 
 static const struct i2c_device_id max77541_id[] = {
-	{ "max77540", MAX77540 },
-	{ "max77541", MAX77541 },
+	{ .name = "max77540", .driver_data = MAX77540 },
+	{ .name = "max77541", .driver_data = MAX77541 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max77541_id);
diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index c4f89a9681f3..a66ca73997f5 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -694,9 +694,9 @@ static int max77620_i2c_resume(struct device *dev)
 }
 
 static const struct i2c_device_id max77620_id[] = {
-	{"max77620", MAX77620},
-	{"max20024", MAX20024},
-	{"max77663", MAX77663},
+	{ .name = "max77620", .driver_data = MAX77620 },
+	{ .name = "max20024", .driver_data = MAX20024 },
+	{ .name = "max77663", .driver_data = MAX77663 },
 	{},
 };
 
diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 1c485a4c3dcf..411011afde37 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -306,7 +306,7 @@ static void max77693_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max77693_i2c_id[] = {
-	{ "max77693", TYPE_MAX77693 },
+	{ .name = "max77693", .driver_data = TYPE_MAX77693 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max77693_i2c_id);
diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 72b608a1ab3f..2347eb0b014b 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -712,7 +712,7 @@ static int max77759_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max77759_i2c_id[] = {
-	{ "max77759" },
+	{ .name = "max77759" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max77759_i2c_id);
diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 2a48577b1a79..9e535ff1e3f7 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -169,7 +169,7 @@ static const struct of_device_id max77843_dt_match[] = {
 };
 
 static const struct i2c_device_id max77843_id[] = {
-	{ "max77843", TYPE_MAX77843, },
+	{ .name = "max77843", .driver_data = TYPE_MAX77843 },
 	{ },
 };
 
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 7bac1d651771..70ffc08a96d1 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -300,7 +300,7 @@ MODULE_DEVICE_TABLE(of, max8907_of_match);
 #endif
 
 static const struct i2c_device_id max8907_i2c_id[] = {
-	{ "max8907" },
+	{ .name = "max8907" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, max8907_i2c_id);
diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
index ab19ff0c7867..25390d0eabd4 100644
--- a/drivers/mfd/max8925-i2c.c
+++ b/drivers/mfd/max8925-i2c.c
@@ -127,7 +127,7 @@ EXPORT_SYMBOL(max8925_set_bits);
 
 
 static const struct i2c_device_id max8925_id_table[] = {
-	{ "max8925" },
+	{ .name = "max8925" },
 	{ }
 };
 
diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 7ba8ed1dfde3..6edc18e0eebb 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -229,8 +229,8 @@ static int max8997_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max8997_i2c_id[] = {
-	{ "max8997", TYPE_MAX8997 },
-	{ "max8966", TYPE_MAX8966 },
+	{ .name = "max8997", .driver_data = TYPE_MAX8997 },
+	{ .name = "max8966", .driver_data = TYPE_MAX8966 },
 	{ }
 };
 
diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index eb13bbaeda55..e93a5ffc9612 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -223,8 +223,8 @@ static int max8998_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max8998_i2c_id[] = {
-	{ "max8998", TYPE_MAX8998 },
-	{ "lp3974", TYPE_LP3974},
+	{ .name = "max8998", .driver_data = TYPE_MAX8998 },
+	{ .name = "lp3974", .driver_data = TYPE_LP3974 },
 	{ }
 };
 
diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
index a125d40fa121..22da12dbab8b 100644
--- a/drivers/mfd/menelaus.c
+++ b/drivers/mfd/menelaus.c
@@ -1230,7 +1230,7 @@ static void menelaus_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id menelaus_id[] = {
-	{ "menelaus" },
+	{ .name = "menelaus" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, menelaus_id);
diff --git a/drivers/mfd/menf21bmc.c b/drivers/mfd/menf21bmc.c
index 0f24de516d72..b2577f9e1e04 100644
--- a/drivers/mfd/menf21bmc.c
+++ b/drivers/mfd/menf21bmc.c
@@ -101,7 +101,7 @@ menf21bmc_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id menf21bmc_id_table[] = {
-	{ "menf21bmc" },
+	{ .name = "menf21bmc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, menf21bmc_id_table);
diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index 7fc886f4f80e..26faecab1af3 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -699,10 +699,10 @@ static const struct of_device_id of_palmas_match_tbl[] = {
 MODULE_DEVICE_TABLE(of, of_palmas_match_tbl);
 
 static const struct i2c_device_id palmas_i2c_id[] = {
-	{ "palmas", (kernel_ulong_t)&palmas_data },
-	{ "twl6035", (kernel_ulong_t)&palmas_data },
-	{ "twl6037", (kernel_ulong_t)&palmas_data },
-	{ "tps65913", (kernel_ulong_t)&palmas_data },
+	{ .name = "palmas", .driver_data = (kernel_ulong_t)&palmas_data },
+	{ .name = "twl6035", .driver_data = (kernel_ulong_t)&palmas_data },
+	{ .name = "twl6037", .driver_data = (kernel_ulong_t)&palmas_data },
+	{ .name = "tps65913", .driver_data = (kernel_ulong_t)&palmas_data },
 	{ /* end */ }
 };
 MODULE_DEVICE_TABLE(i2c, palmas_i2c_id);
diff --git a/drivers/mfd/pf1550.c b/drivers/mfd/pf1550.c
index c4f567c05564..7c3348ad59dc 100644
--- a/drivers/mfd/pf1550.c
+++ b/drivers/mfd/pf1550.c
@@ -340,7 +340,7 @@ static int pf1550_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_pm, pf1550_suspend, pf1550_resume);
 
 static const struct i2c_device_id pf1550_i2c_id[] = {
-	{ "pf1550" },
+	{ .name = "pf1550" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pf1550_i2c_id);
diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index 1d43458b4938..330366224e80 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -300,8 +300,8 @@ static void retu_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id retu_id[] = {
-	{ "retu" },
-	{ "tahvo" },
+	{ .name = "retu" },
+	{ .name = "tahvo" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, retu_id);
diff --git a/drivers/mfd/rsmu_i2c.c b/drivers/mfd/rsmu_i2c.c
index c57795ed20f4..d05aaf576a86 100644
--- a/drivers/mfd/rsmu_i2c.c
+++ b/drivers/mfd/rsmu_i2c.c
@@ -328,13 +328,13 @@ static void rsmu_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rsmu_i2c_id[] = {
-	{ "8a34000",  RSMU_CM },
-	{ "8a34001",  RSMU_CM },
-	{ "8a34002",  RSMU_CM },
-	{ "82p33810", RSMU_SABRE },
-	{ "82p33811", RSMU_SABRE },
-	{ "8v19n850", RSMU_SL },
-	{ "8v19n851", RSMU_SL },
+	{ .name = "8a34000",  .driver_data = RSMU_CM },
+	{ .name = "8a34001",  .driver_data = RSMU_CM },
+	{ .name = "8a34002",  .driver_data = RSMU_CM },
+	{ .name = "82p33810", .driver_data = RSMU_SABRE },
+	{ .name = "82p33811", .driver_data = RSMU_SABRE },
+	{ .name = "8v19n850", .driver_data = RSMU_SL },
+	{ .name = "8v19n851", .driver_data = RSMU_SL },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, rsmu_i2c_id);
diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
index 072fd4447245..799661fb1c72 100644
--- a/drivers/mfd/rt5033.c
+++ b/drivers/mfd/rt5033.c
@@ -107,7 +107,7 @@ static int rt5033_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id rt5033_i2c_id[] = {
-	{ "rt5033", },
+	{ .name = "rt5033" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5033_i2c_id);
diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 55700ce711f4..f25a4b60071b 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -841,9 +841,9 @@ static void si476x_core_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id si476x_id[] = {
-	{ "si4761", SI476X_CHIP_SI4761 },
-	{ "si4764", SI476X_CHIP_SI4764 },
-	{ "si4768", SI476X_CHIP_SI4768 },
+	{ .name = "si4761", .driver_data = SI476X_CHIP_SI4761 },
+	{ .name = "si4764", .driver_data = SI476X_CHIP_SI4764 },
+	{ .name = "si4768", .driver_data = SI476X_CHIP_SI4768 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, si476x_id);
diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c
index 771b62a5c70f..8a213176b7cd 100644
--- a/drivers/mfd/sky81452.c
+++ b/drivers/mfd/sky81452.c
@@ -59,7 +59,7 @@ static int sky81452_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sky81452_ids[] = {
-	{ "sky81452" },
+	{ .name = "sky81452" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sky81452_ids);
diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index 943fa363efc3..8eee780afa16 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -100,14 +100,14 @@ static void stmpe_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id stmpe_i2c_id[] = {
-	{ "stmpe610", STMPE610 },
-	{ "stmpe801", STMPE801 },
-	{ "stmpe811", STMPE811 },
-	{ "stmpe1600", STMPE1600 },
-	{ "stmpe1601", STMPE1601 },
-	{ "stmpe1801", STMPE1801 },
-	{ "stmpe2401", STMPE2401 },
-	{ "stmpe2403", STMPE2403 },
+	{ .name = "stmpe610", .driver_data = STMPE610 },
+	{ .name = "stmpe801", .driver_data = STMPE801 },
+	{ .name = "stmpe811", .driver_data = STMPE811 },
+	{ .name = "stmpe1600", .driver_data = STMPE1600 },
+	{ .name = "stmpe1601", .driver_data = STMPE1601 },
+	{ .name = "stmpe1801", .driver_data = STMPE1801 },
+	{ .name = "stmpe2401", .driver_data = STMPE2401 },
+	{ .name = "stmpe2403", .driver_data = STMPE2403 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, stmpe_i2c_id);
diff --git a/drivers/mfd/stw481x.c b/drivers/mfd/stw481x.c
index 5ed64d53c23d..da1e293d36e9 100644
--- a/drivers/mfd/stw481x.c
+++ b/drivers/mfd/stw481x.c
@@ -222,7 +222,7 @@ static int stw481x_probe(struct i2c_client *client)
  * the structure of the I2C core.
  */
 static const struct i2c_device_id stw481x_id[] = {
-	{ "stw481x" },
+	{ .name = "stw481x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, stw481x_id);
diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 2d4eb771e230..f812e7551f09 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -466,13 +466,13 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tc3589x_dev_pm_ops,
 				tc3589x_suspend, tc3589x_resume);
 
 static const struct i2c_device_id tc3589x_id[] = {
-	{ "tc35890", TC3589X_TC35890 },
-	{ "tc35892", TC3589X_TC35892 },
-	{ "tc35893", TC3589X_TC35893 },
-	{ "tc35894", TC3589X_TC35894 },
-	{ "tc35895", TC3589X_TC35895 },
-	{ "tc35896", TC3589X_TC35896 },
-	{ "tc3589x", TC3589X_UNKNOWN },
+	{ .name = "tc35890", .driver_data = TC3589X_TC35890 },
+	{ .name = "tc35892", .driver_data = TC3589X_TC35892 },
+	{ .name = "tc35893", .driver_data = TC3589X_TC35893 },
+	{ .name = "tc35894", .driver_data = TC3589X_TC35894 },
+	{ .name = "tc35895", .driver_data = TC3589X_TC35895 },
+	{ .name = "tc35896", .driver_data = TC3589X_TC35896 },
+	{ .name = "tc3589x", .driver_data = TC3589X_UNKNOWN },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tc3589x_id);
diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
index cfc9f88b9842..5d22830b010f 100644
--- a/drivers/mfd/ti-lmu.c
+++ b/drivers/mfd/ti-lmu.c
@@ -206,11 +206,11 @@ static const struct of_device_id ti_lmu_of_match[] = {
 MODULE_DEVICE_TABLE(of, ti_lmu_of_match);
 
 static const struct i2c_device_id ti_lmu_ids[] = {
-	{ "lm3631", LM3631 },
-	{ "lm3632", LM3632 },
-	{ "lm3633", LM3633 },
-	{ "lm3695", LM3695 },
-	{ "lm36274", LM36274 },
+	{ .name = "lm3631", .driver_data = LM3631 },
+	{ .name = "lm3632", .driver_data = LM3632 },
+	{ .name = "lm3633", .driver_data = LM3633 },
+	{ .name = "lm3695", .driver_data = LM3695 },
+	{ .name = "lm36274", .driver_data = LM36274 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ti_lmu_ids);
diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index e2f6858d101e..94f5b1a6a923 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -191,8 +191,8 @@ static void tps6105x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps6105x_id[] = {
-	{ "tps61050" },
-	{ "tps61052" },
+	{ .name = "tps61050" },
+	{ .name = "tps61052" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tps6105x_id);
diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
index 8a144ec52201..4d428b82def9 100644
--- a/drivers/mfd/tps65010.c
+++ b/drivers/mfd/tps65010.c
@@ -649,11 +649,11 @@ static int tps65010_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps65010_id[] = {
-	{ "tps65010", TPS65010 },
-	{ "tps65011", TPS65011 },
-	{ "tps65012", TPS65012 },
-	{ "tps65013", TPS65013 },
-	{ "tps65014", TPS65011 },	/* tps65011 charging at 6.5V max */
+	{ .name = "tps65010", .driver_data = TPS65010 },
+	{ .name = "tps65011", .driver_data = TPS65011 },
+	{ .name = "tps65012", .driver_data = TPS65012 },
+	{ .name = "tps65013", .driver_data = TPS65013 },
+	{ .name = "tps65014", .driver_data = TPS65011 },	/* tps65011 charging at 6.5V max */
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tps65010_id);
diff --git a/drivers/mfd/tps6507x.c b/drivers/mfd/tps6507x.c
index 9865512dc7cc..ed806754d89f 100644
--- a/drivers/mfd/tps6507x.c
+++ b/drivers/mfd/tps6507x.c
@@ -103,7 +103,7 @@ static int tps6507x_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tps6507x_i2c_id[] = {
-	{ "tps6507x" },
+	{ .name = "tps6507x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tps6507x_i2c_id);
diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
index 54832e9321b9..a73e0b5c0982 100644
--- a/drivers/mfd/tps65086.c
+++ b/drivers/mfd/tps65086.c
@@ -127,7 +127,7 @@ static void tps65086_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps65086_id_table[] = {
-	{ "tps65086" },
+	{ .name = "tps65086" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, tps65086_id_table);
diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index 24f42175a9b4..ae845be3a8ea 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -225,7 +225,7 @@ static int tps65090_i2c_probe(struct i2c_client *client)
 
 
 static const struct i2c_device_id tps65090_id_table[] = {
-	{ "tps65090" },
+	{ .name = "tps65090" },
 	{ }
 };
 
diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
index c240fac0ede7..cef5cefafea3 100644
--- a/drivers/mfd/tps65217.c
+++ b/drivers/mfd/tps65217.c
@@ -390,7 +390,7 @@ static void tps65217_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps65217_id_table[] = {
-	{"tps65217", TPS65217},
+	{ .name = "tps65217", .driver_data = TPS65217 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, tps65217_id_table);
diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
index 4f3e632f726f..d2d39bd7eddd 100644
--- a/drivers/mfd/tps65218.c
+++ b/drivers/mfd/tps65218.c
@@ -336,8 +336,8 @@ static int tps65218_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps65218_id_table[] = {
-	{ "tps65218", TPS65218 },
-	{ },
+	{ .name = "tps65218", .driver_data = TPS65218 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tps65218_id_table);
 
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f5f805446603..6fa932cda025 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -642,7 +642,7 @@ static SIMPLE_DEV_PM_OPS(tps6586x_pm_ops, tps6586x_i2c_suspend,
 			 tps6586x_i2c_resume);
 
 static const struct i2c_device_id tps6586x_id_table[] = {
-	{ "tps6586x" },
+	{ .name = "tps6586x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tps6586x_id_table);
diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 6243b66b1b6f..b0dbee3e6ea2 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -532,8 +532,8 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tps65910_i2c_id[] = {
-       { "tps65910", TPS65910 },
-       { "tps65911", TPS65911 },
+       { .name = "tps65910", .driver_data = TPS65910 },
+       { .name = "tps65911", .driver_data = TPS65911 },
        { }
 };
 
diff --git a/drivers/mfd/tps65912-i2c.c b/drivers/mfd/tps65912-i2c.c
index 138e50497b51..3eca8880532e 100644
--- a/drivers/mfd/tps65912-i2c.c
+++ b/drivers/mfd/tps65912-i2c.c
@@ -43,7 +43,7 @@ static int tps65912_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tps65912_i2c_id_table[] = {
-	{ "tps65912" },
+	{ .name = "tps65912" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, tps65912_i2c_id_table);
diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index c024a28b057e..4eb553913a7b 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -926,17 +926,17 @@ static int __maybe_unused twl_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(twl_dev_pm_ops, twl_suspend, twl_resume);
 
 static const struct i2c_device_id twl_ids[] = {
-	{ "twl4030", TWL4030_VAUX2 },	/* "Triton 2" */
-	{ "twl5030", 0 },		/* T2 updated */
-	{ "twl5031", TWL5031 },		/* TWL5030 updated */
-	{ "tps65950", 0 },		/* catalog version of twl5030 */
-	{ "tps65930", TPS_SUBSET },	/* fewer LDOs and DACs; no charger */
-	{ "tps65920", TPS_SUBSET },	/* fewer LDOs; no codec or charger */
-	{ "tps65921", TPS_SUBSET },	/* fewer LDOs; no codec, no LED
-					   and vibrator. Charger in USB module*/
-	{ "twl6030", TWL6030_CLASS },	/* "Phoenix power chip" */
-	{ "twl6032", TWL6030_CLASS | TWL6032_SUBCLASS }, /* "Phoenix lite" */
-	{ /* end of list */ },
+	{ .name = "twl4030", .driver_data = TWL4030_VAUX2 },	/* "Triton 2" */
+	{ .name = "twl5030", .driver_data = 0 },		/* T2 updated */
+	{ .name = "twl5031", .driver_data = TWL5031 },		/* TWL5030 updated */
+	{ .name = "tps65950", .driver_data = 0 },		/* catalog version of twl5030 */
+	{ .name = "tps65930", .driver_data = TPS_SUBSET },	/* fewer LDOs and DACs; no charger */
+	{ .name = "tps65920", .driver_data = TPS_SUBSET },	/* fewer LDOs; no codec or charger */
+	{ .name = "tps65921", .driver_data = TPS_SUBSET },	/* fewer LDOs; no codec, no LED
+						   and vibrator. Charger in USB module*/
+	{ .name = "twl6030", .driver_data = TWL6030_CLASS },	/* "Phoenix power chip" */
+	{ .name = "twl6032", .driver_data = TWL6030_CLASS | TWL6032_SUBCLASS }, /* "Phoenix lite" */
+	{ /* end of list */ }
 };
 
 /* One Client Driver , 4 Clients */
diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
index 562a0f939f6e..ed2a2cca8cb9 100644
--- a/drivers/mfd/twl6040.c
+++ b/drivers/mfd/twl6040.c
@@ -817,8 +817,8 @@ static void twl6040_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id twl6040_i2c_id[] = {
-	{ "twl6040" },
-	{ "twl6041" },
+	{ .name = "twl6040" },
+	{ .name = "twl6041" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, twl6040_i2c_id);
diff --git a/drivers/mfd/wm831x-i2c.c b/drivers/mfd/wm831x-i2c.c
index 9bee007f9c99..5a093086021a 100644
--- a/drivers/mfd/wm831x-i2c.c
+++ b/drivers/mfd/wm831x-i2c.c
@@ -72,13 +72,13 @@ static int wm831x_i2c_poweroff(struct device *dev)
 }
 
 static const struct i2c_device_id wm831x_i2c_id[] = {
-	{ "wm8310", WM8310 },
-	{ "wm8311", WM8311 },
-	{ "wm8312", WM8312 },
-	{ "wm8320", WM8320 },
-	{ "wm8321", WM8321 },
-	{ "wm8325", WM8325 },
-	{ "wm8326", WM8326 },
+	{ .name = "wm8310", .driver_data = WM8310 },
+	{ .name = "wm8311", .driver_data = WM8311 },
+	{ .name = "wm8312", .driver_data = WM8312 },
+	{ .name = "wm8320", .driver_data = WM8320 },
+	{ .name = "wm8321", .driver_data = WM8321 },
+	{ .name = "wm8325", .driver_data = WM8325 },
+	{ .name = "wm8326", .driver_data = WM8326 },
 	{ }
 };
 
diff --git a/drivers/mfd/wm8350-i2c.c b/drivers/mfd/wm8350-i2c.c
index 767c176b12a7..b20761a88b05 100644
--- a/drivers/mfd/wm8350-i2c.c
+++ b/drivers/mfd/wm8350-i2c.c
@@ -41,9 +41,9 @@ static int wm8350_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8350_i2c_id[] = {
-	{ "wm8350" },
-	{ "wm8351" },
-	{ "wm8352" },
+	{ .name = "wm8350" },
+	{ .name = "wm8351" },
+	{ .name = "wm8352" },
 	{ }
 };
 
diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
index 8ecfe878a5ba..1c0ba450ef9b 100644
--- a/drivers/mfd/wm8400-core.c
+++ b/drivers/mfd/wm8400-core.c
@@ -135,7 +135,7 @@ static int wm8400_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8400_i2c_id[] = {
-       { "wm8400" },
+       { .name = "wm8400" },
        { }
 };
 
diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 094c0b3dbd97..903d7070dbe5 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -643,10 +643,10 @@ static void wm8994_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8994_i2c_id[] = {
-	{ "wm1811", WM1811 },
-	{ "wm1811a", WM1811 },
-	{ "wm8994", WM8994 },
-	{ "wm8958", WM8958 },
+	{ .name = "wm1811", .driver_data = WM1811 },
+	{ .name = "wm1811a", .driver_data = WM1811 },
+	{ .name = "wm8994", .driver_data = WM8994 },
+	{ .name = "wm8958", .driver_data = WM8958 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8994_i2c_id);
-- 
2.55.0.11.g153666a7d9bb


