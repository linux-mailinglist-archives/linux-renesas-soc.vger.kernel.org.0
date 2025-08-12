Return-Path: <linux-renesas-soc+bounces-20383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F355B220F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 10:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E7F3520670
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 08:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CA42E5B02;
	Tue, 12 Aug 2025 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N/U7eDjP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2982E5412
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987241; cv=none; b=na+FK6B9PAA7/FMo5EGQtjNh5IfszDrfF/ICe7Ej9Ta2OM0ehBCn8/e+BJffcMMftyB/9IYqNGTS2TEIEMt/YWnjuFgVQ9ayPS5H7yzp8t5yezD26C+pdQYSikos5gMh0P/NnRW16ukcXEBPQ7v/sESRLy+VulvyR+SzZdtO6rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987241; c=relaxed/simple;
	bh=uHw1RHh99DzN3gt+21+XixzbhVlGc71uNmong/5Mt7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSopTxbk357Tu6g922MnUaoA7/R3+dNnpJmk8Gbf/as8JEofdIv+D4JUNLoW4BM6Xj2Hr6HGGLvBrooVo1RGsi9LFIPDJvm3w+/IkKvnzSJIEMKiFEXq0Le7iTOZlfEdcXhXAajBT5nm1M9LN1GvXQFBMPl0eHtTuguhLNHsI+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N/U7eDjP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso3152858f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987237; x=1755592037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKgYZvZvQ5VjuvwnOZblLnAWdMLTkRzXbd38Wp8Pe9s=;
        b=N/U7eDjPSzHID1L+gw+2vu9u8VRRrJrmD8KKZHKLAlGJYQS5EkxK+R43Y8EeOj/khr
         TrRRPxsb4zHkVW1KKwInjfDq6J+We8vRccrJYbbY/6PJ7C2T2IqGUGGLkoaSv4fPqb6r
         +QlJloHn2w199G4+JTSM6lYJ1/iioi20MyTnQARtaD9vhtqEdfISD4Mw7MoEm1JGELFl
         WMpaKzhpbvH4dXZbqbipO33K+SUjgwZCC5+eeJyc3KTd99b6FpvpcspTZ04XzHFK7CWk
         f4AlzgHmYfZ1kSy2wFxF6a0dp1W2IwIH8piuQAr/MCApTkvSnYp8F5qWyX/wJ2TlmjwG
         C1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987237; x=1755592037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKgYZvZvQ5VjuvwnOZblLnAWdMLTkRzXbd38Wp8Pe9s=;
        b=tNoz7llDbpe8tH+gSazCWAeFmXkG8oue/nKbWS8rPeUWoBESnW356RIqpRBzL7Uyh6
         +BirITHEL1tsqa+deTBOKbr+qIM5YCSnZX5XzZA92I3MSw1Ibb7KwEv7S6SGuR4l0Gae
         6TDUMWnP1o0D2L/jrGdGSwxPRUyOnvo7CmT5PMjodxp3x5WTJdRHJ/4F1MuVK3Rivi1J
         Kby8efDLLceQZa+Ejy5ZQ8N919nSAfhQ6AVLLqy+8TB4G84Dg8LJQD2U8BkHyzh85qZu
         +wP7xaSyu72trRZKHGyzSEAJCgOEJxu1raANBqXGIXd9PJbzpuHYvzxcbtYVMtATY4iP
         p2rg==
X-Forwarded-Encrypted: i=1; AJvYcCU86II0bchb5fY6RhSQgJmghJoo1VBXJmDF8OILq0sOw3pDHu5SWJOMasz8E/AoIbEFM/yfkfIiINMvKusXyzc4RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcP9qLNW1ims7p5QJtbnni0CBnGDRYjNFqc2CprZQrYb26L0V
	kiMDUR1jrUGfph/xjuI9BplXMYYxBKWM3R6b0cMFI2vHL70KyvPUEEOPnQjdZ5JN9Fo=
X-Gm-Gg: ASbGncvMwJ9GVQZpyVuNsMm+V5O96NsBcHxouYUB8LeXV8CkP7uR3PenyJvq/bIzEhG
	/upjFgiDzPhNodFaGOds7YoDQVt5+IPkMm94GU0zxa2l6q00o50ehcfVM7JzoTQvAszCmkX33EP
	QuBtbsi9anfmJ2oxTaeSBbpM0V6Qe7lDnBVNE1csrE0d94x8WMg7M9hZ9085oGqM6mxZsopoFAb
	4oBmna0fhpqw8bit2nKSWsAObD4KEbD0Uuq98+Vihptm/Q4jcCrAJHMYVXgxnVv0iMzsSn5eA67
	inGnVch+Xmf5+BO2JRALprHB9oOd+FbWutNQ2bjSQC66O7SEE4FXlugIcw60n+eD6voqs08AtFi
	kr3GPRfckE3BhuPw=
X-Google-Smtp-Source: AGHT+IEZ/27jOsHs3m84L3TOqJK9jBTelhRpL1umym9DI5hpFyIiY1nmwpT2VmThicLJJSpID6H/vQ==
X-Received: by 2002:a05:6000:402a:b0:3b7:8880:181a with SMTP id ffacd0b85a97d-3b900b4f015mr12160365f8f.13.1754987237105;
        Tue, 12 Aug 2025 01:27:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:04 +0200
Subject: [PATCH v4 05/15] pinctrl: mediatek: moore: replace struct
 function_desc with struct pinfunction
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-5-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7802;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ABYLZWX8DVJpJC0vF17OH/X5Rl5vi7hFamob0mWFp0M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrX81NUygmmMQnM3UT/GQSjySo3tsKuZ1OML
 8rw0MIP3DKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 ckfMEAC27NWvs4YxoRUBYiQp15IQjffIiaUKgpmoxycB457LMx89AOYxTyl/aHw2Xmy37v9ASx8
 aoiBEyvcw+TCowopcJGuWCH9VOE4Ds1ZtHbYe6mkK68cucW9dLjuco6VPnOWYNcqoel+yPZ4fWu
 G+thbWNJ6uuRpxZ0YrVZIVeNhi93DRWYMYtjMjuMqdyqXn4xZ40pvsLLMaqXwyyDOm83SVibeWL
 dFoz6DhTpo5F3+AF9PaDU5K32ZwyNrmIIR/2Hg1bY0nujcCa7TOEkl/Sf8RNVYiT7fPuEZ2Ue3H
 +q/UMpVOth91pR/SZM2pRVdPV5wUIa2UBNP94XlUjYkoTo3GrWz/tBQo+fvJMUFngUrwIGG2JYc
 BmaBqmOwWfHG2O0ptIliuv/t/LEo3dGeyoC9/0cDNsCS3N30ZV/bapJ8rbk775X+TE/uUweiKc5
 W6D2mBjYa++R7s1FdginOMMlTA2cZNUJUsG34OYVQ+6bwPuoYU8A4SIbHU1mOd764asFzvc7945
 brSDqLxNxlGjD20bKZY7aFVfmI7PtbagP28vMLKv+mNuz0yCJ5pIKNSwaYH+gqxldq/ARUpYJny
 lnxK94YR6GsGkly9C9kOcmDGZvbVtI27GhKVPEn7I6rdELD5ouAqdOiluGSTVN5yDTvJoOALn0s
 HAqR/ojR/FFN38Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 6 ++----
 drivers/pinctrl/mediatek/pinctrl-moore.h         | 7 ++-----
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 9 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 6e4f6c07a509326a8a7e88b2dc32635b22e7b965..982b9887521d036538f67e9919de444693c458c0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -622,11 +622,9 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 	int i, err;
 
 	for (i = 0; i < hw->soc->nfuncs ; i++) {
-		const struct function_desc *function = hw->soc->funcs + i;
-		const struct pinfunction *func = &function->func;
+		const struct pinfunction *func = hw->soc->funcs + i;
 
-		err = pinmux_generic_add_pinfunction(hw->pctrl, func,
-						     function->data);
+		err = pinmux_generic_add_pinfunction(hw->pctrl, func, NULL);
 		if (err < 0) {
 			dev_err(hw->dev, "Failed to register function %s\n",
 				func->name);
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index 229d19561e229c77714e5fccb3d4fb68eacc77fd..fe1f087cacd0446e40628cb4fa35a135496ca848 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -43,11 +43,8 @@
 		.data = id##_funcs,							\
 	}
 
-#define PINCTRL_PIN_FUNCTION(_name_, id)							\
-	{											\
-		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
-		.data = NULL,									\
-	}
+#define PINCTRL_PIN_FUNCTION(_name_, id)						\
+	PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups))
 
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index 2dc1019910662a2a52e81f277a10a32bd83b33d4..d5777889448aab86e82fa6821fdea0d30a5a7246 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -822,7 +822,7 @@ static const char *mt7622_uart_groups[] = { "uart0_0_tx_rx",
 					    "uart4_2_rts_cts",};
 static const char *mt7622_wdt_groups[] = { "watchdog", };
 
-static const struct function_desc mt7622_functions[] = {
+static const struct pinfunction mt7622_functions[] = {
 	PINCTRL_PIN_FUNCTION("antsel", mt7622_antsel),
 	PINCTRL_PIN_FUNCTION("emmc", mt7622_emmc),
 	PINCTRL_PIN_FUNCTION("eth", mt7622_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index 3e59eada2825277b3d7500cb1f2cf740242a4a8b..69c06c2c0e21e4ce785f65539254eb070bff9a0d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -1340,7 +1340,7 @@ static const char *mt7623_uart_groups[] = { "uart0_0_txd_rxd",
 					    "uart3_rts_cts", };
 static const char *mt7623_wdt_groups[] = { "watchdog_0", "watchdog_1", };
 
-static const struct function_desc mt7623_functions[] = {
+static const struct pinfunction mt7623_functions[] = {
 	PINCTRL_PIN_FUNCTION("audck", mt7623_aud_clk),
 	PINCTRL_PIN_FUNCTION("disp", mt7623_disp_pwm),
 	PINCTRL_PIN_FUNCTION("eth", mt7623_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index 98142e8c98011d17339da74f61d6f917372dfcd5..cc0694881ac9dc536db0e46eefe5eb7359735a60 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -384,7 +384,7 @@ static const char *mt7629_wdt_groups[] = { "watchdog", };
 static const char *mt7629_wifi_groups[] = { "wf0_5g", "wf0_2g", };
 static const char *mt7629_flash_groups[] = { "snfi", "spi_nor" };
 
-static const struct function_desc mt7629_functions[] = {
+static const struct pinfunction mt7629_functions[] = {
 	PINCTRL_PIN_FUNCTION("eth", mt7629_ethernet),
 	PINCTRL_PIN_FUNCTION("i2c", mt7629_i2c),
 	PINCTRL_PIN_FUNCTION("led", mt7629_led),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 83092be5b614cc164590fe5ec2b756fe6579b263..6216c2e057f6499b32741b6bd3a4854878c061c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -977,7 +977,7 @@ static const char *mt7981_ethernet_groups[] = { "smi_mdc_mdio", "gbe_ext_mdc_mdi
 	"wf0_mode1", "wf0_mode3", "mt7531_int", };
 static const char *mt7981_ant_groups[] = { "ant_sel", };
 
-static const struct function_desc mt7981_functions[] = {
+static const struct pinfunction mt7981_functions[] = {
 	PINCTRL_PIN_FUNCTION("wa_aice", mt7981_wa_aice),
 	PINCTRL_PIN_FUNCTION("dfd", mt7981_dfd),
 	PINCTRL_PIN_FUNCTION("jtag", mt7981_jtag),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5816b5fdb7ca918486f57a890f73543b3198c728..2a762ade9c35505505c932b6fea75fa0cf77d961 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -878,7 +878,7 @@ static const char *mt7986_uart_groups[] = {
 static const char *mt7986_wdt_groups[] = { "watchdog", };
 static const char *mt7986_wf_groups[] = { "wf_2g", "wf_5g", "wf_dbdc", };
 
-static const struct function_desc mt7986_functions[] = {
+static const struct pinfunction mt7986_functions[] = {
 	PINCTRL_PIN_FUNCTION("audio", mt7986_audio),
 	PINCTRL_PIN_FUNCTION("emmc", mt7986_emmc),
 	PINCTRL_PIN_FUNCTION("eth", mt7986_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 55c8674d8d66f12d2f2246c215056d4e51296a9b..9569e8c0cec15fb6a4a8e359d6483fa163487b0c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1464,7 +1464,7 @@ static const char * const mt7988_usb_groups[] = {
 	"drv_vbus_p1",
 };
 
-static const struct function_desc mt7988_functions[] = {
+static const struct pinfunction mt7988_functions[] = {
 	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
 	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
 	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 36d2898037dd041ebc7e06526ebc085eb42f2828..fa7c0ed49346486ba32ec615aa2b3483217f5077 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -238,7 +238,7 @@ struct mtk_pin_soc {
 	unsigned int			npins;
 	const struct group_desc		*grps;
 	unsigned int			ngrps;
-	const struct function_desc	*funcs;
+	const struct pinfunction	*funcs;
 	unsigned int			nfuncs;
 	const struct mtk_eint_regs	*eint_regs;
 	const struct mtk_eint_hw	*eint_hw;

-- 
2.48.1


