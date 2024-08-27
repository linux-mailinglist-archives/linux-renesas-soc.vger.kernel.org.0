Return-Path: <linux-renesas-soc+bounces-8370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34644960B3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 15:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BCA3B225AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A811BD03A;
	Tue, 27 Aug 2024 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm3UJlLr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C301A1BD013;
	Tue, 27 Aug 2024 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724763845; cv=none; b=Ju4Ocy18h0THOTl/p1SdpYHo7Nbx5EvkxHTt/Ad+bxEQBhe9JbjrMl2u9sDhrKQzS9wO2/x5nkalk/WHGvGY7+kjiZ3QLR61RDd5bAtP9o/mMFEthngaTkmDjeBK75/wd04Iy/Cq0OHAQgQFZz/FQIOZEZR3grrw82nI/Bt7Mzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724763845; c=relaxed/simple;
	bh=B0lMfB2omigVBisxCiV6nQcNaiV/K2i5UL2yptJOSf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J25Y4kUg6RTrc80Piknvvr/qssBqHMzsLukumQVxhKBjCJrv1yp31tsQwl/Z4mIdqLu1UdguSB4s+8jyOW7+UYAS6vNtVVNuusfaigwyH530ULkNbb/o5NfBgxRvhJmsQxMdIv/d+zXc9f2mosZRNToiTXwqo9DQA+shd+hh7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lm3UJlLr; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-45019dccc3aso33348561cf.1;
        Tue, 27 Aug 2024 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724763843; x=1725368643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NS2KSURtky0+tKNFEhKcMtrkr7RAicG1qVIXi7w+Mc=;
        b=Lm3UJlLrShFYm+m7SD16cQEVo4+oTYIcNE02Jq1KU9mSiUcSqHTJFEir44yKz58M96
         pMFsg0g62Zu4+zcGJpNJ+jeXE0UY9ft5oQjw7kt5MAG0CkRTvOOuCe2at9cTsROPQuZS
         CDoW6qwoANwkcK7kHwJ1qbvgaU9Nens/evTS5bNrO1CETuaJgwzMINlIIDlLnto7YIwi
         xbQEknoF4orTEXbeOCzcjxJMxzjk/7P1kflK/hT1PNObSFjMlNp/CjxZu/BD9Ri3Rx47
         yuXHvu38Vq199hJqiepOIOzDGT/HUXw6UqoERGMGVDmgKn1MTAYfp3ILdaGsUZRwkER2
         rMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763843; x=1725368643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NS2KSURtky0+tKNFEhKcMtrkr7RAicG1qVIXi7w+Mc=;
        b=wLxnVBE91slGty3sribvaOY4nGbVdafuUpVrm/IpujOcQFZmn0kdCXGLppZrK6P8LV
         y/DUgRHD1HTqoIyvadx87JB9dW0zuP+VB/CTIb8X5kXhyc7J6R3NsmMMjA6u56YRAXG0
         jcOEwUoDC4C8PzdExpD++JQ+/BHLvJk1Q0bcGzb4S3aeld0Iwno0m+Yyc7d9UKFP3Qd4
         spjt1IpDxB52VmNmhnnEmmioTOzmpAJw1kNuL0tjV16T3sMi/0/BXawc3RQ3didUFNV+
         DU9ix1qTzYHxLPmoTDcAM4dwiWeLKylMEni84PlajVdD0ZtmxLT6n4o4P3x91gjUJTOz
         ytag==
X-Forwarded-Encrypted: i=1; AJvYcCUQdkQwOMlpmmuQz4Y7hhffXVknpf/VuYZrw6k9LY+0vJT4/lP6ahXi+GvaLZV8XBJHZe3UAlvtgYCYrzKj1BwH7m0=@vger.kernel.org, AJvYcCWAaifY7JdpqsXUzkXX2cwfnswwB0GZ2SZsV2KYUgDah0GeXBlwcA+dPY2R7UcYrKkr0/sLqMGU1wO96I2j@vger.kernel.org, AJvYcCWuN+tofY7177MLDRbiV/gMjUoTP/TqSnvGnQgHZvOhnLd02qRgnjHPv72LDYbbGDvk9jWtgGKKXms=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg7NU2hVO2g5+86oOqW5pcPSxTMwd1JCEn5En6IiaGkauUDFmQ
	K/NrxRKC1rKqBD1ObXBN0Qyt5P2uo0dFnQzHjuou5HFesaNXifH0ErfIPe79YuCYZrmC7to6TdY
	vkfZ6kQWU/8pdRKg12YR8/1pvm2E=
X-Google-Smtp-Source: AGHT+IF3MCqYAe5gveOtRrtdaSMoCeURDc2EQdNgdM+B61nRmAAfcxswIza+Zrw5bAebvnnuPwkKoOY/WVR0xQpd+fg=
X-Received: by 2002:a05:622a:990:b0:454:f2e1:2a65 with SMTP id
 d75a77b69052e-455095e6effmr164131811cf.1.1724763842492; Tue, 27 Aug 2024
 06:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822111631.544886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240822111631.544886-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVHuej==aKo+6CTeo00cJLb59wDGu3Rq-ECRq7=cU2wdQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVHuej==aKo+6CTeo00cJLb59wDGu3Rq-ECRq7=cU2wdQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Aug 2024 14:03:35 +0100
Message-ID: <CA+V-a8sk7aPsUp=J0y7ErCj+KHYb6=6N97qNzQHZ9Y8LTvCcVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzv2h-cpg: Add support for dynamic
 switching divider clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 26, 2024 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Aug 22, 2024 at 1:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for dynamic switching divider clocks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Dropped DDIV_DIVCTL_WIDTH
> > - width is now extracted from conf
> > - Updated DDIV_GET_* macros
> > - Now doing rmw as some of the DIVCTLx require it
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -45,14 +45,23 @@
> >  #define PDIV(val)              FIELD_GET(GENMASK(5, 0), (val))
> >  #define SDIV(val)              FIELD_GET(GENMASK(2, 0), (val))
> >
> > +#define DDIV_DIVCTL_WEN(shift)         (1 << ((shift) + 16))
>
> BIT((shift) + 16)
>
Agreed.

> > +#define DDIV_GET_WIDTH(val)            FIELD_GET(GENMASK(3, 0), (val))
> > +#define DDIV_GET_SHIFT(val)            FIELD_GET(GENMASK(7, 4), (val))
> > +#define DDIV_GET_REG_OFFSET(val)       FIELD_GET(GENMASK(18, 8), (val)=
)
> > +#define DDIV_GET_MON(val)              FIELD_GET(GENMASK(23, 19), (val=
))
>
> These are not register fields, so you might as well just use C bitfields
> accesses instead:
>
>     struct ddiv {
>             unsigned int width:4;
>             unsigned int shift:4;
>             unsigned int offset:11;
>             unsigned int monbit:5;
>     };
>
>     if ((shift + core->ddiv.width > 16)
>             return ERR_PTR(-EINVAL);
>
> (you can put cpg_core_clk.conf and cpg_core_clk.ddiv in a union to save s=
pace)
>
OK, I'll update it to below,

/**
 * struct ddiv - Structure for dynamic switching divider
 *
 * @offset: register offset
 * @shift: position of the divider bit
 * @width: width of the divider
 * @monbit: monitor bit in CPG_CLKSTATUS0 register
 */
struct ddiv {
    unsigned int offset:11;
    unsigned int shift:4;
    unsigned int width:4;
    unsigned int monbit:5;
};

#define DDIV_PACK(_offset, _shift, _width, _monbit) \
    ((struct ddiv){ \
        .offset =3D _offset, \
        .shift =3D _shift, \
        .width =3D _width, \
        .monbit =3D _monbit \
    })

#define CPG_CDDIV0        (0x400)

#define CDDIV0_DIVCTL2    DDIV_PACK(CPG_CDDIV0, 8, 3, 2)

/**
 * Definitions of CPG Core Clocks
 *
 * These include:
 *   - Clock outputs exported to DT
 *   - External input clocks
 *   - Internal CPG clocks
 */
struct cpg_core_clk {
    const char *name;
    unsigned int id;
    unsigned int parent;
    unsigned int div;
    unsigned int mult;
    unsigned int type;
    union {
        unsigned int conf;
        struct ddiv ddiv;
    } cfg;
    const struct clk_div_table *dtable;
    u32 flag;
};

Cheers,
Prabhakar

