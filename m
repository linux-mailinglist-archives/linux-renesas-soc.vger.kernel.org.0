Return-Path: <linux-renesas-soc+bounces-8271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E10C95F135
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7F4C28432D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FC316E886;
	Mon, 26 Aug 2024 12:22:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6531913BACE;
	Mon, 26 Aug 2024 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674933; cv=none; b=GsdSRGFH8QQ54uov7kV2ncWJxZdij+IHoIg7fUTryDuUk/nWwY38ChpJam/PhYF0iFq8Gt01/9rqCJPw9AM2tZI1wfLOQXzRCf2SrtTv3cst+Nw+bYQKSHGU37SOOCmh51uIcw2TLepr4ohNJ8md/UAzswuVdCdVotnZ2uzTNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674933; c=relaxed/simple;
	bh=uW+m3JdGXhfn404Bfx4d0D6IR/ct1t2ycf5N/TPfcf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+4SeoRac6OXvYTgBIBzk8rqmtpWv6G+PRk9RVyXFYwro+4HYIY4B1quu30beznO+XhCBcufpjvbbmbRLKlvj2Nwipm51T3DXwuOt2fasJXMwnhQnyMmpie2r3lLbGqmu/uM1XTu7MAV2cpOcEfetCGamlpnXJp5xGrH2gYowls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e165ab430e7so4301300276.2;
        Mon, 26 Aug 2024 05:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724674931; x=1725279731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLwsm9VWCJ/AMXh2DEsUuCR/6VrqrtZ36l+fjHziStY=;
        b=LzAlwsRxI4uxXEPJL3sM4yussHPB9HWtfpzkW+t2Qq4zYqvk239zomO781lGXLumo/
         LVUI3INRVxPusoE1SbZlIAPA4pKzAQfBnzF2r/iNzCrxWI8DWhHS623trwC68Ha5lCbl
         Ot+l/YSzD3VtXMkh4K5yy649D7aVIgfm1sdUmcqztXMMO0oucB++JFEA2NDjqGRcWdv8
         ptICtmZIhwYSKg/vqKOm7U88C00WFRvfWrOEaKpaWzV/iBp0EPG97MZ8jMcK2tM1RkuD
         mIkAkrVMpk1wEQRnwEMsCpGAilojv9IJs+qutrYP/bk1hmAzsfMTsAw2bkb5kwx/78NI
         lDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVumBFJ3hR9j3rbPsJd7vRVbbxrhkinIONupzm6z2WLJvU46tjWgb5oleWk5msBHCUOSVxEyVm+19X6sgBx@vger.kernel.org, AJvYcCWyx43swp1PTBsbV64bQsvSvAF4jTFpy7lKcmFceFmUaWq1qY67Pig1qcgOI1wgQoDzQIEaSUzLZXhT@vger.kernel.org, AJvYcCXjC7HM8x6+KSdKEI4gzxZ9CL9fYTmTlI31Larjj3RZFy3wq51s6Q32fnKbAFFC4GTXI3yjeeb2PRsQr2Tjxt5WQMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzzWFWUuZ7ViHl49408EzhGuY7h7jATbVasj4CUX2PXHtL4J0t
	MPwrHfXpxWyQakOICQWyzyYxYazVNos7YlrolkK1u+MsPsCj70mUIEeKkzdA
X-Google-Smtp-Source: AGHT+IFM3fhpvlJsycXad3YBrr7C1NbRszsd/IbNqee6/KGpkIzxREhJ0FnKfQH/02ZGljH5ryzADA==
X-Received: by 2002:a05:690c:fca:b0:6b3:a6ff:7688 with SMTP id 00721157ae682-6c6243209e9mr122927037b3.3.1724674930762;
        Mon, 26 Aug 2024 05:22:10 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39dc52cb6sm15101467b3.114.2024.08.26.05.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 05:22:09 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b4412fac76so37937777b3.1;
        Mon, 26 Aug 2024 05:22:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEVPb85O7kBq0GkYfnpqpskRsiUsNVVMGLy6upkKdmf/HVJvpWUF2cweNHljfzMOtIWkiaLYhviHcbdnW9@vger.kernel.org, AJvYcCWxLov/cGJj9QIxVRnwXv+8VnaPa1KXDfowrEzzF6fzFcanR8s5Sx5jDX2UB0aG9FICyjNDT/sHP1Th@vger.kernel.org, AJvYcCWxPFTSd8HgEXrFPs4cvsJOE7Y5gJmot5NcPUolFfw/BLc8hzszAEjawWKvPfX+LZl9OGMYnHPkX5jPb28IXuEWiOg=@vger.kernel.org
X-Received: by 2002:a05:690c:fca:b0:6b3:a6ff:7688 with SMTP id
 00721157ae682-6c6243209e9mr122925747b3.3.1724674928592; Mon, 26 Aug 2024
 05:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240821085644.240009-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240821085644.240009-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 14:21:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVf16ZHjyGrdFhwripfoExXrWuy1cb02eUJrWRaOeDg=g@mail.gmail.com>
Message-ID: <CAMuHMdVf16ZHjyGrdFhwripfoExXrWuy1cb02eUJrWRaOeDg=g@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Grouped WDT nodes

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -201,6 +201,50 @@ ostm3: timer@14001000 {
>                         status =3D "disabled";
>                 };
>
> +               wdt0: watchdog@11c00400 {
> +                       compatible =3D "renesas,r9a09g057-wdt";
> +                       reg =3D <0 0x11c00400 0 0x400>;
> +                       clocks =3D <&cpg CPG_MOD 75>,
> +                                <&cpg CPG_MOD 76>;
> +                       clock-names =3D "pclk", "oscclk";
> +                       resets =3D <&cpg 117>;
> +                       power-domains =3D <&cpg>;
> +                       status =3D "disabled";
> +               };
> +
> +               wdt2: watchdog@13000000 {

Usually we sort the instances within a group by instance number, i.e.

    wdt0: watchdog@11c00400 {
    wdt1: watchdog@14400000 {
    wdt2: watchdog@13000000 {
    wdt3: watchdog@13000400 {

See e.g. the scif nodes in arch/arm64/boot/dts/renesas/r8a77951.dtsi:

    scif0: serial@e6e60000 {
    scif1: serial@e6e68000 {
    scif2: serial@e6e88000 {
    scif3: serial@e6c50000 {
    scif4: serial@e6c40000 {
    scif5: serial@e6f30000 {

scif3 and scif4 have lower base addresses than scif0.

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

