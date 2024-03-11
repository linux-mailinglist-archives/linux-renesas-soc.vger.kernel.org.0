Return-Path: <linux-renesas-soc+bounces-3665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6860877C99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 10:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62696280E4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 09:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19DD171D8;
	Mon, 11 Mar 2024 09:24:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0D14296;
	Mon, 11 Mar 2024 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149084; cv=none; b=dF8pM1/0LiNqjkUsOt2+IDaF8Q/5oeMZTb6tgmFfOX0w4kPadvwWIE9Plp12wXp5YMzeEhwMgRNCCSyGO1CvkcGGJXifjrq7cZXAwDNycdgtrmK0yIK5L9AYvYNZDUpYG81OoltlgU9S8QOQW9XTAmiFScMOrA3mx43MjfiHcts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149084; c=relaxed/simple;
	bh=3zAL1J8HfIMhEqliD9c3YpUQWLmtm/5sW6uAWQbROKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BM8BAB7s2s2T/8dZ74uZX+HDN6rpb0K8RFH0ZD9A+kyQ6ZHOLn2o+c71Mkhs6K5rUJu4U8ZwBO1hd67lR1Ic9kimymfDlSWq/3Otp6PmTtB8kFTOnsIXtQfQwkY41UnpHoFX+kob8/KPcv47Qm2h0Y48ilzOmyyQftRvi8FEQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609ff069a40so32288947b3.1;
        Mon, 11 Mar 2024 02:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149081; x=1710753881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aT81oAJGadOC4fEK8pMphPy24pVYDf5vbDKdG3IXeTE=;
        b=JQAXmu11rRHB5fW0NOuTiwpNmqlwwNS7eYPodd/ThSn++2wi45sXBWWzpeDLk/+tlS
         WnFC5YEYGaDcDE82yOUmbyBZq7Qt9+BlGCCbbhoSvhPhFc+sMOfdmuY9vo4z2gTsenKC
         fQ/T+KG6mQ7qwQB93ZMKriOv3ZL3MRghTOdJukdT6CZywzK3hjJcyPBsFQpj9qz+owDE
         uIOM4+X2gdYcozsqUQRFMVfqVBvH4WFE7Fqp+csqT+w1kR5/obOIHqNM43BW/eZCNH75
         kG4+vISzXeVBZLg0a66pPKOydmLl+x/7i/LyRdVSUcQN8KD3ZxKNml215dntp2j9uyYC
         8hUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFxeJaMyYnoq+FdGHPYo5eEn/uK7kC0N8I4RN0m2qzynNv47hPGb96Xe+UA1mjdxpoOaufyLb7vyg7NY1z0CbY7FmlbGD3/6NarycHHxKveyQ1V2vcnpq2v2JdAUp+miY9gDKo1cbZiD20EYzIVVHcx3VYseyd5F6Z4moF3ukT3DIBG8+R
X-Gm-Message-State: AOJu0YxRm4V+AupAL8wET/zMyrE01LziVfF0Y4Qi1fCUYpKv0IL4FOhF
	YcW2H9AUuO7wuJaV80nut2/Esy04RksRlMbdyb2eFtN8w7yA0Cqc5U7zSwDLTO0=
X-Google-Smtp-Source: AGHT+IEPadrCbIeK8poRHq0ntC8funAzonXphO1XwFbtJjdr5lCSP3WXpMdiQO3hks7KJKIUtSoy1w==
X-Received: by 2002:a0d:e201:0:b0:607:b0d3:ebc0 with SMTP id l1-20020a0de201000000b00607b0d3ebc0mr5148686ywe.21.1710149081461;
        Mon, 11 Mar 2024 02:24:41 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id cm10-20020a05690c0c8a00b00609ffd0712csm1188390ywb.64.2024.03.11.02.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:24:41 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc71031680so2360673276.2;
        Mon, 11 Mar 2024 02:24:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhymiDhw3E5QSXRFDkJ7eUZ7iONCeeiWOmYjDt8sz9B2rLjB3SUzKkhLnvEDuBdiIR/kkY/5QpLVx5FUXyqoRy0IbTSTNd1/ALQhwhdEeJ/ZXSqgReeEIEkuujlg2F8edWJFDuIKI5atJ7JbPpSyJFeJDCXPcH8dsxpC46+GpH/YErV3u6
X-Received: by 2002:a25:aa8a:0:b0:dcc:7af5:97b4 with SMTP id
 t10-20020a25aa8a000000b00dcc7af597b4mr3291865ybi.12.1710149081141; Mon, 11
 Mar 2024 02:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
 <20240309155334.1310262-3-niklas.soderlund+renesas@ragnatech.se>
 <f7bb4374-0afa-b79e-e64c-bd97b6680354@omp.ru> <20240309204424.GJ3735877@ragnatech.se>
In-Reply-To: <20240309204424.GJ3735877@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 10:24:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUK034qjYXaTqGbfbwyznvdxH4AGfNtDtMY1QZSFZZVDA@mail.gmail.com>
Message-ID: <CAMuHMdUK034qjYXaTqGbfbwyznvdxH4AGfNtDtMY1QZSFZZVDA@mail.gmail.com>
Subject: Re: [net-next 2/2] ravb: Add support for an optional MDIO mode
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sat, Mar 9, 2024 at 9:44=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-03-09 22:28:47 +0300, Sergey Shtylyov wrote:
> > On 3/9/24 6:53 PM, Niklas S=C3=B6derlund wrote:
> >
> > > The driver used the OF node of the device itself when registering the
> >
> >    s/OF/DT/, perhaps?
>
> I thought we referred to it as DT node when talking about .dts{i,o}
> files and OF node when it was used inside the kernel? The infrastructure
> around its called of_get_child_by_name() and of_node_put() for example.
> And I believe OF is an abbreviation for Open Firmware (?). IIRC this is
> because ACPI might also be in the mix somewhere and DT !=3D ACPI :-)

OF is indeed an abbreviation for Open Firmware...
Originally, the of_*() code was written to interact with device trees
provided by Open Firmware.  Later, it was extended to work with
flattened device trees (FDT) provided by something other than Open
Firmware.

> I'm happy to change this if I understood it wrong, if not I like to keep
> it as is.

... but no real Open Firmware is involved on Renesas ARM platforms,
so DT is more appropriate here.

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

