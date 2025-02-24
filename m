Return-Path: <linux-renesas-soc+bounces-13566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034FCA41E91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7871C3A3AE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 12:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EEB23BD10;
	Mon, 24 Feb 2025 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Jnc6gTSf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20821930E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740398781; cv=none; b=k2S+RqQrlPgD5NoE3UFWfc6OL509RdApM7iS+vYRuLZbVoSblK8lAZkdMAYahWpjYMqTuPDaxEOEiKSeBNmrwdH8V3wkZs+tzbyemeZoDdAP4PA28ZLiMaBFPp3A0txj2hq2vcIOYmLvPCEV6HI19CPheF2RZPnGugBmEBhxAvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740398781; c=relaxed/simple;
	bh=+Agf8UKAqGkJL+3vH4U8xbAblWaOBO6N6JdSJ1Tt5UU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mgfJNt/P83QJHVD/JTDieEGfa6rcgl5MS50Dz491cj4U15kE+VxDQf6X4oWDeYWBWADBSJ5jRUumqCPdmD5Eb49wpOSa6PbtBbr/OzVbGbU1FYpAFiLRjvs5i/3knA/3yNp5HWHS2qsv50bwvOl+v4GdqNNuk6468aEtBwRSUuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Jnc6gTSf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so49023366b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 04:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740398777; x=1741003577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo1Gcpi1KHfmTJdi6Pn8yyGXw/q62BzySSHgB6HQ+5Q=;
        b=Jnc6gTSfcUR9TI16u3EpYvVJD3x7xViIIqLxSbDNkqMU2kZB1l3AZ8+7Vl4RgxWDNW
         vSPo2PUQ6tlM7Yn4oB8VqqNE+uXDvF1yhkzQ2r+3RNDW1eM6qDyV1nT0Z57raOlauxBI
         BVMlINeV+SVrhMiSlNEjOwnpCtFUdUuoPvi4JcmkkK9iJAhwTXGCTDmNfYeSfbyhol5m
         XwUSVb4jaRlmzE4FXfW6PyhCunq24odyi32lCakez4OUAs5GNNA1CRpuI7F62PyrCD07
         ScPBTzl57ageKhrBYiRVCMov5jKwpGIGJwFz/aenkbTTHAuzbKTb5h4gt54m3u8a/84C
         j1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740398777; x=1741003577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo1Gcpi1KHfmTJdi6Pn8yyGXw/q62BzySSHgB6HQ+5Q=;
        b=EVXu6pJ/yIhU9uwja2vRJPnFrrUdKVBDsu3GT/gswGmAyXcLNKraoJuTNsVVLiFPgy
         Gg/+7wN94C1aiuUmLYLnYw3nwfKoZKCuhd67bb4kB4Nc+UcoRAO52CUlmltzdLDZ3h/0
         QplyxehIUWgEkSu73kMNkVsz42zbXMId/R8DdlA8y7KAMXfuprIZMOAUocm1uM8b8wZQ
         BJSwyOmMCbFyl8yTReQZAdLusUufEAt2Zy0GOreEk/IBTgYsWhnz7q/O+gGBlUSNyEBr
         mUb/1fDeDCOJm0enzW6wjZY9J08WvA6u3I0PIDYgHHzfoAuBUF9PUBdEwrLXXIZAGMJ7
         pDHw==
X-Forwarded-Encrypted: i=1; AJvYcCWwjZbqa1/g450oIj3VN1/YNIofNQ1pZ8doFIckLy42w9c8bl3dWzkv99SU72SN020waD7NfmUrxEAhNURuKAt/yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY+3/pWEUWEWX3G0S6sr9GchuUFqmea1GojGAusSb96ZRV2686
	6Xt0t8B4Cu3FwtnRvFRZqw5bf/G8XmQZCZBz5vN8J0yWRea/X64qhuwAgy1MQWk=
X-Gm-Gg: ASbGncukYh8mT7GEuLO2iOKf1Mwob+Jh0axkkLVoAN3Ii6EmW2rzvs6MgYmY5XSywk8
	tnwXVj8ZBVAh+RXxCkKhhzNwZnH0scC3P/8gN/B4V9Sk0TDkj7kZqEKR77rcK4JgrxmSWpddJDj
	lslHk3BwhjuzItpmCFz/HzuCExacgK2tzTZiHkCcWmMCe+C4pW83m26bdjs2lhr+Q4Hap8VPDCs
	XEvKyNBd2bBnNyaO5qpaKpxYDBv0+wBHnrOlb5hx0zjRQ7hwChtLWlkoP5HQi0ieT7yJeMNtMOu
	VOLpD0TwwZB0MDGeNdZLePtrqsK/rni5ElIyShpgKP+8RXI2RDZqjcM=
X-Google-Smtp-Source: AGHT+IGDJzU5NaW2phimEssVYOYVx4z5a+NFOew8SQJlOCu85fp72+5lccWfbGDbcb/fSCXbV+iifg==
X-Received: by 2002:a17:907:7f8a:b0:aae:b259:ef6c with SMTP id a640c23a62f3a-abc096d6e93mr1477881966b.0.1740398777012;
        Mon, 24 Feb 2025 04:06:17 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb978e2c9dsm1598901966b.65.2025.02.24.04.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 04:06:16 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
Date: Mon, 24 Feb 2025 14:06:05 +0200
Message-ID: <20250224120608.1769039-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- in patch 2/2 use a devres group for all the devm resources
  acquired in the driver's probe

Changes in v2:
- updated cover letter
- collected tags
- updated patch 1/2 to drop devres APIs from the point the
  runtime PM is enabled

Claudiu Beznea (2):
  iio: adc: rzg2l_adc: Open a devres group
  iio: adc: rzg2l: Cleanup suspend/resume path

 drivers/iio/adc/rzg2l_adc.c | 117 +++++++++++++++++++++++-------------
 1 file changed, 75 insertions(+), 42 deletions(-)

-- 
2.43.0


