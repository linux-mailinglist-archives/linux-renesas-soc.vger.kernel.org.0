Return-Path: <linux-renesas-soc+bounces-11006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F19E6CF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 12:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54101884282
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E5E20100A;
	Fri,  6 Dec 2024 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="imMOzar5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE0200B9D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483650; cv=none; b=U54lmuJD1c14WcrGMpNLPghT17kPdFBBVtja/IHCWZ7djy3mLF7LMU+CYLCV/8QfniShcEnURW2X8r9+MWGQOhPRl7f+/JudU3na43Lc2kObxY8Ik55FLXxwB/tMUXGwbUP7YXsx8pVfLQXnB5xBA6UEX0dnlNpxvKk3dSjEEAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483650; c=relaxed/simple;
	bh=dEqGILe6UUa2QV4lg2cHxtBVoCG04Pl16cd95wtxMm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WsNZvNFQ3rAliWuzlurKjBH+oVUJPpBGOFZELuoVPdh1PLJO1/PbEoyB+NNJb4v5+fs+kDxkR2P7m8SE3ywxN+y/8zKH3BUiJk5nCJkpMc+tWQOAJbvX/DZCUUHh9UX23G9ifJnF29sQ3wkTT9t04wd5olSbsZvvAiqJrJGMcjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=imMOzar5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa53ebdf3caso352381366b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 03:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483646; x=1734088446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhaQ2fSroT77bogvtIM7JXpl0W5k90kfLSeiQn1uD6k=;
        b=imMOzar5XjEWVg6mv/DR06oioKCfIvh6QHLnxG6xky10HI3yEYK6Dl1YYfPAQrzrTd
         CCZrbF3MUOWlC2tRox/eu/Z+Rkydjplxdew0FPz2yyLF+OfkBxrKLhUWh0j8Mh831xHb
         8ZVZf/UhbVeVApC2w9Wct2YQtvfmek9JBly6lOfBCbmpc+LlR86knIUGGOGDixaSe7A8
         iZp3XvqrApAGMz8fdtAFjF/5H9zpw87d2YZCZl+2d4oCfsiupkTbZegbYLrXaVObhRPw
         Q4V9hG4+2U+icNDTpWi69vhqFm9bSi2d5q4X/qyRsIMuIJiNyKQDdwayFsxJfBIcdbNi
         9zDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483646; x=1734088446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhaQ2fSroT77bogvtIM7JXpl0W5k90kfLSeiQn1uD6k=;
        b=icKELsdISc76iI3XSj/luFdvDAN3xdUXvp9HH6FJqxieTz/2m4usfHBXeoHyCgjhqM
         5NFioQ+J9ZIqQ4PI/OoYv3TaLsZqPKe1GNVUP7mOhOjKb0lW8lFvZIdTjjqINJboUMxd
         h6WEqTRoRbyae/5n2rn3nEKBnoZ/nQiABoD6G6dUtTCZe7cWxvftwXdzZNUePz0B3xUF
         /umZDxcfx583M7tOuEAdbXxCuYqycvBaFHdEx4f9eQxYSGwj9pOxJlFZMMC9bN1KTOn2
         537C6eEa3WBkb3HjJWctAPS8sB6Bnv2edOuxA4rtpSG3j01WLr4sX0xj1ZidYCPCvZEb
         uheA==
X-Forwarded-Encrypted: i=1; AJvYcCWiVUPCm6+zunf1BgLJGxoVMyMwXzOU9FlzGnA6qdEJpEs26Dj+uwRcpOi/2dZzRgyar5j7b0ju5z4OKmJoEwVYdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIToZaIPPB/9zy79rx9G3IoQou2nA7TrDfc4VP4fuOTrMYyIGn
	PO7qULt3CskzuDwOgHV9kaKFQMXNkyFP3TyvYFoXHdpa93EYHnLiIchTWXAOh5I=
X-Gm-Gg: ASbGncueZdWnDLWvQZ30gasUeaLxUxppfLdQ9u5G1Y4rq06DA4KY4pXyiwGSDRP4/qe
	cAcDsqpsSmuHhtG1Fh77elCmGPBUvu84jmHGIIa+odQzhHPD7l21R06AG11Sv0Muh2rwntM7a/7
	9qbB50Jkk/at2llAClVolmbcWnD+iSJmh0gwhMVpEMsO/jeucQPdNlW5uCBokFkI30d84gpp5e6
	xMOIw4QjniDYaW3UURJJmpbnL3UDRgLF62nzdOa9eunfc1lz8owF2GgZmziyg5ZCVTZGIAuAvhz
	p17u
X-Google-Smtp-Source: AGHT+IEde3hbpI6Dn8f4HHeLFJDahnLdyyCKzWeVkTOjBA3NVheYqHyT2l/Eb2Ag14Vr/Xb63k1GrQ==
X-Received: by 2002:a17:906:2922:b0:aa5:4ea6:fcae with SMTP id a640c23a62f3a-aa63a073542mr216321466b.28.1733483646108;
        Fri, 06 Dec 2024 03:14:06 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:05 -0800 (PST)
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
Subject: [PATCH v2 07/15] iio: adc: rzg2l_adc: Simplify the locking scheme in rzg2l_adc_read_raw()
Date: Fri,  6 Dec 2024 13:13:29 +0200
Message-Id: <20241206111337.726244-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Simplify the locking scheme in rzg2l_adc_read_raw() by using
guard(mutex)().

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- used guard(mutex)()
- adjusted the patch description

 drivers/iio/adc/rzg2l_adc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 38d4fb014847..953511191eac 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/iio/iio.h>
@@ -220,21 +221,21 @@ static int rzg2l_adc_read_raw(struct iio_dev *indio_dev,
 	u8 ch;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
 		if (chan->type != IIO_VOLTAGE)
 			return -EINVAL;
 
-		mutex_lock(&adc->lock);
+		guard(mutex)(&adc->lock);
+
 		ch = chan->channel & RZG2L_ADC_CHN_MASK;
 		ret = rzg2l_adc_conversion(indio_dev, adc, ch);
-		if (ret) {
-			mutex_unlock(&adc->lock);
+		if (ret)
 			return ret;
-		}
+
 		*val = adc->last_val[ch];
-		mutex_unlock(&adc->lock);
 
 		return IIO_VAL_INT;
+	}
 
 	default:
 		return -EINVAL;
-- 
2.39.2


