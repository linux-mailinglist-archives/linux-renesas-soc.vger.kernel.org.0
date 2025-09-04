Return-Path: <linux-renesas-soc+bounces-21315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE071B43492
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 09:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EBA65E80BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 07:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833FD29C328;
	Thu,  4 Sep 2025 07:51:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0A2356B9;
	Thu,  4 Sep 2025 07:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756972277; cv=none; b=KnVnZeHRl6gzvP3UEuqWjv3/SgJSiIishcXxsBg76LroHfa0uQT2RRwSEz5hIU8FWqQiyFcObMuRCZFjCS+8oShJgrArVRbSazAlQvl46t/wEo5S5LGfHZjHMKd2z39BakWkkWWYcI3ks6YqysZ+uGkLLje2a7+q4AV/vLeegao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756972277; c=relaxed/simple;
	bh=6AXFif0EultLOwIbtJG+3RqrJO0kW3dm59Ihkf8v/+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJvKd3JsJInL4hHNEw3ecEqy916Am8kv8uPTmxPDayHyxp8W9WSRWQErMFfd+qR/9ONadwCff3Z6UdaettlRt+EY/TZR/LiSTzL17IGcTc+H0W6eDo2VR/+Siu6JMsfm0nTmKZ96yW4RgVOm5JHeO/Q6UMIETVdHiKZ0EjfGd1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8960a00e85bso512172241.1;
        Thu, 04 Sep 2025 00:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756972274; x=1757577074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hd7diSEglZ29T85KZbv5L50Neiq3jMyNbZrXj1g/9/4=;
        b=TZD3GT5SzDTApI6/a+tkR24ojl/nMEULT07NEfiWuMSFIsPUxUy8DwGh/fbuHUXwU7
         B36LNJWDaTmzVFHyKmOgCv2Zio2twN3rMX4od2Lkefb12DKyJIb7g6k36/K8nWi/aKoK
         yHB5iPUu8hkXigpdGRvn37INBKqRxJjufW/eVgKrxfFfopjn9Xr3GKmFJOXeUu0dNwug
         wBIp+ebhK7mws43Or9IB5ZwU6Rw7oDOVzrY4QnmZhvBfeaONmSWp2DhzFJz9M064QGVl
         un6D75VB3NGg8AFQ7xDmb6rwGbswcadPPLm8Ij11Nm9IYRyVacmskhlJt6MkrnxyTEbO
         2e0g==
X-Forwarded-Encrypted: i=1; AJvYcCUAlNOKqoTl1cHFf/N8nmLwb9Z1lFIj61u109md9vORdnN5DY69J6GzJHLXPiDzefxrggIAqYi/jLUT@vger.kernel.org, AJvYcCUxnOkfxPEuZGWHhzTiODaSJfo430BsMte7z8SyEIu+l5ZqyYQTfP3SjDaohAk54WJpW7sN0H1N0kM6LXqD4ihH0bw=@vger.kernel.org, AJvYcCVmJpS/JHin8XWQ7c9aZRVlbw6ox1gsH5OBoc2zE3hrI7uXb0K4myk4FScXGhCLfTn63MSP607xJyOkZrxl@vger.kernel.org
X-Gm-Message-State: AOJu0YxyoRigviYCDaqWnReMxNOW7WKKB6rJhZxIsSSdTHQ1lzRermEQ
	PUMdNX1aQV8ZOtM0KJJGyBHqH3ONB38GXehXcoKXkZkhWErUA8mJoWV6gnp+Zfu4
X-Gm-Gg: ASbGnctRdt0oPOFwJJ3JVo8UQSyzhbWIWFDBRWwiMVeOUjTd2mj5nPZ4cxqnYlAyo6F
	XOjoLnvxs15/q+ab3P5hFyjlZ//3k3wcua87s+ehR1wZLw8V7e9sq+rWbuuTuomX/Dl/QQfxNVI
	LiJ65C+hCD/1VtILCfc23Y77ulewmEfA5cmOQZhxXYrj5gLr4YqR0CzdfdFtWE9EcYPnNWi3LfJ
	m4wy6T8WL40y21ctbSTCI0Gf9UTk7ZnVnd/Z4DgZfWHqstulfojUmy9ICP0MDq+TC51HfmWAdVo
	KBE5NM+wiAlxZvapH2U5KuHpkMysqGkFR7qWLmpIHcERC1/ADeIO3nMeAGj5k2AdDI7Dk+bQf9x
	jN65TeYOAVB82TCz5uVoDqevH33fmHFoQr97Th4wWRfoG7zFDmdhyeW91LCzUFr5fSXYuzvA=
X-Google-Smtp-Source: AGHT+IGLzaPGRYu/MVv0OVN1kHPR3hbjzNzQnC4CsvbbArgCkJV3Wg2OdyBtfcOHIn7a3a1YAiNMMA==
X-Received: by 2002:a05:6102:3253:20b0:52e:68:770a with SMTP id ada2fe7eead31-52e00687c8bmr4205469137.24.1756972273983;
        Thu, 04 Sep 2025 00:51:13 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491318ecbsm7757266e0c.11.2025.09.04.00.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 00:51:13 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-529f4770585so538395137.1;
        Thu, 04 Sep 2025 00:51:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUJFB7JmQwKIv8BWkMADu29RVF70bm3AWT+Dr7Ls39FpKMQlxhl8+YkQSzDUCoex17WgNAAsSNfoeAFvRLTqSC8OQ=@vger.kernel.org, AJvYcCW7X79U+qjtAp6Z+bOKvMEMiB7LzoZTHoRb58voGnIXRyrmi/Jw3cYv2+jCj+MCt/0PSwteg6/OGSUX@vger.kernel.org, AJvYcCXxEbgLW3zueArzFtIQ+v5RIg/BTfOM6ajHzzpErx3xNym66B/sSIpw/Ek7ZbWKpkWtUWJsMTeA6lZp9FXE@vger.kernel.org
X-Received: by 2002:a05:6102:4b84:b0:529:4cf5:8aee with SMTP id
 ada2fe7eead31-52b19e6576emr6815330137.12.1756972273467; Thu, 04 Sep 2025
 00:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250821161946.1096033-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVb_5+gVDCUYYZ2Xj55gXzZATx+5vaY6uS1TuCNYb9Qeg@mail.gmail.com> <CA+V-a8vdktLyjojLbA10SwfL71S+ELSyuVJyozrQdGp8X398tw@mail.gmail.com>
In-Reply-To: <CA+V-a8vdktLyjojLbA10SwfL71S+ELSyuVJyozrQdGp8X398tw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 09:51:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW06XZs_xj7mEnVU0C-W4Yk550nd-nkg+zXQHVqR-huUg@mail.gmail.com>
X-Gm-Features: Ac12FXw7N92TiDUnw36gsRcTzdT3RhB8CbvYBmw5at4FeTfTqWBtYLZYS1nyIf0
Message-ID: <CAMuHMdW06XZs_xj7mEnVU0C-W4Yk550nd-nkg+zXQHVqR-huUg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 3 Sept 2025 at 21:21, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Sep 3, 2025 at 4:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Enable USB2.0 support on RZ/T2H and RZ/N2H EVKs.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> > > --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > > @@ -33,6 +33,33 @@
> > >   */
> > >  #define SD1_MICRO_SD   1
> > >
> > > +/*
> > > + * USB Pin Configuration:
> > > + *
> > > + * This board is equipped with three USB connectors: Type-A (CN7), M=
ini-B (CN8),
> > > + * and Micro-AB (CN9). The RZ/N2H SoC has a single USB channel, so e=
ither the USB
> > > + * host interface or the USB function interface can be used, but not=
 both at the
> > > + * same time.
> > > + *
> > > + * By default, the Type-A (CN7) and Mini-B (CN8) connectors are enab=
led.
> > > + * Configure the switches as follows:
> > > + *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6]=
 =3D OFF;
> >
> > s/DSW2[6]/DSW2[5]/?
> >
> The above is correct,
>
> DSW2[5] is OFF, P00_0 to P00_2 are connected to BSC2(CN43) and GPT0(CN49)=
.
> DSW2[5] is ON, P00_0 to P00_2 are used as control signals for the USB
> power-supply IC.
>
> But we are using P02_2 and P02_3
> DSW2[5] is OFF, P01_0, P01_2, P01_4 to P01_7, and P02_0 to P02_3 are
> connected to ENCIF0(CN44) and GPT0(CN49), and used as control signals
> for the USB power-supply IC.

Thanks, I stand corrected.

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

