Return-Path: <linux-renesas-soc+bounces-12036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15713A08E86
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 11:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAB24162D11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 10:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CDE205513;
	Fri, 10 Jan 2025 10:51:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CFE1CF5CE;
	Fri, 10 Jan 2025 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506319; cv=none; b=RQSzaDTmkU3VP1ppalHHvGtLSZ2wlZKQhJdDzB5xWhjMNwogUPvjZz997b/JyKyYaaAfJjaeWDJliwn9HnyGWvqELlJ6nBfysNsNh/I8kLiFoQ2dZeGboX6pGwBTruogkuFkrZZPN/7IIXi/jzRK/PH6pOpZhRAWTaUKHKiyYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506319; c=relaxed/simple;
	bh=Ku/tZqIZfUSi3lyGMriIrimGxm678r/JWq9SnXVIu/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSZloZO9jQjO+xq5T0q2WoPaXn/qtn3bztKLU4BSQPxLdseW+VYMnQm/8eqOu3FayTvql3RaLGusdg9Rs22myR+GtCjDb/qRidjKdSRlKUGbHmQcJNayIMbu71jT7fZ9+b2L0nxAjAyz/IMDB+uB1Fe2y2A5zkppNKJQkzc5WG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afe7429d37so591131137.2;
        Fri, 10 Jan 2025 02:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506316; x=1737111116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xD+QBn4eamxGTa5r0rGEze9z++OC/hTeuXgPbAlNZ6k=;
        b=sYTuk/dzfTjeCARt+YQFcZDLI3/DaiPFXV55EDI7960fHR5UuZPewF8MGRKeEmxYEq
         QtXITzu/WvWkjQhmnMGxYgEhnoQk+ho9V0R0uwX+VY7GUqMIf3h8Yz0/usYTTPT3Y2Vo
         3lOX0ouLI8ObxghuGhrgkrKIbGH8u5ifVEU59N8Hp3/8GOsWkz1zfHNsQAMqaAZbuVU2
         LmN4SOkrGkl9Dm77mGUYCV/irsqPMroSE/rpQ/8p/6MxzrQvTjlTi8tiUesfFx61s4KH
         vuDRIRqFXH1jAPWxWxFHuODk5aHcKWlvWnrSbVVa5U9mDEzCdRXDku2zSNskh3b3lZ/v
         I77g==
X-Forwarded-Encrypted: i=1; AJvYcCVMwnqsPV2m6iEz2BoyZls3hcxkDPavDNT9ywlxZsH1OhAowFf7Vrp98185Km2xk/sLI833OdntllHA0z8UBaJPebA=@vger.kernel.org, AJvYcCXn5wzdMYpYRM5ro/TISbaVNE/bkCLUO3sdeXZOEigvr/q7CYMUGnGPu3f+xC83e3SnwVA/tqzL+xJ3@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZJJswiqX9Z/7N4WG3LANTGgKbLHWbLGaMt+eUMawn5hpYQgU
	tBnq0U5ZRnptmsC9N2qMlflOvTzO2O3RP0j1hEFMUXH8F4MuPoDSyB6Laqu6
X-Gm-Gg: ASbGnctK9+6exz5uK7eb8HzuIn0xUhsQ0GFirKbCsNOaWfkjJQI+n22kCODooloAl39
	v7FuTEDrJg8DWxggz0hUmJduKEIN80Vck6L2mL0aPlXpw5+rKlorDS4CTZuVI73wftmykgwMZvn
	dnxYoFBP8VhZWWHa+F4xq56GyfH1NZrCv88Ab3Yvmr/gJ+imOnuZfAGO/BMVMH/62Sk/r2SFS40
	pTv4TgxOkEsTln9kckT2htAM1L/SbsHNV8P6cuJEuwNxs7l+2Ludp2+3gy3d9nwC1NOzN8xy6tm
	45N/6iIzySGccayOpg8=
X-Google-Smtp-Source: AGHT+IFnVgwt0lbuPmb715YY5ELIKVaDn1bF8f6MozjPr+OuRQytWio7FhAnBR0NJSIKrDKMlo6xww==
X-Received: by 2002:a05:6102:6cc:b0:4b1:1eb5:8ee3 with SMTP id ada2fe7eead31-4b3d104a934mr9274344137.22.1736506315743;
        Fri, 10 Jan 2025 02:51:55 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f02ee3sm2246579137.4.2025.01.10.02.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:51:55 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afdd15db60so672076137.1;
        Fri, 10 Jan 2025 02:51:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrELnePbql9S2N2/4nT4tz8ahdTZSC1eZCo8ykK+HmLsmhu3/QV7LWkuFOOkyezdMDmvJiSmZNMiR0@vger.kernel.org, AJvYcCX5ZxPWWfWLBYCN5DQfTUftbuGQRseBW8g+8gCvpkhtz4C61rTyku4v3w4HqgFDeN7U67XE3d/Ai5xSL+vMU16TcCE=@vger.kernel.org
X-Received: by 2002:a05:6102:ccb:b0:4b6:20a5:776 with SMTP id
 ada2fe7eead31-4b620a50949mr2130481137.17.1736506315147; Fri, 10 Jan 2025
 02:51:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se> <20250109125433.2402045-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250109125433.2402045-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 11:51:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXg=htmVv5G+VQX7GZvAEsnowtdEopt5MOu+SiJptiR8A@mail.gmail.com>
X-Gm-Features: AbW1kva363ycvdroFB9DzPthq00JtP-7QdII1Pqszh3ii4hGo1-ngWGShj4bN8U
Message-ID: <CAMuHMdXg=htmVv5G+VQX7GZvAEsnowtdEopt5MOu+SiJptiR8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add VSPX instances
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Jan 9, 2025 at 1:55=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the VSPX instances on R-Car V3U.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -2926,6 +2926,50 @@ fcpvx3: fcp@fedc8000 {
>                         iommus =3D <&ipmmu_vi1 27>;
>                 };
>
> +               vspx0: vsp@fedd0000 {

I think it makes sense to move these next to the existing vsp nodes.
If you agree, I can do that while applying.

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

