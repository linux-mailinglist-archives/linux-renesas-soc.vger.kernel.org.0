Return-Path: <linux-renesas-soc+bounces-33216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGeSJuAGF2pz1gcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:59:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662A5E664C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB700305B8C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBAD428474;
	Wed, 27 May 2026 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LfB52L7n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2B427A14
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893867; cv=none; b=aMfBMeDMx2R3nP6URsigDD/NmRz9Py6Ly0WoVR4VHONSsJAuzqkdUVNyZ0/XO+JnYSQfgUsncaCPJdgBIgRGaTUiiaI86ABaAKHrzb+r7rVPusyDLEp/vXyOgt/vTaWgfcaI86q8oYcUQclymc8MoUQRDMbc0+NP+QQtxiLxOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893867; c=relaxed/simple;
	bh=oDODHMUoLpDU7iZfBhWstcjShA2kx7eASZvf6nRJz28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VzRSTlSTs88PxfryCIOj1vdxY0I8UGRgeUEoJpC2p52Fnebi3b2zen76VIIkM5FQHQRka8Kagbdu5TIQpLDb/Y0p9VL5lYn9/bWTSHTvxe90R9T441qKx3b62Ecewcq+d+wDnv/HQRQv28jMSc2Dg/U66HrqPpBlUjs89QnVhBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LfB52L7n; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso102154835e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779893863; x=1780498663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vS1V6wFacA53GGyfnOVFyw9GSa+e1cL9vb2RCcSv0ng=;
        b=LfB52L7nzgAI+OeOURJRd5sLxGfCSAKt3aIjopJuT1QfOuEVGMo8MnAOctU5XlpzlU
         bqV8STYCLqpoXXrkyn0z9oOb9zu55vkva6xbek7DrJP9ImBq/2wdvbl6T2z4CSWX8E9M
         NONHoW5JltWzuzDGBAYcjQib2LDqSyGyXUuJppkmE5B+6U0uGORrDgNX8+h/lQynyRCa
         cpL6korOlFSvMPBxow3fWx9uoWWtwkZTBSdCBgmVwe8aBxJVyHO1E2Bn8qrQbUna21jF
         Sp9qKMkB0O6tA5wxP32Xnm6VDzc8zjQZcHlsjTUV8j8QXVeBb3hS5qIR9wl/TEeODKd9
         dRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893863; x=1780498663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS1V6wFacA53GGyfnOVFyw9GSa+e1cL9vb2RCcSv0ng=;
        b=g34cTEKhTvZN9Ed/jDPDkJ/jql6tFBaTvusAHsJw6afatumx8FxjrScGB4/7ui2pyL
         i3STrKtkev+ZCT3A5Uqz77Ki48BHlat+ZalJdGZBSXZ8qpsEyYtfRgQvikiJDmwWUC8k
         /ldBsJJMa6kba09ekHXKlZIkY94Nv0iQ0x90u2GV8euxjQX5urF+L/THd2VJm/FHwVko
         xSkdN1bY0dNX4zgeNs7TTR8KW3zqv0nllfk7qT3LL2RyQFoy4xxah4srfKfESdP86wFb
         9VrVGRgFFwMxxx4lFPCfntgLuQOUxh2I6hldaARXvGAQy+YqFMIJ2kN1hBhPFYqoAp9k
         MBfg==
X-Forwarded-Encrypted: i=1; AFNElJ/bkmGid7voIopNa4LbaFWd3B1icjnb2L0REmjw7HECXzmNeXbUeWfokHBUyssREofYPJC7k3CMO7MDzK5pYRpyVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDvXok+4yNaCtoPSSFQqrFFMXDNwx5pGWdnTIyyyIEdCbaDO55
	dbHz6IXWadqK6MkVNAtKJmzpYM3n+sF8pvvjYOdf7UXoCbEpF4L0IQqgrmLs9zomk4E=
X-Gm-Gg: Acq92OHxqym0erFohxJDV3ptUdr93JBz7bqAuJGaT15XDhONeDTOoMIbgFKP3ymaINg
	F1bBdyhUGv9i3MLjymywDJy8bH1VoJwL/jC2k7h+Fb4vHS8tdnXM2RlmSHOVSipyC/7ynl8Blmg
	uMMV2Dpzdu7Cc0yoiJGb9XVjdcBsi3kW3G+aT1rmoEtr5xom8JyTxW/s1O/GInw4GMcuIKBAiM+
	Meqma7JHTixQbkyMLzRpXy+LQfrKc4NCDSWhtkt0tWGf62nSN/yra9Yw5h1ox4Drl1T8FOpAkDu
	TLQ7pVVCj+MonU+rmZ97x9RsLhzJY0X/QnCW+FQjJ2GNnEUWoOn7GU2BzAadki0aK+y51p3kIbM
	8vF3SIlOU5fYgjonAOeF6n1qXkRiiYYqtoLXfoo14aZm/tljp3UwGlV7q+3rpLmaIEc/n1/wuL8
	R52WpH4OXqI/S8lMHGy/kZTQvJV9paCCR6o8CwUURtCw704pQ1R75RGos+RMMT7yk7aN/aQfZ1v
	y1g75y3GVu/tW4=
X-Received: by 2002:a05:600c:8b84:b0:490:5466:8576 with SMTP id 5b1f17b1804b1-490546689a7mr366033115e9.1.1779893862724;
        Wed, 27 May 2026 07:57:42 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490838f7f35sm30535645e9.1.2026.05.27.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:57:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-gpio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-pwm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 0/3] gpio: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 16:57:26 +0200
Message-ID: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4144; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=oDODHMUoLpDU7iZfBhWstcjShA2kx7eASZvf6nRJz28=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwZXDKwsOjAsKUzLboec5og9VLoE+o2c00gUz UH6kdhEIFSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcGVwAKCRCPgPtYfRL+ TurWCACGVYbAn82eGpMPsanfyUS8JzwWXl0rIeWEgrdLqqdUkJHpswWdfqJjO8lhMS4iGBnyezq khvw4AJ/eD9YytnLbc+K71CagOVNrJcLWnQZFwmW4MRU1g8nyD7jskSqLUvinwNI7rm42JYZCXL XvQks/gI/EsLB4GXIIiJRW71/FmFZOq+3Q3Apa2Q0amRj9TXVDKMPmX6gpZaKIQA4i0Q4eMupu+ ao8oowaqpXDmq5aUoDZH3WBd5LclJ7rNtHPV+QNDeuU1aqnr1p3tRkqbimiN7ZCVnf6J3MQBiaJ +d0T79KmDEPQiN0SEJ1b9k+z17HNHxh71Ah1pva+IxvJq1LN
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33216-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,vger.kernel.org,lists.linux.dev,ideasonboard.com,gmail.com,linaro.org,free.fr,iki.fi,kemnade.info,baylibre.com,kernel.org,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4662A5E664C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
	index 5d61053e0596..03bc8e859d73 100644
	--- a/drivers/gpio/gpio-pxa.c
	+++ b/drivers/gpio/gpio-pxa.c
	@@ -534,7 +534,7 @@ static struct irq_chip pxa_muxed_gpio_chip = {
	 static int pxa_gpio_nums(struct platform_device *pdev)
	 {
		const struct platform_device_id *id = platform_get_device_id(pdev);
	-	struct pxa_gpio_id *pxa_id = (struct pxa_gpio_id *)id->driver_data;
	+	struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
		int count = 0;
	 
		switch (pxa_id->type) {
	@@ -708,14 +708,14 @@ static int pxa_gpio_probe(struct platform_device *pdev)
	 }
	 
	 static const struct platform_device_id gpio_id_table[] = {
	-	{ .name = "pxa25x-gpio",	.driver_data = (unsigned long)&pxa25x_id },
	-	{ .name = "pxa26x-gpio",	.driver_data = (unsigned long)&pxa26x_id },
	-	{ .name = "pxa27x-gpio",	.driver_data = (unsigned long)&pxa27x_id },
	-	{ .name = "pxa3xx-gpio",	.driver_data = (unsigned long)&pxa3xx_id },
	-	{ .name = "pxa93x-gpio",	.driver_data = (unsigned long)&pxa93x_id },
	-	{ .name = "mmp-gpio",		.driver_data = (unsigned long)&mmp_id },
	-	{ .name = "mmp2-gpio",		.driver_data = (unsigned long)&mmp2_id },
	-	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
	+	{ .name = "pxa25x-gpio",	.driver_data_ptr = &pxa25x_id },
	+	{ .name = "pxa26x-gpio",	.driver_data_ptr = &pxa26x_id },
	+	{ .name = "pxa27x-gpio",	.driver_data_ptr = &pxa27x_id },
	+	{ .name = "pxa3xx-gpio",	.driver_data_ptr = &pxa3xx_id },
	+	{ .name = "pxa93x-gpio",	.driver_data_ptr = &pxa93x_id },
	+	{ .name = "mmp-gpio",		.driver_data_ptr = &mmp_id },
	+	{ .name = "mmp2-gpio",		.driver_data_ptr = &mmp2_id },
	+	{ .name = "pxa1928-gpio",	.driver_data_ptr = &pxa1928_id },
		{ }
	 };
 
increasing readability due to less casting. Also this results in the
compiler warning:

	drivers/gpio/gpio-pxa.c: In function ‘pxa_gpio_nums’:
	drivers/gpio/gpio-pxa.c:537:38: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
	  537 |         struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
	      |                                      ^~

which is a good thing as adding the needed const to fix this warning
improves type safety.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  gpio: cros-ec: Drop unused assignment of platform_device_id driver
    data
  gpio: Use named initializers for platform_device_id arrays
  gpio: max77620: Unify usage of space and comma in platform_device_id
    array

 drivers/gpio/gpio-adp5585.c   |  4 ++--
 drivers/gpio/gpio-bd72720.c   |  4 ++--
 drivers/gpio/gpio-bd9571mwv.c |  4 ++--
 drivers/gpio/gpio-cros-ec.c   |  4 ++--
 drivers/gpio/gpio-lp873x.c    |  2 +-
 drivers/gpio/gpio-lp87565.c   |  2 +-
 drivers/gpio/gpio-max77620.c  |  2 +-
 drivers/gpio/gpio-max77759.c  |  2 +-
 drivers/gpio/gpio-pxa.c       | 18 +++++++++---------
 drivers/gpio/gpio-tps65086.c  |  2 +-
 drivers/gpio/gpio-tps65218.c  |  2 +-
 drivers/gpio/gpio-tps65219.c  |  4 ++--
 drivers/gpio/gpio-tps65912.c  |  2 +-
 drivers/gpio/gpio-ts5500.c    |  8 ++++----
 14 files changed, 30 insertions(+), 30 deletions(-)

base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3


