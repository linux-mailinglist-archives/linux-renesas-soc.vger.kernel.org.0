Return-Path: <linux-renesas-soc+bounces-20200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EACB1F9EF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 14:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12EBB18960A7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 12:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D842472BF;
	Sun, 10 Aug 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M20Az2Rn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73743186294
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754829216; cv=none; b=UcZhLGAK5nUjWwyBVsJof2UMYt7PxD6XksdierKp51uFyHQq6m03Yte7wxOEsMaNmHQu5sV6DBrvGMQrYTRWEiRQvK7DuWVTUqr3LTyHq5Lg6DUE3pMVOpBn3A1ndqBaPwPGJ8gmPDXv8QKqQ72v2tyKT265zz2sgih3XnSrkdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754829216; c=relaxed/simple;
	bh=3nf59Q9AGWpmOg4VMUuCwsRS1MPEIrcUFh0ePKk2Wb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mLDxVk+34fyoPP30rOutzS4G2BK849DQlDCC4UGLu0ovIewjzoMOG23SFixx0BmqfOrnwC2ggEWaR8GVRuton3HfaeWapbk5zbtRrhIsl1IkeIy+JJhCNZFksJya1ZDUo0X7FWe4div7OmaAwHam3GMiSSd+GQHYhkM4CFRvEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M20Az2Rn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61571192c3aso4135489a12.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754829213; x=1755434013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e/vk1HAe6XwhvBH/Z6ZCTNjAcCh+NxJHs2NAijcEcZs=;
        b=M20Az2RnVwhQS+Anv8XdgRkgg/mPpUkrezFO6MotAUluwduq1InIqUiBq59IKSdFk9
         DoQHEexmg03qSGnHA21XpYIJ9bCizx7bXIZphMaqZtDyRrZ42YxXUYQZqYZBvywpT9c2
         3gy+efh871G3HLy/WNZlwXqCtbbgwzDuqVrXANBiq3EX0+rGVoN1tSDwzH7RkR7iI49G
         qyX276O+1ot2JPMy1n3RF21k0hWz1b9oAKquYInWFc0ahLFzS9EuE8WvYf2TtRZqNnyM
         5LYd61r60BgJ2vH0Cb+VUYSA6c+pER/zXyoTQMGecnVDJNEscjGwHTzC8eKVN7ia/vgQ
         hrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754829213; x=1755434013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/vk1HAe6XwhvBH/Z6ZCTNjAcCh+NxJHs2NAijcEcZs=;
        b=YkehChsne7OIIBSq1FIWmtA6gfDI9XTkB55u6Lz0VxO/ajIVCwF1EgcIxCs8p7S8Nx
         gRAcRz5svSmXFZtzr4+CH/HykKyThn16py3fqtbQLaexaxXDq+vJ8BCq1af2b5jWmlyT
         gSR5N6bDlIl45jBB8SmTdP9SkTFD8dhF7gOX+ayUwifO6k4ZmyXO6PR3Uhk/n90Cerxw
         9vrmFJ9wsfQI5K1LVZOyRDQckRb4X096Gl6/gko44HXFB2gd5swARzXrtKNGJX1pDgfu
         Azi1JS0fQNSo7lphG7Shx61bsdrfKGe31xe+E7JDeomZSi1l20pbJxKVSrrehFvXamlQ
         yXnw==
X-Forwarded-Encrypted: i=1; AJvYcCVF8joshHhlHeR15alxtvBbi0AJeCQKvWLz93i/xybbYApZyl9niWPYTuwK+MUSB2rOlctPGQJAGRFzWClT/ZPVJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIY3PUhbmHX7wuoZxnTsGKefsTpBu70md/KK3/xdxeVJ4QRPBi
	hfhNpsx9mr7ch1qrmWV7EslKyo/IaNRpCjawk1twKx4CeW4elGLGSIbU5j2h5lnVyEQ=
X-Gm-Gg: ASbGnct0/5mAQt8VRwSdZF8zfTWe03/ImYLG+8eZFU567UYFoqt1OHdqbIv+So3DH9f
	i29laDuVXkStAnndd9sHh9PhZoQo0Dhy7Y6uJZJ9sTZGepFcIVASX98WQTia14Uj7WyX0TaOW0m
	58RGnd/U9HMN5PIAPp971iEMvGjdHv4sHu2OtUgtyyxR2sZcv3vd6nyofbM5zT0IK9cz4pVZMyP
	gMI7q79v9x/Y2jpPPKE0G2gcUVSIXV8Xwtud0fL1L4Jhvud//mZMw4fpUZ1/TiNT1egQoFfQfEU
	rHIP/bUQnb9UAkxy6mGsm7/rOcs6KSEFXCOFkCyVmGUXiRxJw1GYhDjOJVtnwJXp5RCmwXYLP3R
	YVED2isi0Jn1/tt/LTXxsVmErP7UeyPe8BKAaS/AW8uxlO+Cd1TWo
X-Google-Smtp-Source: AGHT+IFu5S+xpfZ42LBfBM2LxULYyH7yrjzISc4HpHnHIpHtS77Eg10O7wraMX8ZzVEZ8pKVCi0TWg==
X-Received: by 2002:a17:907:971b:b0:af9:3116:e0ff with SMTP id a640c23a62f3a-af9c653f538mr968527366b.52.1754829212827;
        Sun, 10 Aug 2025 05:33:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2437desm1852203366b.127.2025.08.10.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:33:32 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
Date: Sun, 10 Aug 2025 15:33:26 +0300
Message-ID: <20250810123328.800104-1-claudiu.beznea.uj@bp.renesas.com>
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

Thank you,
Claudiu Beznea

Changes in v4:
- dropped patch "iio: adc: rzg2l_adc: Open a devres group" as it is
  now fixed by [1]
- added patch "iio: adc: rzg2l_adc: Set driver data before enabling runtime PM"

[1] https://lore.kernel.org/all/20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com/

Changes in v4:
- open the devres group in its own function and rename the
  rzg2l_adc_probe() to rzg2l_adc_probe_helper() to have simpler code
- collected tags

Changes in v3:
- in patch 2/2 use a devres group for all the devm resources
  acquired in the driver's probe

Changes in v2:
- updated cover letter
- collected tags
- updated patch 1/2 to drop devres APIs from the point the
  runtime PM is enabled

Claudiu Beznea (2):
  iio: adc: rzg2l: Cleanup suspend/resume path
  iio: adc: rzg2l_adc: Set driver data before enabling runtime PM

 drivers/iio/adc/rzg2l_adc.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

-- 
2.43.0


