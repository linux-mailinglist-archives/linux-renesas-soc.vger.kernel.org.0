Return-Path: <linux-renesas-soc+bounces-20202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D27FB1F9F7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 14:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18E617AA2E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 12:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4DB2580E4;
	Sun, 10 Aug 2025 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZYXEJBSq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA12512C3
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754829220; cv=none; b=MMWuUvU0jtLudifAx1lTKF99HIK33lbQWkeIr0CJLdHO1lGFdjRXCkT+k0V6QFBR2n//IICsxwaPinFWFegOQjXTCoj69riHC8gaUQ+G0iX1sBEpwckRIcS+YfeMLDm9GRAf0cshq9fZEFFmtN01/pW+kbpxUUsF2EnSl3TXgKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754829220; c=relaxed/simple;
	bh=71Zw6M2jWdmfIYc6s1O6BKdyVGRBVJ0JuCrqDmGLOrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AovIII16yPZEY/uioggNKlWLSFawfei9ZQaf0vlMIjLRX/LZKHQa7qXwlWS4+WrXyLxmPfw6BoQUpmO3oYtA5euQn3YHldZ+gJCyeZKEYXV42COvNwyGNENGyyDWgLQn1KXwYpWTxpuqO+aOk7Jki62tWbkFSCuzOAKGoK8RP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZYXEJBSq; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af96524c5a9so468995566b.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754829216; x=1755434016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV/TDtPSqEo+5cYQ2J1jzlBNpBRLHkqgnRcU52xQyv4=;
        b=ZYXEJBSqA80sslOIrXCOU+y1HCZUKmtuhLBBHIAId4Ir1YtgwkbD1a6EODY+RRMxoQ
         YJL5FvLMC6faUauyIzTXdHqXAStRs/hn2x5WA6W1ssFBj6dMutleEa3eV78tAPr5KFA0
         Y7LK5VqjEM6MGeCkR1ThujRVS1TGmLSGPr7TTaioKnqdCtMBYtAddrsXjcpjD0JTvZ0G
         Rqu1ocd1b2IQqGKD+jtr2Eexqi+XZNL6LmbRmVlCwz1WpfZUInbsPK2FQA77F/RYPE1Z
         kk8W6gi+UChMISJdeHYgPYrWUO9qe5zpDTCAAf9sIxlNqaZAkjgmWp8D3iKdo2N3akno
         cMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754829216; x=1755434016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV/TDtPSqEo+5cYQ2J1jzlBNpBRLHkqgnRcU52xQyv4=;
        b=nrek/rejWRBCkUowbkWKsHvLXzO1eekyzCI4Yj1wC662iRbligwuilSCCBD3QAhF+8
         04WeUkwUfvClip2LOkxWqjuBFjh8zicnoJAGbjUIG2JiEKfXM0cCfkh1YpMqTOQYzcRy
         7N/LGdJw6b+qVkpWBCGZtKbmeI0Qg207rsAtuCLNyrjWHfMdLiDnVbV+fi66euU8Sa5G
         fk0JborSFHQ2itHiBfvGv1fiYh7sACB5WyX+ncBdWxRdhgKIPWUdEL0teRCN2+4KCF9h
         DqJF9QTMT3qEbKdDyVfTjNGxCKXO2jeTYZrYPkuyzasspbuQ+j16evxnARUe08Pwvytc
         IfyA==
X-Forwarded-Encrypted: i=1; AJvYcCWReVZN2/H7jCKC3BXmO0zF0vC2HDgKtbMufasMJEdAy7JnQ8Z3uLqkQbT+u+GO1gBNaEZGCTXeT8HGTbg+AgmF5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS5WbT8zLvXaahpHaavwrXwY8IuYUyad3rrhFIsi67v1/e//iT
	8bSYPSheaGWWfxFzq8aph1S0J4y4QcKPG7p1P2L1YQrcr3+CdB/yNKUNf+ZX70++5eQ=
X-Gm-Gg: ASbGncuOVc4ao3x+6YrG4HAGa9KVq6NTPiySbWvYa6RMoLFVyNo+iZlkDxNOlrjgJVM
	TCNcf0rHRpmFrrDNCtTS/56rj0cgtz3eZX6sdtFFERCIJlaHyhTjive36Yp0+ldJZetwjEmZYc0
	sNR37jbb8p6+1R9cHSya8c5auYHE0fb6KMi5gHEmSQGAhvPCiPPNi+5EoWwTZoLpG+r1GM3GKiJ
	wbis6OVP2RBzXlLBibFsL98H0l6WGvJLBwdXvqCIejNJ1WjZFxf354gZMl93toyDdYpv+uypMZ2
	tn7p6wihpQvg3VDM3qJUOxoE6hORSBKCKYxW+VebtzNjVtVwhB1Vm2RlytC/bkRrYv/pPdot44o
	OKGC8+V+WKUsSga8rpoSvY2n4vP/aVICl8YX1E0gsTGQohHb1zemK9Bfj5m6YgCg=
X-Google-Smtp-Source: AGHT+IHQAKMYrFI+05pz7SbKlvMrNUdxOuLAR74amCZyX1EGKun0OSM/Q4gjT8wSLWIIGGUnBnwFMg==
X-Received: by 2002:a17:906:d542:b0:af9:1ee4:a30c with SMTP id a640c23a62f3a-af9c64d3cfbmr922368866b.36.1754829215779;
        Sun, 10 Aug 2025 05:33:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2437desm1852203366b.127.2025.08.10.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:33:35 -0700 (PDT)
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
Subject: [PATCH v5 2/2] iio: adc: rzg2l_adc: Set driver data before enabling runtime PM
Date: Sun, 10 Aug 2025 15:33:28 +0300
Message-ID: <20250810123328.800104-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250810123328.800104-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250810123328.800104-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

When stress-testing the system by repeatedly unbinding and binding the ADC
device in a loop, and the ADC is a supplier for another device (e.g., a
thermal hardware block that reads temperature through the ADC), it may
happen that the ADC device is runtime-resumed immediately after runtime PM
is enabled, triggered by its consumer. At this point, since drvdata is not
yet set and the driver's runtime PM callbacks rely on it, a crash can
occur. To avoid this, set drvdata just after it was allocated.

Fixes: 89ee8174e8c8 ("iio: adc: rzg2l_adc: Simplify the runtime PM code")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none; this patch is new

 drivers/iio/adc/rzg2l_adc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 0cb5a67fd497..cadb0446bc29 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -427,6 +427,8 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 	if (!indio_dev)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, indio_dev);
+
 	adc = iio_priv(indio_dev);
 
 	adc->hw_params = device_get_match_data(dev);
@@ -459,8 +461,6 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, indio_dev);
-
 	ret = rzg2l_adc_hw_init(dev, adc);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
-- 
2.43.0


