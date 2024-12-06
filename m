Return-Path: <linux-renesas-soc+bounces-10999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD259E6CD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 12:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745C6188413D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 11:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2841FCF60;
	Fri,  6 Dec 2024 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dABlAaeK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B91DA0ED
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483638; cv=none; b=CTqOqsPtBcbqux4YPj+eCZ/BEzIwMfX5wNnC07eLgw/5CKssbHaZmw1FKHHHai7qqdP3EtksnVHdiPoPmeoYBpgEBeGaZJupFC1+DiJIVNB2g++M44JGUGnRc0RR5dNP1skqlYBCyHlRfXs4LPhLw1hlAr9AkVQ0eJAxUVnmqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483638; c=relaxed/simple;
	bh=dDR4+Q0bwup8XiwfT7f6n2a0gDrV0vi56ih3uackW5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TpyBB5vnFKsM9JTs9CLa8lgEmjTAw7JExDJ9ganwUShw6uD1+0jQRI8TC+9GsU1R6IheSlDb2P8q5HuoryLErxVs/lzirbjEfCz9+T76f1qwdXA7UDaUyV3E1BgHeqCzfujcRpq8uE8oxl93CC13s3FqSDStWtNVwqar+twFgJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dABlAaeK; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so5368697a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 03:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483633; x=1734088433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNv2zbazDCZ/pWBKvIEuI2Pxd+zGHz/To3nXkUZrj8k=;
        b=dABlAaeKFe2g0SBgd2s1oTOHlV6y/JXrGEIbqbVZgAaFRA/WmSNy2FHxMFXD0d2eZi
         t3LxiM0jwHHLmkPXuKy+TXx2mUJwKTZO3Huj8sDlCaYIdrdYJxgKFXJkUKwweeGI3AvX
         yG4YsNZNLvdrdlrTl3oRu8FVcGLq8reUEZ0pAqRx/l0dOJLH+XFth/oE84/JkTkjNjE8
         +Ke9WjhkA0N4VfK6/2VV8aHJdPbq61+NEa5uGVYaDkgSHiyrmuL8fTa1sD0cR7pw2I1n
         lWEQzh5RdQlww6uhQxTk4JaqsA4tccmAAzVU+2rOQqT4ygsyJfx+Dm5P1MNCh22J5iaN
         o+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483633; x=1734088433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNv2zbazDCZ/pWBKvIEuI2Pxd+zGHz/To3nXkUZrj8k=;
        b=sTT8d4VhBLQXoOhwhf/VQ6+Mu83UVsdfPRKFMD2n1ZIPoUr3dCvbczduIselC2L9zo
         GMLCoSqnVeYbV1iz2UKCa4G3MDWm5fx2bd1P5016RleWn0oq5yot/2h4TIHOhgWK1F4p
         ODUUWafjcflGO+9MjU9s7gpF+TICjnieFr6DuOYHOhBpfyqJAB3iBwfCW8/n3dohnngp
         EaGcj87bp+cQy9cAMnZOWNQeQT4iqT9sRzCr+VPACGxptXh6HZKMwndRES8effACRhzU
         QKVVb/yTULkaWJUoMgIZLDPtfwu78SlMtC7TjQkVm9cOXV2S6KBHY4lSYmsX3A7ddk6I
         G4ow==
X-Forwarded-Encrypted: i=1; AJvYcCWxfZoyjocA6UVunM2u3haPlTmd3DFoGdmDpVNWjWdFu6Osb8oa2qfo+UsDX3h9ilHfo+/QmMLoN1j3klkMG2sM0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhMN6zadRgwh9JCp+mXDWkUrVi8/AU/IDtoh0WAuEOSzAY1R5
	rFZvmPAasWewoSC9lt5AEIK2VNaMMoGOl3tn621fo0OskixOTJZX+vfbmBhCteA=
X-Gm-Gg: ASbGncvY16mzGkVFSIP0bQJccxumqmZ1WN/hB9B9d1YfwvPW2nksySthiiDjXm5dLre
	0SsDzZZLrtav6wQBldB7T2XrEhD4eAetVkVq3RgVe/PjrsTCBPVs4anVG6dc5XUmXpQq3Ei0GVH
	2QxfWtBOfmJTRqWiv7aI4imIiq9xNxscrXsHHX0T5IYkTSYtRm1yx2raXNiHnxm6MCbxi9LAGsv
	l/Xb4/owQzSgngbgX/ry1nmaIpAY/54BBMnYzzXzB8/xlb/rdF1XwUP+2fkXZGTLqNhIs3udGnz
	kryO
X-Google-Smtp-Source: AGHT+IHll3lGOqyFO812VEboDgJwa6/Nx08MKrC77gJO3Ig+etbaCZN0rl3zYI2kKOz7kmgwe+LwuQ==
X-Received: by 2002:a17:907:3a0f:b0:aa6:2b21:ab5b with SMTP id a640c23a62f3a-aa63739e4e9mr254496166b.12.1733483633411;
        Fri, 06 Dec 2024 03:13:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:13:52 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/15] iio: adc: rzg2l_adc: Add support for RZ/G3S
Date: Fri,  6 Dec 2024 13:13:22 +0200
Message-Id: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds ADC support for the Renesas RZ/G3S SoC.

Series is organized as follows:
- patch 01/15:		adds clocks, reset and power domain support
			for ADC
- patches 02-07/15:	cleanup patches to ease the addition of RZ/G3S
			support
- patches 08/15:	enables runtime PM autosuspend support
- patches 09-13/15:	add RZ/G3S support, including suspend-to-RAM
			functionality
- patches 14-15/15:	add device tree support

Merge strategy, if any:
- patch 01/15 can go through the Renesas tree
- patches 02-13/15 can go through the IIO tree
- patch 14-15/15 can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v2:
- added patch "iio: adc: rzg2l_adc: Convert dev_err() to dev_err_probe()"
  as requested in the review process
- addressed review comments
- collected tags
- each patch includes a detailed description of its changes


Claudiu Beznea (15):
  clk: renesas: r9a08g045: Add clocks, resets and power domain support
    for the ADC IP
  iio: adc: rzg2l_adc: Convert dev_err() to dev_err_probe()
  iio: adc: rzg2l_adc: Use devres helpers to request pre-deasserted
    reset controls
  iio: adc: rzg2l_adc: Simplify the runtime PM code
  iio: adc: rzg2l_adc: Switch to RUNTIME_PM_OPS() and pm_ptr()
  iio: adc: rzg2l_adc: Use read_poll_timeout()
  iio: adc: rzg2l_adc: Simplify the locking scheme in
    rzg2l_adc_read_raw()
  iio: adc: rzg2l_adc: Enable runtime PM autosuspend support
  iio: adc: rzg2l_adc: Prepare for the addition of RZ/G3S support
  iio: adc: rzg2l_adc: Add support for channel 8
  iio: adc: rzg2l_adc: Add suspend/resume support
  dt-bindings: iio: adc: renesas,rzg2l-adc: Document RZ/G3S SoC
  iio: adc: rzg2l_adc: Add support for Renesas RZ/G3S
  arm64: dts: renesas: r9a08g045: Add ADC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable ADC

 .../bindings/iio/adc/renesas,rzg2l-adc.yaml   |  37 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  53 +++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   7 +
 drivers/iio/adc/rzg2l_adc.c                   | 423 ++++++++++--------
 5 files changed, 316 insertions(+), 208 deletions(-)

-- 
2.39.2


