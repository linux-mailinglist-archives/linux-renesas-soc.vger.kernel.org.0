Return-Path: <linux-renesas-soc+bounces-7024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EC192557B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 10:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1F71B20C20
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 08:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AAC13A865;
	Wed,  3 Jul 2024 08:36:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ABD4D584;
	Wed,  3 Jul 2024 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719995800; cv=none; b=LHep7Tl2/gXBW7DC7Wp0fpr4JJ1tBeWb9+uSliH2g2mT7CAbOfsSSZtPuqnQx7V04fOveKdp/Lup0soyO4FTQrQ7TGoI3keQBTZD96NfikmtKjANspnb2jPwdOFiiBrEpb7ujc+tE7jNVb54+Xko310C80rcSqoy6RCS+EHdZZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719995800; c=relaxed/simple;
	bh=yxxrwJseAuushSEziKMefvZ7jrdU8YxyJrKEd0CjvnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiARfBs0mdWs8kz+zSD6AbqijeDtweThg8jSWpGTb8kyl213udml8yd6SIzSMGnwgBsVjUMd7vIT5QSYrM5xQA+fjvG4ugII8CzFoaWkCYiVeoQy7oC81MQexg7koD44Nbe/4KuJqH1tg56AP8HQtHUw+CbrESCWkRA+5h5oeDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-650cef35de3so10762267b3.1;
        Wed, 03 Jul 2024 01:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719995796; x=1720600596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BT6Tv6N+pnktl0oz4QdEbXnwBPXb90Am/ZyrrKG3Cy4=;
        b=D8YFkJHnE5ooFBKl2SxNP3b+zuHhbFdqFy1G2b9J9NAE5rK35obL3rO0O1SoLGoRFv
         /NyiSN9OMGqlwVj7NvWmja2ls5WD7yNzN/Yvnrtv61WjtRE6F/tk4QjeJAL7VpUn5Z63
         qauoO24hze/TGQxLw1qxJ5X2tZ6mNpx/0jl6BueoAxJpTvVs207LFvOBCKxqQxH7CK87
         5d3FnjiC8KnX4dj/ozobfhWJn2s8CCly5kJoHXuWO3CQMTelHbgBbqyQVWjBedl1v7oA
         IlgYhsEkrJBwCBbCrO/AKJhmRyPoLWRpeTWLTfvaZe0V2wHaKU9JrXPkXZJTD2G4s5o1
         D9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWv6LgJ9RWZKcIxxblbCsd4jt3/M4w8Ogoq0wwAGJI7YyCgZiRTMCdiwLEIEVyfdDm+k0hT8liZd54S1GvI1sfC9rrZe656NfkiydPn+toE8MwgshbmE9oqNtJYkMDjhF+dKFKQwkqLFu7dEQfR
X-Gm-Message-State: AOJu0YwpGDzDiuR1uOsI2ZeoiXVwSVkdZj3hL5hAVzWs2oc1sw0nev7K
	k6mkhHWMStUl546rNpCHtyedW+gK6QzQMR41NHSC+8gRcWOy4GUXHGQRYLfw
X-Google-Smtp-Source: AGHT+IHgDEapnCLwPgCzhVsWBD+dZBqedypq8paQw3MwsIYPwkZhRykJ6DQedbdxooW9RQHMokyegA==
X-Received: by 2002:a81:84d0:0:b0:61a:d846:9858 with SMTP id 00721157ae682-64c71aec0b5mr114884187b3.20.1719995796106;
        Wed, 03 Jul 2024 01:36:36 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-650fca11ff8sm3075157b3.40.2024.07.03.01.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 01:36:35 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-650cef35de3so10761997b3.1;
        Wed, 03 Jul 2024 01:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEMJUf5yqMAggnv/xsqTvEoMzqdkiYp+AJ7ZrlxQAcasJFND0qH9iKTp/uEUs0WdeKwc2x0IDMgSDQQS1fQc0OWCwJwnolimV5YGxIvFQUAqT6/70Ce36Opr+VKlnbRAkiFU2AqF0ZOEFsmoD0
X-Received: by 2002:a81:ae17:0:b0:650:9799:41d2 with SMTP id
 00721157ae682-6509799460cmr31241117b3.30.1719995795398; Wed, 03 Jul 2024
 01:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702180032.207275-1-biju.das.jz@bp.renesas.com> <20240702180032.207275-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240702180032.207275-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jul 2024 10:36:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmvWPPBVqhtpu2dovwQg7YA7TVZBRnATUiY+1QRy0B1w@mail.gmail.com>
Message-ID: <CAMuHMdUmvWPPBVqhtpu2dovwQg7YA7TVZBRnATUiY+1QRy0B1w@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Jul 2, 2024 at 8:01=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Replace the fixed regulator for USB VBUS and use the proper one that
> controls regulator based on VBUS detection.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Updated commit description.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> @@ -54,14 +54,6 @@ codec_dai: simple-audio-card,codec {
>                 };
>         };
>
> -       usb0_vbus_otg: regulator-usb0-vbus-otg {
> -               compatible =3D "regulator-fixed";
> -
> -               regulator-name =3D "USB0_VBUS_OTG";
> -               regulator-min-microvolt =3D <5000000>;
> -               regulator-max-microvolt =3D <5000000>;
> -       };
> -
>         vccq_sdhi1: regulator-vccq-sdhi1 {
>                 compatible =3D "regulator-gpio";
>                 regulator-name =3D "SDHI1 VccQ";
> @@ -139,6 +131,9 @@ &ohci1 {
>
>  &phyrst {
>         status =3D "okay";
> +       usb0_vbus_otg: regulator-vbus {

The label is not really needed, is it?

> +               regulator-name =3D "vbus";
> +       };

Also, as the regulator-vbus subnode is required, perhaps it should
be moved to the SoC-specific .dtsi? Or do you keep it here for
board-specific control of the regulator name, i.e. to avoid conflicts?

>  };
>
>  &scif0 {

Anyway, this adheres to the DT bindings, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

