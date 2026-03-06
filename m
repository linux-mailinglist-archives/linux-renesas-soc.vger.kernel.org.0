Return-Path: <linux-renesas-soc+bounces-28934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCmuBSi5qmlpVwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:23:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B301721F9B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B063D3139779
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 11:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F8935F160;
	Fri,  6 Mar 2026 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8rc6HT6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18DC37CD22
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795997; cv=none; b=lTRVAoSTen6QuW5njuSdh+wuT6wBMOtax0GQVxg5xDhd/s/Tw4AQlaSMQ6+ZNmwvYI4TxwEiCRfr72PUn6P4Ied81sjrRRV8WHioOduRXGZb4aOuQAkasQDtiq7waH6wZnr/+rQ2wnSUnQEn49ACuBAvzoQCr37OvJrQixg+PJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795997; c=relaxed/simple;
	bh=V6xmUDir/R+x5NzOf9HEQbv1gktAL/EV06jQVrAxMpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjArkg3Wzci00FThANh7+S5cKmYOsj707BIaoGmHaYGp6KVnDeAebGc3Fftzy7v4+1WsQOnxzJBbiABmXH2iQgiG1tMGaHiHawq7lJITzFNqPFKLFM0uxhasailNtEZtlFhPFsXcdI83TgwBdrTLvdvMkIeGlRsWPs9wZ0Uny3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8rc6HT6; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c73967cf77aso553252a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772795995; x=1773400795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc6w9WjyVAm0N3akeFsUfvW+uoclYZdQN8UKYjlEZaY=;
        b=K8rc6HT6D/oqkUtV1Lz1Y9vRaNDK69XkPiO+ynVE9jrrWkBy/vqdzq2IxOV/1zQWh1
         4HA0Ur3XVKoQJBMDYtAspP+e/8mPCt4a6elnlf8QF7ifYDZ4Ert1o5V+uDd5bRBt74uY
         m4g+DC22nPUh6toYCM5WdwCc+AGg8tOjDOzvZa2suVxSv6nhyhWQ9vsKx7lzOo0RQM8K
         XHHO1VVHOezgwBfS8GoeKxt61xG7VSYjfksTOJjj7AyT7h9IwvqF/aagxirW4mPd34dK
         9DlSMj0xrBCb+jHxsOQ9jhRMKG6jMUAi7Gk99bMV4UDydUs6x6cdE3aQF06ZmagaNZVI
         pf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772795995; x=1773400795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bc6w9WjyVAm0N3akeFsUfvW+uoclYZdQN8UKYjlEZaY=;
        b=IjtNPBwdT7NiF0vdBSgyL36MeY7woMT1Yqd3zPXDdkJItBfKFfWTAg9VL0ulpIWIMQ
         iGd3AbsJGI0duVV7NG7XUNbSTmTLFZBX9UK/1X2Y559Mye7L61+7DpA6rQSm6Wf1wFkD
         QFc6yNHuFcsyAf6q3W3Phg2N+mw7Cx4KviS/cy08Q6jUT5xzM4TUjhQ6x1gy4cCb1Mfm
         ZAnE/mfvZVuf/elzgeogSDqXyhlPhRB8BdECnbN+i7qKtNsdjjilmU93knaBzTO87vNf
         rFP0kdvT1TWkWozEzT4mzpvMcardi80saarCGtuQIdat5xtWkK3Rboq6ayZH5eEtUy3A
         iGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh2Huzr9ZjkqWGANYoll1sCMlQNztpWuUu95s3qgSbqVdj/U9gFitSWdRXeKf1s0v6zmKTiC4X6HNITtHZrd3X/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+Gdo87NpF4PVbllGMtGG+/3OgL+37pw/bhC496lWSxhG5uwT
	dSCu/hWFCj/hQU5dgaIsUtvaT9WcGcjoHJkjdI0HgLcEeeOdpy7cp7mD
X-Gm-Gg: ATEYQzz0RI8okAKn602TBpEqheAWdf3uSns0GmK5jwPSQRADGXfE1NtU6sa45ZCLrgr
	Hl8/LPEYNhAVscyJlWj9LHJrufB9YFWPSRCSzp/b9CG/jtwrYDQ/XLoYtswoECYGCImqarQWQTf
	tmdQjwSWLDtTNP6kKllHCgeJFoHDYfnaIsZEElNkS03s9OjQ86t/7IPm40o0SjBnUWcKuM+6R+A
	vVoxq7XiicZXncZciaXO+rzC2hfYY2xTcCpgmbry+IyCEiKsUqQBE+THdAPvm26ODZdj60SZ+uI
	tN0+2sYdGqgTI7D0q4GhkqU0W+W3BmE53nXf2BxWCLphG8IcUZfjQNiJcC1+n03PwDZN4nLr3QD
	p/c62OaLZcDA9PtNs85uxPbdSmHtKfHR8IpKXcDhwDSnW/Enkb6FfnwQKRndTFlwwIg9HPd4WlV
	z1yNcoWSXJAo8ei3fcpGulOK4LW1j1krBLfbPrPDSk0nb/53hEx6Bo5Vd8Eg==
X-Received: by 2002:a05:6a20:db95:b0:38b:e68f:4645 with SMTP id adf61e73a8af0-39858fda379mr2232375637.24.1772795995243;
        Fri, 06 Mar 2026 03:19:55 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636cfbsm1475973b3a.13.2026.03.06.03.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:19:54 -0800 (PST)
From: phucduc.bui@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Bastian Hecht <hechtb@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/3] input: touchscreen: st1232: add system wakeup support
Date: Fri,  6 Mar 2026 18:19:12 +0700
Message-ID: <20260306111912.58388-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306111912.58388-1-phucduc.bui@gmail.com>
References: <20260306104025.43970-1-phucduc.bui@gmail.com>
 <20260306111912.58388-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B301721F9B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28934-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,labundy.com,wolfvision.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

The ST1232 touchscreen controller can generate an interrupt when the
panel is touched, which may be used as a wakeup source for the system.

Add support for system wakeup by initializing the device wakeup
capability in probe() based on the "wakeup-source" device property.
When wakeup is enabled, the driver enables IRQ wake during suspend
so that touch events can wake the system.

If wakeup is not enabled, the driver retains the existing behavior of
disabling the IRQ and powering down the controller during suspend.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v3:
 - Remove debug dev_info() messages to clean up the code and comply with
   upstream coding standards.

 drivers/input/touchscreen/st1232.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 9b3901eec0a5..8fce17d8bdc0 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -183,6 +183,9 @@ static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
 	int count;
 	int error;
 
+	if (device_may_wakeup(&ts->client->dev))
+		pm_wakeup_event(&ts->client->dev, 0);
+
 	error = st1232_ts_read_data(ts, REG_XY_COORDINATES, ts->read_buf_len);
 	if (error)
 		goto out;
@@ -356,6 +359,9 @@ static int st1232_ts_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, ts);
 
+	device_init_wakeup(&client->dev,
+			device_property_read_bool(&client->dev, "wakeup-source"));
+
 	return 0;
 }
 
@@ -364,10 +370,12 @@ static int st1232_ts_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct st1232_ts_data *ts = i2c_get_clientdata(client);
 
-	disable_irq(client->irq);
-
-	if (!device_may_wakeup(&client->dev))
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(client->irq);
+	} else {
+		disable_irq(client->irq);
 		st1232_ts_power(ts, false);
+	}
 
 	return 0;
 }
@@ -377,10 +385,12 @@ static int st1232_ts_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct st1232_ts_data *ts = i2c_get_clientdata(client);
 
-	if (!device_may_wakeup(&client->dev))
+	if (device_may_wakeup(dev)) {
+		disable_irq_wake(client->irq);
+	} else {
 		st1232_ts_power(ts, true);
-
-	enable_irq(client->irq);
+		enable_irq(client->irq);
+	}
 
 	return 0;
 }
-- 
2.43.0


