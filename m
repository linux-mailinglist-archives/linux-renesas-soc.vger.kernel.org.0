Return-Path: <linux-renesas-soc+bounces-16051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD7A8B63A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 11:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 146341883B73
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 09:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26E123BCE1;
	Wed, 16 Apr 2025 09:57:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C7237186;
	Wed, 16 Apr 2025 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797446; cv=none; b=MuAwidaNVJ5VYnKC61NTQ4/PyM+KhY8NhoK2RKTh8qIyYQi3Vm/MTSQj6rxMjKo0UkodIc1EDx50qe2wyoF60ZuQGjitnQ9XwyF9j7fKiECTa8wxNfQj3NwtIYQlzXV6vG8VZHLv+W9yPPdRlCmteRZrW98CVx5RlP+ou3+iEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797446; c=relaxed/simple;
	bh=l5qNooRCd1W0gmZEHROqQ/K9YjfyyMuDokciVCYCZPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfKovRxVWuqjFcMCQeaEm5wRKpwlVs5XNI2j0TGtjTsXJwyRvW167V+3oS2q/b6t6J3WHQg/IWBLbf6FVG2fkXP3A3MHB8t3YPYfZwarLv5frR0wDSDtU5TcE5+WMVPXL5nWjOPYnqAkG84Hivcc/w6cOfSB2p6lPEPSoskjaHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so2504424241.3;
        Wed, 16 Apr 2025 02:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797443; x=1745402243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/AdmEjELs7czLvY/QMPsCiILW5NyytlUoY3Z4E62U4=;
        b=r/63nL/O2up6DXDe+bMHEVn9k+GNS3zystnFi7ht/ChMAhxaFCmeMLsCqWpCoSwbbi
         Ba0mUvMeXShuFz3wmgVrFIJvHxCuCukg70GbDWhwidRFdMsx9D1S3aw+Pu2CMH+3ZZQQ
         SA6I1+SwN+IGwbF7pQvqAyYyLjLrddPDtsfRYBi/GukUj6q6x5RCigSa4JeE7QdT1DUE
         8ixVWGXwx9Evs1r+uUInG/q9XAMxOUBfn92ei75C/zmuTzqEBjxH+N7nfq0gthKLI3ts
         RezzLR6DAeqXYtl196H40fTUqwo0Xi/zddXA94clye5CWjWvwOJncZGkgX2XkJOnRVRB
         FTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpl2oZvh6MD5LXHFOeQ7ikuMZgOESgv+lUIKv3htvaR1LwK3Rbh0NNyttqwCbvL22UfZ+UbOCZfDgvN8HI@vger.kernel.org, AJvYcCWDkfHXp4VJcz+tBRR383JG/AU3NZ/LRCC3H7qiwhVrc5GBRY5JUSjaNRHAgImmbD+WKAz+YBVoGGc=@vger.kernel.org, AJvYcCWIB7ZOsa501/rZW1d5RJPVJqwdq+gJ7gI02hmNaMIt1SwcZGGdepZUVI0bHI+r1butBrwC3wrp9aLaZCVmoI58B2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbo7R1A89jrhBhWFqLw9+4NfUjTdUURmLuu8SJlC33Z8pxohcn
	rg3yV0snISZAE4I8R3dMtB5bzA/a/uAG6/az2HT0QIsSxkWG7RQuvvehOCZj
X-Gm-Gg: ASbGncsaWbKjXnStLWMjL5to1G3FRdfB4UCWrct1B5dtt1PNIpHI+8VdOA7Cn8eaJfs
	IKjwW8NFwPYezYznErSleAsVN3nJVu9AsBS4kiaQcRu1jfnmO9vzyX99mVyGltaKHATTLyDn+Ns
	UCJc4nHgzUCxv2QdRH4qu/f63xFP7rscwqBITr7xx2qAPcbdasG46Xk7eYoDxLpkrGsbHW2KuHC
	icAxpv3ibXnyc5plqAytkR7wA0q9KXgcFRHXbI70zRSErh5ilpe1wm5UKqJnga1+F1f31Z/33oq
	aJFx82La2Z1559U/zzTnFvutU29Uf535eWseA73FqAgss6QOb/Y+37BECw1Nzy8Sdah0KMAYFP6
	Dlu9Ot/yjw1758MaqDQ==
X-Google-Smtp-Source: AGHT+IFueu0WKzu6fAD9i5+srBkaj6K2THHh5pY9dqRFgk7+Q4NTwcL/fbklF0paYVSru0v6Lwz8cQ==
X-Received: by 2002:a05:6102:3c4f:b0:4c5:1c43:7cb3 with SMTP id ada2fe7eead31-4cb592f5949mr275091137.25.1744797442667;
        Wed, 16 Apr 2025 02:57:22 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87557280076sm3037576241.21.2025.04.16.02.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:57:22 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-527b70bd90dso2999035e0c.3;
        Wed, 16 Apr 2025 02:57:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKT3crQGyLvf3jj0sEZMy0vhUm5iZSUOiC6qS+nkbUZ9xZMad/+PHA9Wuu0THc1tswZLR3RmubhB8=@vger.kernel.org, AJvYcCUvArpgOZYcRs6GY9NMTnEqI0ph+epMXkzrauEeNJlfRHpJoomS9M+nJtSKCrU4U5s42Hr4Fu7BcxwpkY9v@vger.kernel.org, AJvYcCUwroFWJtE13+yBfHZU2AV3LVm02YJZZ/P0bSolDGcA4ldvynGd8rnbnICKM0khW2ZKgJMaoJqFDVrjUT1fn4pMwQo=@vger.kernel.org
X-Received: by 2002:a05:6122:2a13:b0:518:7ab7:afbb with SMTP id
 71dfb90a1353d-5290e1c73damr349467e0c.8.1744797442070; Wed, 16 Apr 2025
 02:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com> <20250402131142.1270701-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250402131142.1270701-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:57:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdvcPA_Wsmc6NZ4oQbVoFzHjGCKnZfc5aN4uZjkpYWnw@mail.gmail.com>
X-Gm-Features: ATxdqUH6i59Gzu7O1mIrIttmGODeb50cvVqQ2I7ZIFCJ1h9bRWKzbfZCBv9pqsk
Message-ID: <CAMuHMdVdvcPA_Wsmc6NZ4oQbVoFzHjGCKnZfc5aN4uZjkpYWnw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: r9a09g047: Add clock and reset entries
 for GE3D
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 2 Apr 2025 at 15:12, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add CLK_PLLVDO_GPU along with the necessary clock and reset entries for
> GE3D.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -185,6 +187,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(9, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD("ge3d_clk",                     CLK_PLLVDO_GPU, 15, 0, 7, 16,
> +                                               BUS_MSTOP(3, BIT(4))),
> +       DEF_MOD("ge3d_axi_clk",                 CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
> +                                               BUS_MSTOP(3, BIT(4))),
> +       DEF_MOD("ge3d_ace_clk",                 CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
> +                                               BUS_MSTOP(3, BIT(4))),

Moving up to preserve sort order (by CPG_CLKON module number).

>  };
>
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
> @@ -214,6 +222,9 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
>         DEF_RST(12, 6, 5, 23),          /* CRU_0_ARESETN */
>         DEF_RST(12, 7, 5, 24),          /* CRU_0_S_RESETN */
>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> +       DEF_RST(13, 13, 6, 14),         /* GE3D_0_RESETN */
> +       DEF_RST(13, 14, 6, 15),         /* GE3D_0_AXI_RESETN */
> +       DEF_RST(13, 15, 6, 16),         /* GE3D_0_ACE_RESETN */

Moving up to preserve sort order (by CPF_RST module number).
The documentation does not have the "_0" part in the reset names,
so I will drop these while applying, too.

>  };
>
>  const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16 with the above fixed.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

