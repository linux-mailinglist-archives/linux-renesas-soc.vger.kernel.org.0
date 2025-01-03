Return-Path: <linux-renesas-soc+bounces-11806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6FA00A2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 15:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D76164268
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 14:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FDC1FAC44;
	Fri,  3 Jan 2025 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OEHbV+Ej"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BDD1FA8CD
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735912861; cv=none; b=ruHp9XFMqhupBGs5jpzAhzT8LJdTw7pucXMfrAY2vXOu37KiI6MLDW6TUd7sh9wDfFH02+hGsGQhsEo0haVW63t4ejcBfhPPW5TvDM4la/x3qFCaW8Zi3JMUHIovuWfp8BUFFxgTAblsPAosrGvWiE/bsnzS6VLZWj/aIj/baNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735912861; c=relaxed/simple;
	bh=t8fxei54uN9o1jvVyQlhHWpPizYdfXuCssnzgSnQL90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BW3qjnnuRk27v4If5aC9TaOOXMwZov0h2KgUKC6hGmOufS01OnqbmZeAlkDe3r+llptG/X/TynvG8cuQWkYrvCoyUAaXOY6DtRW3pmxhrn70VvNzR/noQTivs+cChj03kSXYcct4spGVeJdMCi+6x9GVOEAEx/E2RofIymeD04E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OEHbV+Ej; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso19184291a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 06:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735912855; x=1736517655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJRIeirdBRYDa71STbttzeJBbsC2eIbsmBB0Kex5yKU=;
        b=OEHbV+EjEJYL5CaDyJ03GFqMu6um4qc4CtAniXMZigzWHLV1XzojiLrQ5kGsr8hGjC
         92axwhOidguOYCcf3l4ZkwSthudczwTveiCTNzrgd2BalLrmj76kt2s9HzQy21+zdsSH
         buIMbV2cTekErkbhngQ6IdyVG8fMU1cZogriHQD3UdUNXd9pjCXsVlBIJuN3D9GrC8U7
         cciCy38usx94ni0RrHUOT2UqCrrya+RNIpT8GG0O/ex21ZSMBYulzICLAeylt9uyvqX3
         +UoXLiiOz/5n1bgnZP4fYUEOBbUfBCDxvrpMdtdSQAUNjG1O9srHKfIW/bwrxNyvWUIy
         ypPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735912855; x=1736517655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJRIeirdBRYDa71STbttzeJBbsC2eIbsmBB0Kex5yKU=;
        b=dkKNDZOMtXppFoKCu4Zn4e2yEfkmGPO0Gww4633FptE3TFzYXOWnnKdbSgB8g5V+Dq
         rcSpr+FXBlafKEZ6Ix6ZvXXWzOCVImfd9WZCNCwq2nqgiqKcWaXQtBIMLTPJVu8Zy9dB
         1Hn28jinIlRgBP42PY5Zbb1ytNvwzfKjksQusdYErZpNkR6JC/WZpep5J6w7eAcf8on6
         FxHCU0tiQfRTNcbxLoFbPnLBGomZIhEH/QVS01HHBBUxm26KiywcupXhl1ZJ6UoOYAuM
         H481e48ClgqQ67nbSAGx7YrFcp3DpPPFfW1dSHKj7eAsvS32ir7gI2yfEiGt8c880Ism
         1DXw==
X-Forwarded-Encrypted: i=1; AJvYcCWahttjly5dzaRu6DIzSRuAmLFI+wI+/SvNyeBL30cFn54kGrJuZ9is5e2yHajfmAOk3zTmJJFuqoYBRKinZII3yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZay3AREUWe5/ypNJSxE/hwNfWCXmWKI4UZdRWXGXHmF3UCUJ
	vT1Z6RRueTnO15B0OD0i4eiwScB+c53M2BdT/sanI1Km2nZvScB4CBBLp0ytvow=
X-Gm-Gg: ASbGncuCLGg+rtAzmTWkBMs46qesLwndKd+bntEV50xrkkTjI20G+Vkr4KDlga9oIPH
	8grsHLD5SWEMZCW+hjyfvM62ITi+7HfLZbN0eL2Hpfvf/fMNocVGzcrZCJ4i4zwvQSyZ5rBwCV5
	LSvmnuwIxIsSZ1Zd3uV8K5KadfYvmM1IG0OznGQ+Exfa6cdyaXWZNMVm2CotStCeBxgesLGCF+f
	anxt7BIjQuJsYhbh5pPQuQiNrswsw6PLDsn0Ogqdvk2tejwjZtE3M9koyUDsOGqYHPyLZWck9Mj
	VCs+SxusXkI=
X-Google-Smtp-Source: AGHT+IFSyOQzbinppHxUP9oh8DJ5DHvKPosqPNihCcG+SIUNZQ/slS6mXMPHUj9d0EW0nov+n+p6Pw==
X-Received: by 2002:a05:6402:354b:b0:5d4:4143:c082 with SMTP id 4fb4d7f45d1cf-5d81ddfbda8mr36765096a12.21.1735912854203;
        Fri, 03 Jan 2025 06:00:54 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f0e4sm19502384a12.42.2025.01.03.06.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:00:52 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	ulf.hansson@linaro.org
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
Date: Fri,  3 Jan 2025 16:00:40 +0200
Message-ID: <20250103140042.1619703-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds some cleanups for the RZ/G2L ADC driver after the support
for the RZ/G3S SoC.

Ulf, all,

Please, do you think there might be something wrong on the power domains
implementation that led to the conclusion from patch
"iio: adc: rzg2l_adc: Drop devm_pm_runtime_enable()"?

Thank you,
Claudiu Beznea

Claudiu Beznea (2):
  iio: adc: rzg2l_adc: Drop devm_pm_runtime_enable()
  iio: adc: rzg2l: Cleanup suspend/resume path

 drivers/iio/adc/rzg2l_adc.c | 62 +++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

-- 
2.43.0


