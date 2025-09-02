Return-Path: <linux-renesas-soc+bounces-21164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F3B3FF5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8A216B76F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 12:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D6D30FC0C;
	Tue,  2 Sep 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r5Mk8oUB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CBD30F526
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Sep 2025 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814366; cv=none; b=ORR5csgPCKdqQBg/wQj9gtAJBUmHG4mJ2MTZUzSONCv30lmvXcGUAyExyD33Bf+Y2f9/8L0SK1dDyDyJ+6Ey684sEoHwcXqSjrlOeJ5Gw8mlZj4NKKmkpP3ImygOPV6cgrLjGSVJVoHOKgZLmNd3+mB7r3G8fbPcSjOBastlsqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814366; c=relaxed/simple;
	bh=x7jB67hOHgUBA/KFXUtVDJmPHSB5d0zZ/tjtxsJC0zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OADmawMqyKx72QJHicQlKmDnRjbVzZWyx3rx3aAO2s2xCGxEq73seZDA9mITSda9ZgnBgli6tf4Hy7xt1+Qgs64RSCjd9NQTMRr/cOsjI1Hi/8OKK2VxMAJM6ojzRzwySL0loqpE9Py6qea5MBkTZ8QM+Ku3z440MSu/SSa5Bv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r5Mk8oUB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b7d485173so33118215e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Sep 2025 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814361; x=1757419161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xw0DbvJpbtjbSqzP3tTQeRts0DWSDSnK+T4azKoEMMA=;
        b=r5Mk8oUBDZ9zw6Jm415K/7Kk+pr7MiPETlGKR5Gjqmxr6nIUdCllfXQmv1Z7v/Ft7q
         EeLB68mv2jI9YNGUXictmR/9eXGQBcXDnORiCI2+moV4idbrWXKJT4Hatmj9ljsMdz7V
         KsFyFMAfImJ9gev4RxMry0jlluWojwPgD44Dxz05hntZhOF6Oo0OMomMI2k4Osxvik7a
         ejFZAYom8JUDqM1IXy89g9F71UHpGKP85FCEUcoMEWKilcpvv9hoiVw/YdbjRgVGcaPJ
         Yb7C5mp+NbI1EkAVd8GNF76VlLev9aWj6eJWPbnOSDF1XZ9lI/8HyE/TDRC3BMYgXwJP
         qtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814361; x=1757419161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw0DbvJpbtjbSqzP3tTQeRts0DWSDSnK+T4azKoEMMA=;
        b=Unauec6/gvUJc61pHGcKPPwsx2UcD9sBqHwh+9pEc83b0IqXnMP0OESG9qegDp2nTJ
         nluACw5oic3k5+kmZQu5/Ji0BTmHck9cBL6vHGkywdk4B+y3SLkeaqaPbBHwpPsgQq8J
         vZFoK+5PKXdGHHAUiBwEsRdSl3QUOsTDkiQ5nC9sXFxcYZ6nSZiWfLU8e4JIewSN3yPq
         0yOoKrb2f2oihtwhCT280siXA+rXO4MReNl39sQN/AqOX42CDKQhnGtBrP34CKoIits2
         ddACPZgzVBGsrpFP30AL9nW/jixmhQUCFy1l9n7uEzZ12JeROX29se8xetuDFA3dK24c
         w9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsiKzYh++wJ+asfbM+AT3xVWBI/iLpbDcPj/CcEMyzk497nDPpWDh8h40elP3S0uRQbaSWSqgk1HXhpKuFtwbaQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmU1Gi0qqB5vzJGkPIfLC2ITgNxG9WnRle0MCrZd//eXZar6e7
	y9ToLl25NAc4Ak4dape5JJEH4STquZgAaOFXQ3o8940HXaa2GHL4v1AkHhaVvPFcJpE=
X-Gm-Gg: ASbGncuRj7mBLBO1YWLNUimFR+7DyIu7VvFTE8pyIs2OLlS/2svFYgZI9Z2ECRVCK07
	ZLLIyToo7Mi0basxdxark0ZXd/oN4+dDMWRlkbwyFC+PC7xrL/UdzLdSQNvg00DYY8WzTe9TNIY
	m2sMhrC2tsjTGZ5sRjP1VHy1UR0jQDFRf/TscU0TgSAGQm9RqPsZujPfUhskTno6PlIx5Lspq3T
	ocKkzqVphPAfZhib/9dyUQE0VeuU+vgA5bNbfB6yrKBRrEy3P8zyt1KlZcTwZFGOFm2e77XHnDu
	OYq2DYYy9eqc11Dk6q9fGaoetycbI3r/IkWSNn0ZDVRskEKLnw8l7UMG1Li8wT/M6yoU5lWjRsx
	wVY402bHAXV4ac1EtNiDZeC3VA800ddWKJ20ABQ==
X-Google-Smtp-Source: AGHT+IFig5+i8G3N69JEt/+fNxuJuAd6gRiFC1wmQxBVMkPWwXoGHVbuGh4GiKPX8+ZwNKQptgTe0Q==
X-Received: by 2002:a05:600c:358c:b0:45b:9a3b:34aa with SMTP id 5b1f17b1804b1-45b9a3b36d5mr16360915e9.16.1756814360865;
        Tue, 02 Sep 2025 04:59:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:10 +0200
Subject: [PATCH v7 01/16] pinctrl: check the return value of
 pinmux_ops::get_function_name()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=D54IdY1jZZ8ZVjEEMBAjgBQa9W3AU+ENLut7Z954Gtw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwRpfc5+ADDPAejjZOjTlM10dVKuuNC16B4U
 swa+RJih4qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEQAKCRARpy6gFHHX
 cvXpEADI6jEEX7IdUfYs7XEPZ54xMxDol/HqLYMKjzn1pd17gzZ6pMm489HJP8zxM8j2mK8WlMY
 iT8dv7GBCK7tnrD5rM7OlWLIxCHEgcGarIfQ57UN2+VpxxsBfBGJxT5xHQSPmO2/IuZDM4v7xrr
 JyfM56zeQWTLPe/1M25q4LQwah6Oqo80g3y/jAAg0Bc4NLVqbMRln4z3jzJnCxS4CfmCXVtD6lD
 ciPMgjSGGIOUmzZX5d3tPLZe8yjiEew2QQFX9+T2MRbl0+ohghrRAch+lwm/4sQTJ7GKOW1qk2i
 wwl7NFzrR9h5QQbB/nZZAP6tlNUbhFRh1w6y8WrY2zKhMwBwVkK73ahZ01ffpeWhg3NNobSNNWU
 pbfVXe3SwtMqwmifizSPEwqqxk1ic1ptmSRSLy7cK0O05upywue8PqE2slVh+TLY92uuX2KNjrN
 q9rl5LbEk8az7wY0eSXYE8hfRZcGcBst47/HbNFlIQxtMl3uuNlgmdLUthI/vOpeQ18Z1qXRQyG
 lpxPT6gBF9yUuuckVmcnrAASFTjSTBAq7653xlPLzOr0JPQwkykh9GfOyH/cj8cI7vpb6HUhjLy
 JBUfD5NOkVzL1VPrttUEGa0NyZG0lOBbQ4/NUG98mYZWTltQYpqLJ2URVbtPWAU/CoaZ1AF4/tv
 onN7mO4K/5AiBcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While the API contract in docs doesn't specify it explicitly, the
generic implementation of the get_function_name() callback from struct
pinmux_ops - pinmux_generic_get_function_name() - can fail and return
NULL. This is already checked in pinmux_check_ops() so add a similar
check in pinmux_func_name_to_selector() instead of passing the returned
pointer right down to strcmp() where the NULL can get dereferenced. This
is normal operation when adding new pinfunctions.

Cc: stable@vger.kernel.org
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 79814758a084570adea0ea1a3151d186f65d1d1f..07a478b2c48740c24a32e6ac8f10df4876e718e3 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -337,7 +337,7 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 	while (selector < nfuncs) {
 		const char *fname = ops->get_function_name(pctldev, selector);
 
-		if (!strcmp(function, fname))
+		if (fname && !strcmp(function, fname))
 			return selector;
 
 		selector++;

-- 
2.48.1


