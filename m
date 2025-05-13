Return-Path: <linux-renesas-soc+bounces-17031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A014BAB4E76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 10:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AC5A460B6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 08:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35DE20F091;
	Tue, 13 May 2025 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkXtyLF4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997D20F063;
	Tue, 13 May 2025 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126067; cv=none; b=qcBpNk6Wg2mhcKaQK7E6rvaxncvgUF6l6UN10uT4hrrN+nqXBykfLV1egKPd2ichxhEn5gaFTDXyhkyBltoDsP6O9tEd6319xEfthGn/ceW3r3MdiyUjQoq0zwV0pVyBun3s8NhtQN1FYdwubNEZxkAfrSgUmjq59Dl5vrblAK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126067; c=relaxed/simple;
	bh=U4fXErCQrmf9N3AvpNGYsyb+qIqioH1bT1/sBIu59DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paqoHeV8Ctq269WPbRQdUC/+3x44Rd6F+utFLbTfXUdI30jQaxGt36CkwFOSin3/uqM2z7m1CGWWB/zccFMMfRaBu6Qc3B5ZNwO0Xiv5mqDzoWSM/hC66ggYqvPSCpAe+XeuaO/5w40SYvlQV4EFngzcI5HmUwQJrzflO9VaKUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkXtyLF4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0ac853894so4638537f8f.3;
        Tue, 13 May 2025 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747126064; x=1747730864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqUzLMdYqQZHvUetmEUi3oceJygz2KZ2olDSm3gHUWg=;
        b=jkXtyLF4Iw+y/hElCWHF1WjWa88YFkNiseDSvdUw0k5w/21VnUKp+fVNn3yHoesu7V
         rpX0U9LIYTY8Nn6R8IpbBj6BDRWeDNpq5OfgJDkKStrbKpIjCARDMoS3LweVTE6LOicu
         DHAhzbfqL6nq+7RaqF/LMhD9YFFVfqxeZDnncsaJS5/pTna92LentW3U2RNm/M3IZBCV
         ajIynL1iOWMpF6JvGPFw+vMkb5rag29RKmNdAjmssVLkKhiBS0lforDgrGc6bmuNw3Vw
         T7t8bcIL6jlmzAXyegyHZZR4uaDCHJ+OdXQVaYfjCej3FEnDBx48x5lPmH/oyJhIsx6v
         i3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747126064; x=1747730864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqUzLMdYqQZHvUetmEUi3oceJygz2KZ2olDSm3gHUWg=;
        b=b/khgA9SBjDhPte2GfYLbjknc7uvPVPhh8ax5KH6zXqDSZ4VDVrDvvWkpRmHSQFfDX
         psSDxc3DOF/gFGtxVnWknjPKU6NoCjj0sOPDuD68pxoFxw/i5QC3Zg0ASDq6uqPMOToZ
         GxoHNG8vfDVhxlbNXtErKTp5Xb3uD+KKCsBown0i5P3m/vWUAOKs7CNA5IeZnrWbup2K
         ZZ4LULqkK5P0TwlG9F+3WnBE+Vm/YtPlJwZU9S16Dn8CR81oKMeVXAHSnt7WFqnAo7Fh
         DozOSTVg8Ty3l/Er+Uv56XeOALzRGKbeZhNtM3737vK25OC9mu5JyCfa/pJnEnmJQuvU
         amfg==
X-Forwarded-Encrypted: i=1; AJvYcCUGMLpPzIVnkRA67zTh6LWx0RTP4z9JkbprWAlad/7nEpJeAMDabWr7kCVHylh4GORr684ak0GpfoieANLw@vger.kernel.org, AJvYcCWQ4YITxueRT3ANHRCaV5jJQGaAB3dtbfhEBscAKdanrEnOf78Imz/zTM6tLgmbxNIP47D+v5mkk26mIKrG7RJHLFA=@vger.kernel.org, AJvYcCXExW6h+9o5c7Eu04gVxg4rNSv/HuP5yFyvEH8g8SsQo1sQ9s2WrKXba0xu/13RwBxaz3U3ZGL1ZTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX24FQUh86UB3EyQP3Vp4vrca7yD/sVzy/v6dbpHff9KdudEPF
	iwvEarQjbOwFvE2i16GWxg9MqfCc9xbk8C5MWlRDxXHtbLJ+C5Or/GJ1orX0v+3T2DB6vlh5fqn
	aLEhhGaGTvtpIUahApy/xmdd0qUs=
X-Gm-Gg: ASbGncuoJFmVoNw0e8M26WyeJ+E1hm3RzzuIK8Be04jUC2gCKPN5UPEDsobhTcBks3X
	os3P5P0NoCH0DiJA/9UPr6QCcAesF3r/D8+kvHMJkk2wVsWuLCMsgepXqsjl0M+T6ChY4pW3QJh
	zN83v2LbEwmSQOYKZcgFvqA+YwiZvMRs4=
X-Google-Smtp-Source: AGHT+IFsaj8vThL8OQoi+wj5H8DB+9bjinLdyvzmXeD0z1gbWN+m3r16SLxk+RyBOcnSiYdf9HWVwNP2iwNyzw2zezU=
X-Received: by 2002:adf:e3c1:0:b0:3a1:f654:ebec with SMTP id
 ffacd0b85a97d-3a1f654ec75mr11785703f8f.38.1747126063693; Tue, 13 May 2025
 01:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250509160121.331073-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX18eBo6HhAqxxga35NFTVt_0oBJzTU=dFUjcCCnPZvHg@mail.gmail.com>
In-Reply-To: <CAMuHMdX18eBo6HhAqxxga35NFTVt_0oBJzTU=dFUjcCCnPZvHg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 May 2025 09:47:17 +0100
X-Gm-Features: AX0GCFuVm0qewRxuvyj-O5S2JXQTgP4u3pDeXR5GyxchD94fPOfZz2Lki8poNxc
Message-ID: <CA+V-a8uY3F7BD1gPRNmqfP6=WaenDv47Yx1nT8sW9CH_MBCuhQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
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

On Tue, May 13, 2025 at 9:03=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 9 May 2025 at 18:01, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for GBETH instances. Include core clocks fo=
r
> > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> > used as clock sources for the GBETH IP.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Dropped adding CPG_SSEL1 and CPG_CSDIV0 macros in rzv2h-cpg.h
> >   as they were already added by XSPI clocks patch
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > @@ -93,6 +93,7 @@ struct smuxed {
> >                 .width =3D (_width), \
> >         })
> >
> > +#define CPG_SSEL0              (0x300)
> >  #define CPG_SSEL1              (0x304)
> >  #define CPG_CDDIV0             (0x400)
> >  #define CPG_CDDIV1             (0x404)
> > @@ -118,6 +119,14 @@ struct smuxed {
> >  #define SSEL1_SELCTL2  SMUX_PACK(CPG_SSEL1, 8, 1)
> >  #define SSEL1_SELCTL3  SMUX_PACK(CPG_SSEL1, 12, 1)
> >
> > +#define CSDIV0_DIVCTL0 DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
> > +#define CSDIV0_DIVCTL1 DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
> > +
>
> Moving these above the existing CSDIV0_DIVCTL3...
>
> > +#define SSEL0_SELCTL2  SMUX_PACK(CPG_SSEL0, 8, 1)
> > +#define SSEL0_SELCTL3  SMUX_PACK(CPG_SSEL0, 12, 1)
> > +#define SSEL1_SELCTL0  SMUX_PACK(CPG_SSEL1, 0, 1)
> > +#define SSEL1_SELCTL1  SMUX_PACK(CPG_SSEL1, 4, 1)
> > +
>
> Moving these above the existing SSEL1_SELCTL*...
>
Got it. Thank you for taking care of this .

Cheers,
Prabhakar

> >  #define BUS_MSTOP_IDX_MASK     GENMASK(31, 16)
> >  #define BUS_MSTOP_BITS_MASK    GENMASK(15, 0)
> >  #define BUS_MSTOP(idx, mask)   (FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (=
idx)) | \
> > --
> > 2.49.0
> >
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.17 with the above changes.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
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

