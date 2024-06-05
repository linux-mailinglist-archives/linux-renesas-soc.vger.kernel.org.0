Return-Path: <linux-renesas-soc+bounces-5845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9268FC4F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E9F8B24EB9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B6E18F2E7;
	Wed,  5 Jun 2024 07:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVG+iDhU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597E318F2CF;
	Wed,  5 Jun 2024 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573788; cv=none; b=FPgJxDkdjQzYjzK+mJsZP/uf9fQj9pGiebEH2pPUjCuEUgaMDUntg2dixJV3PX13V5q0/la1KfW3UWM3R5Z4xJFQ7cD30X7Ug0uprs7LMUbmLMrQmS4lS69k7zGTaLVIhYUCZOA7jFVl0h5xj/rLV/Tl9f53I5z+T2+5gZSjqxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573788; c=relaxed/simple;
	bh=nP4ePIFWEZmwJQAvOdkOk187vqRImCjAJbPq8XE0nmw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dyf7jJUn7GivvvqVMHbGXjh2fHrXFz/bihc1yF76IXSipFhMf0lC9KCnsGij3WVoX01edpCysgyxLjqguRcKr1/8cNfBb4D8JiQRH/Gi6OQNP9m7EbmIdtpARue8TD7P8ajZu2fx45Zk1RqXLlRPax5vOPiEQ4t0IZCzLxeqOis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVG+iDhU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35dc0472b7eso5683047f8f.2;
        Wed, 05 Jun 2024 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717573786; x=1718178586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOhtGxO0o7tPLhq47QsYz4F3PypSrX/mlR/NgnLorfs=;
        b=eVG+iDhU3fVg6rfb5zBqoP4Tv3fsChDj4/c0Z3So1zHJ6ZXyTNG77CqmClGsu1uc37
         DbHKfp+EumiUT1YzA/aMriYNQ27ZvfU2/TjvLnm0C/6R8DVu5//5VIwgd4kT6HDc5MHJ
         18mhbnqg51RTASQ1AEYimBiDrDaIDK6cVNvfbUdsyrJZ+WSS3e9AMkDk5hK1Dq2nzwYR
         osPU/b4XI9hyafcegCeoTpbbzONYSqTQBN8v9VXhdAbzLfkhXtChYzWO6AFQNabvkH1h
         8KSPV5sVequzMKf2rutozIiVonQvuZrJddELo7gPWguFCIEM7tzOJP9vBFhVu0sKxbcX
         bmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573786; x=1718178586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOhtGxO0o7tPLhq47QsYz4F3PypSrX/mlR/NgnLorfs=;
        b=QwbBTY1fUVD+opi+mY8ofgimrIe4idLJPVdf427SVH/ULnKIxOVeVKnIABaxFg0ABa
         hx2cNDdUsWANZLaTaV0zvt9PHKj/uHDd1Ye6IHxS/Y359OV7ZmfOcgrN87I5o0Z4rdPA
         QFvtUYpFEkHLK8DrfpnpbLCBalKvqKdKxPBfxLJVX/aQD8XN/Uo3OXcAlT1qA7zrY9O8
         h8sS57tv1fx4AqpPTGHaQZSMC74rQnFhh9fpRh7WGKW9GoLF8miePxQFXgqb8GHrq/If
         CLymdj3b54qieKutgy6PLtgy48aeJ8Z08p5lv92ZAAEQK0L6krCGPehWHuDPTTxsAG43
         lHfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFSDpsfBaA/aExr7RBw0kV5+H5ZQdumCx6bkzHTIaOzp2H5K14+Yn9CeITiBMMaC9iWgYbJK4BxFMGJCLyc3c7KYDEEcyw71b8eaoxRNBqEiA5HBHOnrX9e3VJJxjpAi0pg4LpLQoC2obfSMMUbVk+2fdsN6HBYHQBY+XslzQJ95o5rfmxAUo41xyW
X-Gm-Message-State: AOJu0Yw3oIW0VD+5SgL9PwtCYAQpSctxUqy9gC+m2tEkrPsWlqxg3y5r
	rfgJNZGmCkb0uYhMx8sKvA0TZCTYtHmS8lMz4k8XyF325HLLiWLY
X-Google-Smtp-Source: AGHT+IFTxxhKNPAB6ptzEF7DUS9h2PU5dZgmDN3a/Psf53pQF2NO3WYB4c/tBToMvRP7D8yfoxpn9Q==
X-Received: by 2002:a5d:4d05:0:b0:354:f4e6:f9cd with SMTP id ffacd0b85a97d-35e8405e375mr1247061f8f.17.1717573785394;
        Wed, 05 Jun 2024 00:49:45 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064bbb1sm13527200f8f.101.2024.06.05.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:49:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/4] Add SD/MMC support for Renesas RZ/V2H(P) SoC
Date: Wed,  5 Jun 2024 08:49:32 +0100
Message-Id: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Sending this as an RFC series as,
- New regulator API is introduced
- Regulator support is added in renesas_sdhi driver

Cheers,
Prabhakar

Lad Prabhakar (4):
  regulator: core: Ensure the cached state matches the hardware state in
    regulator_set_voltage_unlocked()
  regulator: core: Add regulator_map_voltage_descend() API
  dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
  mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 20 +++++-
 drivers/mmc/host/renesas_sdhi.h               |  7 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 67 +++++++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 45 +++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |  4 ++
 drivers/regulator/core.c                      |  9 ++-
 drivers/regulator/helpers.c                   | 31 +++++++++
 include/linux/regulator/driver.h              |  2 +
 8 files changed, 176 insertions(+), 9 deletions(-)

-- 
2.34.1


