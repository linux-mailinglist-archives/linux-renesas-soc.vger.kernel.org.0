Return-Path: <linux-renesas-soc+bounces-16693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E1AA9803
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 17:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F371617BB55
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 15:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5AA25F795;
	Mon,  5 May 2025 15:53:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0051F9F70;
	Mon,  5 May 2025 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460408; cv=none; b=LukfICHVZftTFJcu+J8N3eQh9CT10UkZtoomk/MAZ2ciurlEd/RL1lrdFbK9FRJMoyREe+Cb0XAVfq1qRoKettiRoxIRKYOWsH3l3PZGxoTUOEUC4/5w/LPiYGCun3/KryWDxpvXRM8HM8/8qihJH5e2BTayTpPESPM0KlZadX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460408; c=relaxed/simple;
	bh=8RkBVqfox7fwCwPsAC9qgiss0kSBBf8x9It9eI8yJz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3CToObH89Dic2/VwGrRc7TrJcR9NP2YCdBcshI4ZwJkJ9O/wHwfSG598+1rn9hKFCePBhLu3v8CSLAyiZxhdGrNh0tE1DH+4PWu/AvF+iuM1+MJMOZOl605sOZjxQgFUpomuq/d0+X9YU41lZZBob1IIdLJIH0tWLmJmeNbrsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5240764f7c1so1195068e0c.2;
        Mon, 05 May 2025 08:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460404; x=1747065204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eVBPdIANQkUOyeisDxdJnjXvcyAPwO1HmPMz4yFNDg=;
        b=Dc2xzQwoY3T5G60Du4tjfHjFf74KCYNtHG981TdJo8KQs6xCx98FDCjpsbm5FpHuwN
         PlKwFJwWXSt8Z1ridEYN3q/xpRBYwA4Nc1nZMbipS97x0WVSWTN7K3aH5liYg/rKlUeE
         H5hMCZkQy82GlTCuehsljqzuC2iIeBk6tLJINSdwdj6usZFwYknodPhsicwR2uVETDe1
         gEvEnSCJwr1eSsBPKR6fXfhHhvLNE7K9B8UN9y8CG6bHsAxM1xQMk/Dk21M2rFBBiEjM
         qySWNGGy5LhBlJB3YYN7zRu5l6JkB73D2n4ImKghvO/vByWpejNwzdbC2fzH3WOh/9KP
         0kGg==
X-Forwarded-Encrypted: i=1; AJvYcCU2kc/t8K7OLDJwIPtBYuZzKONt4xwLva4VEIQH3PPxIwEevqrDcg3m2vKinNtq8PaPL6vUEJxOHRS3@vger.kernel.org, AJvYcCWXsl9xoTPPfC+UF+9PVxRmTz+j4R7tnYwjwmAuZTiQ2hfbzDoDmO46Q2GRNFHEjY2lnptsso/dNR2XNkhOLmAlNQo=@vger.kernel.org, AJvYcCWbLZ37l2q3LmJUXLiNWIybgYAPMpWy1IBJieQZsxgQpetqMD4YZZ6m78/0Na5ri1gxENBDKGIM1okR@vger.kernel.org, AJvYcCX5oTD9d2PCYYlzILbdXBBdr9lSzdQnHQOwaX8xAs6TgDeNiwBfIri+6JMAcKN7DqNt2Ag+Hg/DtrFGloqo@vger.kernel.org
X-Gm-Message-State: AOJu0YxUAHZn1coGg0yCjOP3sgEMFVh5md2yuKJSsWfqCuGARtFG58Iz
	Fug+C5CjYKwV2YQG5XTPy31430UtbV51jUweWJvIaCxZfUub+zGIOivAVF5Q
X-Gm-Gg: ASbGncvyMPJyag4mqNcbyk5SUBmdmwEngvZ6HXtqxbZvODvwN0tFTtV+xWI+0cWTFqP
	fRuZjAvWXaD5DMZObKScxCaQ7mCCP/ckLfYhls9aDE/s17ynhXL2hGZYjDwfu8LoWqOf0SWCkqS
	ev9xN6753i5K3LjCGlafe+AJOpzd4PN/HZ7HMLeoxm5A02C8aeCpo1i/LHmVq1csn8AoEwQiGHk
	psthB3rOyLudlILXoue1wRyuF4BRq+mCEN8zDT3wtXKj30TgubvVJaThFBXcV86ov49o+0mU11K
	IX8sV/2n52dewgScvZ3yIWkKHwoFcvj/NH3xKpTbAMJsEBVNaK8WKd7YmpTcFv+pkx+kZjDWEt0
	Zki6As5gJkUoZ3A==
X-Google-Smtp-Source: AGHT+IEfkfD2ItAR/7FtQTasBVwhsXN/svNz62QJ3Pvang6MOtscfcAd/EH7bRUNbHSt/oTwTl8bkQ==
X-Received: by 2002:a05:6122:32cf:b0:526:42c2:8453 with SMTP id 71dfb90a1353d-52aed7a4e23mr6875008e0c.7.1746460404319;
        Mon, 05 May 2025 08:53:24 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae401eed5sm1571402e0c.20.2025.05.05.08.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:53:23 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8782c05137bso206108241.2;
        Mon, 05 May 2025 08:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1EtGSNpDzeFXUv27gAs2ufS8evmfTpDap/IlfDrXxNfwuxUDYdVGnfyPLMHQ9KdPXn8HrpuIrzXvJ@vger.kernel.org, AJvYcCWJbmNUUvKxuXPy6d68uLVYKypURudONiAhplXp0SWcZh1udbHIL3ouYN4kMzPMTFYi6Vi11Dq/aCTX2bvRpuwi4sg=@vger.kernel.org, AJvYcCX4/ElyUhiK3ZYHZvuowwHs7as0QRJ2VXY8pSfUB3ToMKfiBA+GrK9FH9qK2vBivhM1bXY+Hx++CqVq0Jer@vger.kernel.org, AJvYcCXhtMplQPQ7JJ0YYDv2IpXvvliFQtZAy2iCqT/mlpu4PDMWgnpfMJKX0CXJxcvokFqbc+OHaX6ZyYjD@vger.kernel.org
X-Received: by 2002:a05:6102:1492:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4dafb6ec028mr8759884137.22.1746460403317; Mon, 05 May 2025
 08:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com> <20250410140628.4124896-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250410140628.4124896-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 17:53:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0eKTfh6QsznWvCEeK5w9W-Zw4ORQ8yaevbYgh6+Ub3A@mail.gmail.com>
X-Gm-Features: ATxdqUFlsIimMDXgDoVOyWKi-0CFxh4-I-vFRJaa5_Ji6cKjTXTxtCDDilP-BCg
Message-ID: <CAMuHMdW0eKTfh6QsznWvCEeK5w9W-Zw4ORQ8yaevbYgh6+Ub3A@mail.gmail.com>
Subject: Re: [PATCH 2/7] clk: renesas: rzg2l-cpg: Move pointers at the
 beginning of struct
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
> Move pointers at the beginning of structure definition to avoid padding,
> if any.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1183,20 +1183,20 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>  /**
>   * struct mstp_clock - MSTP gating clock
>   *
> + * @priv: CPG/MSTP private data
> + * @sibling: pointer to the other coupled clock
>   * @hw: handle between common and hardware-specific interfaces
>   * @off: register offset
>   * @bit: ON/MON bit
>   * @enabled: soft state of the clock, if it is coupled with another clock
> - * @priv: CPG/MSTP private data
> - * @sibling: pointer to the other coupled clock
>   */
>  struct mstp_clock {
> +       struct rzg2l_cpg_priv *priv;
> +       struct mstp_clock *sibling;

I would move them below hw (which contains only pointers), so
to_mod_clock() needs no calculations.

>         struct clk_hw hw;
>         u16 off;
>         u8 bit;
>         bool enabled;
> -       struct rzg2l_cpg_priv *priv;
> -       struct mstp_clock *sibling;
>  };
>
>  #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

