Return-Path: <linux-renesas-soc+bounces-17591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945CAC6733
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CBF83ACC39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 10:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591A627A476;
	Wed, 28 May 2025 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MW7/9SVE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A53202998
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428897; cv=none; b=rFLyIo83hAsYWmatbXOaozTzpJ2ewMCrZlRVmaCAgo1JuP+8n8uSS+R3ZSL8f0SvgBRTBQKTyByyxOcTGzgw4JOu5ZWLZO19Xs/RjF9UFrebyMP7Kx/ireJpeQopLg1YT/tz9uooiXEI3KqDU29ncfrUIeJ9zZt6LSyG0DL+Tdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428897; c=relaxed/simple;
	bh=31q5XaAMlBexIYczbpLSD3TpwdohBFMpqp6LWBCJyAo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F7XEeH9J1zvfAxZIbA5gH2uBcF7cDNgRBnCpYjQBRmiQEQbUeFVXDdDqpWg5ScdGbKYtJhrzhgd864gfgFJsAFgL3NWnjf8oUZIlDURQ5NerpXUBAKTKcFTZXuQELj5CcrQPBKegKN/1mLRfo/a/UpVI39KqsXzAb9GgFMJfc64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MW7/9SVE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442ea0b3b46so4583735e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428892; x=1749033692; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
        b=MW7/9SVE0LCBuR3VdEZQUcZI+q/wrIA8c1C82+QV/i0t6FupFFHSg5l8cIl1L2qV6t
         7a17W8thQR+NdgEGpmX06gW1eFnke2QnUnEkBGLUhdo1fGGdnxFuS+rHMSBE7AXbEHv0
         gRelWuPHzAimrILeHTv/M0SGCacUb8r7OJFsApDbkKmLjBJqjC2WXPqgO9/nDEYOSlJS
         kpR5dayR10fS6Uy3p6x9P+v4VS3QzWafxGvuKub4kL7x5nTbfzt2+utPmDHFiJpDkDNn
         k2NqbIFuSyUCnefkKp1QuDyRx758YiALZlg2EX4EJFALBdpu5TwB8+fimlvfTDTbhIts
         fA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428892; x=1749033692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYGECA6tC+WcTnZvoeh8g+cRlyTZnil5/IN1N4S/06M=;
        b=ZYgYlUhx66eclw+am1kxh4h+mrHHVHlc2i9sorTIumaRUv8TR/MEvk8ENN5VbZB7nx
         WZmro3S8oeGloHRnXgY0f02anhGruXbInL1tmSueeHJv5+nY6uFukRbCUY72HDmDuwaG
         zaBRKLrHWSAuZjwy11J/ltSrMScJJEdr9WsYUU4ebmGXvCWiTCT3bMJj8GP6pA+EVKIf
         dSrneY6JL3CLeEA+5ZtUDTA6I99MaQ/vIoNmiBkgiKkPH6HSJPl9VKopHfIup1UIDhDF
         xLtpVK6UtANX9H2eX7h29q1QeWkYQYF6BjlN4deN2JLmYc4LDVWkiNlgJLBh27YGXRue
         LnRw==
X-Forwarded-Encrypted: i=1; AJvYcCUuPR1DHj4k2kjDTbbWjuCmt8wrXIKeZYEp7uRpNAaEm18AI4JRZJjm+OBPrwklHjxmvNeHeQ1TchEk9ZGa8JH/2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl2pqPBmgdg6abF3FbY3JkP21iqTISw4eEEh6qHmJHy6IhH2Xd
	qhnyDVjgrPeb0/MqwQmdQ5VAkjjO0+eTCc1n6FvEDmtJ9x25GmAofkAg1XfQjbh/OUc=
X-Gm-Gg: ASbGncvhZL4w0WWdTp4nCjQktDccsiH7FXnzYgjngN0H7QHHPeDhCriRgvVjM1cW2Aj
	v8Dh2BKiokNbwbiZxtJ+UfgG5mwtpMCyEXn7RRrExBbVMo4tEZS3RM0JhUnBwKMim7k5Cn67HYu
	fhQ5UuKNqffCoVS7bJSgTwSUSStgjPNITEadaJiguL0I+q6TQ700WXApwPc+HGEpUB86ExN1+wH
	rJH4qKsqaJ5coB0r+VkkLhvaujm5RyTZChUjnpinLrVIgeeGcnzFGYhjgRBzTXR1V5F2E+Ajg8V
	n7gDAGABgYaiKBlmL32pysV56hgwvt3fewcakBQxBFz4ed8i/9THhojXVCVRdYtgzT8/U4A=
X-Google-Smtp-Source: AGHT+IGEfOLQIkgSBlZ2iFouY1f/KgLVcIHYsjuV4CgQ8KecLfZQnSg2l0D8HirR5K2pryTmJCchcg==
X-Received: by 2002:a05:600c:3144:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-44ffbf6531fmr6551045e9.9.1748428891894;
        Wed, 28 May 2025 03:41:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and
 more
Date: Wed, 28 May 2025 12:40:56 +0200
Message-Id: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjoNmgC/x3MMQqAMAxA0atIZgO1WlCvIg4lRg1IlUZEKL27x
 fEN/ydQjsIKY5Ug8iMqZyho6gpo92FjlKUYrLHOONvjJYHueCCdQW9cWAlb3xluBybfOCjhFXm
 V959Oc84fseaE1mQAAAA=
X-Change-ID: 20250528-pinctrl-const-desc-3a40e39eca15
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4130;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=31q5XaAMlBexIYczbpLSD3TpwdohBFMpqp6LWBCJyAo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhIG4ER1L7WtI9n7LAHBv7yR7/wd9Y62GAPM
 YOkBRMFzV2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSAAKCRDBN2bmhouD
 1/WaD/9J3m4W4vBhw2XThuOyRYX1b6hv7wnFg0kwf/oG58B+tqan9UkROsMsYaftbalsBBZ5ZRN
 1M9nkKj1NYeRqNX8GD5zgdOlhg99/xoNAe4tKnXdHhemj/SZnMwRRpjoouoI5MZtU0Wyr3D/iRh
 apzqHY1Bktzyyz3i0o+EX3N6UGXKOyRFk/Nv4gpE89Tnp5pCpCtNpTewhTStIJo5v/+Zbe2YPrQ
 AnR+OeW0EPpY4/9GqX4FIXW/SBGtMEBrUl82vugNf3cxGgJTWmgAVoKYZNsVPsoZ7Cw5w9ZG7UJ
 nT+moUwF280v4jVOMoAy14NfrX3rj2HWST1PKwMiowU5NSmpEaJi+w6xE/2vB6qVh2QW7+3dAaA
 BpZVKNBQeFJMhZ8WdOg+Jh/qQ6uiZPxIFnUZRKqjwl44agPEeENckIbyD1wJJfAA+JkHuc8AiPh
 V9ANQmhknrtWhe7+PeFJI8GfxRXLnum00ByOaQGly2msm7YKUjNC5gshTcRyWaWNB5rCwL7LPa1
 0IdR7g9/Tt/4d5KIA6xWPHTzupJxtq1nsBEZwM9n0z2/82V8a2ByQNlhmzte2qCLPiweUR6oikT
 3AEpIeiINOC5++QtVlihhuU7o9fNUbOyMpEqQNMr5jj0m6eoELYBLii4S7gWJrXGzT0Ya3JNLAx
 mzmNbbD8leWapdw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

In several drivers pointers to 'struct pinctrl_desc' is not modified, so
since core does not modify it, it can be made as const.

Dependencies/merging:
Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
prerequisite for all further patches, including RTC patch, therefore
probably everything should be via main pinctrl tree.

I split several patches, although not all, per SoC-submaintainers, so
reviewing will be easier.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      pinctrl: starfive: Allow compile testing on other platforms
      pinctrl: Allow compile testing for K210, TB10X and ZYNQ
      pinctrl: amd: Constify pointers to 'pinctrl_desc'
      pinctrl: Constify pointers to 'pinctrl_desc'
      pinctrl: aspeed: Constify static 'pinctrl_desc'
      pinctrl: nuvoton: Constify static 'pinctrl_desc'
      pinctrl: bcm: Constify static 'pinctrl_desc'
      pinctrl: bcm: cygnus-mux: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-ns2: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-nsp: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: as3722: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: max77620: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: palmas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: renesas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: pistachio: Constify static 'pinctrl_desc'
      pinctrl: Constify static 'pinctrl_desc'
      rtc: stm32: Constify static 'pinctrl_desc'

 drivers/pinctrl/Kconfig                            |  8 ++++----
 drivers/pinctrl/Makefile                           |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  2 +-
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |  2 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-ns.c                   |  2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |  8 ++++----
 drivers/pinctrl/berlin/berlin.c                    |  2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |  2 +-
 drivers/pinctrl/core.c                             | 13 +++++++------
 drivers/pinctrl/core.h                             |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |  2 +-
 drivers/pinctrl/pinctrl-amd.c                      |  8 ++++----
 drivers/pinctrl/pinctrl-artpec6.c                  |  2 +-
 drivers/pinctrl/pinctrl-as3722.c                   |  4 ++--
 drivers/pinctrl/pinctrl-bm1880.c                   |  2 +-
 drivers/pinctrl/pinctrl-k210.c                     |  2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |  2 +-
 drivers/pinctrl/pinctrl-max77620.c                 |  9 ++++-----
 drivers/pinctrl/pinctrl-mlxbf3.c                   |  2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |  4 ++--
 drivers/pinctrl/pinctrl-pistachio.c                |  8 ++++----
 drivers/pinctrl/pinctrl-tb10x.c                    |  2 +-
 drivers/pinctrl/pinctrl-zynq.c                     |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |  4 ++--
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |  2 +-
 drivers/rtc/rtc-stm32.c                            |  2 +-
 include/linux/pinctrl/pinctrl.h                    |  8 ++++----
 36 files changed, 69 insertions(+), 69 deletions(-)
---
base-commit: 08ea0cc455fbf6f6719b7a4cdcd1d132ea34577b
change-id: 20250528-pinctrl-const-desc-3a40e39eca15

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


