Return-Path: <linux-renesas-soc+bounces-21069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45CB3B9A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 13:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632C5188C2A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 11:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A9E313E23;
	Fri, 29 Aug 2025 11:04:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43E311944;
	Fri, 29 Aug 2025 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465481; cv=none; b=q8pQYhldf8j+WERVWUsoldHTbd3qZvdixRBNpNU9I4ukV6n/LGhe8PPYHOydyyxM0l4LxSGRvYp89utXQMSYLUOZKsyAvjpBDpV+5pKz5sBuI1LHVQ+XlbrOtWGfJbTb2/xj9XGfELKBKKSs5c/XWPbyMah/qtwsfR90en2WptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465481; c=relaxed/simple;
	bh=sSiBNyDXXS7RcuduRZ2UoWnH2RKrGy8/4c9TL9DXg44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJ/6mbbtsQhMzxaRJLnN6uFKu2XGXQ1kGhuLNGGh0QY+GNl7KLsdpjJeSkEkbvvQNWcD9jUWV50KUHHuVZwHDZfmbHs9yWQyy1yekcWXf/7NShtDzrJEUtdbeB+y5yWZHZJdfBuxP19oNoYPhBkT1kWkvLkMr60YAJPu2SohOVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018e97232so633681241.0;
        Fri, 29 Aug 2025 04:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756465478; x=1757070278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhYfBahQ/meOeiWo39IyKitIfgj5nE9X9TMEpjrNtVM=;
        b=sSUkwLx5rZcXZyI6bi+PbAOPM9ZKyiEtfJPhKnossauejY9DQslPZKJdxlfC0LwKdv
         IWyUTE4RkAuDrocpPwCGiR5RcroAOPYmQVc7j/X5F49Y8SJkVxcFXnwgaFg78exlRzJ9
         I7MXL6D+rkcM4LNPbqQTqRO495s+E1qIYKVg7xMRzBSMq1+6mHjdX6PvYSTaCIJ2fbXt
         aFFxtjhmawSfWDjLnUZVW7WJv5GNTS3NFCw93p0ys7VkTtNQL8uMYLxeNlWCpjehaHUu
         hdUx/LOjCf+/E1dSmxne+twPgSjFHfZUGntRUctVB/urC3mkL1ErHqwEe1GtXnayterw
         hsZA==
X-Forwarded-Encrypted: i=1; AJvYcCUi5cpubYf1CwPIVRsusfxRs9Rbt1NpUxdAkQ7Zi6yMDRlBXsD9fq2oivZf8iUTQOBU9ox0WPHWpZw6i0o=@vger.kernel.org, AJvYcCVQBENCcBncT7UusNWkngijlELMSOgyGTVRT0xi5WLCLx72TOrFPO20h8iDPB9LHagm6/wiGHDVMgCTEIxcfLvk4z0=@vger.kernel.org, AJvYcCXAvbb2EBpcyCp9+3NROnFkvP6BNcbdoI7w75CwBRug3RwWqIJEf4wNkd/iYiurA3pEALveTO4ig2VY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4k5bZoZStGLfmDEM0oLbAA30lhff2GjJu6B8pkIB6ZSeRswyY
	VgtdQ307perN1Q0IUNfvqYAVpLyVXKIEqNUPmtefJExTL4Ls6eWqsjZCt8OBpZLo
X-Gm-Gg: ASbGncsfSYQKgh9d1xsrcza6ppq6QQhLWpnE1s0gKfOJSWX0YDBJXJQ9OAZNJ2G31Jd
	8XynZeqVC5xeiJNvN++GiOW2eP5jPcIJGb3i3MBZawFi+opVWzyw5op6vEwpuK6MAbDqdJqERCv
	HOv4/9W1NfDNryGFnbL/+ocTv4JfdwqscBfu2sr6TExBHPK3OqAK1fCWzflnzYvfL3OWkwf5Okq
	8ytQvsCfuDIINk52Gn5qdeiXGIhIkLTsBvuBS84L3Ra3q38r8QdFHeY/M87Ko8MbYeUBUIYiwQI
	B+5fYCwUbhePGehM9pCVYsFDtz2pXsFf49S7aan+jNeNLhS4x7vT4IhS5CAdiGoVK6AoCPMwztM
	GVMTgY7a5KNf4dCNky98eOwEnLxO5MVI7d2NO5J9+ZW9TvYDjpVTOsEPaQaOUZsHQqX3Yi+4=
X-Google-Smtp-Source: AGHT+IHqM1DbbNlG1XUZrlnumvw/iGxU9s3f9lMzwHqoLp688AK+Ws2CW7atvE6grTTal2hog4i9SQ==
X-Received: by 2002:a05:6102:358e:b0:528:2527:6420 with SMTP id ada2fe7eead31-5282536b215mr2192446137.4.1756465477779;
        Fri, 29 Aug 2025 04:04:37 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-529aee96099sm830117137.2.2025.08.29.04.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 04:04:37 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89018e97232so633677241.0;
        Fri, 29 Aug 2025 04:04:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJaqh9iW8qeIscxj4iuCHv+X2b2LzX5HhaSMB9bY2sLxWPXspWw8CrDu4Tv2knGzl5MspZm8W/b7bmm1aC6Ib7TaA=@vger.kernel.org, AJvYcCUPvnp1SjpEfLbNi1TvQcvbEDfI5PfRVZ7BEX6ZJ+oDQ7ehR7VtPqDD93qita2CXKR1lCCtNbuLtbwG@vger.kernel.org, AJvYcCVUDXFJT5FLeLpyhIyvx1NuYeNLkCEC6ofYiS0q6e7/D2piNfQ2eCH1i27nGA4F5Gcd2N4TFUikcAwDE3Q=@vger.kernel.org
X-Received: by 2002:a05:6102:dd0:b0:525:42d2:790a with SMTP id
 ada2fe7eead31-52542d282b5mr3681556137.12.1756465476910; Fri, 29 Aug 2025
 04:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWOMpZo0fVASyDV+XTLmh-o0ozqfF4Za_sPiydsh6LOfw@mail.gmail.com> <aLGAaKYucaW1vPCg@shikoro>
In-Reply-To: <aLGAaKYucaW1vPCg@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Aug 2025 13:04:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9HjP09R2p-PS4KgHKB6UcAQB+zKqN6QYwsboxtJCkPg@mail.gmail.com>
X-Gm-Features: Ac12FXw1eepLRsTfT94A3x9t1CbrGEZZsnpnLyFxjZUhOEIkqQ-bPQ0_fe6I5_Q
Message-ID: <CAMuHMdX9HjP09R2p-PS4KgHKB6UcAQB+zKqN6QYwsboxtJCkPg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and
 RZ/G2+ family
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Biju <biju.das.au@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 29 Aug 2025 at 12:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I believe some of the SoCs that do not support 64-bit accesses, do
> > support 32-bit accesses. Do you think it would be worthwhile adding
> > support for that, too?
>
> We have that already? Check the context after the chunk added to
> tmio_mmc_core.c:
>
>         if (host->pdata->flags & TMIO_MMC_32BIT_DATA_PORT) {
>                 u32 data = 0;
>                 u32 *buf32 = (u32 *)buf;
>         ...

OK, thanks, then I misremembered what exactly is supported and what
is not...
But this is set only on RZ/A1, so my question should be: are there
any other SoCs where TMIO_MMC_32BIT_DATA_PORT should be set?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

