Return-Path: <linux-renesas-soc+bounces-16692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21981AA97FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 17:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 817A217B760
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 15:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AEE25D8FA;
	Mon,  5 May 2025 15:53:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9942BB13;
	Mon,  5 May 2025 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460381; cv=none; b=Uv+EnC/cTuSvAzq5ayg8THNgzFtbQNa4hci4UXq9us+uI0EfxUx2bXy0fVywW+S8uUfwT3qlLGAHLD/U6uTCUx3VdqHnhoRdSg1wj2tVApXu4m6jDPhcd9LxzzJsbtVD3KZZdZ9ep2uPgkCTGLKgq97+RjLcLWrhbvWqJlVj3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460381; c=relaxed/simple;
	bh=vYMs6unpeRPM8TUbyz29X2+hbrNC2RWBMgXxaCCt5LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLPT3uFIhWyfokCQaBrahtMrQrqCd1xFTF7YlXmNTIcuLhS9UDxtW5SiP0bwcFHNqOhOjFmrjn1icm0sN1uxRV1HcQybL7+Ws4JcIE3m4QbbYckv4ZpyRWN5oCif4t9i4c5z6ppeV5MaAhM0DUZxykWJ0heFVhioUgTTqXUrKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4c3183ec801so1367159137.1;
        Mon, 05 May 2025 08:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460377; x=1747065177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdTkQXjcSYm0To13RFO17AQ68/lboBqXzyLTNrJP47o=;
        b=Vr7TMo89lZK7pIlOtnmfxY45pib5J3UHIcz5D+5SPdWS3/MjRxSifRu92430V7sylj
         /hS16w8fpSOVdMU5qN/UdSL9KuDtXxNKiYTW3IkKsXcj9fYmZmWVojgkTt+CL7EttTjE
         LAFLqctoEh6BHQiad+lt9YcabcVsDLvhnpdq+nAlG74C2ZApBlA3KS/vd0RkXQsv+qH/
         lJQArt3SCsYl3J0bYJma3s40T0igCjysGjHD2oz5fUOVGSEc2GirWUH/6ZK4LGmBTKUp
         V23bpfb9N1xei8vPbwofp2tUQiL0gCS9PQN+ZzoQvcf0gpP7wPlBpwkA9mOl6g3iYsie
         la8g==
X-Forwarded-Encrypted: i=1; AJvYcCVE8AdLjmGf/2a4W3adKFzGn5VRCfNP3zFNdeIl0fpHKS/6B8lCSvQLc7vRE9S8mhyofIFwUTxvdR8j@vger.kernel.org, AJvYcCVeo0qOHCp3oqYRyB2fnwgMZJ1vcLPJceoKbjbrL04/wci7NSBkGjeWZnGHBlp/6daP1cWz14E6Z2Q1Tm6E@vger.kernel.org, AJvYcCWD1oJDQYYlSJEj8BL38xw5CTD+LDDwvc94qEHbCr8j4XLq3//+tLBdd6duIWRoOiY64dr1QWwgVMoTj/J3Uh6rsSM=@vger.kernel.org, AJvYcCXcZkvsnH5cACrs7TGnzj2UHoYcAA3vIbmhxXVq4PKbE+1JzqqWypJQIbEBnYSXe98WCk2WBm0yb4nv@vger.kernel.org
X-Gm-Message-State: AOJu0YwSKGk558jFVhrEdHZR5GuD7lzTGmamgL4K02sn++rKp51qmYDK
	hniU35KxMUXvREO96NmTlZVp8L4i11/ufFpk+bmSWxTuw70EbaHCuEzIkSW8
X-Gm-Gg: ASbGnctTle4vU0sPI3KlycSu/QgqxITl4UX1lu125vqD+QmNfyr6aAqm7EY0TV9CKzJ
	BPriutkgMSQN6+Cg5PLxK+XdQj/ZTMHyFA0uHJvJYUwCrO7UE3APyqjgHuHXjUET1mI89oAdG/R
	/4kAw+wEle/6M337Vfqe0GdH+INft6lbecSnVl6/xtftIXZvowc3pyL37i3aJV4ovOcVdkYJ8ps
	NFqY2WQNOZkhL7YVCHv+lwzlEA45s8EnxycVIuwxbYlxnKIqaVW0HnjA998yGAgf4w/evQjDi0a
	7jr88rVYrwzomNy0LHjgrgRAwIz/ixH0iAPLd5tVb05+MG4SjcIzKF1s61SUdH4knyyT/EoOCUS
	RHLQ=
X-Google-Smtp-Source: AGHT+IH/u4C/NTWesC/iaMsX+Z90LrdJ/yd+VTdhAFBNcZzZ22XkTYckDfJbXBZa6a5tjlqCSGTCEw==
X-Received: by 2002:a05:6102:2b81:b0:4c5:904d:f358 with SMTP id ada2fe7eead31-4db149803bcmr3839105137.23.1746460377354;
        Mon, 05 May 2025 08:52:57 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4db1c605c57sm649269137.13.2025.05.05.08.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:52:56 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d6ac4d5a9so1245824241.1;
        Mon, 05 May 2025 08:52:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVE4qffm+BcsiSQ5Be8G5jwpVXxossuqIvzQo7h6JTWlrlGGRB8NEa5Vb7Sxfvn3lL5vZo2D276fpa4@vger.kernel.org, AJvYcCW4AaHK0SRXEQEa4NYJfIc7L7wEw46WEBDkHgKdHX0DGrH3M/03suBBDXkm2HJjKDnnx/+mu0NHAo/khbK6@vger.kernel.org, AJvYcCWLjVZ/PCGfyEs+4Z8Ge7ehk/+mIJ1oI3e7LE/iAFBIV9i6yMMnKlYr3qUCzZdbvgh8MyN+7qF8GFtCUBM+1yiXv8c=@vger.kernel.org, AJvYcCWjBg2M9EGOOVS0MNVT7NuAzxlrfOXvh3KPHXOPXF9YeckAW6wRGsWr65MmUcW2miHLJXxD6IOQsw+h@vger.kernel.org
X-Received: by 2002:a05:6102:3c8a:b0:4da:70a8:73cf with SMTP id
 ada2fe7eead31-4db14920e44mr3484043137.20.1746460376582; Mon, 05 May 2025
 08:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com> <20250410140628.4124896-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250410140628.4124896-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 17:52:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWx9Xk5QksoGFvCyo2HLXZ_+WRBCe3bDrZx=bfPoXHJgg@mail.gmail.com>
X-Gm-Features: ATxdqUH0AjdMTTpWOGsPn5ANUmJwNMh53fTsYIVWiBcRSToxWlDl8AFA2D7DzBo
Message-ID: <CAMuHMdWx9Xk5QksoGFvCyo2HLXZ_+WRBCe3bDrZx=bfPoXHJgg@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: renesas: rzg2l-cpg: Skip lookup of clock when
 searching for a sibling
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the sibling data is filled after the priv->clks[] array entry is
> populated, the first clock that is probed and has a sibling will
> temporarily behave as its own sibling until its actual sibling is
> populated. To avoid any issues, skip this clock when searching for a
> sibling.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1324,6 +1324,9 @@ static struct mstp_clock
>
>                 hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
>                 clk = to_mod_clock(hw);
> +               if (clk == clock)
> +                       continue;
> +
>                 if (clock->off == clk->off && clock->bit == clk->bit)
>                         return clk;
>         }

Why not move the whole block around the call to
rzg2l_mod_clock_get_sibling() up instead?

            ret = devm_clk_hw_register(dev, &clock->hw);
            if (ret) {
                    clk = ERR_PTR(ret);
                    goto fail;
            }

    -       clk = clock->hw.clk;
    -       dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk,
clk_get_rate(clk));
    -       priv->clks[id] = clk;
    -
            if (mod->is_coupled) {
                    struct mstp_clock *sibling;

                    clock->enabled = rzg2l_mod_clock_is_enabled(&clock->hw);
                    sibling = rzg2l_mod_clock_get_sibling(clock, priv);
                    if (sibling) {
                            clock->sibling = sibling;
                            sibling->sibling = clock;
                    }
            }

    +       clk = clock->hw.clk;
    +       dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk,
clk_get_rate(clk));
    +       priv->clks[id] = clk;
    +
            return;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

