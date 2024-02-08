Return-Path: <linux-renesas-soc+bounces-2502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0370D84E9A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 21:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CA2DB2E231
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 20:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A66C383BA;
	Thu,  8 Feb 2024 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BVeZdwrr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4DC38DEC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 20:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707423704; cv=none; b=dcVw6tDUjUywIb7YG9c+TO22NDHg1mP15sAIk5Ss2j0b9BoWaDhr2o4uBA/kVOXY7SKeO5b43BcHD4JakV/TkwLyrsE2yXMSBhjXU+z5c3YMSP9U1CbLWUXgIOk5xM95KDMA611KRlYdcRq9BT5xAkFd2nrezVt3+hd4JhxK5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707423704; c=relaxed/simple;
	bh=tsee4NBKtAR96KWrN8Sd6UvcENo+6pEmAXhvCXNQMq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZQGm3gHQ/WM/hOGU9s5+P4EPdpgJXzsXxPi959riWidjkgfNdOunkeZ5HNBY/wiwQmMzvPF9e6B8P7eZzJknpvayXWcFuazNzvoOU01t2QSd+O4aGvZEFHCmHssJytYdytQ2EKPNDdt6m3sn3ELxBYTGXOI7Ezj7HCQ6Br44f7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BVeZdwrr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33b58ca0b95so48443f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 12:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707423701; x=1708028501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3acf27u1UG3FXBRbQIS8gUvuFH8u3NdpIthkRuoAGs=;
        b=BVeZdwrrCLaIVIFuK2LY9K5gYOpCsreks9oeZtLWj/NF4VNHELY4kYE9IXsjqUctJ/
         9g1k8bHjHo7wWDf1aAsZSfFaAL9cwvNrk3w5Tu/NJ9fVVfw4LnR2M4qzxk0e88Ao831Y
         niXLyt5q/O7/U4AW+hLVn+UF0xgHrzCNFCg3CytLOnB2U6GwjpzOx1dOG1MBk1drt+Ch
         9deIiQKgrNaYNGnXP25Vf4S/4FLBJmzpNwwUXm7Lisf8qKvH0B/uVu0KcuWDWCJMdSeL
         U4okl5jGkY5wZ40pfD67ppnstvZ/BmNvSxHIKL3PHhQVWBZBU5aUb1HY+wP+w55xKa4p
         PRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707423701; x=1708028501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3acf27u1UG3FXBRbQIS8gUvuFH8u3NdpIthkRuoAGs=;
        b=A+m0WSJsup1goYzqES0DdFxEaQ5gy7qosoxIGbBJtIuqmqDhjWnmHgCySa6+llQw7X
         AbLlrLHhy4lEwHfTuJtT/Ut6v0DkH975XUGjIJsUHTXZRYPXEyhg5VzNA1PIL2dRVCLk
         h43piSbdHDnf2h1JUzSaXlcM3VWgLjZD0xqsMk2h2JLQ26phNgeIFG2qD+sfLAb3OUq9
         xc8MFB12Th8am5LFfD+nJg8jvBHufRf3QCMdWud4sSOtiHAjN0UeTK5q3apnZjkRz5KG
         XqNxuCAzQ2Gvn3/OQLmhlr2JJqpEmarOIPwKFCxe8PbWQVrnUChbrC10Vm2Gbq1yARQy
         44vw==
X-Gm-Message-State: AOJu0YxrKLq9OA1whE0ky44N3RVXaUZ+fNRDpGOgmuss9IvcNyRmrdvQ
	qb9UWcT7RpZESDvgbr6G8wKBizwGHuhCTIORfN3jnCAS54taY6MWtYn39Y/w48g=
X-Google-Smtp-Source: AGHT+IFUWsEumF3+dMYhr2VTrnxGuMPs8G4EV8UXVWSxI4vbqAdO8nTLkOk8hnwSe6Tv81llsq5ixQ==
X-Received: by 2002:adf:f891:0:b0:33b:28c0:7c98 with SMTP id u17-20020adff891000000b0033b28c07c98mr349299wrp.61.1707423700730;
        Thu, 08 Feb 2024 12:21:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWntY+LUqqaL/5/EQFIUEI5qSZCAvHwoNIb4PBn6lcNZRcol6KYHwLo3eRIa2UjHTXrWcyeyGLdv21pn4gWcBuGFBjLGWBk9gxpgtXfKt6l6kspZ9qvKBkF02ORU4wjY3i3IAPLeWkejOyjgiXpJ0LEUrnZUkgRkQeTlyDU0uE4W24d9iPWuT+yBSx3vy7XyYDo7u1Yibwa3WNRd5kx8QijQw=
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5305000000b0033af5086c2dsm102548wrv.58.2024.02.08.12.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 12:21:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] mmc: renesas_sdhi: use typedef for dma_filter_fn
Date: Thu,  8 Feb 2024 21:21:37 +0100
Message-Id: <20240208202137.630281-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use existing typedef for dma_filter_fn to avoid duplicating type
definition.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mmc/host/renesas_sdhi.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index c1fb9740eab0..586f94d4dbfd 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -9,6 +9,7 @@
 #ifndef RENESAS_SDHI_H
 #define RENESAS_SDHI_H
 
+#include <linux/dmaengine.h>
 #include <linux/platform_device.h>
 #include "tmio_mmc.h"
 
@@ -63,7 +64,7 @@ struct renesas_sdhi_of_data_with_quirks {
 struct renesas_sdhi_dma {
 	unsigned long end_flags;
 	enum dma_slave_buswidth dma_buswidth;
-	bool (*filter)(struct dma_chan *chan, void *arg);
+	dma_filter_fn filter;
 	void (*enable)(struct tmio_mmc_host *host, bool enable);
 	struct completion dma_dataend;
 	struct tasklet_struct dma_complete;
-- 
2.34.1


