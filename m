Return-Path: <linux-renesas-soc+bounces-6646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63A9129B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 17:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC396B250C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 15:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44306EB73;
	Fri, 21 Jun 2024 15:29:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E1548F7;
	Fri, 21 Jun 2024 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983771; cv=none; b=RDczOmG1R6Neak9+Jf3kEkygZuBmAmRN13hjY8BT9+qvbpUZ5/mOiZMUCdS/4s5OjGdF8OP3sCpE3pRGVIjkx3Ism3uiXCdjRpX1CVJEf5oA20tFyJKGJWnCP7Hd/VudB0oBVZgmlRvZfY56kapFlR2bAzeZ7kXmxfo8mD3zj4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983771; c=relaxed/simple;
	bh=3W/7GEJUFml+rpFv8YIElP7kB+r4mLIZReTBoCiWIoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5RWTtOlCKCUyuoXjiq025EstC7JOFbrJ1IYK2wcOZk1BK36qPJPsdmLXgI7ukOjQhaifOyObcsu/WnHq23ur5cGHMjDPSzHbz0Pik8/Djpmewt8kXrYTQAf/ZWRD3+ZgkwLN8UAPenrxjNOaDyTmFOOR5MfK1dapPeKrgvFv/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dfdb6122992so2087655276.3;
        Fri, 21 Jun 2024 08:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718983767; x=1719588567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSQbNV6p7MusuGwhIhNByYs7R6IXrxKvQPF0KCrDuNc=;
        b=pc6yfbTsQmLAWdsEtJIxBxh7TV9FnARpaISdeqQvOMNt93r9kNHIzD9/EvlhuJU/QL
         y6hPThWL7Nq0KzMWQMRsx19Ml3r+qoDuYpCVP2vjsfCVWQqmGwo3GMnkwrRO+9Q7uOZ/
         ZSxnbxSAVNv7tynVuDrRwmkCIN1Q98z6vzuz0P7/2Tf+eGidFtPLy6aVsFtqa6hdg7ea
         zH4lVHr2CXiRIWkfJqTLgTRvhrLsqrOXm0WyQaw0rCQ6KHEhuL9B+EI+Is/FV/Q4XSbB
         hBT4gYT+PYn0jYQWtsdvpKNusdsvzkE3UjpSO6taBD7FilPiOyOcrRdJZ2eOxKb+T83b
         ibTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWm3Tu4GQU19qVl5Qf871Q6UKVW/jrPpzjG30C7k2mho0ViVlF3cjeP18VD+sH96VS/6tQ/zlqXTMnI8X6VlsPuPm2mpdvOz6TvJTiLECwI/55F//ZHTKDQCxEkbBWSYoPUu5+PlVpiyR6dbiw8ws=
X-Gm-Message-State: AOJu0Yze6XTIGhGIoBRgj06ZMT2ktDVN1Bfwg5FLzN6ajrmM50o6yf/E
	t1Hl2CYR2fUxsF3E2YxX6e+zQfhR92nX4h1hvkegVe84MOxb6fzss+ZS03VO
X-Google-Smtp-Source: AGHT+IEIozGOx3Q60pZ1JD+rlvxuxOg9ueD1lSCvWLIA9DDo1zCpo/Ou10RaAY48OvA+9ic1xpWF4Q==
X-Received: by 2002:a25:c752:0:b0:dfb:538:df1e with SMTP id 3f1490d57ef6-e02be168beamr9338877276.35.1718983766903;
        Fri, 21 Jun 2024 08:29:26 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e65be7b1sm490700276.42.2024.06.21.08.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:29:26 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63ba688bdc9so21417537b3.1;
        Fri, 21 Jun 2024 08:29:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWiqCOqrlYFkZhGqUb0SQ/KyXGolA36u8+UWf2EXmEEguH5Acey3ar+vLKxF9LQJ2tP4DTSPQhvYyChE7AC/TRsKlyR9rGpLExgpA7cyqLnm7MSO+tifkxP8Oz4mb+bcAcAW5Qi7VYR238LIfGUIs=
X-Received: by 2002:a81:f90d:0:b0:615:1cbb:7b81 with SMTP id
 00721157ae682-63a8f9f9603mr85397687b3.46.1718983766067; Fri, 21 Jun 2024
 08:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418132602.509313-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <75b1798fbef0f941a7c58b91583d62dff6384671.camel@pengutronix.de>
In-Reply-To: <75b1798fbef0f941a7c58b91583d62dff6384671.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jun 2024 17:29:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgHLB6k1jVXdk08U5tgk6M7jGjhaWwpxDZGtoi8ViTjA@mail.gmail.com>
Message-ID: <CAMuHMdUgHLB6k1jVXdk08U5tgk6M7jGjhaWwpxDZGtoi8ViTjA@mail.gmail.com>
Subject: Re: [RFC PATCH] reset: Add devm_reset_control_deassert helper
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Fri, Jun 21, 2024 at 4:45=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
> On Do, 2024-04-18 at 14:26 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > A typical code pattern for reset_control_deassert() call is to call it =
in
> > the _probe function and to call reset_control_assert() both from _probe
> > error path and from _remove function.
> >
> > Add helper function to replace this bolierplate piece of code. Calling
> > devm_reset_control_deassert() removes the need for calling
> > reset_control_assert() both in the probe()'s error path and in the
> > remove() function.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I'm not sure this aligns well with the intended use of devres for
> resource acquisition and release.
>
> Note how there is no devm_clk_prepare_enable, devm_regulator_enable,
> devm_gpiod_set_value_cansleep, or devm_pwm_enable either.
>
> I've sent an alternative suggestion that adds
> devm_reset_control_get..._deasserted calls, similarly to the existing
> devm_clk_get..._enabled calls. Please let me know what you think.

Thank you, that sounds like a good alternative.

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

