Return-Path: <linux-renesas-soc+bounces-9583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A0994516
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 12:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838E81C2261B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 10:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C37B18DF65;
	Tue,  8 Oct 2024 10:08:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387A778276;
	Tue,  8 Oct 2024 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728382108; cv=none; b=g+cjGgcPQNoz15H5fcUwMUkzdiWqfVrEImwMrK5XUp6vy/CT8InURYjF3gtlOYKBNMTo2wFDWubXbauIJVkf2MS47U/hOO5SJCUAe2YSHvgg8a8RxCWpvdOvpVGSlBBybUkOnKBX9r0znj53qpJUBuIxdnuHXhiXYy0CN55IqSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728382108; c=relaxed/simple;
	bh=kmCNfHjWXdftj3Q1U37B1UQ/6HSiMQJPwXH7I/NxWgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwf1yWBCiE95mudF8bxrXOZ9sZ4x0yfH29W0nA4raLtvJOnRC9lVRMFUc+ICOrId3B16PVsU/Pg2+Udt+ymFhQtznVQveuaWPwUWe7Z7Gdz8WgfBnDXTS82tjgP8xOfBzFSpK3pKehgbkmMu4Z0OECTCSxjAQaCC2DILjnxIeCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6dbc9a60480so45930787b3.0;
        Tue, 08 Oct 2024 03:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728382105; x=1728986905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eofPis0FPAdLt8MucuiPgt80mBBI69FxYuGtMj8mdn0=;
        b=pcOAbrCwBakVO6dthbF1B7ZM4d2idBlDzFrNdNeKenfBbhPIQE9GB9UAte611Obh9d
         I9/3og6qzrllT9qZ/TS/0es43yvaq0XOTxVFq+dEhBdJTi9Gqw44oPDCVBjJ6Lb9G8Gn
         pxuzK8W1/k/u8w7ZRNT95P9kfKFZdcBRzNAIvuAkzv6l0Wiu/gLKu2T81t1y3rrQyOAa
         sJuUaf2gVcVwIS5J06vrJz5IVLWtn/RsvQ1vvErNzaUdkXWpjy/MelfcXN6+Yo0nq2Nn
         2FMN7PWNm7kwO5zTOrKO3AnUt2tDZzzoCpS2+T2lCVWReSCwfiENg72AKytZLHA9DNV5
         VnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD9HVqB4jdkJHZD/E35HR4loPnhHNyawUEJPcMFNcJgh8ZACgq55vm6zZ1ANWZrZNUiMh+scbeoGFcbUn305oyflc=@vger.kernel.org, AJvYcCVq3G6IBKHDUqeiqquN2eU2KwzrvYQuxVD6mNuDvm5cbdwYaJkfBXkM9DaSZC7NWPE4UmqVYSxxcoTxCKsJ@vger.kernel.org, AJvYcCX5XXPDViEqPbF4zmQtPXYOVU1CjCjfh4i7jFbpTtBpzCdlySp9gNQG6xwOomRK6W/XXjrxo6t13qLT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5venrTDdVN3w0l+Gh+Q4rMxAqoemfTsxJXp42496hPh3ZDpKp
	GUXXX0yaiXe7YfaTY4HWe9mtfIkk7V4alcpFXkpkd6GB2hpTGtZ36qjosGCb
X-Google-Smtp-Source: AGHT+IHGa0DD6v0k5cgNLFSAW51Hkuu1o74aAvKlpN2Ra7Tvx489n+9O/ZfZgaOl8ri1DliLjED8zQ==
X-Received: by 2002:a05:690c:f8f:b0:6dd:cdd7:ce5a with SMTP id 00721157ae682-6e2c7036ae1mr126498757b3.18.1728382104614;
        Tue, 08 Oct 2024 03:08:24 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d93e271fsm13591067b3.105.2024.10.08.03.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 03:08:24 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e2f4c1f79bso19004607b3.1;
        Tue, 08 Oct 2024 03:08:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQUcEGpvvYkekSrpXUKbEaU+udJ/OkXaYEc3GaTfO9O7MukfHkkFNvQmPQrKAKdrOIuzV0+uGlvK/xFLDlgKzE/TI=@vger.kernel.org, AJvYcCVCQ+/B2UKPm0QsD+AJ9dyxuT+9vayPtZeH7cDHrKfmUjTcwQJHBoWR5x3oe86sA4JzbpOUYDCGvSl1fG0+@vger.kernel.org, AJvYcCXOoQq0wSRw5y5ktFUSEnuDHC+yfuuLTZPPoGJUaXPIs4QzZwYFbYXkdWsqTzPt2zeWP6e05/t8ZjVF@vger.kernel.org
X-Received: by 2002:a05:690c:eca:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6e2c6fcbc5fmr128552717b3.3.1728382103697; Tue, 08 Oct 2024
 03:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004133108.779934-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241004133108.779934-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Oct 2024 12:08:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDc55KO-d0i0_ag0udh7sGCjFfJ78aw8o1-9zaHS15+A@mail.gmail.com>
Message-ID: <CAMuHMdXDc55KO-d0i0_ag0udh7sGCjFfJ78aw8o1-9zaHS15+A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057: Add OPP table
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Oct 4, 2024 at 3:31=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add OPP table for RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
>                 clock-frequency =3D <0>;
>         };
>
> +       /*
> +        * The default cluster table is based on the assumption that the =
PLLCA55 clock
> +        * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be=
 set to
> +        * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and addit=
ionally can be
> +        * clocked to 1.8GHz as well). The table below should be overridd=
en in the board
> +        * DTS based on the PLLCA55 clock frequency.
> +        */
> +       cluster0_opp: opp-table-0 {
> +               compatible =3D "operating-points-v2";
> +
> +               opp-1700000000 {
> +                       opp-hz =3D /bits/ 64 <1700000000>;
> +                       opp-microvolt =3D <900000>;
> +                       clock-latency-ns =3D <300000>;
> +               };
> +               opp-850000000 {
> +                       opp-hz =3D /bits/ 64 <850000000>;
> +                       opp-microvolt =3D <900000>;

According to Table 10.1-2 ("Recommended Operating Range"), this should
be 800000 for this and all operating points below.

> +                       clock-latency-ns =3D <300000>;
> +               };
> +               opp-425000000 {
> +                       opp-hz =3D /bits/ 64 <425000000>;
> +                       opp-microvolt =3D <900000>;
> +                       clock-latency-ns =3D <300000>;
> +               };
> +               opp-212500000 {
> +                       opp-hz =3D /bits/ 64 <212500000>;
> +                       opp-microvolt =3D <900000>;
> +                       clock-latency-ns =3D <300000>;
> +                       opp-suspend;
> +               };
> +       };

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

