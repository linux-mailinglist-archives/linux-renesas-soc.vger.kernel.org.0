Return-Path: <linux-renesas-soc+bounces-16792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 899BBAAF527
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 10:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0BC3A8BBB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 08:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245A321E0BD;
	Thu,  8 May 2025 08:08:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610D16F073;
	Thu,  8 May 2025 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691703; cv=none; b=oBRr/wOckIxAmQnFJUNDPkAxAFzFQlY/RW27spu+UgErI5CVE36cGazCbnRvJLQsbYgOPixl3MEtpp2HoqIbnfCXK2yOfAw0phmjir71n6l1LybjNyAalkdD6GWDOXdXdBjHUHdN8QSGCOQcBsGfBnmwnoyy+fzhIUOUl7Zl/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691703; c=relaxed/simple;
	bh=+sJ+nOd93uoWClQE2mhYQO1xYIQfotIWKMU2W7nPB2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwpvs1MkmZZO/eH6Kq5IbB73V9tRCViOswDdAFyb+wxoYtaP2GmGITf9c3ZnMdiEq1PmzSo+fgMcgwTPt9qqH0r/FzE3zvh2TIInocGtBS3l4vhZrOnpTXcSn5juMwU0BBI2NW0yBU4Hmx1cFrOvb1mv29xbH57j4Kcfjgb9DVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5241abb9761so238255e0c.1;
        Thu, 08 May 2025 01:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746691697; x=1747296497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pyh88RLi7QBn3vHcG2jBCwxHsg3m1PlM26ESBfjfQk=;
        b=JdVUV14WGk68/k1HNNJGKorvTY7Q8kr0nz2kJuiUsEQOn70dC6/VuX/LS0IuBcV3OV
         /v5sgnoLF7ggsPuZEenIWHr1XT1KzVWNE/PMvtKbvNZtel0tcHCqNh2JhTg4bQEFThqx
         QSvAVz8KeK6KbHiinIXfOFDiLA5SM5qqjLoeutHb2IyoRAKixPYKT7TsgiFOSzKlEBRy
         XXOmGPeqPeUehJKh/gyag4Pn7HUuJc8EwecAA7QzvpPgkhjhRIMdPlj2MFzoUgozGUeO
         OZMAkxwPBbWX2ydgmnpjvZprveH/RJkmoxCNkRqf1o/wzPz4JOMssRchcboys89crIjB
         PtdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9w1Jt9qaJgT/KogH8Sehsd8x74zE5gcGXD8gM8y0B4sgPYREpIUahvrn2BB1o3boSloTaQ0vPX1J2EpW1C7CFmvw=@vger.kernel.org, AJvYcCWmA69ukN0pd6k5LJOhKObgTMu/q6J6qr/j4LbVMc8tmJOGkoX9RtbCOA3ujQzBIkiBXmjNEqQVtwE=@vger.kernel.org, AJvYcCWnKkIO9botPEul9Adv7i+FXZyXxeL6K5z+wLxI9l5ZJ1d5kYj55rFn1psMm9q8YzDpE7lPpCVPFkBkD2nk@vger.kernel.org
X-Gm-Message-State: AOJu0YzRY/iSfJPFp3RdnMMXzU6xUnU80r6RpfxiHjZFDiQiankdG/ow
	c51kzh2g1DdAsM2Wh3YOvDuixpSe/HPC7GYLzo9adtj9q1C/TNnLgyGPbbVR
X-Gm-Gg: ASbGncsu4NRZ5Wlt741EbzMxhLBkQrnYaR7ciMvtQax7QZmiNO/wbW2sdAHz6m6uqdS
	rDR7DO4eYy/4+9ViBRB1Z1hFf9RMoimHGP2CL0HmijA4m4A54Im+QhCMVaY4XXYmZt72BV+3k9p
	AqeTYS4Ebz+9bI9KgmxCay85kXrkKwg+gb7FdyQvgjAjb+a/7OE9YGEgm1PCY8086s5WoinJkFx
	Fwm/0VGxJxS8WzhYQJUPCx8WwXRXu7hAuIvsmeTnMv+/G6V7uvxX1WPKij/zokEhBWg6S/aO7N2
	+UOGe5C70a1Qc6jbhaPFqRWD1T10jnItf43LZ89Oa2howKbTEQyWw1f4Xmf3ustiU9SWGQBYVYu
	de7H3Sbo=
X-Google-Smtp-Source: AGHT+IFaWIGOmB8cTBxOE+dYT4jEmG0XdjfXBvG0xeDCxKUTjA0Z0v02NnZ2wm1eKbLYbdO4+GchmA==
X-Received: by 2002:a05:6122:7d0:b0:529:d14:67b6 with SMTP id 71dfb90a1353d-52c441af38fmr1708144e0c.7.1746691697402;
        Thu, 08 May 2025 01:08:17 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae419c85csm2888631e0c.33.2025.05.08.01.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:08:17 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5262475372eso197650e0c.2;
        Thu, 08 May 2025 01:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWERG2zKGAiRQQbsYKzmFdvBqDBG3fMORz0BTLJezVvidt2qZuvm2KyBxeg20ibfYakqXIqPFvSvEg=@vger.kernel.org, AJvYcCXP7qTdcNYgGPIqAm8VRHqVlVK/mkm5ETkeP5G+mKfEYMmUzzKbztJyW7Q6bmaQwYCMFrepPKxTaOTyR5Zv7TIPaUM=@vger.kernel.org, AJvYcCXjRkBa3ovT+r4jzo9wMSLt4kSxUcX90GCgg5bTvI9E/h8U4uz4MLZg9Aa9+UXw3fwdBzeHOr3bbKhaLOaf@vger.kernel.org
X-Received: by 2002:a05:6122:3295:b0:529:2644:5eec with SMTP id
 71dfb90a1353d-52c441e2252mr1551202e0c.8.1746691696707; Thu, 08 May 2025
 01:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327151109.9648-1-tsogomonian@astralinux.ru>
In-Reply-To: <20250327151109.9648-1-tsogomonian@astralinux.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 10:08:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoZSXQwu6gZgbzUcFgjQh=ng7UZAGC5ke4GVB-zqqhqQ@mail.gmail.com>
X-Gm-Features: ATxdqUHjjZXKNDvAcDrDPJ9dSfaDFZqswvwv39QmwuKKp-97On7DFcun-1asJ9A
Message-ID: <CAMuHMdUoZSXQwu6gZgbzUcFgjQh=ng7UZAGC5ke4GVB-zqqhqQ@mail.gmail.com>
Subject: Re: [PATCH RFC] renesas: add zero check for prate variable
To: Tigran Sogomonian <tsogomonian@astralinux.ru>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

Hi Tigran,

On Thu, 27 Mar 2025 at 16:13, Tigran Sogomonian
<tsogomonian@astralinux.ru> wrote:
> To avoid division by zero, a check was added to the prate
> variable, since no guarantees were found that it could not
> be equal to zero.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>

Thanks for your patch!

> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -205,6 +205,8 @@ static int cpg_z_clk_determine_rate(struct clk_hw *hw,
>                                                   prate * zclk->fixed_div);
>
>         prate = req->best_parent_rate / zclk->fixed_div;
> +       if (prate == 0)
> +               return -EINVAL;

prate can never be zero, as req->best_parent_rate is always larger or
equal than zclk->max_rate, and zclk->fixed_div is a very small number
(2 or 4).

>         min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
>         max_mult = min(div64_ul(req->max_rate * 32ULL, prate), 32ULL);
>         if (max_mult < min_mult)
> diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
> index 31aa790fd003..4c9a7d699290 100644
> --- a/drivers/clk/renesas/rcar-gen4-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.c
> @@ -308,6 +308,8 @@ static int cpg_z_clk_determine_rate(struct clk_hw *hw,
>                                                   prate * zclk->fixed_div);
>
>         prate = req->best_parent_rate / zclk->fixed_div;
> +       if (prate == 0)
> +               return -EINVAL;

Likewise.

>         min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
>         max_mult = min(div64_ul(req->max_rate * 32ULL, prate), 32ULL);
>         if (max_mult < min_mult)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

