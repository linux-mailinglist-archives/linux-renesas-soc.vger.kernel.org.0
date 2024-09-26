Return-Path: <linux-renesas-soc+bounces-9086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8AA9873B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 14:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60913286978
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1697010F4;
	Thu, 26 Sep 2024 12:41:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A223FF1;
	Thu, 26 Sep 2024 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727354479; cv=none; b=P+xENLQRC3cFpe/wT/q46hfDlI8URrmQuNejEOFOFPuUz4JS63HTNAK+yzhhrIeQU1WWVXFo0vaogP7kiNKTACchpLEciiOwU49qVQ1GA84Cy+I4+HhDuLx60D8gK2zVEcTq4hG6iIr9xZquktpoexaTrsgrJdkJBIHC6Ceu5NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727354479; c=relaxed/simple;
	bh=9H5fLgkM5EykQ7gd7+WWZI0Degjq3pPi1YkZ1bmQzUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUaJDqk0TnbHvsr+dQTJ3fTVCZTvFDScTymtNW5Swi0FOwsMqwVmM4QNQdkAKrpwUa2le8aToZdkow5KzbSZAEuhr7Yzrqg2oDKQfSSu8m9FahiPGVa35YvMRSwhtHPdkZnGz7uRGvp931vgk102vUQdOjDsQ6wVMZ0pqDhuTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6dbc75acbfaso8961617b3.3;
        Thu, 26 Sep 2024 05:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727354475; x=1727959275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPVnklwhSJaUKS4J3ASyaEzfdqfrhx+UCF1pV70djn8=;
        b=S9rdUX1St5ZIMkrQJwSP/8LWc1otyTtikSI91cehS9odDp1trP5XTMRyBizLSlO+Vo
         adKeK9ApAGR697Tos/DoUR2Ntkx0emi4bET4if6RKi5QHC+oiSpxJGGP5o/DrlPfy9p9
         wsMRrv6MsGQu5+skUhiHuHde35/TdalIrS3NRKkUR8/I5blJTttnqf+e1t/QC+XrIoKS
         yqCwN2u0kxD7qrvECIACmpyBLqoELdKqDmqRIdCdxaFhicIzkrvaCuvdUaiffWR4U/NN
         0vpuLj/LzAlgk171OM/qPzrI382wkCt6GSQo5bxw+J7WZw4zIqLUCyJ34Xw+G9gN4DT9
         /Cew==
X-Forwarded-Encrypted: i=1; AJvYcCViV7ucNX5+CHWD/BoU6gnVVITOSEMOVupUJ58sFCWpfPFsCIrrjKXJ/4/1YCdhQq4WFXywoCTWrGmf@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBQr7yksZwIgYoahkOTawiSzIDWTEoHD5MggK1IdlD1R4bLiK
	NDZfzs8GcKAxY3C8BgxcV6xfr8eNo/cqH3UlQRlxaiZUut2CeS+pAgzrUdbH
X-Google-Smtp-Source: AGHT+IHlfW6Jiy0RkhoExtFeZDPuFuiVch7JL/gy704pF0Fh8jvUj5ziP6ZkcM/F1AMK+omFE9ysEA==
X-Received: by 2002:a05:690c:660f:b0:6e2:1527:446b with SMTP id 00721157ae682-6e21d6c71a8mr59932507b3.3.1727354475450;
        Thu, 26 Sep 2024 05:41:15 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e22d3a7502sm3807377b3.77.2024.09.26.05.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 05:41:15 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso825977276.1;
        Thu, 26 Sep 2024 05:41:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3Jnwz6UEtdxYG77rW2BBuYu8O+nypi22nN3NSztQhWkzbtcjK6ybmaN+RNUv9FwZibIfGuzeK/W8S@vger.kernel.org
X-Received: by 2002:a05:690c:660f:b0:6dd:ba98:5c3d with SMTP id
 00721157ae682-6e21d703938mr60419227b3.14.1727354474637; Thu, 26 Sep 2024
 05:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com> <20240921114813.4124-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240921114813.4124-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 14:41:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDJkf_aibpCx5ua+QCTzM5orN45TA0Ct5OR7fmbiMwJA@mail.gmail.com>
Message-ID: <CAMuHMdVDJkf_aibpCx5ua+QCTzM5orN45TA0Ct5OR7fmbiMwJA@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: renesas: genmai: define keyboard switch
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 1:48=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13...

> --- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts

> @@ -58,6 +59,22 @@ partition@4000000 {
>                 };
>         };
>
> +       keyboard {
> +               compatible =3D "gpio-keys";
> +               interrupt-parent =3D <&irqc>;

... with the interrupt-parent definition moved to the key-1 subnode.

> +
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&keyboard_pins>;
> +
> +               key-1 {
> +                       /* JP3 must be set to 1-2 (default) */
> +                       interrupts =3D <6 IRQ_TYPE_EDGE_BOTH>;
> +                       linux,code =3D <KEY_1>;
> +                       label =3D "SW6,SW7";
> +                       wakeup-source;
> +               };
> +       };
> +
>         leds {
>                 status =3D "okay";
>                 compatible =3D "gpio-leds";

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

