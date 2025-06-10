Return-Path: <linux-renesas-soc+bounces-18024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96558AD35C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 14:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E179175E49
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 12:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2165A28F929;
	Tue, 10 Jun 2025 12:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x2m+D85o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B528EA59
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557586; cv=none; b=Rgpm562HVejb0BTMaDlIMiNfn9kLsCx/6EBap/sx72cBQHTIiX3zCcMY5Nz2439ZTBo9Y9Q4uyIWHV1jl4QmrfUc/FnY5KykEM79clLNAeKCi7APx4sLs7fc0zjUCvMIZWgnX1A7w52pQGLzD4jtHGxqzQwtkM++LKhf8eb2Z34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557586; c=relaxed/simple;
	bh=YM5cOjvkImDluNeIECuvYCT7f/hhSLiCc5Z0btqYPAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mo1tkn+vO8KMm+cPxdWRGGXvCmnEOIrQHeyAtR1jb29m+W+S0eibtgi4/4kADHSzBX+peBiZHRTi3v2Pr8aupSbLBMp8qcObUz+UJICfnUtEcPwwMe/aa5XYLiu0+5yNzEAWQcReTF0MSzL4Hk0+TGJwgk3CPJQixUMMfhTVah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x2m+D85o; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2109082f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557582; x=1750162382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le0aK+IVPXNrNAOYji4i4jCtbavYpjFKQlnb+jNZ6sY=;
        b=x2m+D85o5mtbqj9hivPGRkbFqF5QWXuoSPsMrkKBN+37PYHH4HH+0WiMRdc5Sdwpg2
         aihTIiVrDPdj7qHT3K6zUY93z+JmcgBKTS4ZHcINXUeFKnGyecv5shwY0NTFqMVv20z8
         jLett9yX+W2QQCHtQnffVldSyyQiE8NJBY5FuOWqWKY5d91YqUuVmCJJ+jLR4R+AZLiv
         /yNvOcOlM3InpcAQyZT+xPoN1maNoo6BHgmuzSkjppkHKPFILvrWXUnrNUya0p13pima
         xJWLA2L6FkbJpXzittIcnKKiRhzVlDvR6tX1eXyIzBD15QNLDX3IUgt5R5WaEAOcLbF/
         9zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557582; x=1750162382;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=le0aK+IVPXNrNAOYji4i4jCtbavYpjFKQlnb+jNZ6sY=;
        b=RtgkQg0Iwf8+XiLIecmk75We3NhYZ5mhu4cvdJRfSvfn6lcAb63bQZnN9hDP978wad
         6O1oKGwG3FPXAeMc/MA0pQCmoaJtFCR7qhXlVlExufBkiBoSEMFr+yvGiC505FtLbOe1
         4hxyD91O8f1YKQGF7zEi5bUm4pfqTFum7EzuEjs5EXpSbBRjsKOzpCYlKqpl4zuHn++j
         0NFRkbXJyKSVS+OpWGDz4c6gHhjSHP/WxCsLigZ1vrHD3yhgBGDsot4QKuwSVJ0wiq7h
         1UGBoJcRDZeqqvS9eSg4WlLQ/ah3QlJM2e4beTWlnSnRxK16C3x76X5d93J5CNF9/MFf
         cyKA==
X-Forwarded-Encrypted: i=1; AJvYcCXfIK98QjdBltmMbuSGdWutqgdLwzCbfvOI2N88qKqvHq6cCJW3V1VGGGnWykWPFcFt0QPXzYHiNQDXthg+U2x40A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzagSbzBb5YYfOBJlumdM8BfBGU9X5F4PwOOm0a0/UZin47SBMq
	vcrVHpf/W6PA1QhOibxAY80/nR4Vdx5YtMlIMZ23z0J5+6e7TNFy19cKhgoukDt6Ax8=
X-Gm-Gg: ASbGnctMHdWMwPhjhcdOGhOcDC/PdWD+zHzA8p3JzHbKucpMZaz6joxdPueNL8xtIYI
	ulwIW0mQXlduZ4+0LXB2pZcmQ3Ok5GmGxs4899x4WYnHDp0x2pHiGsjrkI94uFszrdUlK+Ac9UV
	rhk9+ENDIHiK0idfNfZff/AWePD66Xsl63o5Dv7AflE15NOe9Bt9QhszT/BEGw21++0JB6wxafg
	myS0qmNenxp8r/Vh7cXQ3ISKgv3TA3J3W90ur1CR9cltvlVxF5hxDIlup/VhVcPZBAsEKS5nUkr
	m9Ap9NI9Zt6WhE3VMCvVR4eulXBIVPJ5nD+mlkYt1FvNdAoLPUEJrKjT92bOB8jfuNZKBWlvBu5
	Wo9lAMSmpe8wMw0bngA==
X-Google-Smtp-Source: AGHT+IHtuwgbAB28mjkjsgeLFZ8wDfI2Y2ogosy9kF1ck/rOXLBqv8pI/FyeIKnEC4hwL0TCuba0WA==
X-Received: by 2002:a05:6000:381:b0:3a4:d6ed:8df7 with SMTP id ffacd0b85a97d-3a531cf55d5mr15185230f8f.59.1749557582546;
        Tue, 10 Jun 2025 05:13:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe85260sm9841035e9.0.2025.06.10.05.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:13:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi
 720x1280
Message-Id: <174955758192.1700488.11354565917020465872.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:13:01 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Sun, 08 Jun 2025 16:28:16 +0200, Marek Vasut wrote:
> Document the 7" Raspberry Pi 720x1280 DSI panel based on ili9881.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi 720x1280
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/808d26afdcbf1abe5176261afbf945825652b748
[2/3] drm/panel: ilitek-ili9881c: Allow configuration of the number of lanes
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2f7e4a6997362a929419fc352ad8f424143ae482
[3/3] drm/panel: ilitek-ili9881c: Add configuration for 7" Raspberry Pi 720x1280
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/29a9b3a504c0d18bcc7f0547371409e9dcbc045e

-- 
Neil


