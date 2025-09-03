Return-Path: <linux-renesas-soc+bounces-21287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDD9B42409
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0768D167333
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D686D2DAFDD;
	Wed,  3 Sep 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlVI0jyW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEF2212569;
	Wed,  3 Sep 2025 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911101; cv=none; b=TiYnIDE5MX0Zo6jSwhhq40BP32P6IyFrbmOwtCxiYEK8VoOAdWnFSwAKjJ/VLM8ooiSnUvSuUQHv/fItlN+4xvD3EWFJezMvb1Yjl5QW6pcJGScvOXPUN79pOztCfeoj9gigo7psIjlwzfqhtpRFcEEZRaDf6HGacz1U1FXeqcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911101; c=relaxed/simple;
	bh=ViULookCR7D8mwqL/cpGeW24wX8pHVj4M5klm/jS3Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zphzy1rizRjmm3DHrVrB/72/D2MFO1leSu4kpGoxpFRzWwuitsY7jG89vKWM31BagIhRdm0YHsR7sb1YPC0C4fEkWuUYsJCASuCxfAVB3uckan0LZHMDhYKuSV1fSW3rrkW4u9ocAU5PJNGMLIEnyOMevveaQQ82melVTN3e3S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlVI0jyW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so392065e9.0;
        Wed, 03 Sep 2025 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756911098; x=1757515898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONQCd5mtEfll1aSXZi1ZT7BJjKeR37O5uZEXbkjmGkU=;
        b=hlVI0jyW4hknJQ8OIvPazTFDfBpxnW95f27ybAw6lwNngLwH7tqTnmvBnTGO65nqqv
         7z2q4Jb7JHBNofqZghzeFmZndYAHsE9LQ6FsyiAKQQmsX0Fy6A5uAYxG6f3xHMqr52gL
         Fcjpqq88Je6vzpoKOL9j+vOgmkpoTVyLaVeV/RbK4C0yjE+1ywplPoBm17Em1OBTy3x9
         EJSHDtmfUZG9/Vs1Ox+QzhIRBr5P/hAqLHnJrYoqtL5ScAypsoPnTIZ79bTiGvUgKjMt
         ad1fonRWn6pKOi9Z5RuaL1n6uq9T55P4GZV+hLZHlehirdIEAIjh2FAw9IgCYnLwX8hP
         cyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911098; x=1757515898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONQCd5mtEfll1aSXZi1ZT7BJjKeR37O5uZEXbkjmGkU=;
        b=hUQt2yvzr0TOorBGmL4sA85odD/HDzI89iYuCVoDwaGDD/LFwoP65N+I05P/f6ueZR
         TmWsE8sr50rNxZIOJepj4FxJ/25ekQwqg7FG402Nri9atV+tjaAuFF1L5qjy2FP7pdn/
         TcdT5apV4KEANB2BWg0snlm6RDOh1hJ7coV24YFI9TBLHor6udf37Cvr6p3OgdgdTMds
         hFglBULlGkTPFDI1M863JoOZOrDDwzj5vdaQHjcQUjVwDbhYwy2/njeA5vxxlu714rS+
         bUV6ft7qObspBBk0P4yzu5+zw3mg7765du7ymPFcvpoCLUWpz1Mefhlk5CYNW9WNBMRl
         bvoA==
X-Forwarded-Encrypted: i=1; AJvYcCVmu1f4Y+RkroND72H9BHz5mjhKiiGvp4resK4hjA3WL61Z7xxi/ojDsVFAq5PzRRWQR+bWwE5bgApG@vger.kernel.org, AJvYcCVrl4ZqS56farTcg60lxPsw/WOTxO56BLo86v3bXehoioDt9k552K0PP4s3cMUjk5ZOQKkwDjfLKN0pNRUf@vger.kernel.org, AJvYcCWvQGE3SwKN5UxQe6/YadUh6iudr9bVm277KBxs0f3dq2bGzPJKy8f9m75whKRv9/BrkFfdFP6EfHViMF7DyW2ePYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OQjB8sYliTHn8TL18kX6i28c1TD2reBfOhIhPQJ7BStrFz/P
	CQX+icQrID5mZYNFi+7srkDR0sAYDkpXBCJgAYLYGPx/HgYrV53hbq5Qr2GlnVT9Y9NBtfWCKCM
	Hg1LVyP3tyG1ODs64ZOom2dwkxcKKfMU=
X-Gm-Gg: ASbGncswC/Ju6apEQILB1dSVBBf0cFQsAz71BySFiD5Wd871IroZoHT3GGfWQ83mHMf
	8327OXcTuwn5dBGE+RRKxSqywNsn9gswxNwCwdtQY6AYLoq1xTB6d1iqpjxa7hIGWEBAcLuWhOq
	IscD8q/eZMyOsztgM7DRNkxgqHmL5QwpG/8PBowZVNHV0OVWQOKUzBcN0SoRLMjirlNEyZB/Sdu
	++ElRxvHlfoFKbFlKhbWMZgCZ80fkFpk8CThScyj36XbMP5PFA=
X-Google-Smtp-Source: AGHT+IF942RsmZBPmgo3FojGihUawL7grgyK/Ea4c2cI/k4EUPA4isjdB4usMDdFUmdW6V7rpqqRgP7HQl8mgKVDfHY=
X-Received: by 2002:a05:600c:45cb:b0:45b:8aa0:c7a with SMTP id
 5b1f17b1804b1-45b8aa00fa4mr135726905e9.30.1756911098143; Wed, 03 Sep 2025
 07:51:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250821161946.1096033-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWPst=JAbyL43SZAHTrCR=wajs15JZXCH4kmM41cdAh5w@mail.gmail.com>
In-Reply-To: <CAMuHMdWPst=JAbyL43SZAHTrCR=wajs15JZXCH4kmM41cdAh5w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 3 Sep 2025 15:51:11 +0100
X-Gm-Features: Ac12FXx3aixEQx6DWLJgwyjIlNe0YkYiwZL27VPA_flFqJGI6Hnl0U1LpWsC-Vg
Message-ID: <CA+V-a8thD8ALr+tzyBC9kjuTw4iLbSn2UBLJC+zgo+HCa6yN+A@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r9a09g077: Add USB2.0 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Sep 3, 2025 at 3:05=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add EHCI, OHCI, PHY and HSUSB nodes to RZ/T2H (R9A09G077) SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
>
> > +               hsusb: usb@92041000 {
> > +                       compatible =3D "renesas,usbhs-r9a09g077";
> > +                       reg =3D <0 0x92041000 0 0x10000>;
>
> "0x1000", as the region starting at 0x92043000 is marked reserved?
> I can fix that while applying.
>
Ouch agreed, thank you for taking care of this (also for RZ/N2H patch).

Cheers,
Prabhakar

> > +                       interrupts =3D <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&cpg CPG_MOD 408>;
> > +                       phys =3D <&usb2_phy 3>;
> > +                       phy-names =3D "usb";
> > +                       power-domains =3D <&cpg>;
> > +                       status =3D "disabled";
> > +               };
> > +
> >                 sdhi0: mmc@92080000  {
> >                         compatible =3D "renesas,sdhi-r9a09g077",
> >                                      "renesas,sdhi-r9a09g057";
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

