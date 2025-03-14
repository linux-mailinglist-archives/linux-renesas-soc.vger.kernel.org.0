Return-Path: <linux-renesas-soc+bounces-14372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF380A611FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 14:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D3071B62C23
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 13:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4552A1F4169;
	Fri, 14 Mar 2025 13:04:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F672E3398;
	Fri, 14 Mar 2025 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741957496; cv=none; b=paVhoJXu1QbA7652p6VqgbIb2q9Do3T0cCzg+E5ynIuBuZ5jRE2x04Y6BqFkFcYBhX9Wp4zgKKjD/B1UmZk7HVMTDYJ+WAbUISENijoTtX7IkQYCoKp/wzeTygch57jATXKSykzNv6zTIffQ5rtPYjl7jaVfRA8hYlwuTcD73g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741957496; c=relaxed/simple;
	bh=zyomwtA57UlhAsFzz5wOac89yRYEs905pl0IQvNIO/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiuLO3f3hPFkpZZ8bfpwHEARJGHQFaNRgt9/gGuhK26Fudw1b4FWrv908qXh9jyeMCB+pSPiJOUGw8StN3FJH9J8PSUPx8IrIFxZ+4CvGMeLX4LtW0oQPGX3Rr0Ki/FPswoyhr7WGfzjGy9rol07/Q7Fcz/UR1VSOzW/5sYRBpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7be8f28172dso133525985a.3;
        Fri, 14 Mar 2025 06:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741957492; x=1742562292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6N7MIvrxusn0ziXilYjMqdfovi7E20CQcJ0QC4pu9oE=;
        b=XhHiNRn5YZKA2QvuySYoVQmv7ETnCHq7U8e4nbl/TwN2BFRLhHI5RmlbWBcyMPH/l+
         EDqxhVimkgewFxVAvkLnxYa0TOOUKnQ9ym64+Eg9KmvT5uErcV7QJAIRicBB+KyhQAV7
         jrNV7sIdbiTfzH1AKVGPYruQckEegOyHDQEIyB1zKVAROFs9MBlbk+uCh+6oDbE+kSdu
         HbuOdqFj2nYZoCyM/Z89SpYWpRfcPFdEnyZS1UDSChdzP0DXifnHhTkwz4zoyaDirjXN
         oIasORy0mouw4sc43E979zjnBTZ8QjcVGXSdk9gEWd9mX9aAVVXY1DLsxGu53nKI2CG6
         4jmw==
X-Forwarded-Encrypted: i=1; AJvYcCU2XohIcBK+yf/Gm1LaXIP/ogafW8CsoWao1mVN5GcA39kLm4EGlG4mEJi0AvuYP1YNXDkr6rdbnpUD9qrkBZfrmb8=@vger.kernel.org, AJvYcCWoUVFZ+2nq5KnaeRVos9ztz+cfJFsgNYYcY5RzcfSzwBSCzEUqKO393Dp76CysZ3uCetkqwJ7NiKI=@vger.kernel.org, AJvYcCWqY1gMOrMZ2FY9yd6EBDLmXlhkpDQJB9TvKeICIrSaVwdfk36giSIumlGSD0XppZZBONFy1zPJqKafk/nd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2sEEF6F5PrWzOmbbrEHQt0J6Zp04IK7weCrSvp5cqbpOaJzvU
	nTboMh9BmLXXkl3DjMznoX9+Xb/LbIZl5+GVRhew0fB7oFSAoqo1ws7Uf8p+DcM=
X-Gm-Gg: ASbGncupw/FKE3C/zsvb3zIy3fS7OsnnBf6Q++2KZ0QAbbcnamRSbiSyJguxU29yDlL
	zYvDPnUe7OcJSDGRCYDZdeIJkcTiPmRnuZMtxlBYwLV6Aqp/1wKtUG6ucfvcotbd+9vvO61iAVb
	7vu4NcwM/YYIkJylhA00qdMuPqTDJHSpup7l65JaJJgsKF4UAeHMrhlV+SsuOSZnj/B1m/l3SY3
	u6m607Jvylv5Ptk6t3kEVHV8pbrMUed5vGCmz1VXA0aougDl7PFiIk5mMiA0afeSeY7fJFbFevG
	gpQPttvCMvq/BjA6XQ+mI6IMOiF30qzfG8106I8I1FOsN6fTDF15NRIYxhvEpRx4oIViOwe9ZZd
	0g6dEd/w=
X-Google-Smtp-Source: AGHT+IFj0SyXnZXn3tqcs7zBp+PiSloeTHYZ7W2Cwv7AyVnD4T9DgXzNgI+D4ozd4baCUuiSQD4Mww==
X-Received: by 2002:a05:620a:6603:b0:7c5:5909:18d2 with SMTP id af79cd13be357-7c57c73b897mr358442185a.7.1741957492162;
        Fri, 14 Mar 2025 06:04:52 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c9d641sm248511985a.65.2025.03.14.06.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 06:04:51 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6df83fd01cbso9790386d6.2;
        Fri, 14 Mar 2025 06:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWktwdOM2EAdjCNX6RJ1xrXy8KsC+EH74otOGsXKFH/vMXdTqTHP5lsqUqH3IpqUzydW0vbu3tSLY=@vger.kernel.org, AJvYcCUc8q+oLJNIg/B5dmnD1waM2G0XNp4At824IWk/GZvb8Ai1X1gRtUo1XYyv/CrtS+ktFTbnpoB+IHt6OFgx45etcLA=@vger.kernel.org, AJvYcCXBTE0P94TBwfgO3itz5O1okuHWo98h2cOXJci8Foi35cUWFksg6SrrZ7Katzdv3zrdkNpGwNeYUzixBGDg@vger.kernel.org
X-Received: by 2002:a05:6214:19ee:b0:6ea:d033:2853 with SMTP id
 6a1803df08f44-6eaeaa07d5amr37576526d6.16.1741957491115; Fri, 14 Mar 2025
 06:04:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250309211402.80886-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8sqJy1HJYkxZONqSEsFuCmENgbs_ofLyaUChtRJpj_ebg@mail.gmail.com>
In-Reply-To: <CA+V-a8sqJy1HJYkxZONqSEsFuCmENgbs_ofLyaUChtRJpj_ebg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 14:04:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkwUXn0tVVg6BzUbtnSzENGokSY7oXPQW2fuX9QiZz0w@mail.gmail.com>
X-Gm-Features: AQ5f1JqeLXs1t72wc6b0zZMY1NqsyZTfGb4kquJly8mm4cjwxKYeZnMJFeumbKQ
Message-ID: <CAMuHMdXkwUXn0tVVg6BzUbtnSzENGokSY7oXPQW2fuX9QiZz0w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 10 Mar 2025 at 19:22, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Sun, Mar 9, 2025 at 9:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Some RZ/V2H(P) SoC variants do not have a GPU, resulting in PLLGPU bein=
g
> > disabled by default in TF-A. Add support for enabling PLL clocks in the
> > RZ/V2H(P) CPG driver to manage this.
> >
> > Introduce `is_enabled` and `enable` callbacks to handle PLL state
> > transitions. With the `enable` callback, PLLGPU will be turned ON only
> > when the GPU node is enabled; otherwise, it will remain off. Define new
> > macros for PLL standby and monitor registers to facilitate this process=
.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Updated macros to get PLL offsets
> > - Switched to readl_poll_timeout_atomic() and updated the timeout

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c

> > +static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +       struct pll pll =3D pll_clk->pll;
> > +       u32 stby_offset;
> > +       u32 mon_offset;
> > +       u32 val;
> > +       int ret;
> > +
> > +       if (rzv2h_cpg_pll_clk_is_enabled(hw))
> > +               return 0;
> > +
> > +       stby_offset =3D CPG_PLL_STBY(pll.offset);
> > +       mon_offset =3D CPG_PLL_MON(pll.offset);
> > +
> > +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> > +              priv->base + stby_offset);
> > +
> > +       /* ensure PLL is in normal mode */
> > +       ret =3D readl_poll_timeout_atomic(priv->base + mon_offset, val,
> > +                                       (val & (CPG_PLL_MON_RESETB | CP=
G_PLL_MON_LOCK)) =3D=3D
> > +                                       (CPG_PLL_MON_RESETB | CPG_PLL_M=
ON_LOCK), 10, 100);
> This timeout didnt work when I power cycled after a complete shutdown ove=
rnight.
>
> I will update the timeout as below, this Ive made sure the below delay
> works OK after complete shutdown.
>
> /*
> * Ensure PLL enters into normal mode
> *
> * Note: There is no HW information about the worst case latency.
> *
> * Since this value might be dependent on external xtal rate, pll
> * rate or even the other emulation clocks rate, use 2000 as a
> * "super" safe value.
> */
> ret =3D readl_poll_timeout_atomic(priv->base + mon_offset, val,
>                                                     (val &
> (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK)) =3D=3D
>
> (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK), 200, 2000);
>
> Please let me know shall I send v3 with this change or wait for your revi=
ew.

I can incorporate this fix while queuing in renesas-clk for v6.16.
But, please explain what is "the other emulation clocks rate"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

