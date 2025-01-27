Return-Path: <linux-renesas-soc+bounces-12574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD1A1D605
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7ED188743E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E191FF5F1;
	Mon, 27 Jan 2025 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nR3i/O2B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299818D;
	Mon, 27 Jan 2025 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982003; cv=none; b=t5b98WhuhmyiQZkn9FVVkAq0P0MtXDSkREpqbueYK7W/G3pTBRO6jpKTBgon+M60ohjncP250mO7s6FoP5NN+jRLnpHZlf0jQ15noB4ytt2rFjRU2olG0KqxbMBWIrN3+m5RLeiCv3HvgdvxUylkdmSp60cdt80ddxqtIs9CFck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982003; c=relaxed/simple;
	bh=RfFf9mqe7wnUpvIjSrHj6CQMvmZLwVEjIiP2MewLm8g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m0Iv/f0mcDHUhZmFRGRar67voBZfssKMoyBjimvSzkGTa1KTpAZtIXstRLkQJjhZl6eqK6Pfbidv9FzEAiQYaoHsJi2Rz68SMjZu5mtdRwFNe9QuDJ9/KozJ+ac/TTIFKuuLdRSH/tscwh7s9Hm7Jn3wsrfVKkvR/6dsquKfLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nR3i/O2B; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436341f575fso47838325e9.1;
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737981998; x=1738586798; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z8eYln85d4V0XxkISkF3B47hIlXSQBbJiZ4zG36gYUY=;
        b=nR3i/O2BEQxrScKBu0l9nQOifuyVhqT9C8TMzmncQ200b18rnknRa6MuffgX4DZ3GI
         XuA3QAv/v80Kv9fQGjr09gcUgQ3EXFUMChsmYluW4v6CyUqXSxoZS0RC0sNYJjIbOfLv
         PVEVg++rIPJmFszZRbz+fpdl7wrrozXvxglqY6ZmuAPveKcymp6TFsJSS9HVpvaOJ/m3
         nVBT5zngPT8CJgqH5cA6X9xsGh03qZOSEuqa1AsNQr2cwelOn8Ll72ci//NwJoCOy1RA
         luQgD/LR4x6f87MJcM64YumXrJpKClqHbP0ol0XjGtz/gwN5A3EQwXfwtZ+H0CJajWiQ
         TW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981998; x=1738586798;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8eYln85d4V0XxkISkF3B47hIlXSQBbJiZ4zG36gYUY=;
        b=cRQQIEU2bkRXffzuF+PhNj7Az3pDu2nLgWV8JAAhqtZ/Z857+nhxqEFUBsHCwfvBQS
         5Pn7A2UKcgkm/3DbK9Bbs36i3XWFv3LqSMjAgv/TTq0P8d8aScmcOLG6dObNQVANFANv
         o3fV6MYiuSKsJBhsYhMhsKybUCy+G5mmQ0Kpz1YF7JxDB028Icc5H/DhcYMGS6DeiZd3
         eJtDqR8lEmUBvRmv+aWNCjEVYirPviH73+kqCYC1Z+A7cJvtEChKJDf34WovB6zVSvmM
         YqL5nD1fdYZFavNLdO/oVgRYXE72GEpdJXfIZGXest3UAVcbYij8XRqIZDJpxpu+gLD0
         tXzg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ8ilDXagVDJ65eWzxLvkUKZl3ANw3tejUl3+76A/TTM4foAEYRkNKoyCupIFTKhWTQgIJdsvaCjR4QCI=@vger.kernel.org, AJvYcCVn5mtDc3UT5revjaUOEu9rfSPdpEXtKvGGZFfXrSVhLqz+HtWBqQcn6CzNHRKZuDroUB7jTaGUIc5CfKP6akNdQkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQZ38n074+MBmvpOY18jxf7QAk5teELE13Q3vT+E5esGgaeZI
	d3mhgrL+F/1gveDhoQV8+ZcJlQLTFqpgY9p3S0K0QLR06NUJIJCD
X-Gm-Gg: ASbGncvJN9VKbKWdGLaDTK1bYEsLgxLFLfIutk8HdFf92rFqGRPI9/GnVDJC3/v+P5+
	pGNyYuMhDNjTg8Ks9jBNNzgYH08vnPuweyJP+wdWwAcJIwkobCU8ybcDJ7+F7/simB9X6Ehp2p2
	Oh02MAw+qxFE06V/7XBTgWzYeMKONMWM2ZZuMxsIFNAQYkOxRA7wBfpRwqjwciBn+EW6BLK7qXz
	d5nhSYdAJ+4tYEeaAdxPVQuEXSlzl1ctM+9CW8WVWURSeVHdbseB+ILbOIZxLd+WSEvDoEuAsb3
	g4qa
X-Google-Smtp-Source: AGHT+IFfSd38Ri9jN8sfQ5L5B554TUZX0q25wsFyyX/2uMgyGS67py+XFULHlQy6v7HbU7SVRYe6KQ==
X-Received: by 2002:a05:600c:3495:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-4389143b450mr317083695e9.21.1737981997803;
        Mon, 27 Jan 2025 04:46:37 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b9990sm135476565e9.29.2025.01.27.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:37 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [RFC PATCH 00/14] AHCI power management cleanup
Date: Mon, 27 Jan 2025 13:45:55 +0100
Message-Id: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOAl2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0Nj3YLc+MSSRN2UpGQD8yTjJIOUNGMloOKCotS0zAqwQdGxtbUAIVP
 XsFgAAAA=
X-Change-ID: 20250113-pm_ata-dbc07b3b0df3
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RfFf9mqe7wnUpvIjSrHj6CQMvmZLwVEjIiP2MewLm8g=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AqHXy802/pdPDCEw20R6+hBBw+dOLQVfY0K
 QKOcufY0oGJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKgAKCRDnIYpo1BLC
 te79EACIeSoH/vfRi6LCb3ARwUq4Q7HhYCKxv2xDX3f+4IFS6pryCyaXp3kgdqBqgNYaMdQ5ShF
 VKytt+DR+0DGoHcn+C1yMz3KxmukzDBedfB8k+fdD5hjGgh795mkqmPw6E5AETkN6odr6wAyzIg
 tWrhzoJpeY6SH+gkPflAR3Tc/PXkxWMQgV5zCrvWb3KmYDX/BrBPHX0A6LwyF7L8v6t4As3cIHH
 QC+bBsP+G0uA4AFupeTs/LMOX+UkfCKthpVUYsspVDUpXv6ntLa/zQn8F2lhD4b3U9cP5OchTmz
 g76Etrn5y2YHML03AKRXgtNpQNcpyedeIHMY7I4EcyKhK/dka5UTl/sM1W18Js+vQUbDo+OhEQo
 uerK1Ke58MwavucFUFK+hmqJtJJXwhjOqUUzAFRoVSWNLuod0jGTTB1rGC6IasIdP3cSsOYxpF3
 AJqZ0p8Vpad0JWvKza2mYOsdtAMvX4ym8T6iwt70ipD2TONcNxhaNuLJYc5Ae3zvTgE6kjd5Uph
 hS0V69QysEsSK6BhUOHKlR5Y6G3/nhCSvV9iTjMhfMP+MToZO1ZCZrKN/J3FtuVHDDZHeNHTZ49
 sMTOG3cHWP5kkCzdI0rnBPZAVzQlmyvrDmr+O298eFnNIKSWDq21+i7ubogmftWYSINmMsEQ2j5
 VG38IVjlMtsqAIg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Several AHCI drivers expose suspend/resume functions in a way that can
be simplified.  Using pre-processor operation can lead to errors, while
relying on automatic kernel configuration is safer.  It also shrinks the
kernel size when CONFIG_PM_SLEEP is not used[1].

This has been compile-tested on x86, arm and arm64.

[1] https://lore.kernel.org/lkml/261f9fac-82de-4f39-bf5c-cdfcee917588@gmail.com/

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (14):
      ahci: brcm: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: ceva: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: da850: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: dm816: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: imx: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: mtk: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: platform: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: qoriq: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: seattle: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sunxi: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: pata_arasan_cf: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: pata_imx: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sata_highbank: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sata_rcar: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()

 drivers/ata/ahci_brcm.c      | 6 +++---
 drivers/ata/ahci_ceva.c      | 8 ++++----
 drivers/ata/ahci_da850.c     | 7 ++++---
 drivers/ata/ahci_dm816.c     | 8 ++++----
 drivers/ata/ahci_imx.c       | 6 ++----
 drivers/ata/ahci_mtk.c       | 7 ++++---
 drivers/ata/ahci_platform.c  | 7 ++++---
 drivers/ata/ahci_qoriq.c     | 9 ++++-----
 drivers/ata/ahci_seattle.c   | 7 ++++---
 drivers/ata/ahci_sunxi.c     | 9 ++++-----
 drivers/ata/pata_arasan_cf.c | 6 ++----
 drivers/ata/pata_imx.c       | 6 ++----
 drivers/ata/sata_highbank.c  | 9 ++++-----
 drivers/ata/sata_rcar.c      | 6 +-----
 14 files changed, 46 insertions(+), 55 deletions(-)
---
base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
change-id: 20250113-pm_ata-dbc07b3b0df3

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


