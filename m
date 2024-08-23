Return-Path: <linux-renesas-soc+bounces-8130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 334E095C9D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B48C1F234A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 10:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D4014D718;
	Fri, 23 Aug 2024 10:02:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A128EA;
	Fri, 23 Aug 2024 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724407358; cv=none; b=DHIPB9DegOg8K+atkOzpltedsq6yUHexMfSRb63FrO8Unj+MXwSLY+EstzGf3uUr0k9A1grJk5vlhQFoprbjwKXN+CsqAbdQ7UumfWakKuvzNDHaahjXwP5fZrSi2twa4TgpPKQ9oWwNuAsno6Lf7pLsLcvNtjYFjqhRzXS/1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724407358; c=relaxed/simple;
	bh=oiYKzaGj7xrlWfmhZHg5Hat7MAkPd2ergf45bH1IXOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAu+0XTpAdaiBVTh0DqXBWp7U4G1yy/ldkdu1O7ZclbLbtNhsiWl8TSI5dXdxjmR5pyvpCh6329oAezeUSqJFnk8OeKjqHmkI+fEzleaJRiEOxTJyzxfKaiogcydUqov0SrJCHPNDhDIiE7yhUvrNzWm22la010ZIQ3EVniPVeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b5c37a3138so16709347b3.1;
        Fri, 23 Aug 2024 03:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724407355; x=1725012155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/StzLHVzGIe2hAzWOEh0nBxaHg45IwWO5eMFJW/nYrQ=;
        b=AucMRNy5npNYHI/iTZ2GIaE4V+zUCV+AjHiuTfqvIveQO5FN0k7AIgcdvEJ/byehT8
         RVazeH3hJ5W9vgdRaBIvihwDlZNsnxWNXgMAuCu20jWvt+MeT/Y6E/n/0lIVN6Q8oA3C
         uMF8ZOElVOuLmrpPjk5XMyOwOnaxLzCV90F+wdxTPAn7ECEkPgUD9PC95+lnL2okpWJ9
         964Y0fjWHp10XkCmvf2pkDiDEvjyyqfpsb8+nDSJYNG6/+1EzLKpnL/K5koV3lWzwPsK
         1gqOpSatxKI9hPd/VwWs3XXgoEstJpQtrji5SyN6nRWfTrO2Vyeyy+Rllnah5Wa/DFqX
         GMeA==
X-Forwarded-Encrypted: i=1; AJvYcCUg6KxJv3lBvve+DFu7tl6gbUIYKAuAuqwAX2KGww0FZ4lx0lMmH4B1SV5ZH8C1+MuEaHztma7aAQOFtLk=@vger.kernel.org, AJvYcCUwUZgF+mdD4O10RC99eBmBVrUVkA/Ck/uRAj8AWX2Z1GQ72S1i20RbxeOPvpAe8NcleiiWDWJKR+vrY0GhG6pE4J8=@vger.kernel.org, AJvYcCVKwPluRC9kFlTXcBmpJ389JeFfXgUbFKXaXq5E8KjPwNzVhFV/FN2xHBnAmTE44XaUS/hfJIkxtHG7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxve+ATyB7W5UIMWJYWIBe/RNyXdrCB9fgH0BOlOCu3iUYkOErU
	AMqEzOYuuFSe/qwQsUTi+16/19rp/ns9JoHeVzTW9FCwcFuKx29SkmTYXlkJ
X-Google-Smtp-Source: AGHT+IGtpP5lKFtWxufcpa1bwEy4pbPv3bWWOt/4qwDT6d1JB2vvn6eAHmJR3tIhEZz80KkiXxTKfQ==
X-Received: by 2002:a05:690c:4585:b0:6b0:488a:5056 with SMTP id 00721157ae682-6c6263ee1c8mr15321077b3.22.1724407355525;
        Fri, 23 Aug 2024 03:02:35 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb53f6sm5002797b3.3.2024.08.23.03.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 03:02:35 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-690e9001e01so17161727b3.3;
        Fri, 23 Aug 2024 03:02:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGMOu5/wZ7bm5mngVVECdJrG82jlJUt2lCBzLXUGZDyF5rhIaofJ2yxKQR0xg5dBALIYEewNppCTIr2BfL3C7xPsw=@vger.kernel.org, AJvYcCXDTSVswxBppOi0HhIXuTD7zouH6rzMlpqnUQBlyDIBEW0jjVmi4NJ1eBV50Hb6AObw3GSC8Qj5HlYe@vger.kernel.org, AJvYcCXTk2g1bfzojaOsH8FOT2UJfVeCgqEAuQibqaecM2HxXPVpb0e/aiuirfSBcsiIwK0LrYfZlpiTvQhy034=@vger.kernel.org
X-Received: by 2002:a05:690c:2e8a:b0:6ad:f6ae:768b with SMTP id
 00721157ae682-6c62924f5dcmr14634597b3.31.1724407354945; Fri, 23 Aug 2024
 03:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725084559.13127-1-biju.das.jz@bp.renesas.com> <20240725084559.13127-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240725084559.13127-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 12:02:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwtrCyCA6A2AZwFgQedQt+sXr9iXoVogvo2N2iY9fjMA@mail.gmail.com>
Message-ID: <CAMuHMdXwtrCyCA6A2AZwFgQedQt+sXr9iXoVogvo2N2iY9fjMA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Jul 25, 2024 at 10:46=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Enable HDMI audio on RZ/G2LC SMARC EVK. Set SW 1.5 to OFF
> position on the SoM module to turn on HDMI audio.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -48,10 +58,16 @@ &canfd {
>  };
>  #endif
>
> +#if (!SW_I2S0_I2S1)
>  &cpu_dai {
>         sound-dai =3D <&ssi0>;
>  };
>
> +&ssi0 {
> +       /delete-node/ port;

Which submode does this delete?
The conditional one below which is only added when SW_I2S0_I2S1=3D=3D1?

> +};
> +#endif
> +
>  &dsi {
>         status =3D "okay";
>

> @@ -177,6 +202,18 @@ &ssi0 {
>         pinctrl-names =3D "default";
>
>         status =3D "okay";
> +
> +#if (SW_I2S0_I2S1)
> +       i2s2_port: port {
> +               i2s2_cpu_endpoint: endpoint {
> +                       remote-endpoint =3D <&codec_endpoint>;
> +                       dai-format =3D "i2s";
> +
> +                       bitclock-master =3D <&i2s2_cpu_endpoint>;
> +                       frame-master =3D <&i2s2_cpu_endpoint>;
> +               };
> +       };
> +#endif
>  };
>
>  #if (SW_RSPI_CAN)

The rest LGTM.

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

