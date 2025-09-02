Return-Path: <linux-renesas-soc+bounces-21174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC99B3FF8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79ED74E6C3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 12:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4EF320A01;
	Tue,  2 Sep 2025 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K8bOMbnk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7BB31AF2A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Sep 2025 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814385; cv=none; b=XB3nsYKVjyGBc/XLQyfF2dSTLGOrv4zymfy4QHbl+p1+56JW8QP/xwjIMVEFeQJyZP5WKVQWJW5BtcDv1CzrHNeIX6sGFcREIM2/Kfn6DuSN6XHJ9WCQfSLjZGbzwKYnA6dE0cXJzDYNV2CKPfrJbaqo99+z44YhaWDjR7ct95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814385; c=relaxed/simple;
	bh=SDJclfljZ9EZ8edvVXQQ6eYcphnUAuu57/dfWC8Pfac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/ex0mhUNv52lmUckKug6b7dL1hq1Sha57nEy8Vgs6N7czhh2a/qMgN7L1eszrVa/2hftvMvSmjtdkVDccIR7K7OJpxQ+5/4GFNSXPix0xXe1cCHw/jOLW43+jdr0hm8Fs4W8qtZa4rNneaU6ogi+r/8vMBvOmUu+YzamlQVQ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K8bOMbnk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b9853e630so6000055e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814378; x=1757419178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPt8gvlEjpDQTK76H3vkguPR1nz45r4YrgyISuAo6sA=;
        b=K8bOMbnk7Y9B3xYAhGO5IOpFk4OoyJIDBUSw795JeObxEdTMsLntIdssV3/IaprSAr
         fnTdriIObVL4VjqBSb5ndUa1Jez/4Y9ZicD8Bf+TkrvdhyijXXfmJjH98vXRHPd9C69Q
         udG3jHuRSg74eNWxT5G5fIC8RCOCkczHF4zmwRaxmV6JMv8FUMsCIH3tKOs2N8i8YtpK
         +ipurjMdnmqHeB8mcrrmGaD1RaOWbdXH79Z9bvRgykkANa+UpMaeemmyoYoCWLym9EII
         Fkxzm6NpLTIWOBga6oghBrhokDB5XUUQ4vUI2VUpFPdXLieVeyMi2hVsBInb5a4X6jAv
         dSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814378; x=1757419178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPt8gvlEjpDQTK76H3vkguPR1nz45r4YrgyISuAo6sA=;
        b=KsGGVZqnPDu9qpjBYOC8Gzzia+3364l7rBt5lmMHqkcsBG7vGZNKKeGbudOxQDphUS
         iuxxa+L+UKs40iHAVJqfB96BxT8Fa4t7PaAYxq/Q2VmGplyWNKWFFIO5u9gbkHUIPDAJ
         jqmBeVzi17oQKPmT6ZgVn/Lr8b5fJZ6ahzaMdwnTzE2sEAKbh6qUt4s/ZZdoycKJux2P
         JEFcr3HcNsrbT5eEbDN7m0YYXvAzZKIefkKYK+KlTE9VgQ+LeLB0KaSUb6V32S0gQpKH
         ipQYDGqgJXuym6aqroeH4xfN7I2TF3dDVyRdOzwJZfxuro4BENyhBCyxdZCligoP68yi
         Icfg==
X-Forwarded-Encrypted: i=1; AJvYcCUFprULkqAe3i6RptU2gjn1ya4B9yvmdwX7Nemw+WpWxoXD1JUxl54AxaHR21J9rLN6bTOFRGDx8otASC9qfApeBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMm+mBYrxqQS6PBZtn+kNc8DCirSUphXDxHkq6X44HX/nTzIG1
	WL3bkxKq+PCmSD1cxYz/tEqRCJssvhlcH/l/fpO66Z/gsJUlQMocDQLfghfXTVonrCw=
X-Gm-Gg: ASbGncvOyjKE50MI3WKnxTerBeQSxMCJhYR7OvRENDQA+1R4PWI5iSFRxIUkYzggyNu
	i46636ozmfAGIPE5/ZHiFl3BqKaWREcq89IiODCTMj/HWnra0Lz7p5xKOAAFd9xlArIlDzWILYs
	V9HtTwcyVTzZ/zM0sA3LAAF/YDvahkhkFdS8XzKqoK7Shdjd3ILgRywQvdjFMHoxmWW1roVBCrK
	ux7iExboRLsOdTX4UIjYiWI65FJNe2VZsJr6hlWehSXLVjuIf+b2szINfhLkhoFWWiaOujhoh8L
	3JVTfH6CP0PwOQUg0mLksLnDCkBTuE8tKj5GNDVnTd5xMSMM/QcVJI1yBab066YlEDqs1xm8kLf
	RpBTojifz48mGKPZy
X-Google-Smtp-Source: AGHT+IEXxOo4z4yAeoQlkFOtnjlAQNS/tph/UfDFWhMsGtwbVd/rb4cnwy5YUM0kM5fJazYx9xpgkw==
X-Received: by 2002:a05:600c:4687:b0:45b:8e26:5f46 with SMTP id 5b1f17b1804b1-45b8ee17c88mr52018185e9.5.1756814377701;
        Tue, 02 Sep 2025 04:59:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:20 +0200
Subject: [PATCH v7 11/16] pinctrl: make struct pinfunction a pointer in
 struct function_desc
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-11-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7zPuWJKCi3W/APCCISK85dTCZM4XZbn46J4D4451eVE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUiKOInObUndgch3MKKYY2s4jaFgidDJSCQ
 h6iRThYRN+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 ciuZEAC4P8XFy/z/dPHBoKdgqbmvJtQw7Hsxiwp7RwIKdmC6w3qd4q+WzFqlyiwDQXnES/qnpC3
 D5cnkNqC7eO8sGZEwg7V4s/DyQn2O5WmTYQiiQ/eGLLoVv+drovg3G4fdjwSCjzJmjatVV51k0R
 bjqrd30zT2cMLegn/Zo1ycMwKRpXHqNJKYs8Ja3yeSJKRxxWCXf8m1jh6c+o4g+eEgJRIJaK/uk
 Z+TOO0HtXrzKa2x8Vmqevg9+6B4FLQRMOuhAgcp59eACh65TASHH9SlG1M1TSHV8t2zoo2Elhr7
 sPdm7j1eJ1paD9KeGRkPOtk1ovdCPAtAY0nHQaaBCyWY4+R7Oi8xZSWsxTWg1OshqP2F104YBay
 leQDYLDVkrnhdU4QJfaJv2+CjoxvbiSk9BQzwSiGB8mCCNd95+b3XbP2jf/BpAKzJMcOMHhVi4N
 H9KleCUWal4+JEQOKMOEtq2Fnxg/0okYVWlJk9jZfRUHBbst4bTrAT2PYz4gW6cq++UCVf7Nsre
 Gky0m4k34pK+ynwTGMGCPLGppT0pqAd8kPU9+VDjpAj0yzC/qt/oyqrYyyCi3yvjzQi0UtGu/EJ
 2D/E3uPP6c7qUebkXHFqc55URWRiYfVvxSTa//SnOFHPX+g0dXooc05xgP88iF+s++rWyHCYUW1
 9d3aGQPVLm4hGGw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently duplicate the entire struct pinfunction object in
pinmux_generic_add_pinfunction(). While this is inevitable when the
arguments come in split through pinmux_generic_add_function(), users of
pinmux_generic_add_pinfunction() will typically pass addresses of
structures in .rodata, meaning we can try to avoid the duplication with
the help from kmemdup_const(). To that end: don't wrap the entire struct
pinfunction in struct function_desc but rather just store the address.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c |  2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c         |  2 +-
 drivers/pinctrl/pinmux.c                  | 18 ++++++++++++++----
 drivers/pinctrl/pinmux.h                  |  2 +-
 6 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 39c582a25d8fe9ff24cc2b7d8b5a4d4e9fe982cb..731c58ad43eea98ba65de5d05755f9d33dd51951 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -266,7 +266,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 954435f74f8c128577ef23da8248368e5c145f6e..76639643ed3f2f3582d5402367064684bc5bdac4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2456,7 +2456,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 
 	dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
-		desc->func.name, grp->grp.name);
+		desc->func->name, grp->grp.name);
 
 	func = desc->data;
 	for (i = 0; i < func->group_size; i++) {
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 17a08c73423fd089066e4894d2307c852bbbb661..11dc525eb3a2dc8ceabf2278ee1a2abaa425eec1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,7 +56,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index e13ef07850386e70cffc83011589ceaf70a70a41..e5b24fab12e11e443df25ffeb7b70d7c1a03c6bc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4015,7 +4015,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 1529d7b6c6657eed23dd1f3daac1fd7444efd1f7..07ec93f09334f8ba8f8cbde4c54fd6a894025ae6 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -810,7 +810,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->func.name;
+	return function->func->name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -835,8 +835,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->func.groups;
-	*ngroups = function->func.ngroups;
+	*groups = function->func->groups;
+	*ngroups = function->func->ngroups;
 
 	return 0;
 }
@@ -903,7 +903,17 @@ int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = *func;
+	/*
+	 * FIXME: It's generally a bad idea to use devres in subsystem core
+	 * code - managed interfaces are aimed at drivers - but pinctrl already
+	 * uses it all over the place so it's a larger piece of technical debt
+	 * to fix.
+	 */
+	function->func = devm_kmemdup_const(pctldev->dev, func,
+					    sizeof(*func), GFP_KERNEL);
+	if (!function->func)
+		return -ENOMEM;
+
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 549ab10f7afbda32fadf4ad151401180bed2064f..653684290666d78fd725febb5f8bc987b66a1afb 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -137,7 +137,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  * @data: pin controller driver specific data
  */
 struct function_desc {
-	struct pinfunction func;
+	const struct pinfunction *func;
 	void *data;
 };
 

-- 
2.48.1


