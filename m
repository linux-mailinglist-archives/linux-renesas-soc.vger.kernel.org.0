Return-Path: <linux-renesas-soc+bounces-23508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59586C01804
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EE7B1A6455D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF71B30BF6D;
	Thu, 23 Oct 2025 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNraloUD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C4D311C22
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226452; cv=none; b=krZfC3wvCta8b0m5ahyg3mb3fWNOP8yXJK0Nq/tqYNMJVngE0wI49oQ7A1Je5kKSIoX26ZPFJdOjGzBFXgih5UBjr0XajNssymhrCxYkBdyz/qsLqcUBOV5bteXLMyMYfGqouDDjaQEnyG8dcZ0qm+BqR7LzC8L4cRg9f/PcNdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226452; c=relaxed/simple;
	bh=bSW7rfgtDQGPDS4VUfy3VAbqzFM7dWBO3YRWYHobxFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IkX+pGPeDcohA1/2oeKTpv5jZTtH8muwrgR+slBxRdpzHFDdBPmF9GNmuu6JGM7ha9W5vcku69aOzyPPCMH4IS7nQ/Q1S+aBmwa9NEMmrUaNOB6d+muG/cyk4M813iD53n++xBnajusIH6wo0rNd2pL/hgNmY+NfoKMv8K6SS5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNraloUD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-471d83da4d1so365475e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761226448; x=1761831248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn0n93gjogjSKpUc9SVWlrCOjCRjVkd4BQ8C0NGtc/U=;
        b=sNraloUDRIzWKp8sxjib3o25Il9pF5s2T6luMBW0HkSEQO9LYLKQe6J/rPkchDMZVF
         /Q8yutidAOZIvJoQJQdfqk5EsgV2sGcnikR34ydDoOwZf+lHQwnwAOsda+0yTM/x4WS3
         wfblT56+vjC85mPcRecZJRDGurNkawgeKu/eO7tUej1smVHuVBKl9OGjtpyYZK+zAuvr
         D6QFyI+J+TYDUL5YkhejmyAAmFsgVBHOHz61dkIH0xkIlxkpqlX7xdAaGq+6jeCLg7ZM
         EIFNhQbyGewxiXieYw59xhvJx7Eky1ZcF5fpfyJMBuZmubu/sdDBlMYyprnc3BLnURp1
         Ktyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226448; x=1761831248;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn0n93gjogjSKpUc9SVWlrCOjCRjVkd4BQ8C0NGtc/U=;
        b=SctR7f2HTeluTkwJkaJSCLYU73GHqkiLtvkTDt+DXfaN9IQnqF/aQMPOom53+IYERe
         dZlEYq+Wm2zbtbTup0wczQacSPlSbyrGjIYWWRp74irdnjKXbDpcrvV6gIy+h8YMBspw
         CpVW6g/xhqTtyidDPoTQFy3iSPjG9w8jRYXYTKE1NSa/2In4mMyolJMvrvmkKdwbNN7t
         aiXuV+wcpKDbFI2k0mXnfXPkOeSMHO7ahxNCkkLSGtxIoDOmJUTrt7fdEeuE5P9HZhjd
         QTl20yobOW80/FjMZTokNH3WAE4Aozo8YJLDPcXbwZvrKXcXPk1+zjAtTwhCq5gTRJAk
         QoLA==
X-Forwarded-Encrypted: i=1; AJvYcCVTRSBtDr4koojILqRH3NLGxPSGpYQXxERVDp5X6cbOG9OYK5pxvIjBy9GZBkA2j+q63KaHhPtGq6JJhdKF6Er6tA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvv/XB3q0HC/MsduzGZccdUN7kliOblTfDJO1dIBBjJhYktfEu
	oLKvyAwpl7ZhgKV8m9cWd/5N1+d4pTIo2f3RdUAvMdwyZEx0Y13x0HvVuXid6wT+5wd7y8sSE4g
	nLKm6
X-Gm-Gg: ASbGncvcdoZGBLE19pSuua550J/0FVJ4O1BajeohpWVOx6szPawUuVDQgqi2E+pXCvt
	Xo5ZAxhUPxtu2hwEiiEbgQkI7QISGqUILytZ+WxHczjaZ7ZCsXXS+vX5tdhq2ydvzyWg99+LdBg
	4XQ3IokjXk3Z8BgrFjP5OzF8yTAVXN3Qm3qIUMngdeRAcbFBKV1iKKyFqgjSQcc24a1s+lKpbHI
	N8Xsvt5RymLx4vmhTRol0KL+YEP7E0Vze96Y5bI6Ev7G0wFx3d63OrgI4j7Wtb++QITnYNcpfeh
	ZqBNln8hqQ3peYBvjMPbPhK1eH6OMxh3xIgwxKYwnuBJs56o72uRf+GBgFqa2Hk9QGYWsj6oQ83
	QenTXPQWHVPwhzqsO48WyvdjFT1sfXY28O2FJakOEVjz54YRoSY1iwCuMeLJC6g1Nnt6dcCFHZ/
	FAcvu89gXsn8e6Q0f3dji5OxgLAkY=
X-Google-Smtp-Source: AGHT+IFsde65CJFTvtkSZupSMvUZM0RX7wQDUIPA6gojMigbtbuO0hwv7Ss3zHX5Cl6STVOTHym5aw==
X-Received: by 2002:a05:600c:350d:b0:471:3b6:e24 with SMTP id 5b1f17b1804b1-474944c2050mr39159615e9.8.1761226448360;
        Thu, 23 Oct 2025 06:34:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e75a0sm4037198f8f.5.2025.10.23.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:34:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20251019180940.157088-1-biju.das.jz@bp.renesas.com>
References: <20251019180940.157088-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3] memory: renesas-rpc-if: Add suspend/resume support
Message-Id: <176122644698.70962.12759967875481339805.b4-ty@linaro.org>
Date: Thu, 23 Oct 2025 15:34:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 19 Oct 2025 19:09:38 +0100, Biju Das wrote:
> On RZ/G3E using PSCI, s2ram powers down the SoC. Add suspend/resume
> callbacks to control spi/spix2 clocks.
> 
> 

Applied, thanks!

[1/1] memory: renesas-rpc-if: Add suspend/resume support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/42ec0bc61f052beb0d9a6a889fe746591de74508

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


