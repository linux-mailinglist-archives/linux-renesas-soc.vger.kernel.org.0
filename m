Return-Path: <linux-renesas-soc+bounces-19638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B820B105CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 11:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED42C1CE13E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 09:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C0B27E04C;
	Thu, 24 Jul 2025 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PUOdM5oy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A15259C85
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349085; cv=none; b=kgQd1ZEe0nDKG4oVFkNPmrKkxcbpTmujr0lr9RVNhBc6LuY+F9Q400iMzsJTRoncxmCuLI7VuYRH5F/m75GkGr0fyxt2umke1DE7Lu017wO/l5fZZK6cIuHzGuQVpFTn5tjVzT4Srxr7nB6iCtVUurIm8O3bWvyNjUe/0o89b6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349085; c=relaxed/simple;
	bh=KDOYk7d1hTlQEQ7jNP1FzXMIaIbaGvdp7Q2kHJYhtvk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DAXB11Po5/UedEOxtMFRRDWsI7r6akwarPW/SruxYySfOUddw5Fbjw7VCKVA+sBI59yVh/0BV34YpvnM/EvswfviJoJdqsvthYZGTp29KJ9dHUEG6WDxeu9/MMmVQ5ahJL1Xv8fD/Zyv3gnrBGDPlqM1FXfQTqD0fR7RFXjh7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PUOdM5oy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso592091f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 02:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349079; x=1753953879; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+Jk1KCKeq5r1SUXMgObkBW3hrvYWAaOodBQW7tXaa4=;
        b=PUOdM5oytryR7NuBH7/Rdz6jGYRQeNiY+kbPzlM1TXuMoCs6en7ZQNPBWUtKSOG2qd
         htLHFyiCwrWMw6T3V9sro0o0OlWxAo7jLbi1Twe+cpFeialA8GLNgi/mZyw4D9z2EyKN
         5i7lcCkfDxZSgS/mbB3MnQz3UOfRc1ygZ5FsAzrhSTbQ2z72WoCiG2xOrX+NO8viGo2p
         lT8YziufMwyaDPkdIvxYFqmK6aWuBS8vGXjQoi7b1bPZzTZx8qp7EUFWHiASRFWzU/jT
         v2eDx277s/GpcqupsNNRwSK+AnJIkbJvQ7S4LrgP4LHG1/LvBM0627esJAVfqvTk9WBS
         32Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349079; x=1753953879;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+Jk1KCKeq5r1SUXMgObkBW3hrvYWAaOodBQW7tXaa4=;
        b=ssRwh4rm5G8UF77+qhnQft0iORo02FH37HqrEA3vabvFTZpCvm6ZqnnlIYouifF5Z5
         5bHYuNJ38TR2EF2n8wxJ+t9c9wra+a9IGdjrXltWfWCdGYcYyuwTt7GRn7L66b1szXrp
         GF0H7uv+uNOIGA9YGJvqoB88ufKX9Xvd7HAEswhO/VZbZtqDEGxQJcfJ1B4n8PQxqyjm
         6honxU/Kfub0Zlg5CGgiyTF97fMSfsd5bv+VY1U9Hui293taa89ZWsij+jh+ACi1GYqc
         KFt+RP0dUMRW19vX+Urm47Xyvl+tskmg5JDda/hJVSgoyXXTF8ScKuaUFdfP2gM9yQbJ
         bqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxpLVhTRNOQiKybc5BptNuYRJD7BKcOIBQPcUzkVJFNG4grihQewcQopyDvOmT3Nn5ZpD15yyrGtilqKwdUUePkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRmHVsxzRHkxL2JwBFixthUnW0yjDseAc12xKYm6eDtIfG8YeZ
	+q6Fd8vzv7iSfnTIm52kibvLE6vhfMGFcMkkAwWb1L73rbs2Uy2pGJUph3b3zJHFG3o=
X-Gm-Gg: ASbGnctCeXqCIIF76FKQMUYOu0Yy/NNGHhJ5xCHWxzoZLOijsBOJ3wnZOSs2a8YpqEO
	zT9prjQBFjyJmUHNx1PA19s2x0I+IGYVVxDXWUsGI9G/FxVhAal5KwhamDt8VjIqU5/A4s4SKTG
	raU/TzJmqo8nuVgn3jedn0DLackWFlmc2dOeRPFGprZSBiCbFP+LqfIrueYmVsF2QKmrsp2T/td
	WpM0gud02KCcUJS3soJBIOG2k0wv+byqgg8K+V0TVvx3wwL3wXw6H8o0O9bTfUFQWajEQLxLwkm
	ckcMffwFHeeA74Cap0QjDjdoMdwGHPWv95HPOuE9hQJ6597/JJ8m3AiBiZPhRntRotUvYLWRCmf
	BfDpOe/tO2cGycPfG
X-Google-Smtp-Source: AGHT+IHiVNcL8dxsUjZ9ow9Nkc+BPBzrSJjl1Twm9rUjXxGqsNrfckwjhBUnI30ZoqBFVxil9UcxCw==
X-Received: by 2002:a05:6000:220c:b0:3a4:cfbf:519b with SMTP id ffacd0b85a97d-3b768f00de3mr4831049f8f.44.1753349078746;
        Thu, 24 Jul 2025 02:24:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Date: Thu, 24 Jul 2025 11:24:28 +0200
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM37gWgC/3XNTQrDIBCG4auEWdei5qexq96jdGHUJANBRVNpC
 bl7TaDQLrJ8P5hnFogmoIlwLRYIJmFEZ3OUpwLUKO1gCOrcwCmv6YUy4tGqOUxk8Oi26J9WRaJ
 NyzstpFRVCfnWB9Pja3fvj9wjxtmF9/4msW39ivxATIxQYnRWaS+qptW3Ca0M7uzCABuZ+C8jj
 hiema5hZc0qoagWf8y6rh/JREqyAgEAAA==
X-Change-ID: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9733;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KDOYk7d1hTlQEQ7jNP1FzXMIaIbaGvdp7Q2kHJYhtvk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvRru7ED4AJHRVdp9Kj4Fl5NEpjpe67nSkHi
 V9JX28Zqt+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70QAKCRARpy6gFHHX
 cqOhD/9NkukkbU4i8neVl4M1zDGb4hvB6yVojOnaSNoWwaxVnKVMQfpikAbVV/HfuxpzpwwVVQP
 tJVltv8yEMK+cuD6u7m/wj6oVZjvj4t6i8hUIbbgMFoNzgUlJWxpCQOtINLTpjvzbHeE6Uh2W6f
 8jkFtAevV7SgP0dUz03+W7tFIOR1+6JSu6rdDGAx5qiJqohs3T8C8RO+3deQIH5KGWIowyzj5FT
 okGFGNH2JC0Xne5rXd4JfXL2atbI3FSJLeKft2j3xtjDimXTMOcQdEd0DEI2FmFv7PJJOUuj20s
 aRyBV6LZjwyNVq5TqdQf/oEgpEFxwcidA2kUfEz+off2/0I9UJmyZz6RRP/JRR5h+xrjtghKZni
 2g8iUlZaHo3JCAbJQcoC+2kQ4vrwh/vXzuyMpDKFVX4Pd+a+kuAiYuIvoGXDN4mIcgDDsq0pfZO
 yH+8GZDLGTcOxnhPqR6sfmqjHUdmfR7p6SUILpMbM2dN4peWBNEskGyahCNKfzPzL0pBmro+cRV
 wtbV2TZTwv2vhkkF1HnIKjYV25VDETtvtD0utHRWVt41PrqNN7lw9mn9rLwSGcotHgAQLj7vXF1
 nuBuqhwLixjojObQfQ79GxdMLnTaNxi6djsDWYT1J1vWtAy4mstwLUY2g6XuDwOmGvLT8xaA5Wy
 KmiLVNZOHlhKL0Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

NOTE: This is obviously targetting v6.18.

NOTER: This series is a bit all over the place and looks like it should
be split into at least two separate ones but I figured sending it in its
entirety better shows the whole picture - namely the fact that the
pinfunction handling rework is there to allow using the generic pinux
functions in qualcomm drivers without ballooning up runtime memory
usage.

NOTEST: I tested several Qualcomm platforms but I have no means of
testing Mediatek and others. Tested-by tags are appreciated.

Problem: when pinctrl core binds pins to a consumer device and the
pinmux ops of the underlying driver are marked as strict, the pin in
question can no longer be requested as a GPIO using the GPIO descriptor
API. It will result in the following error:

[    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
[    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)

This typically makes sense except when the pins are muxed to a function
that actually says "GPIO". Of course, the function name is just a string
so it has no meaning to the pinctrl subsystem.

We have many Qualcomm SoCs (and I can imagine it's a common pattern in
other platforms as well) where we mux a pin to "gpio" function using the
`pinctrl-X` property in order to configure bias or drive-strength and
then access it using the gpiod API. This makes it impossible to mark the
pin controller module as "strict".

This series proposes to introduce a concept of a sub-category of
pinfunctions: GPIO functions where the above is not true and the pin
muxed as a GPIO can still be accessed via the GPIO consumer API even for
strict pinmuxers.

To that end: we first clean up the drivers that use struct function_desc
and make them use the smaller struct pinfunction instead - which is the
correct structure for drivers to describe their pin functions with. We
also rework pinmux core to not duplicate memory used to store the
pinfunctions unless they're allocated dynamically.

First: provide the kmemdup_const() helper which only duplicates memory
if it's not in the .rodata section. Then rework all pinctrl drivers that
instantiate objects of type struct function_desc as they should only be
created by pinmux core. Next constify the return value of the accessor
used to expose these structures to users and finally convert the
pinfunction object within struct function_desc to a pointer and use
kmemdup_const() to assign it. With this done proceed to add
infrastructure for the GPIO pin function category and use it in Qualcomm
drivers. At the very end: make the Qualcomm pinmuxer strict.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- Add more patches in front: convert pinctrl drivers to stop defining
  their own struct function_desc objects and make pinmux core not
  duplicate .rodata memory in which struct pinfunction objects are
  stored.
- Add a patch constifying pinmux_generic_get_function().
- Drop patches that were applied upstream.
- Link to v2: https://lore.kernel.org/r/20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org

Changes in v2:
- Extend the series with providing pinmux_generic_add_pinfunction(),
  using it in several drivers and converting pinctrl-msm to using
  generic pinmux helpers
- Add a generic function_is_gpio() callback for pinmux_ops
- Convert all qualcomm drivers to using the new GPIO pin category so
  that we can actually enable the strict flag
- Link to v1: https://lore.kernel.org/r/20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org

---
Bartosz Golaszewski (15):
      lib: provide kmemdup_const()
      pinctrl: ingenic: use struct pinfunction instead of struct function_desc
      pinctrl: airoha: replace struct function_desc with struct pinfunction
      pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
      pinctrl: mediatek: moore: replace struct function_desc with struct pinfunction
      pinctrl: imx: don't access the pin function radix tree directly
      pinctrl: keembay: release allocated memory in detach path
      pinctrl: keembay: use a dedicated structure for the pinfunction description
      pinctrl: constify pinmux_generic_get_function()
      pinctrl: make struct pinfunction a pointer in struct function_desc
      pinctrl: qcom: use generic pin function helpers
      pinctrl: allow to mark pin functions as requestable GPIOs
      pinctrl: qcom: add infrastructure for marking pin functions as GPIOs
      pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions
      pinctrl: qcom: make the pinmuxing strict

 drivers/pinctrl/freescale/pinctrl-imx.c          | 42 ++++++----------
 drivers/pinctrl/mediatek/pinctrl-airoha.c        | 18 +++----
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 10 ++--
 drivers/pinctrl/mediatek/pinctrl-moore.h         |  7 +--
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 44 +++++++----------
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +-
 drivers/pinctrl/pinctrl-equilibrium.c            |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c                | 49 +++++++++---------
 drivers/pinctrl/pinctrl-keembay.c                | 25 ++++++----
 drivers/pinctrl/pinctrl-single.c                 |  4 +-
 drivers/pinctrl/pinmux.c                         | 63 +++++++++++++++++++++---
 drivers/pinctrl/pinmux.h                         |  9 ++--
 drivers/pinctrl/qcom/pinctrl-ipq5018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c               | 45 ++++++-----------
 drivers/pinctrl/qcom/pinctrl-msm.h               |  5 ++
 drivers/pinctrl/qcom/pinctrl-msm8226.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-sar2130p.c          |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c          |  4 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm4450.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c          |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c           |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c           |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c          |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c          |  2 +-
 include/linux/pinctrl/pinctrl.h                  | 14 ++++++
 include/linux/pinctrl/pinmux.h                   |  2 +
 include/linux/string.h                           |  1 +
 mm/util.c                                        | 21 ++++++++
 78 files changed, 275 insertions(+), 224 deletions(-)
---
base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
change-id: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


