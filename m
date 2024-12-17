Return-Path: <linux-renesas-soc+bounces-11442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4639F45B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 09:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF1DD7A11FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 08:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47DB1D61A7;
	Tue, 17 Dec 2024 08:09:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA7126BF7;
	Tue, 17 Dec 2024 08:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734422997; cv=none; b=NIVijkRNfjmbE82RlVBC9r9NCfBuzlqAkZqaxuO9ICH34qVDMrcVjuOkSwGJem1UluB5QvbYlCaq2HoChohAz/xx5CcdoewZMDgCSTMBJVy/qPnUGeblerZzebjpcBeZubUA/xLyFh9BNRxexkF3BWmyCBckdDymNfixfcf9jGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734422997; c=relaxed/simple;
	bh=+aXP5ePe8hupl3D7oAXUOt0ixFaQkhZ0CS3pn8nAcfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAtWwAk9RdmfFQCIJGHQYS7cvqF/nu/bcIbj40vkmpT8EVtmeuyRSFhIkg+qvd5gHzTZReTO0FMH0iW9v8tknWkXzEKo67XOPz4Y5cwlyuNe4OVnAzDQTjZ5mIDwW1AtVQiBtAlItLpYN6Qic6FEH5O2dhE1kGwMoTBwc+F5t1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-518957b0533so1487226e0c.1;
        Tue, 17 Dec 2024 00:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734422993; x=1735027793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5i6EzC9kL2QPRbSiXo+9+SMBweKbp3o9CbIrJPpag20=;
        b=czuOO6ScmOoL5Bte5A3rY76Mrnr6vSKJIS5u3E72VY9czk/uu4bw1ibIyEpN00GGIN
         NCpgFGQiHR+VvtrV/q3ebUIAMmQ39CudhAi+TELf4gZ8fvnn/W3hQ/AhO6xDLa9HmPio
         li1rRyX19oLKguMJ+GQlBAnARw/t5pmnBKIrGhDqOgnxdW3WEFBy/1bjSHm9BUHwhd8p
         Avg9oL4zFgvCu/HYWoeO/ZzORXuBLJzLl24iKM1iFM/5685xv+Eym/SM7VUeYpRNrEdN
         ymkvEPk0TjiMaSvSnJHFDNeGqr5Jhc3g1DKm7trFxzEzn899ZBqNdv/BwIFTLGl04Gc4
         ZSSA==
X-Forwarded-Encrypted: i=1; AJvYcCX2QHMNewYj9Z+WvmXhxN3HpLzfKek3EVNTcudR0mltiaWv8Ykj9/Cpshjkak1HvK2A2J9OFZWBIVgtxfLjrsRn3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpyrtFuTLhZgtHkkBsdqtYoryCobnAidzefTyVxXC4SyBE9F2+
	E/TLoFEydZhWRwHFFvLuCPcEID6JdZG5eavenjDMs4srFo6pkRE6r46MdyPy
X-Gm-Gg: ASbGncvHGzmaicnPpaCIKipVCX5qHj9X+lcmQXpsl+5QwtsPWmETok9TcTc6gDr49Kx
	bOpQqetx7m8aF4aAgNmxZULoZpzyl+HmtW9q2r15XoA0lpzGrzyrlip3yF74ZAN4DS7Xb4p4Zak
	liDctNdCVK/ehQoPGMus59x88a4JjqKTs6otCH7YeFo9eskM/pZRZzUrxRqNWGmnsBdEQw08g4N
	9my2/57CfsqESlX3IDJXZwZRfyQ1dj9ZW1OftPPdLg4Qq53PqaFtZEHO4Q74gfoP8iwdvfP3f/3
	FHdvylz6ymtcH+euXQw=
X-Google-Smtp-Source: AGHT+IEOIGNLOegfyJoDSSZtDFzKFHCL1JGuKtJLqdhDTp1D7hh1heZMxasd5xrLuNbYaqVaD97/Jg==
X-Received: by 2002:a05:6122:1806:b0:518:859e:87ab with SMTP id 71dfb90a1353d-518ca468491mr13985767e0c.9.1734422993033;
        Tue, 17 Dec 2024 00:09:53 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb729ca4sm859860e0c.48.2024.12.17.00.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 00:09:52 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85c4cd95885so905383241.1;
        Tue, 17 Dec 2024 00:09:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPu69Eql+BS4kGe8Oi62fzTa3ZfLfEtkixJNjGgVR6wcv/vBcErRfzMM9/Ddql4resyRo/ZY6jdKo7Do9WuCiPPg==@vger.kernel.org
X-Received: by 2002:a05:6102:3e85:b0:4af:d487:45ed with SMTP id
 ada2fe7eead31-4b25d9d5441mr11307534137.4.1734422992582; Tue, 17 Dec 2024
 00:09:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdVUKpO2rsia+36BLFFwdMapE8LrYS0duyd0FmrxDvwEfg@mail.gmail.com>
 <87seqnm3u8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87seqnm3u8.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 09:09:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+Eozo1r=xY9PdVJ-Grxb=AzWnCHBF2XQ4eFOx13igaQ@mail.gmail.com>
Message-ID: <CAMuHMdX+Eozo1r=xY9PdVJ-Grxb=AzWnCHBF2XQ4eFOx13igaQ@mail.gmail.com>
Subject: Re: rsnd_adg_clk_control() sometimes disables already-disabled clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Tue, Dec 17, 2024 at 3:38=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> >     ------------[ cut here ]------------
> >     clk_multiplier already disabled
> (snip)
> >     ------------[ cut here ]------------
> >     clk_multiplier already unprepared
> (snip)
> > Unfortunately I cannot reproduce it at will.
> > The above is from today's renesas-devel release, but my logs indicate
> > it happens every few months since at least v6.1.
> > So far I have seen it on all Salvator-X(S) variants, but not on any oth=
er
> > SoCs or boards.
>
> Hmm... I'm not sure why, but according to the log, it seems it calls
> clk_disable_unprepare() without calling clk_prepare_enable().
> I think "clk_multiplier" means "cs2000" on Salvator-X(S).
>
> Basically, I don't think it can be happen. But current rsnd driver doesn'=
t
> check return value of clk_prepare_enable(). So if cs2000 failed clk_enabl=
e()
> for some reasons, indeed clk_disable_unprepare() might be called without
> enabled (It is another issue, though...)

That sounds plausible...

> I'm not tesed, but can this patch improve situation ?
>
> If above assumption was correct, the clk WARNING issue itself can be solv=
ed,
> but sound driver itself will fail to probe...

I'm adding your patch to my local tree.
Let's see what happens during the next few months...

> ------------------
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Date: Tue, 17 Dec 2024 11:30:46 +0900
> Subject: [PATCH] ASoC: rsnd: check rsnd_adg_clk_enable() return value
>
> rsnd_adg_clk_enable() might be failed for some reasons. In such case,
> we will get WARNING from clk.c when suspend was used that it try to
> disable clk without enabled. Check rsnd_adg_clk_enable() return value.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/renesas/rcar/adg.c  | 30 ++++++++++++++++++++++++------
>  sound/soc/renesas/rcar/core.c |  4 +---
>  sound/soc/renesas/rcar/rsnd.h |  2 +-
>  3 files changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
> index 0f190abf00e75..723dcc88af306 100644
> --- a/sound/soc/renesas/rcar/adg.c
> +++ b/sound/soc/renesas/rcar/adg.c

> @@ -389,18 +389,33 @@ void rsnd_adg_clk_control(struct rsnd_priv *priv, i=
nt enable)
>
>         for_each_rsnd_clkin(clk, adg, i) {
>                 if (enable) {
> -                       clk_prepare_enable(clk);
> +                       ret =3D clk_prepare_enable(clk);
>
>                         /*
>                          * We shouldn't use clk_get_rate() under
>                          * atomic context. Let's keep it when
>                          * rsnd_adg_clk_enable() was called
>                          */
> -                       adg->clkin_rate[i] =3D clk_get_rate(clk);
> +                       if (ret < 0)
> +                               break;
> +                       else

No need for the else.

> +                               adg->clkin_rate[i] =3D clk_get_rate(clk);
>                 } else {
> -                       clk_disable_unprepare(clk);
> +                       if (adg->clkin_rate[i])
> +                               clk_disable_unprepare(clk);
> +
> +                       adg->clkin_rate[i] =3D 0;
>                 }
>         }

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

