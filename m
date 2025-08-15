Return-Path: <linux-renesas-soc+bounces-20555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05DB27CBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 11:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1795F1D200AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 09:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582DD2D5427;
	Fri, 15 Aug 2025 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wMU6dzkX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B842D12E9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248969; cv=none; b=RV2J9yZYrtOgEVPtxUDVtCDKK64+vW4GDUOR97Y44lHW4ytyMynbwxNMbvlrVPt23rxYSLmbahr1pER2vdrxTsxAGCwhYfv1jQ3SZyo/qINCg+ExP7SKFKpdYRoc8nTNsPrr5GpIbL+xszeVNudgZJb+uJTURF66k3g1C2tg72I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248969; c=relaxed/simple;
	bh=AqBljAHcu9SEs+fMf1cVNWEroJaNcsABmNRiWlNYjLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXwgQuTrmyHqNN74By0ygp1XFAYNNpBI3yE6rPRTG4wZ2J0rrpYs6u1UMCYm9b2zp0F//WMjp7fedV4t2m4vK6Y85T0bDlqc0ZGbi3d5ptWlv3vyS9K18dNIWm2XKRTUO4BKILy1JrwzCRJiMhkgEJ7EuG7Y6bHKUl0ops1uzWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wMU6dzkX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so984208f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248963; x=1755853763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=;
        b=wMU6dzkXi/qrBlyKM2ISCYREaM0l/Oj3X9WOdYgn8DxQ9DGxySmcSIf6isiaC+Syee
         /Ow8jY+oG7uzPMbDqnzC99z6cVz24JYOJ12xYbXkillkbndVh9onyDRtq6Hj/0B0EPTA
         NCCCJ8u0/dR6TNbcjTjUJnA4c1LjVdy1jmNssBTQ+MO8aRFX0E/sWhXxwf6hJK1o8SKj
         dRj1bFqkDyINo1sB/6Yki7R0e8TDhyHV8DXhEJT/tmPY2/Rwu8pGC8uEQ4U+JHuWGx+T
         k1G3xywo1DlTA6OIMA1dbvsBhmSmqWL6PIYhTv/hxxVgBbBaqvKUb77MrwtHIY9eKUrH
         a1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248963; x=1755853763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=;
        b=Iv+ouS/jX+y72JtEYCxPYPcs9asT2MbgObFbTzmFELCViOA0HuUBw+RFd4SG/f5VkK
         rgQnnECpSzlP+tPxtwR3BlSK1b2B4W3uHZF+mFHaB/CVUZgW/1O8+FbLRRM0yip+su1V
         PJTrjIEOkSshAglzWdPYWg6lTvZOufHLuZmWQLAsp+1KbEvKoad5MWEJ039nHcCrlQtW
         X7IY4FQ5YYp5g8pqrpQdTrE/029jQDEthcZ7qqFpPU9dDYCmGu/jhaCphkQbTaji19k1
         vRP3SzXhldUw/I781Ov9lZRaBNgmVQqeoU6Wnt+86R8yOnG8f9q1e+zjM27ohgGNAhzN
         CLvg==
X-Forwarded-Encrypted: i=1; AJvYcCW0OCzybmfdSPqPzZy55gE2T1bwuCFnIweMVKZGl66Jn/9a6ivELpv7e9OQrBVA23d4NFQh0B8x+k2nF/c02sjBsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Cxuz4tjz5lDUN6xcAsMNgaz/otyYfELpP3MNkXj9WZc8GOP+
	/Gata88+Jd5Qhpwd/yfR6BqbLW0c8KV0nTUfpsXAgjFVVOukVl7ZY+9Zj35EsmVUvPI=
X-Gm-Gg: ASbGnctQ8SuxkqbvDiR5Nvg/Zq7VQ+0kk9zoCbW2mmgBQjDJa/oBBJvXWjzXgUY8eDd
	UUtEMsRrEbhwj6KaGdGUZMjK2QStkLnALZePeu6HVU/LnS5PgzbfC+RCFG/H5ZSFIukGeQUZCJd
	Qw8JW+VfLbqNuUySK9po68gilGCKlG+eIzs5Ql5142kyvwVBsIoGXmp47pjjcW9QUodi3gNoUQQ
	iS4BNQxKQGPkTD8XduiBWqqdyp+PDjeJvrGmQzBsDkM68TaRZvEOiXpqDnIAYIhkI52eTSIGFj9
	88efUrYdqA/rcL61ccfUAyZBd0qGjpAkdjJF8oY0KSCIH+HlSN2fQdkB8sOqaWVQLolZGDW0Md7
	8trODabprfN8m2W3uCw==
X-Google-Smtp-Source: AGHT+IGUAXDLykutIpMPqR2CWw0jGljeultUDjNsFBqLcnpk3VzMMU1IX8ETkYGEQbzDEFH8gkziRw==
X-Received: by 2002:a05:6000:18ac:b0:3b7:fbe3:66bb with SMTP id ffacd0b85a97d-3bb694ae9cdmr917909f8f.50.1755248963081;
        Fri, 15 Aug 2025 02:09:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:06 +0200
Subject: [PATCH v5 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-4-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2921;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=79i9CgDBpTwy0KAMS4vozziB177zSWYhoWrySFXqKM4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3DYcWcJpYjc33UdaGFLmDUkrwfiB7Cee3H
 F0qycSGYn2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 co6kEACQTpYK55/OPgc7yEK07WFy41u732QgiT+adm0VgMyxXTaDg3lfMIGivUSairqhrEA9JW+
 09eDY5n36AeV+A12kqPw8HD35KZbHbtTuoMuHMk8P+d8gMiFVuEMv3adO2lTScoCulcZlBDOtv0
 CE5E0kuD2RYWyiaDmsg4aMFCmrfKpA9uME09G9HtIMoR8quMRxZlpfvhLiOzU9tzn295FegYp+z
 eivL1my4FBTBszxeaQACTxWk9EcZm02fWxThXV78fuTHu5KcO9JBMiBhjp0IU1IMHsAuCU6KjjA
 PbZPnhp8foSt884XPFcFoF8Im2Pb3mFU7ej/3rozL+EoeYzM0mpAHCgurzi069Z/BCt61kpOM4v
 DLmQtREGwtgi1VHfLgTDVr+I2+6lyeAdtS70adO8lUvhssi+8nePshV7zWw/cE+sq86eQdx7ppk
 T4tfE5W0K8ZxeEEl+X3tM/O/wsnyN9fRU5QqfwC2Rr/nC3+sEjeazf3tjn3xBN/pDul6IJpRo2W
 5Ser3RMdQd1a1WxD3wSOdrJdQWXgvjC3+ZEUGE8kQg8lh71EdKNPagZZ4a5H9cDHZfe4o8ZlFjl
 v4E2HQ2i4+hiRfpZlEG24sQIZhSOFo9nfY9riA6rOJSMosbGFdQfJHPUtUCSC2EazYpbBXD/YJv
 Xoc8bWRKcVnJQ2w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1


