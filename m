Return-Path: <linux-renesas-soc+bounces-12215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A3A14EA6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 12:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B9393A8D50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 11:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7981FCD08;
	Fri, 17 Jan 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jqCTYGI1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26411F8EE0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737114355; cv=none; b=MjNe1FrYscwlvM0/Wi7mMpP+ApGkwyWg4wEL/lIWXbWd0wdn921rJx5upktRc0cu2axqAHnomdTFPsNyrI9Dx/OWoC3ECRtIOEITQhuC/JCEDyFY2UnyF6zxnjvtCBAF3UlKURjYwgAObGAdV4sNjAby0cue56W1mmEQV5aZsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737114355; c=relaxed/simple;
	bh=TxX9GZPAigyEqICMU7mAfPmTnURHSzNAAjMsT2EtXsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EHXwxzB1FyohkequE/ZWo2jpxcHz3GFYgv6boTo+RMWlIhcG2HFNGXS9S370GgWk+S3bab0GF94zR5y2TVBHMbU9R/hFLzEG+gk6MY7KTkzskxwuCxFP6rZ+aRcR3jPIkZja79boFBwziL9tfelAqPLr9XI2PpwmLJEVbk6UeKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jqCTYGI1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a34e8410bso1008189f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2025 03:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737114351; x=1737719151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SX4E5nOs9sDG0cFz3WAmPbWBhgd4TVZdnDk/oMMP88=;
        b=jqCTYGI1vlYKcfSzqyIIAsqV9Yz/TuD70j1MSc35bTH0mPRvnJSELc4yS96oQyv7yx
         dZIJpUvqi+RET4qgH+uOS+gbcP68vZXsa+WJbOS82oaZEOqsW1uNyhDMQQ9TTpUWpvOO
         G79TqTq5X4XRmVrvKdOFxxcThd7zz1lExcM92/8QbvarQUFfp81KKaWsdHduGR8iyVGn
         ghbAIcAQIjginD04m8z7BVQM6x5+HIqPjKhjqIl7WydPo0v2q110o0gEoP/cDcclYjeP
         FmlDsUvV/klCSJYw2c4rHVh1Qr3YhxOV+olQIcNbQw9D3hy1IvUDg3R/iQxERUT8oA8l
         lKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737114351; x=1737719151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SX4E5nOs9sDG0cFz3WAmPbWBhgd4TVZdnDk/oMMP88=;
        b=LR9fwOWGpiEOU1FnDuBlGolgPkKO2hqctJkjfe3Kt4QwZUC7tnw+h5W4pXnUi8rLiR
         dND1k8dv56cb7vm0LnjtUHeTVis57hAj9VyrBQY4izB4UxZPwTeUB8z5tgiMKkrIBozW
         6cK4QLLBxJdaGYi8kCnfBFGyQzV0hb2VNBk2JoX3dVSxFAnYKj78doA4NDmGXXEzmk9q
         asPnio0yLzFmv//SOsQCT9drNmX06/19Yw9m1murge6D74LQIwJgW5JXclV91r17XNGf
         ScxLeQN1axphSARGvIJrSbSvelp6MMZIv1oI6CWDghk7EIvbZLBaEM48tdZMX3Kq2nSs
         kC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoGwgMnMSCxbpvMq/D9EMgWQboTBjwx1GWm5LH3vErdgN36Oa6pwJzsDmT92HAxKu8cBMHxHE/XyxBDUUIxB4XOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzeqf1SM2fMKQazbNZXaRzyCPkUqqT8uUTL1NiIoIn+pJxiAHj
	piIifuoBieRoISYGjRWvLovfAT4Pqkfjtvee9wGFAetdQpcP3h+a5DaiS1Auv6Q=
X-Gm-Gg: ASbGncv1FEZdPJW1JQxRlBoqFHT09+q8TSIcwmvs/CSPfkML7klnD/tneM2q2I+FhUW
	iOwI3TWlLzm1YnWrxWfX1V2aeKWFXdewlH4paZ2W6w+jnXc40j5o4lKXoMQ/yt3btUA09VDmVIV
	bGom2BQ9fMQVRMPDsDb+0Ju/wgnroCfWAOF2NF1SaZu+PFgijzUMk0ndrZQNflVJMAUtYddoVmA
	ztOI2+i6i4VzgLZ03WRHeBDfhobH9jqjAl1rSbz5bjTJ5rMnp+BkVwN60uMX7bTbM46vqAYNVjT
	8O7WAl+bhEw=
X-Google-Smtp-Source: AGHT+IFnyQealSLAM40HDbjd/9KHWOb1sGSNaDORrtaRZtmtd0iJ6agBu8P4BDVsNiR07l+34VbthQ==
X-Received: by 2002:a5d:4e52:0:b0:38a:88bc:aea4 with SMTP id ffacd0b85a97d-38bf57a2304mr1575293f8f.30.1737114350925;
        Fri, 17 Jan 2025 03:45:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aab8sm2348496f8f.57.2025.01.17.03.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 03:45:50 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
Date: Fri, 17 Jan 2025 13:45:38 +0200
Message-ID: <20250117114540.289248-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- updated cover letter
- collected tags
- updated patch 1/2 to drop devres APIs from the point the
  runtime PM is enabled

Claudiu Beznea (2):
  iio: adc: rzg2l_adc: Drop devm_pm_runtime_enable()
  iio: adc: rzg2l: Cleanup suspend/resume path

 drivers/iio/adc/rzg2l_adc.c | 89 ++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 35 deletions(-)

-- 
2.43.0


