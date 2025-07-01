Return-Path: <linux-renesas-soc+bounces-18954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E985AEF4F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E41453BB8C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 10:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B722526FDBD;
	Tue,  1 Jul 2025 10:24:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FFF26FD90;
	Tue,  1 Jul 2025 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365493; cv=none; b=D37cBGuY9ezgn6nIynCd6MDxztO3IGvTuudjl9YNWSNaweteDDms3LicCbdc5qkul3rEUWS4rucGyr3Ud71g8tvdF5nIPRbq+6EhGuLXYpV0mf97AAaNRVv0/JeEwnfBLOOAcecBfyQIbu2XnfoewL/W4e1oY6z+/d5cyagN8co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365493; c=relaxed/simple;
	bh=L9I/QwF14on9fp60DEuPscxVm5jBLrf+FI9XP/J1bmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaYvghr6jaHu1qtEM56ciDzK3olAF5DS0Bg4q3fetN6mlr0tsxMyPKoTgFj+CgiJaI5VnTgarHPth3RFE5p69jUbjlWA6YvbLmjUFTgU1MXNW1RhlxyVOXsCayCCqVBxzrJ7wkSXtAuvlgEEhBB0B1u8T/XyaTLyxOAIiFroRFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7eb3fad4fso3087738137.0;
        Tue, 01 Jul 2025 03:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365490; x=1751970290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irNrZCPGj0s+GoagNMAYrylMTiLNtVpXzFPwd8Y8B7Y=;
        b=igRbi2FpeU/na8e3Yq7e9WirDtMPrzK/MY9oqWa4ITK4dfwXIWL/eX2bJpxq9IsKKd
         6UfruzNWStLr2JNF4ymu9PXosEAQEEZBiGuWzhBQgDzaxbtbH+J6CgpbCB137cD1OFZg
         WVdPF1wATyni1gcsYwIshYeXsAjI4llRDrprs6PKY1sNTpmhJNLFHZ9iCb1P/5G2HGtx
         c2nU4SCPyDLJM1FdqnhtJBShaAJ+fYaeWtVIALKoR3JeqZUIDU7rS3tN7vChSHElHjk5
         8hwB0JxKzqORI1XAd+ToXZo1vyDimNXIDs7yahZV7L2B9j1L4U7OW7A2axwINBeiVudN
         kyWA==
X-Forwarded-Encrypted: i=1; AJvYcCUkNEDbMvlyHXf3/VKF/DNZT+xZnn5BgHqggibOhH7v4TN1N9cf8d+Kbw5jcz+v2aYKch04eEgVMaZF84VY@vger.kernel.org, AJvYcCVa5Dt58g1merhFgozUbYMdsdLsvxXthzXLkAIdCgRQcUIdwUKeit4WJXixAHecLHcEdSoNNZGzJKY=@vger.kernel.org, AJvYcCX2cFHi1jQkCfG0RmN8ZtfCET9ibgr+xypIeJ2mDw2rwA2Sp1+02dJuCMkfVs42bCWxW4aS7OHtNyAl1zuJ3XQikMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mzK5lPzbMtmdbkH2jesNXzTj4W2x0xKXIVjKx9gyudpLKvm8
	CtoOiyhSKuAYkhqmn3TfWlNTUg586LyF8+X/Ws1/waXo3wflqUU3w5luhXsvdTEH
X-Gm-Gg: ASbGncv6lzpMnEDcCH4qdcej4hY1Z486hVANjUCSxHr/HB3UYRHckcSfoqIEplKKd1v
	f8z+v+b4PpBLVLF4vDsJOEzVeQJysfKbOGmGgBoP3x9zRHKYJpN6BykswTV/3FH6eK144USGT1K
	E22folhXYq+gW3TXvbcTFAn3yrRoZx9p1oozPib5ZJFBI43aOwoYbnbwZA50e1sNSAJYqBHryFF
	dAE7i+jsAeXG2+aEPPlGuFFY/F1z+uF3gZykF2wLk+JJWcDBYGtvJEgRopBbHB5un93tK0AhD08
	b9hOoAYU9Tpp5ljPIO8Kn9LeDaiqDKvEHdb+tztPw5My/dszVcg2ttgQ06p+yP6IV/gkJPYBKOp
	2iEylJ7aoDlC4SwAIpqySv4gi
X-Google-Smtp-Source: AGHT+IEDvOTHlGi8AoXCERwoNFW8zMR0WsN3JQSGjwTOk5Tw7YTuiJPW/Iz0DEPVO46Anul3nQktrw==
X-Received: by 2002:a05:6102:1608:b0:4e5:9c40:824d with SMTP id ada2fe7eead31-4ee4f6f7b83mr9497718137.16.1751365490512;
        Tue, 01 Jul 2025 03:24:50 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1d88000sm1864434241.19.2025.07.01.03.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:24:50 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso2791606241.1;
        Tue, 01 Jul 2025 03:24:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZ5wWfCGDbkGYgH68Lv0hGmoXvrCzUJAXq7V8eJMQQe4dPhe7owlekTL0j+BKUg8JAJL51VYKIOovTlWdj@vger.kernel.org, AJvYcCVeWvB8YUTwSGkeQ1x76q4dmp4mNOacJLUZA26b+k/AfCA5bBxqIK/sTM9IRGShNKrAiyHA9XZEEDd4gc5Epf5EDB8=@vger.kernel.org, AJvYcCVvooBWAbAw0mTnmsFnaVmBYkDfMmSvKRyxHq8zlxiD175PlJXHjgYOKkUOgJWfLY4Q40lK+xZrlkQ=@vger.kernel.org
X-Received: by 2002:a05:6102:b14:b0:4e9:b60a:441 with SMTP id
 ada2fe7eead31-4ee4f6f8278mr10613853137.13.1751365490045; Tue, 01 Jul 2025
 03:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624153049.462535-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250624153049.462535-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 12:24:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV46tME9zuC556XuxcxRt2FGLwuUmdudZvOKf9RLvQ1Lw@mail.gmail.com>
X-Gm-Features: Ac12FXwUljg1lofKpmUbbv07c21dKNGD0chVy1ox_vcCbaotHiTKDZM6ZS_5KyU
Message-ID: <CAMuHMdV46tME9zuC556XuxcxRt2FGLwuUmdudZvOKf9RLvQ1Lw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h-cpg: Drop redundant base pointer from pll_clk
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 24 Jun 2025 at 17:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The base address can be accessed via the priv pointer already present in
> struct pll_clk, making the separate base field redundant. Remove the base
> member and its assignment.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17, with s/rzv2h-cpg/rzv2h/.

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> @@ -230,7 +229,6 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
>                            struct rzv2h_cpg_priv *priv,
>                            const struct clk_ops *ops)
>  {
> -       void __iomem *base = priv->base;
>         struct device *dev = priv->dev;
>         struct clk_init_data init;
>         const struct clk *parent;

Don't forget to update "clk: renesas: rzv2h-cpg: Add support for DSI clocks" ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

