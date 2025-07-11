Return-Path: <linux-renesas-soc+bounces-19512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE574B01998
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 12:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13C111C4512F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 10:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EBA279DC3;
	Fri, 11 Jul 2025 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="POXC6jug"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45A027F4CA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jul 2025 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229278; cv=none; b=jLFPoexKOhEOgznUghrVfDCZeUke4if3dJGx8W2PV190XZZ4KffeIHBf7o/uVt3ecHY+wPsbX+4rZc0hwzhZ4VQVnVXnfgckCNN3MlPI3215srq2PDJs7S8YUQo/cp4kuiRGzhFOI7cX62w9NK8J24f+RMEuTE97S86undBS1yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229278; c=relaxed/simple;
	bh=9U5Qw/3AXzJBpxBChR745u6GgyjjbqlHXinlbSjJtnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WxtbCql31/ShZqN8+kL0sY/LaavXhTu7sPG+m5e8t4nRiQFG4IzDqYNW+VNrPHwd9WzMHxOXxDT51c/koKinjE9SlaZDO8s5U4hcR2eXJOPpq7J8b+0/IZnXEpjkyn3VpIe1krZxFQN3G7w9t9dGECdU2eJa3Ke0AeMyfYEbFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=POXC6jug; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453643020bdso14782065e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jul 2025 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752229274; x=1752834074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucM8ujevxCrED8BMR+hWxz3gAzlP3qd37Xf/zMpVXBg=;
        b=POXC6jugrseP7ouxfWlr2cFmAdErlOGj/sKevMXpG0l3pRCAzX48BwwCEpfHUt51nv
         3fYhA2D9FXVWpY2gBBWjfJicYs2zngDBW5o7vjhtnbNM2Z3K2sylQiCVAF3e+Spj8+rg
         b1AXTxJ1kbzHhkFn+zOOYRAzR3dT4veVn79d55nktE6DDuCKUq2TWy1lAC5EQte5qBRa
         ReKh2c4SoesgnGq+ztSbQsiTwLwbI0p0R9kcewYYqsWxbO1/GWzmxazgSZlcwhEaUdqv
         Fzy4hYDGnxZPWobPEYta1XqviDpT/y6TAhJW3YwnBN5SatjINSinndhYFZFWAMu7VpT3
         Ye6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229274; x=1752834074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucM8ujevxCrED8BMR+hWxz3gAzlP3qd37Xf/zMpVXBg=;
        b=WRVmtJkXI2/gT8ICYxB/g0wwFxOTtagOH9e3UKxQWZdocBYu4EAbhxDilnoomtk8TT
         n0ACyk50XptUYWleYTUHZJ+3z+R73LOB5Z1wt4e1eAVNs7idt4vT/pNxa3r8o4j4w7L3
         O/griHX4nAhUzy25Ht6aqJWJ0/u6QDnSIAUrn1LIyWR+t4mpNMIQROTZDyfAdh34eNQg
         o8hQGbYsPIBQn/oJ2NJOtFmxuUuZKHtlNXK9pZ4JECEo6zEYVpLhzdgZPmZDxEK8oObN
         k6I2iXcWGUJkSi5fb4J92Lt7D4BmpFrK/bKSpmkZGfI2rmi4q+y3s3+Pp0jna4Dj6C98
         Hd3A==
X-Forwarded-Encrypted: i=1; AJvYcCXSD5asBb7h0A5V//U4PF+dNdbh/0JT1WV+IK5iIAo8mIligIzx8iAZ80xOtw2DAKvxqr2wYqOgYAgvqiqDLOP5Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qJ9M5SeZDzfZsd0QFgUryz3q0KTIEfWe+3yBwFND98DWxdZ1
	yQAEr9Dbp+d+1lPGyolnxmPvIuvVojuH63GiLY0cVU5IxbWMnS6yThW/QuSoIBhS0PiA6374ry9
	alO6a+zQ=
X-Gm-Gg: ASbGncvOcvzmpbm3J3Z4e+uhtS7Qgh0UfExKz+nz9wN+BvCnArRDDFVWZVD8gkIZ7yB
	CH521jaHiTddYjwVPdFk3YutqdppuxARmeT8DI0KOV1iZ8lRkJ9X6uEoPEgQElVBY+ulqcMsG5e
	PLXAJZWJveTB+XkDRtf7gFH2OXIyfsYhXMMcUtuJxf9VoCLv4akFP6gbq4/Q6x0x3dAUBymvnXw
	vnUcOPb5nSwoUrbsO+np2beqY8ftPyqrxsgRRsRrJk1RNmmch8BDmBzKlMZvNGBlVVcawljxbo+
	S11tKzGnrlTajyw2FSQBcM8bejgLycrYqvONr4Hy770HHcvQGF8OAxvlDVTmUo5QZ/K70Xy0wJd
	4pwpc1qGgBPdWqgJBtzE/vQ==
X-Google-Smtp-Source: AGHT+IFKfLwK0/p6xfFnLGZFXzWGAdSY/SqT9MSCFhGWxiczu2skaO80Yn33FTFBelWczkU9tzk9Xw==
X-Received: by 2002:a05:6000:4112:b0:3a3:6e62:d8e8 with SMTP id ffacd0b85a97d-3b5f18dff07mr2432560f8f.55.1752229273959;
        Fri, 11 Jul 2025 03:21:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4de1:8724:bdd:326e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14e82sm4085256f8f.71.2025.07.11.03.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 03:21:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 11 Jul 2025 12:21:12 +0200
Message-ID: <175222927033.51560.13787916709041612909.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <e201140426daacaa799d73e2f76bfd96b6f5718f.1752086619.git.geert+renesas@glider.be>
References: <e201140426daacaa799d73e2f76bfd96b6f5718f.1752086619.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 09 Jul 2025 20:43:59 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car GPIO driver from SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> check for CONFIG_PM_SLEEP, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled, while increasing build coverage.
> 
> 

Applied, thanks!

[1/1] gpio: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      https://git.kernel.org/brgl/linux/c/328d48cc0a644bc54c2ab27ee584f3510ae8c6ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

