Return-Path: <linux-renesas-soc+bounces-7491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26193B692
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 20:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5B5AB2144C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 18:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202F716A38B;
	Wed, 24 Jul 2024 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsSlwCxG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE9B26281;
	Wed, 24 Jul 2024 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721845372; cv=none; b=UbOp/stBLj3gyv839TgSjsm/S2JlNFlvLmQv7wSrZTKnQnqpk64v5O0vj3r0Axj7cvVXtW4Pdsv1WwO063Y2aNZYUAE98l2/Na/0nKut/Zh7U3u7l97F68XrPDuoMhsX/NS9ZHvS135llkdyUVkYT7ifhvs1N0RQlNBAcEcqU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721845372; c=relaxed/simple;
	bh=KP8gSj+a1mpvgNJnmfRSJCfC1GJn0BAsMw3VIqypAJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TK5f173otFJjRolIzPJ9WfT9ipkTyTWTS/Vx/8ypgnZvsyCjXsfHyoseeiPAiQNRLK9KV7Hg898FMdo+2OrTkKpa4p+QacNrr3jtxVO+9DplVdiXy3B6VusRvdCG9nwwXnnQSLqLoCdfW2HlneS+5P1j6MeWyYuE5vSnJivgBWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsSlwCxG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3683329f787so16622f8f.1;
        Wed, 24 Jul 2024 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721845369; x=1722450169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2AqFzfDpjrbg+Wx895CZJJvSib1dLoHHlUdkcF7CksU=;
        b=VsSlwCxGzTypr47DFA6Rpo8rmlnuwfv347NAkKuRp2d00c0bCjcVz/Ip78FSVGkKxL
         8rGrzObxLFDenM8z4fgwzchkswetw+dDuRXggJ2Aw9m0pJ82ZHgAwdww6fyE2l0PogsX
         4V9ERAhRFhAjRDDXdiu6vC7T/aLolUu9R9H0oyCEL/Do391XGT6CTSGsqtshUWAZiexx
         EjcBXordeYH1ZYDsElZUzWwGh6SxJ3jBSn0wt/f20gY7NgpKF6RhulZCzKlDURtK3jcr
         ZziBAI6zvRCItHeyiVva5GrW17cyKDrRH+O/cDTPSq4H5QnSlunkLxaVAObVLmsVRm8B
         sdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721845369; x=1722450169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AqFzfDpjrbg+Wx895CZJJvSib1dLoHHlUdkcF7CksU=;
        b=L+xPX7ZsvcCK9KTrETkrX5O9GywKpvdq/xUL4CS7JQMaHoInm/+qSjCLchfshEIPTP
         dqIuY5302zL6LNry+oZ49aHdZF+hSggOvEWFT3mewuqRxk7y5R1m6wX63wKJuXAm0SuU
         KIQ20wr1bWYwUaY5BpM8DoM/EsVSNWOol7tPUZsPlN6/1yiXShafZD3oUDAqZYF27jjS
         GxwJGNttDC57cDNDyhjolm0mCvIJ2iSl08i5vZfq4DCHzDY4c+RlQYqLzFQISyVXyaPL
         JTUNFdUXpETuAdFTSGFQ+8lx1WT6Gg1ND0BV9kFl1KTAcC3R26zVqWQbtMxZin4gVLP2
         Sa3A==
X-Forwarded-Encrypted: i=1; AJvYcCUDNiKBG75IL2EIG5YPf2/YLbNhWCLma8zD5/4gAR/8xtN7zoCmLd4lzowmDlnpKdqINHgZHtxx+cx36ykQISp4BnppniRa971PmXmDDPos7YfM5JYA3Xrgo1GZ2e60dmAbdD61kqJ5E8Kh9SvfeWp5EgGKnfioGGb7/8xDSjdAp6uq+BCGznkz6/7N
X-Gm-Message-State: AOJu0Yx+1xVPb9mcvZQhJQ/w4NhxnNd3/OtqxOoD6hrlJfLWiE0Rx5aB
	HbN2xRezud8tuy/n3WvaXsBMuiH4BXVjB5wGsoaF6XBm6O4xvPHyskigLfgTdjU=
X-Google-Smtp-Source: AGHT+IGYJK2JnRESrTD5oSmbVhcwZpbLYnFWtITQgWIrXfGXfnerulg6NifzJUTKdxrjf5QUpgdSTw==
X-Received: by 2002:adf:ffc7:0:b0:367:f0f2:66c1 with SMTP id ffacd0b85a97d-36b319bd7b9mr307340f8f.12.1721845368355;
        Wed, 24 Jul 2024 11:22:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868b5fdsm14909882f8f.38.2024.07.24.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:22:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/3] Add SD/MMC support for Renesas RZ/V2H(P) SoC
Date: Wed, 24 Jul 2024 19:21:16 +0100
Message-Id: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add SD/MMC support for Renesas RZ/V2H(P) SoC.

v4->v5
- Since the SDxIOVS and SDxPWEN pins can always be used as GPIO pins on
  the RZ/V2H(P) SoC dropped adding regulator support.

v3->v4
- Dropped 'renesas,sdhi-use-internal-regulator' property
- Defined vqmmc-regulator in top level
- For special handling of internal regulator now using of_device_is_available()
- Fixed comments from Claudiu
- Rebased patch on top of https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240626085015.32171-2-wsa+renesas@sang-engineering.com/

v2->v3
- Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
- Added regulator-compatible property for vqmmc-regulator
- Added 'renesas,sdhi-use-internal-regulator' DT property
- Included RB tags for patch 2/3
- Moved regulator info to renesas_sdhi_of_data instead of quirks
- Added support to configure the init state of regulator
- Added function pointers to configure regulator
- Added REGULATOR_CHANGE_VOLTAGE mask

v1->v2
- Dropped regulator core API changes
- Updated DT binding
- Now controlling PWEN bit via regulator api

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
  mmc: tmio: Use MMC core APIs to control the vqmmc regulator
  mmc: renesas_sdhi: Add RZ/V2H(P) compatible string

 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c           | 1 +
 drivers/mmc/host/tmio_mmc_core.c                        | 7 +++----
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.34.1


