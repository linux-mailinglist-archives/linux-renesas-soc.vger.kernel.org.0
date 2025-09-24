Return-Path: <linux-renesas-soc+bounces-22334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDF9B9A1A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA532188B7B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27FE175BF;
	Wed, 24 Sep 2025 13:47:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D771E230E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721620; cv=none; b=Wle0hA9ggF19wOt0gFPfbrRe3kaGBH4rAR+YWyoT+CQgFBLc6NQr5vUn3crVMVq+wJGo4xtoe9VyrGvQv9fN/Eh06VkqwlXzbmuE93OR3zTv87SLf9jYaaehrSBadc3GJzJy2egNjay2ly3D6iCibanISK3pgTMBl0Xo4gos4pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721620; c=relaxed/simple;
	bh=4ufVBo91j6b7vQS8nx77668ZnFWJ1UYtSUBtzw1k6GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cu4A+yqhPpA1oMat7nNYoYWngJCeChOld6u7Pja+Bfel9XJ0qTg5rS2oQnrp5p4GYcHL4upSNO9++NHWwd3dJCidqIjULPv3y1L8pTT4kQhV6+98gIKTOieURuTT/LLF/KEgbzMc66Yzeov67Po+Jokqy/PiSWwbGJTJ9Aiy+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54a94e39720so1614242e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758721618; x=1759326418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLzLZ4lMMfD6hJdHfjXaI/aoGDFxs0QS4To1e7V5pJk=;
        b=OED/w2ECObF5fA0UbyDhZc6Ck9wH1DelyEdUIopHW7TLba9CFpH01YAFLlBh7pqlGT
         sk+U0D/PIPI5wHjIkOfEpBS9+ht6q2eTo0nxwggJazqGd+WHSaXtox70r1n9/nrQGlH0
         cMr4MQgr0Fc/zQ3T32DxdGpXhdgnft2i5RzKYpfYoHi8pEQmB4LvrMDUpYnaj6QiMnF8
         zKXzuAuu17yQD5xDvhJe74kul6GvRXOKCjp8dj7/fwRNv7yppLt0neMCsHMCXnipXkT0
         8JFttfQcdFYvHsz1Wl17A+QzefoT/YrKl2CSqzpYeDIUfGFkr8SdwT7ZX2qKrP9u2KtX
         cEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTIrfm88j7kOJ4fIHcSlupjAkyTHpZsNL0FKjLnMyK6+KF2IyxaGxlw+DvlJi1H6vyZIy+SfdP4oO0/u6i3K5gpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynLJOQzxWkE/cxSvTuyO9FSsrfxxShYnqRwIkdk0fddlwLSw5p
	LEOBCKaw6PUUI/iTgPagHP/kxCirPZmONs9z32dIryCBE+lOX0V4W/jdQ235IkuU
X-Gm-Gg: ASbGncs0csL+Ai8zRvO+eUyQ1jfy2t8/LsO15w23R8H65auOQhCD+UeEAL64zAJR0EB
	n+MzzpEp+LOpi5mSpXnl/NyCEyXNnZqNYI7XIP7lnmcTnkSkZfBEM5551EC5MbLrDGUI1MPv5Aa
	4THVBmL/DK9SKvguzk5o4DZgpDkw4L4YpGxnIH1Uix+89r25qSwNbcBBoqOQpin5oB/B56Q4jl0
	HbfltGfUHqf+QXrfD0BDt12OHvQF7+dFYMUByetxNhgUnk5g3kP6ASfH+7mD77TttnaeCjsYpXz
	RNObMwDpSA75BOUNfYLQdLCPfrRFTw1tpxTqcj3R6H2li/NJptqyRmjsm0qCsJXL/+KLrEWP9oO
	b4SANJJONRkzGBhgtG93dcOw0K7nQ18Cyo8vZ9d0vbSIcWcR4oIrXJFKDwS9/cFiBSbWsCjJHrs
	I=
X-Google-Smtp-Source: AGHT+IE5DDhieV02thqyBUmSUQaU5KVFQWayAtlSUvrk+edijASsDeMdG6nunBl3258pQYLWwDwxZQ==
X-Received: by 2002:a05:6122:1d12:b0:54a:9e02:f9c2 with SMTP id 71dfb90a1353d-54bcae6f6c5mr1818280e0c.6.1758721617326;
        Wed, 24 Sep 2025 06:46:57 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bbc96ccacsm1756415e0c.3.2025.09.24.06.46.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:46:57 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54a94e39720so1614233e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYc7aNneEJbRy5cTTFXtshfiBa/8Ik6geU+tHajeQfV8P/5MrooqTEFLMC8YxGFoLj995og30NoO30N4HaC6MV/A==@vger.kernel.org
X-Received: by 2002:a05:6122:3d04:b0:544:75d1:15ba with SMTP id
 71dfb90a1353d-54bcae9778amr1949729e0c.8.1758721616800; Wed, 24 Sep 2025
 06:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
 <20250910142657.1148696-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVKZn-YfBxvwA1wgjksvzZK=NPzaoTCPRur_Z=AneLA6w@mail.gmail.com>
 <8672a8c1-26b2-4b65-a30e-a4c3e0f1f32e@linaro.org> <20250924093132.GA1062104@ragnatech.se>
 <69f09f55-fd2f-47a9-887a-e9c2cf7c21df@linaro.org>
In-Reply-To: <69f09f55-fd2f-47a9-887a-e9c2cf7c21df@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:46:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWt07VP=i_5S2bm6yaRwOovzc4hgZzYaYvpqj4nronxgA@mail.gmail.com>
X-Gm-Features: AS18NWDVph8AWywi1xllkD9wmtBCKD3KT56Evui3Cxt4BbhVbP3DxFNagKkV9X0
Message-ID: <CAMuHMdWt07VP=i_5S2bm6yaRwOovzc4hgZzYaYvpqj4nronxgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/sh_cmt: Do not power down
 channels used for events
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, 24 Sept 2025 at 15:43, Daniel Lezcano <daniel.lezcano@linaro.org> w=
rote:
> On 24/09/2025 11:31, Niklas S=C3=B6derlund wrote:
> > If it's not too late I think we should drop it. The issue this work
> > tries to solve is a lockdep blurb which highlights a design issue in th=
e
> > driver. But the driver have function properly in the past. So I think
> > it's better I work on solving the blurb without any regressions.
>
> Ok, dropping 2/2 but keeping 1/2 is fine, right ?

1/2 is a refactoring without any functional impact.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

