Return-Path: <linux-renesas-soc+bounces-9366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157AB98F68E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 20:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AE2CB22767
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 18:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADE81ABED4;
	Thu,  3 Oct 2024 18:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gouGuzzy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF61ABEB4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 18:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727981641; cv=none; b=Va0mvEhizEm9LfIA4+NRbL1vIwdXNntaF1KsVQqVHkG+VpMZQGPa/Tq0z4xh+VCi9DKQWOf2pnyn4yjuDjLozemNO2YCo/CHgzXj7i+Eja8q1FGIDMl2sPumRrXybbLXd2KJfJN7FKWHdhjBUn7L6VVlON2c4lNsdKzx2fx6YIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727981641; c=relaxed/simple;
	bh=Aqe59oBmHOyl5wWiS1U9TJYJQG6Xi9YPCCHb6ik+U3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHGZQfJb6+b2YMuL2HutNZ+1B1ImizKcN9fLxIeOsRtaKHKDtiKi5GjL6oGBizP27asaClMp2ex2H64iW6e4pgJjPNJTRJaQnamcDFYAOJgNZzQDITjAJ2Tg4t0WloMczc7ospAbbnjwl5nHjkr9L18RWC3NQaywQ2+XGg1V7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gouGuzzy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so12826745e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2024 11:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727981638; x=1728586438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7Rgivd96fCzL22YiGf6WhlNkKr0h3M5JifVUpHx5A0=;
        b=gouGuzzyFyO89iwnUZkliBMHAGJH4D/HjB7voreS9uqMPY8byltWXYYbuxN7jVS722
         OM1hszG5EjzcC5ZRHIVdpLWNfzYMVc+vXZmu+LD4hKOPp0++QVhXeU61wMxvqDyU8gpC
         LMMhHQg8cBNAdNomed7vcGJI4bna0zlByE7uyqb+JuY9Nw/GX2/oC+DRKG1fi7priMAH
         eMxK1xzQqy5eDauvB195gwDLIT7f+asWTxmpYR1jz9rCWwAYcmkcT4a39TNDGcDTCEb7
         ruOCv3AYnqqcbdShNF+qkcTdTQKvQmWRGXW4z2WISnyAgv2PuQj9mASLsq9aIzkpwinN
         W5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981638; x=1728586438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7Rgivd96fCzL22YiGf6WhlNkKr0h3M5JifVUpHx5A0=;
        b=agEF+iryN/7Xzu+oF19D9Z5q4b2+qk2JzEY19mi/U00743/FoggQdZHe4wYItOEeYH
         DlkQxX7E4hH4QcmcwCB+PSiQ8PkwErzKiCo3TIoLawIhYwot50FeveEwRXaSQwAC+/yp
         7FhNGcOTKN5jjnZoJaqjahjkxpEyonJoEQcTRgcxmwLg65zLiWH0JE/VtvNO6GjWFreP
         nBMI6OoZT/IeRAaFjPSMRvmAP+R6rPlaBn0GYdH7XisAucCiuVCUN1lH+M/1HYTvc2rh
         bmigdM1NDVjiadM6YdSVo4ugxFt8JEN8/0CZyUCMmS8B/zj0Aa/4YccsmB29sZUgmj27
         S5iA==
X-Forwarded-Encrypted: i=1; AJvYcCWOHetUXEYLxSS2B8bKnKZaMeMboQnRcJ+EdH5ztn/E2GpIePxrjEK/fnxkD5ap4iU2H8COsQMqDwQ80aH/Qgfbrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzzKS1pj718CoDONfGd6hXWcbdKrIX8nnJEZRdc8y1CE3XDWPa
	QvUkciAYmpGMrekTbuTXx9CfGlq2jwwr3ut1o3mFfusLzPxthLnpaAdFu/va0AI=
X-Google-Smtp-Source: AGHT+IGdMDDuB+X/iH8qp2PoHwumzrpJ170SAsJSIi+VUZmj/upMuarzwVOFa8anmg4yM5/TdKFQUg==
X-Received: by 2002:a05:600c:3511:b0:42c:acb0:ddb6 with SMTP id 5b1f17b1804b1-42f85aa8087mr507345e9.9.1727981637826;
        Thu, 03 Oct 2024 11:53:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d16b:3a82:8bfb:222a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a02ef4bsm50870425e9.47.2024.10.03.11.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 11:53:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar <prabhakar.csengg@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] gpiolib: Fix potential NULL pointer dereference in gpiod_get_label()
Date: Thu,  3 Oct 2024 20:53:55 +0200
Message-ID: <172798159241.47650.3165790189839746577.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003131351.472015-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241003131351.472015-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 03 Oct 2024 14:13:51 +0100, Prabhakar wrote:
> In `gpiod_get_label()`, it is possible that `srcu_dereference_check()` may
> return a NULL pointer, leading to a scenario where `label->str` is accessed
> without verifying if `label` itself is NULL.
> 
> This patch adds a proper NULL check for `label` before accessing
> `label->str`. The check for `label->str != NULL` is removed because
> `label->str` can never be NULL if `label` is not NULL.
> 
> [...]

Good catch, thanks! I added Fixes: tags and queued it for rc2.

[1/1] gpiolib: Fix potential NULL pointer dereference in gpiod_get_label()
      commit: 7b99b5ab885993bff010ebcd93be5e511c56e28a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

