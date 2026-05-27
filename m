Return-Path: <linux-renesas-soc+bounces-33203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qByPM+3LFmprsQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:48:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D08AC5E2F33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA775300441B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 10:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BF834F27F;
	Wed, 27 May 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ftzUlKhm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020B3F210B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878888; cv=none; b=X5KAI/9NWnF6OrRrh5ey0kcE0MX8idWGcIocYv4b7d/fGIWt2NhN9XIdV2P11YAZGynf6NFLar27WVt/9E+uZuBx3braHnVux2hqPQU7rxnw+uT5Pl9MYZvHABRCNaMkfEj02CUi72GfqWrnyIBEBFwiwopEJpBT8+vp8i6XiWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878888; c=relaxed/simple;
	bh=9Xdnbrncq7VH0BmQ/6t4XS63l5XFKqkc1TeJjnWKNtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N8W9MhJwim7S16Vv14Z+/qyLEw4fOinOJkKEo+cxxUIHisPxT4bjK7eLbvZpv765KgCZbvejC4kNVUvPjwsnlwiJxaRoP32ZjNMxx0fcvGko9xRg5RsvAM9ESo35ucxhdUEFNI7wYfI+TwErksZltaDnNGUMWHO+R1N4LhlNuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ftzUlKhm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so45906015e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779878883; x=1780483683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=;
        b=ftzUlKhmxzlcX3NkoEBFVMfPaMo1Yi9ZUcLzeLBcwLVudmzeMGNAT+XoTRZCLJmYZL
         vN84ImLVxfAtlmZYixIUGI75rwCWkcDkc/zDwO9/z7grTcbgBOTkf80yV1Ps4R+MC8uy
         yu+ysKdsSeEgOq4DyChEGIPRx9fy8TZ/6Z2v/e5c6GmyMzlFhpviBevUGQV/JzlvDl9s
         BsFfe9DvvLTV+74OrjiFI+TshXbFjvxX41khWVT1GynXhKK56XMW3vv+kFGIvlLSeYW+
         XeBOjRD//XDXW05kPR058Ohgr89mkbo6jsF0hjW4zijCzM4yUqvbYq3+bD5tA4nhnYRr
         mTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878883; x=1780483683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=;
        b=EenMiVviI1MTbV+hlsjqHYbEfzP4KM0+P+1MZ6vdM3hPgQcdoW7fZ3EGCBq/C8/ZVt
         e+74hiJLlKovLUmc8RpRpCd2h+08p0hnBxyG0UAHY3WMIWyx8pvnU5LSdtselXq6cZYD
         PhHCgaUlVNN7do137uKlkjynSIQkip+Acs253AhJJneGUPSRxcebUYAHx8zA0RB6U8uc
         Ba1KS0Qkk4LAJ6FEtvr9ML2PyKnd2qIPhumMGVTMuYYYNpoSb16xt0selp2GWnbFrBRz
         paL+5suPTey0x6W2i8JzeqB8jX5DlrTOSWbhsVtr5uh/17jX1r5DMGipPdZbjbNBAYQ8
         Fa4w==
X-Forwarded-Encrypted: i=1; AFNElJ8iBRgej8L4t69euXp4AgxQfN1UhzVoV3E1feEo5UHwx+GoxB2L4fIcerSBkjvdHRmWvN4Qd+UU1rffEJRO28koRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLXo+qCJZQw1w1G6e0SaG4IrkK9k0QADZqeiAvYwEYqcdbi38
	xqYNOKcp6QQyzuMWFpw2AxGU81yx3d9y3pjXq03FW1Uy9n50O2G4GRCDt+HhQmu12EI=
X-Gm-Gg: Acq92OH07G7ZeEDa61RMf114oIJbjZnBUm38CpR1eUB63q6gzOHN9D644LRpeoc75mt
	iNQ3cMEA6MbyIe3ccYgxDja/iQvtiBUUn2dUn6uy/CsRMs4IIc5FXgMfKjJQRlE1dmSTm+lQvf+
	RNGUcliupJuBAuuXC62lqQeUrzuL4K8rkKM5Yc9B4Gs/lS8YTmzoTPjDeDfr4ycB9gXaLaMpc7u
	+O62rfHF0kglncUn1H/sAJ6BiesCM+ChVg46O9kxZnTlFWnT5krASLYCHWcoM6WSPxFsHUMhEyl
	p4tQeaSuntJ3jRqkz/v0SjPim8ZJm4q5Vs+EsiqpojcJm9QQuNAPMTMVUcMMX0XkG7mqDUJ+1T+
	YMGQEof+YUAYGggVfQ0pRDIFI7sZsMx7zV648+apOq9KeaP66fwDtHqZGSrlxqMXi82+ErDyzO3
	KELz4DtHJW7JYpW/7DeCYj2FY0OH+asOThP4D2qozARbw9iHBSXDuQc361kQU37NbaKoisI0KjY
	bJlg+Uo8T9yoJrv/MNm9vUeBg==
X-Received: by 2002:a05:600c:1f87:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-490424ad9abmr362404855e9.12.1779878883413;
        Wed, 27 May 2026 03:48:03 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4904527526dsm428217795e9.4.2026.05.27.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:48:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 0/3] regulator: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 12:47:43 +0200
Message-ID: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5669; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=9Xdnbrncq7VH0BmQ/6t4XS63l5XFKqkc1TeJjnWKNtI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFsvQ+3pUGvYbTzMBf1U7HpUNs0YqKV82qCwBE o++WwMTehGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahbL0AAKCRCPgPtYfRL+ Tr6TB/9tVIDirqaIFIr+cLHvFRjr/N+HTQz/62BiICc2JJZjFIxmMz6KGMb9PGbAjW0SSau/dN4 zcLMGrCLoC48OmtmlVPfz+h8PG49qdmzJoQkLg4kgndLfg39qqbcPsy5OhkrlgPPzheAU6T3zrm 0WxKp6Wr3LT/anxmAVOQ5FtwjfhMonlFOEOipHYnM2hSfShJ2Bh1eE6IBZytU+c7SY+/nNNsB/D ZC0jCfekfiHdSj1sMmpvYw/JsTRuvgZI4wfY2r4DqR7oE0TrKI5jZLonpB9QKDQyLjLXmkS+xzK bbDtl9bNcjm0Hwz5BysWpXOKEc9oARJLfgXY+NBO7kgQGcRc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-33203-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[samsung.com,kernel.org,dowhile0.org,gmail.com,collabora.com,linaro.org,vger.kernel.org,lists.infradead.org,matfyz.cz,iki.fi,kemnade.info,baylibre.com,atomide.com,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D08AC5E2F33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3b0c9a251a2e..b84881f32444 100644
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

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 308279b31fd3..6bbad1f1ddd1 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -1211,7 +1211,7 @@ static int bd96801_probe(struct platform_device *pdev)
 {
 	struct regulator_dev *ldo_errs_rdev_arr[BD96801_NUM_LDOS];
 	struct regulator_dev *all_rdevs[BD96801_NUM_REGULATORS];
-	struct bd96801_pmic_data *pdata_template;
+	const struct bd96801_pmic_data *pdata_template;
 	struct bd96801_regulator_data *rdesc;
 	struct regulator_config config = {};
 	int ldo_errs_arr[BD96801_NUM_LDOS];
@@ -1224,7 +1224,7 @@ static int bd96801_probe(struct platform_device *pdev)
 
 	parent = pdev->dev.parent;
 
-	pdata_template = (struct bd96801_pmic_data *)platform_get_device_id(pdev)->driver_data;
+	pdata_template = platform_get_device_id(pdev)->driver_data_ptr;
 	if (!pdata_template)
 		return -ENODEV;
 
@@ -1329,10 +1329,10 @@ static int bd96801_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd96801_pmic_id[] = {
-	{ .name = "bd96801-regulator", .driver_data = (kernel_ulong_t)&bd96801_data },
-	{ .name = "bd96802-regulator", .driver_data = (kernel_ulong_t)&bd96802_data },
-	{ .name = "bd96805-regulator", .driver_data = (kernel_ulong_t)&bd96805_data },
-	{ .name = "bd96806-regulator", .driver_data = (kernel_ulong_t)&bd96806_data },
+	{ .name = "bd96801-regulator", .driver_data_ptr = &bd96801_data },
+	{ .name = "bd96802-regulator", .driver_data_ptr = &bd96802_data },
+	{ .name = "bd96805-regulator", .driver_data_ptr = &bd96805_data },
+	{ .name = "bd96806-regulator", .driver_data_ptr = &bd96806_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);

which allows the compiler to notice that driver_data is supposed to
be const and thus requires the first hunk.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  regulator: Drop unused assignment of platform_device_id driver data
  regulator: Use named initializers for platform_device_id arrays
  regulator: Unify usage of space and comma in platform_device_id arrays

 drivers/regulator/88pm8607.c              |  4 +---
 drivers/regulator/88pm886-regulator.c     |  2 +-
 drivers/regulator/bd71815-regulator.c     |  4 ++--
 drivers/regulator/bd71828-regulator.c     |  6 +++---
 drivers/regulator/bd718x7-regulator.c     |  6 +++---
 drivers/regulator/bd9571mwv-regulator.c   |  4 ++--
 drivers/regulator/bd9576-regulator.c      |  6 +++---
 drivers/regulator/bd96801-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421-regulator.c      |  2 +-
 drivers/regulator/hi6421v530-regulator.c  |  2 +-
 drivers/regulator/hi6421v600-regulator.c  |  2 +-
 drivers/regulator/hi655x-regulator.c      |  2 +-
 drivers/regulator/lp873x-regulator.c      |  2 +-
 drivers/regulator/lp87565-regulator.c     |  4 ++--
 drivers/regulator/max14577-regulator.c    |  4 ++--
 drivers/regulator/max77541-regulator.c    |  4 ++--
 drivers/regulator/max77620-regulator.c    |  8 ++++----
 drivers/regulator/max77686-regulator.c    |  4 ++--
 drivers/regulator/max77693-regulator.c    |  6 +++---
 drivers/regulator/max77802-regulator.c    |  4 ++--
 drivers/regulator/max8997-regulator.c     |  4 ++--
 drivers/regulator/max8998.c               |  4 ++--
 drivers/regulator/mt6323-regulator.c      |  4 ++--
 drivers/regulator/mt6331-regulator.c      |  4 ++--
 drivers/regulator/mt6332-regulator.c      |  4 ++--
 drivers/regulator/mt6357-regulator.c      |  4 ++--
 drivers/regulator/mt6358-regulator.c      |  4 ++--
 drivers/regulator/mt6359-regulator.c      |  4 ++--
 drivers/regulator/mt6360-regulator.c      |  4 ++--
 drivers/regulator/mt6370-regulator.c      |  4 ++--
 drivers/regulator/mt6380-regulator.c      |  4 ++--
 drivers/regulator/mt6397-regulator.c      |  4 ++--
 drivers/regulator/pf1550-regulator.c      |  2 +-
 drivers/regulator/qcom-pm8008-regulator.c |  2 +-
 drivers/regulator/rt4831-regulator.c      |  4 ++--
 drivers/regulator/rt5033-regulator.c      |  2 +-
 drivers/regulator/rt5120-regulator.c      |  4 ++--
 drivers/regulator/s2dos05-regulator.c     |  4 ++--
 drivers/regulator/s2mpa01.c               |  4 ++--
 drivers/regulator/s2mps11.c               | 18 +++++++++---------
 drivers/regulator/s5m8767.c               |  4 ++--
 drivers/regulator/sy7636a-regulator.c     |  2 +-
 drivers/regulator/tps65086-regulator.c    |  2 +-
 drivers/regulator/tps65218-regulator.c    |  2 +-
 drivers/regulator/tps65219-regulator.c    |  6 +++---
 drivers/regulator/tps65912-regulator.c    |  2 +-
 46 files changed, 95 insertions(+), 97 deletions(-)


base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3


