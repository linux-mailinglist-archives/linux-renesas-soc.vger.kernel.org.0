Return-Path: <linux-renesas-soc+bounces-16237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A35DA9806C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 09:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD513B6DDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 07:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927E9266EE2;
	Wed, 23 Apr 2025 07:19:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDC118D63A;
	Wed, 23 Apr 2025 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392759; cv=none; b=KoGHOF5Q/Ma0bCgq/86X8+997u1VXSIrHF4uql1Ci1e0PA+S+xPBL4FROX1YETcgANHG8CbQzaf0+5hjPmo5DU0yPHGVCCYDIUQwUKn4KeR3ikOOhNtEGfCqS6t3nBDuJ2jlrnI3zrti1pI0VYuS3qqid5QpRfPugMZ5+U9M3HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392759; c=relaxed/simple;
	bh=OelUuagaoJNGvmq4zulFutE63UpEPJUFjETU5gHmmRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+hlnMM8UvvShkOs+vC4FSce/y/NI+Mrs3N4THulGviujqWWrGiZTzIAGuuYfwjahEqZMvR8ye2Xpys6Hc3DbyYfd9vuBRTZA1FAlyga/h33mQVDclU9r0nEFbz2HY29l0IibqxkjAVgd/U5HFHk3aKRW1RZDiWk4JOdWq4ENR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso9101415a12.0;
        Wed, 23 Apr 2025 00:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392754; x=1745997554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVmtrUo1YbYw/X4g84zkSdEwr7vBSfOVDVsuajCd9Rg=;
        b=OQmc6vDkip9IEDHkdoeskpcRda8miBdQPmEfl0sLI1AduDtKw47F3SJOT33zdZFSCH
         6msPkayLOPkoTJ8XlObhdmMVlin4H0LbSF5aZ2ugckQTcaT4tSTvVynzYI82m+40AzcG
         s1qaIL0rphBspZqIwuS3hjk7QINdu+xMPAlNfImvGYUBHufYF4b7gOfgcb0YBIkfe92e
         QIU7V4xgXVZfHwZ+99gCWFYT8EI7+8a8HABOhlHwSDR8/jt8KhbObLIspG8Q7R5WqTW6
         reBG7LljdgGZY+0ienhhScx1QSmYKN32V5Dtre6K92rOJZEk4xRD1NFATFFKxQYNfqK0
         KIRA==
X-Forwarded-Encrypted: i=1; AJvYcCU2S0J8NBMhfhwCrNSRpClufxmpQH81kyKAr5d2YKzjqCEJjosbnEqz7V4CsGPzrAoHeKSSfxOlFbs=@vger.kernel.org, AJvYcCV+FiossHQlt/8g2KFEmQge2D7k0IrZ2jwjARcMLwAM0ILBksd0nxwUl1PeCCLU3gwpEdZPK0yVZssnigHgB1MsA9Y=@vger.kernel.org, AJvYcCVw0Vn78FT1kOnvmu6S/foua06NTukEDUhqYBkgDD4wCmyj71d6blJVrwCp74IWCdj3g0by+OUlgC/O9Yl7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3HhmuX0STitvgCsV59B5Uqx1fAl1oX/y5zJOMFIH8SuaH7p/E
	Ma76WFehYJDrMzs94lZmH50HyioQSf2s96HjL5hT1TdHJLbXRuVAgScpOUepG4o=
X-Gm-Gg: ASbGncv5ucOuUl5j40cF7P7on0K3xRxXGpsRSnao9kCNiGvDGoLJnXRcNVAihfRnzNk
	gcYAcgsfMlamD6Zfli6WJvsmm0Z13k5rlk3/lueUIKKFQT0AMV5IsKuZNklYcn/dWqb62xM9Kvb
	5HNfyuRAG67lrYUDik4PiBJ4XjUa4wlILSSZ5i/i/iR6pN7zR0lq/yr2TBTF4mrvBRLWZAMTYo3
	HdKC6/4ntdB4485XST4arlR5QTe6+wd+t2PvWzQjlmvQ2h9HHyzCo+w7+D78gcvejaJN2yLs5l2
	YgVF6a3qd/seg9SodGdC9EOCN8L04Q+Vo6jV0aiEVD3NAaf6t7bMSKZBKPC3vMrLqdQXvJlVwm0
	KR9o=
X-Google-Smtp-Source: AGHT+IE/0Y2NIRV8KG4Gr+qUXlRMfGPzfBaObygtzvunOWGq2sXZ22/uADoRMSPJasXsp/i45raY1Q==
X-Received: by 2002:a17:907:1c90:b0:aca:96a7:d373 with SMTP id a640c23a62f3a-acb74ddd2f4mr1453407066b.57.1745392754178;
        Wed, 23 Apr 2025 00:19:14 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf16sm768563066b.105.2025.04.23.00.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:19:13 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac25d2b2354so859139866b.1;
        Wed, 23 Apr 2025 00:19:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqmcTzGUzBfrClcOx/R9fIHetA6D7LJq0Iata0oUrRqR6Hut5FwFDCDBBTQCLXqwvaMZZ1EZ3cBUdWdZekDFLD7Pc=@vger.kernel.org, AJvYcCXOTvpPZAcTrcJmh9MOzhtFfzkHgQcgXO5OkcSnBwSm8wZt10u/hYxq1y6IDWVkf8CattIJIIO8Tns=@vger.kernel.org, AJvYcCXirlgRPibLsmHWPLGDUI7KeKYYywWPhxWZiIF8WaRrM1RPPAvLJHrxH7CvbFCWV/wXdpIh+pmwTW6AVd0S@vger.kernel.org
X-Received: by 2002:a17:906:dc93:b0:ac1:ea29:4e63 with SMTP id
 a640c23a62f3a-acb74b4f63fmr1755632266b.26.1745392753452; Wed, 23 Apr 2025
 00:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-7-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVpiZ+F0TMbLm000M_Scwozj2-SHPrUwTHqFKckVcmufQ@mail.gmail.com> <TYCPR01MB11492BCF416760E978541AFE18ABF2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11492BCF416760E978541AFE18ABF2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 09:18:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQPbP0Fi5SDN8uOJ23S=_8pqHRVR2QFS8vHNfohzae2g@mail.gmail.com>
X-Gm-Features: ATxdqUGnPcr5nw2bU8kZXewmcWmaBnKwPIbVqw74OHQUy0h-V5sZQcUv4L5lrRM
Message-ID: <CAMuHMdVQPbP0Fi5SDN8uOJ23S=_8pqHRVR2QFS8vHNfohzae2g@mail.gmail.com>
Subject: Re: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Fri, 18 Apr 2025 at 23:22, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
 > +};
> > > +
> > > +static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst =
=3D {
> > > +       DEF_MOD("sci0", 108, R9A09G077_PCLKM),
> >
> > Shouldn't that be 8 instead of 108?
> > Using R9A09G077_PCLKM as the parent is a temporary simplification, righ=
t?
>
> I am probably missing something, isn=E2=80=99t PCKML actually the parent =
clock ?

According to Figure 7.1 ("Block diagram of clock generation circuit"),
it is PCLKSCI0, which can be switched to PCLKM.  I guess that is the
default, hence my "temporary simplification" question.

As the actual switching is controlled through the SCI's CCR3 register,
the SCI block should have two clock inputs in DT (PCLKM and PCLKSCIn),
and thus the DT bindings should be amended.  See also Figure 33.1
("SCI block diagram").

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

