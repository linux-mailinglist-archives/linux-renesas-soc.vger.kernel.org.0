Return-Path: <linux-renesas-soc+bounces-18048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E04AD4ADE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 08:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FCB51789C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 06:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09FA227E90;
	Wed, 11 Jun 2025 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uc7j3yv1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DFE227E89
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 06:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622453; cv=none; b=fs0eFhVpkp8hEM3N5OzOC+8J1LOKOepMsAkUBhb7GkN9AcqHeaRjSqdnvFnz9VpRu/gNMr7IXDrOtOqf1iBeP02Co3JaY8QkWvZMF+hFMsVOlWcDVNmwXQmrxCigzdZvWaGx8MC8BDne3/y15AIlh5i2Sw3E5sFMR20f89/qAVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622453; c=relaxed/simple;
	bh=jEd48vl9QSQfzJRNBpRv6p4cKnnNhkUJ4fLA7sMP4dg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ESgQXI2AeI6WykLk5pVnjPhevGLNXZ0F6CZmzNv/xPDG9U+RqjU1hpv7qz+nzI7nZW4LPMGBvydi+Km9mllQMDNaICt+eO1wegeYXOJU09fYiZvGNuXK8sjigIkib16lXdDctuGOEGJq4X1vA0t4O62m77uYfBX9SmGopyNn6xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uc7j3yv1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso408875e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 23:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622450; x=1750227250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlyv04vogoughQAdjKFOOQI6+Za2bCSuZln2DyzNVIw=;
        b=uc7j3yv1jJywtUPV0xhTVFvSohTeVN/mPSHeaQ9PniEBIUyAOdz3NfIyoV3vCvdRWR
         De2ikoZgVYoab0atnKaGdvv+kB7ecRNUxwk3HdEZ+CURyNI3ehvyY8CNeWe3Clygn+Mm
         YsID45WTgq4ZfXMoeP8X3OLxecBq8molDW/85PoEgJ6yUaYG6pBzwXq2XUw4hf+XlYbw
         XZT+WmUdQEt2a/pq4exudYwFDfHnWbbgYI03qTrb1lR2cO8wp7GnA5H+FyrqWh49vvDD
         SHXahlMFEk/ADTfdwG3WSnFomXaNcFwIQyI2gSIvDXlHP1zCL1cMSJwHYHWnAWSNFERw
         hG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622450; x=1750227250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlyv04vogoughQAdjKFOOQI6+Za2bCSuZln2DyzNVIw=;
        b=pJGu8EVaElAkOpBtDKdz+dGcmUr6VQEZ040yT54IUHKmwgKcf/zAp4Lp3cvW/6oFyk
         ypLwVihYWRj4I/XcetED7nzw9S8ERvrvtU1Xufgz0fNgcp+RzRrSrf8J/oqxxA3Ii1tM
         eaQN9oUrBZxBkkTDRk3wR2CdIhH/RDDwa7C0180K+xGejnguFkU815w+pFWCigIPdZmz
         OCfOQOnp5NMyRjP8FyChU9+FQSU9FVWeVv2wKToRU8HjKQEdl+uiqEQaRDkzC2/oMOZ3
         ihP/N95l4RDqnY4FukO15dzs/PRneUkn1nhoApT7ZLMHUqB0ADeUbd7LFvf8bcB/0F4h
         Yrvw==
X-Forwarded-Encrypted: i=1; AJvYcCVl6QFYIE1SWTNZaMj+XLeDvl2FE51XSVgryGuQCp3ESds5mygB2/I3NaSsTJDRODh4wrmHLAYjZBwF0gUfJCq8sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuC4UzQeJWcFDm6hsqBLpcy/CNulAyMgjl7+Zu8k/3GpxAGL+Q
	NqidsN+tHkRLTw11t8geTFnTXtO7JGaai+c5ZaQp7NEi4oZlSEVnjLoePeeuhg1Jyso=
X-Gm-Gg: ASbGncu6iMppZngiUtfTZjAd6Brplzm95aBIkV84vTStRzPJ5Dpyvr2OT3+xrqK1fTM
	SPjKyqv6UCjYJzwwkF89/TplqvPR4kOowR/wYbqtdDMv6lIb0ZsBQfO2OyRPgfKi34iWll0QJL7
	6ttmV+keECUnvHGBCyZJd2ERgFqGf0Ee7Lfd1U8B4tJE3g3JncLG0Y6AoPbIMUns5FP7ed9nrqn
	9lq/0hjI3Wdc+7L4kpEgbUHU962gArQCUOAlA8iNPXOflc8lxvQjpzxtaFKmbUKCXGzpYYjJYzi
	JeJuG6l+e2pjFKcWoiIKTWv6QUz4T0xJ0cIJTTU3BY5AoUEQW+S76ENc+1+9UQato5FbbVcF80L
	1jZtu8uY=
X-Google-Smtp-Source: AGHT+IHdRXjfhWjLOdwo/Es6Crc9zuoJuSCwsTyx1a1IJmVOPmaXxFQNpnMjbvHQ6+89WTmnzm3cfA==
X-Received: by 2002:a05:6000:288e:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3a558821396mr547717f8f.13.1749622449979;
        Tue, 10 Jun 2025 23:14:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and
 more
Date: Wed, 11 Jun 2025 08:13:32 +0200
Message-Id: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIweSWgC/32NQQqDMBBFryKz7pQYTTWueo/iIsRRBySRiUiLe
 PemHqDL9+C/f0AiYUrQFQcI7Zw4hgz6VoCfXZgIecgMWmmjjG5x5eA3WdDHkDYcKHmsXK2osuR
 daSAPV6GR31f01WeeOW1RPtfHXv7s39xeosLmMZJtWmttbZ4LByfxHmWC/jzPL+k64GC1AAAA
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
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4396;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jEd48vl9QSQfzJRNBpRv6p4cKnnNhkUJ4fLA7sMP4dg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6ZNJXNtzDS06LfmSN9fRLSYJEq6TBJKxjlO
 0BdYrKgNxuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkemQAKCRDBN2bmhouD
 19wvD/49T/2W6MD/HM9DqX8B584NX/5doowuan1+HGbgL34Jkh+d7CgyP1/jT80yenqBpDEMWD3
 Ck/IBEYyVtvu9+lBHSavpcGJimI3dvzrS2eIQEYHrv+Db8ILvy2SuVEHWV/SsYTwrQwOFnMpGvW
 9W/ZSKMpl9m4M9tAVHaDBbkMl+Tb5ncycLl6wFt/FsGS9t5Cx2rco/bWPa2MKncWcM9GcsA+2qs
 8E3IELZ63OxMUKovUR0i6iB6rfsJQdSP4qfVLCrHfQKh1mtC2RtQvtSTeTxCP4gOFwoOkDnqhxT
 15x4Pa3hOLuqGQQ07HCsCypN8/p1cAnUGs43CorB6AvmkX+W6f24hElt4yTdzuSXdIbkCoRJ0Ru
 5lhPuh5vXCcYpuGDSVgWG79t3dEa91VeieYekylNWvWQ2AJVwUWT0FUEI5MFevKXuqYvdRw3CKy
 HWh6koZO844FafrzJBAEBAqai2FBax1mQOSMBRpLINtogb1nAKviRdDOWfjMbThMZYrnQhSDwv5
 UPDEC+1fbQmFThXN6Yqbm40F/AyOypi0XO1oAdDCp5+Yscm14p2nyyP6+iZvOY2DWEROhfLuPMw
 u5/9PfeVRutqtDCyfBbpoQgW2VkWNSctUpZgDM5ju51b2N7iqATLm08lXVHj/020ojBZ33Ew4L+
 uvN7ZKqtl1zf1jQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Add Rb tags
- Patch #1: rephrase commit msg (Geert)
- Patch #2: fix/require dependency on OF
- Link to v1: https://lore.kernel.org/r/20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org

Description:
------------
In several drivers pointers to 'struct pinctrl_desc' is not modified, so
since core does not modify it, it can be made as const.

Dependencies/merging:
---------------------
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

 drivers/pinctrl/Kconfig                            |  9 +++++----
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
 36 files changed, 70 insertions(+), 69 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250528-pinctrl-const-desc-3a40e39eca15

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


