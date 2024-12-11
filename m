Return-Path: <linux-renesas-soc+bounces-11219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F699ECC27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17B5188916F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1345A227581;
	Wed, 11 Dec 2024 12:37:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170A4238E23;
	Wed, 11 Dec 2024 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920669; cv=none; b=nEKnDwZZ6/R2tBFGnUEaRDy4qAdaXnBEcpppy6S2UzKxWm6bHq7y2egzGJ63gzUpVbt2fC0KmkWve4pT7NvV46bAwRvgy0EjWGkKYSoi9aPBZZaxubV/XxBGyCuk+f9BRBhZe6WjQmfWgGft03HFwSWfZHzcV/llvUQl1KWW+Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920669; c=relaxed/simple;
	bh=8A5CrmteiQlZfEh6qwztWqlsCGBp53ZNUov14BzudeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpNO0OXNV6NBOIombSsuIiBBAc+yqcNKnEU1iWhkPTdx7QvfZxxXxkT1kwNjDmZUYUQ6hvoDhOkNLXuIJsYFUQ8tz0KC7tuOO8RW0/xcqF6QFjm4XoeUZya4YuYqrE7+WrSIIrKfCYLPNBLMyU/vYYPLh3KYHocDLN0CSoC8wpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5188c6f260cso650500e0c.1;
        Wed, 11 Dec 2024 04:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920665; x=1734525465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ86Ezt1IhboGcICgfmJZa79KW8rXDylHzrx2Yfcbis=;
        b=rkychT3T7YofPubweOY0YVCym+ZlA+5uIQNnd89WAafunuygUuza3ZxmoaHPJjCYYQ
         thR6uajMNqxE+Iw1+oPXSf+1bU2px+u0LwYgEdEu+1ta2CSg91NP6sKvFRLTwnjleetJ
         7dsA7KUpoA9NECgxZb5xH6A6OrzN1n7ddTFOdLkv8xH+8H1+L2zirUOwjSvhHfsZw4Dd
         njy148PtzGSjxi2t0Q2cVexCZhP4H96e5tl0ulDsze2RlCarhIH8oLz8VliipZYar2ZZ
         cUomOexoPEuu4W4R7wuOfSNArHshVEHOOJ4Qdjzl/1XggYXpoVGfhaCJMz2ySQKBIE2O
         nWjw==
X-Forwarded-Encrypted: i=1; AJvYcCUCsbkKV1x6lvhVGX0q3hkw4Gmgm3lyNTzHr1Iu0KSrU6DKRgIoYronlHY9Rir8T9eT8wGqfc03iHvg@vger.kernel.org, AJvYcCV2LyXWeCWxvau0BcQUGkHuvJGZWQR2CuEJSTVKNZTCmIbXJRlSIhFrruGW300f82WJVOjW96xluVF0LZ/a@vger.kernel.org, AJvYcCVdm/mAVqxAeuuNiUvwyTsZlepEYGnA3/zhM5hXyCrjzk4OrvPC3DOkscPBr9SvPD7o//f2wfx25L9E/PkjwO052ow=@vger.kernel.org, AJvYcCWOCOMUOBDdvcgTTEaOR0AgWgwgTB8qWbfPTz8/hvq3mNVcA/aSkRWNo0IEOHkuEWvdmFkFluPlDQs2@vger.kernel.org
X-Gm-Message-State: AOJu0Yztx6nxI5kHGTRMi8VYyx6p9/5mIdpXsJAbCG0WTVBEIoYsudze
	+Uxw2Sts0aAhhquR6Y7/hUkUrTPeHXpm96PB8tWIq4PHi3UgjbQgEuCJ/LsV
X-Gm-Gg: ASbGnctWwePu11wA1GAxXXnA0zPIfgV1emnHFd3xDqs7rj7GXRErJ5jpYlTtRRuADI1
	axQf2BIzn3jdZS8anRYFE6vNxPBkhDId6ppycZ3ra2v7tYEYcHCmG0o1D5PHyyncharELOSPg2w
	fxwMC5eMy6krQr18EmXbMKlWzeCCrU05YTb8uOE4ZrKyqXJ1RsLCXSrCzLRp8QdFpfLVfUbjOo+
	6B7RbZR5bmWuDBhqNMxko1ChWkJJThGeNQb2fgHvlcFuGoTB6TDOQn3nrL//iQZdv4OmZIdRsDH
	FYqCp8Nh5ew3aJ83
X-Google-Smtp-Source: AGHT+IE1D2lQ91hapezxrAZkcziBE8Uk7ryteiqJY5E7XwGExYGCBR+saT/fdIqDLeZ/yZ0nI7fPBA==
X-Received: by 2002:a05:6122:408b:b0:516:1ab5:fab0 with SMTP id 71dfb90a1353d-518a3c23627mr2223215e0c.12.1733920664649;
        Wed, 11 Dec 2024 04:37:44 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae68d96sm1128813e0c.28.2024.12.11.04.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:37:44 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afefc876c6so1048864137.2;
        Wed, 11 Dec 2024 04:37:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu7U7/qhreU4mT5bs1NV0nE3V1y6/qEn9sveePL9vWRlKpNxBWVa2RKW4vUsPyyvaG//AmQNT1RC9l@vger.kernel.org, AJvYcCW11vywDpTW30bzBlyoghN+tfCeFa2Ph8fwt2CwEUbywrfQoKrUjageyr94tAuRkJc2Dm+W2rIhnVQ4bGtdaIAaL3c=@vger.kernel.org, AJvYcCW1XlUhdVWTFFN34exMmZ5JPdSrlF9oWQXti3xi7cfRIXdC2h5ce+CdKHChoU/dsNqfMWhfB5+NVEVVuNTl@vger.kernel.org, AJvYcCWRGU11CSWSoyZAXKFsjSIwjq7kv+nzib3aseGTGpmLVm9kZBmkSUNojUmWDa3nvxnwTFPg8xrXZNb0@vger.kernel.org
X-Received: by 2002:a05:6102:c86:b0:4af:ef82:ce8b with SMTP id
 ada2fe7eead31-4b12919eb17mr2932281137.26.1733920663802; Wed, 11 Dec 2024
 04:37:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241210170953.2936724-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:37:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXB6RiCpm-znuQVSH-o9a-SoQgORD4hJVTn-pDpj_Fd-A@mail.gmail.com>
Message-ID: <CAMuHMdXB6RiCpm-znuQVSH-o9a-SoQgORD4hJVTn-pDpj_Fd-A@mail.gmail.com>
Subject: Re: [PATCH v4 05/24] ASoC: renesas: rz-ssi: Use only the proper
 amount of dividers
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:10=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There is no need to populate the ckdv[] with invalid dividers as that
> part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
> always be >=3D 0. While at it, change the ckdv type as u8, as the divider
> 128 was previously using the s8 sign bit.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - changed the ckdv type from s8 to u8 and updated patch description
>   to reflect it

Fixes: 03e786bd43410fa9 ("ASoC: sh: Add RZ/G2L SSIF-2 driver")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

