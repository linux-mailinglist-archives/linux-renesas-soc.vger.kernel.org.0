Return-Path: <linux-renesas-soc+bounces-15169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C24A76662
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A13AC16A93F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2214E1E32B9;
	Mon, 31 Mar 2025 12:53:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388821148F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425624; cv=none; b=iTMv1072MADKqe/HxsvCEaByct1Nfx+y1MknWU0x4JC7ZIYcSSW1lCUGbhpNQuP+KuRDzy8XrU3crLC7ZtkfzajfcCE1/fx02w9keJehjLYEjHrV3rhehMmtI3sC3SPSeyvM0SBYPr8QIPy8fcKl3cPDrrWSJ7TFidr+LN6qSAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425624; c=relaxed/simple;
	bh=YNWErMD56pC73lxXoqnVK77X5YoL1oVnmDTQHlM9Afs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkY7J0rwUGENIrLbjSA1NatIKF6SHPmNrBxQSVlUPFlx5nmiy8j57LvtEcobumOKt29MiYO2X8Euq7om/w1bVoCRMrZMMuzVo7Hh2aezoR5Iyt9AI10y94dcsprPfazdfZcDawbTwGLwdZlAPE4965b68dSeQ/sb83cj3SdEkwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d69774081so1928749241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743425620; x=1744030420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xA4p1Mo3tgSeg7bbxD2mo38fT7n+Vb9z0HRxYoI+e0=;
        b=F+Ysa8P+K+Gfi8rhpOlmNE2gjZvCCUsAh46jqqVxc4wbl+9fNRtyYlQQZn3HDG0zeE
         uRYriumzn9UIzC6/kO+pj6ip4Q2tZsf+ZqjbPueG6Lrc8xiuqahts2sYSf59Vv60TNuo
         6ehF0OUc8b2jwyrxtkvr0BGrALw2TlDXfrc+i0KUSb5vFcZ6IIULiwQk21UXkcq0n9TJ
         7lr1B41D86UhRkGXQ/mq5AkJMGZCXX6rWlhnVbocF6uRG1PMfzZ2oHFkmGKemx62NoL1
         BbnfBXoumDWQglmnuRQai2sMOW2fm8PjmCG0bRgwDBJBOs/F8keXjpkpOtuBd2uffCgA
         nsSA==
X-Forwarded-Encrypted: i=1; AJvYcCVuxXfRdNgG70JNDf3FXtmX0BjRruQOchlgptt69lfXRvOlxc/Nlh0JYwuj29bz8Qyb5l1749T8CDcHz55NUITVvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNV75DPw14lS8hYMbNo2X2HFfU2YqEJrk7A+rrbSqZib/sk/7E
	l+Z4u5Am8zpIck3moofZ6uDomxm5sCiZhOHGpzzk74/2n1kSAPNExKXwGqi8
X-Gm-Gg: ASbGnctG9vzEOtlVFgjfWD5gGyqYXYB+/45kSRnHEtYYqvSa+/6qCXE+3MULlunzKM7
	kFgIVHxlOv4lJjCWndhWcR2C0RIRiGXBqVd4De+y+xKeZGwj8ngNi35AaeVbUSZ8tMadA+4YP6B
	y6uBublPmxedSXVK7hUDe2UtkaUHzPEzpfxGIEXfpg/+XOEy4PZVuibHxs/TBlieskY2OftjYQ+
	sC0RvEJfQRqsWl8ZRCU/85oFZ2EAA6A15qsO0wjukKjjTzhE3DD6cpYgGm/V72q+1tQDYUx/e02
	+CaFtK57zNv/YwBjTKoXpzUVZsbsrqOEHNYmWIP5RoJMfKMdmyN3VTObfCS7Im92ZnRfyYQfJZu
	c3eLW9Mc=
X-Google-Smtp-Source: AGHT+IE94Wy2SGx8aepJmHwtgihgSj6+NUWlF0dNmO34lAIEgG9c2l26J4PCT07JEdzgfjf5e+C7wQ==
X-Received: by 2002:a05:6102:5f05:b0:4bb:b809:36c6 with SMTP id ada2fe7eead31-4c6d3862b51mr4947571137.11.1743425619676;
        Mon, 31 Mar 2025 05:53:39 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-871a329bc31sm1525179241.20.2025.03.31.05.53.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:53:39 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso1966607241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:53:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfJiAqmxVmzyBh03J+iuHbx/EyC5lTeX3KOItXo9F1F6ZDteMfuk1JXGI2SnkZCOKB6uqpeufETriUgIkr7oQ/GQ==@vger.kernel.org
X-Received: by 2002:a05:6102:d91:b0:4ba:95f1:cc83 with SMTP id
 ada2fe7eead31-4c6d3952343mr4573980137.16.1743425619327; Mon, 31 Mar 2025
 05:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-8-biju.das.jz@bp.renesas.com> <CAMuHMdWEAVfQ0_Ffbw0eexhTnDDZFu2mDwx3zvL4s66XsBN6fA@mail.gmail.com>
 <CAMuHMdVpY0xo-h8gSz0uq9YttZg8kBB1z1MnobhTe0dfwOqzhg@mail.gmail.com> <TY3PR01MB1134646707925886C675F7EAC86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134646707925886C675F7EAC86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:53:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNBTtsMQzaTTFk=T0OZM9i_5fHMVTxA3-C1BoSZ_TEHQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jqgp1x5iCyY8INKTgpX0IhG0hco5jN8Q6DJQAA6K3CMyuXBmVEmCN2mcFg
Message-ID: <CAMuHMdUNBTtsMQzaTTFk=T0OZM9i_5fHMVTxA3-C1BoSZ_TEHQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] memory: renesas-rpc-if: Add wrapper functions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 31 Mar 2025 at 14:50, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 31 Mar 2025 at 14:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Even though XSPI and RPCIF has different register layout, reuse the
> > > > code by adding wrapper functions to support both XSPI and RPC-IF.
> > > >
> > > > While at it, replace error check for pm_runtime_resume_and_get() as
> > > > it can return positive value as well.
> > >
> > > While the change is fine for me, the function cannot return strict
> > > positive values:
> > > https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/pm_runti
> > > me.h#L418
> > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > > --- a/drivers/memory/renesas-rpc-if.c
> > > > +++ b/drivers/memory/renesas-rpc-if.c
> > >
> > > > @@ -519,20 +543,15 @@ static void memcpy_fromio_readw(void *to,
> > > >         }
> > > >  }
> > > >
> > > > -ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len,
> > > > void *buf)
> > > > +static ssize_t rpcif_dirmap_read_helper(struct rpcif_priv *rpc, u64 offs,
> > > > +                                       size_t len, void *buf)
> >
> > Seeing how none of these helper functions are reused for xSPI in the next patch, I think they should
> > be named differently. Perhaps *_impl()?
>
> You mean, rpcif_dirmap_read_impl() and xspi_dirmap_read_impl()?

Indeed.

> __rpcif_dirmap_read() and xspi_dirmap_read()

That is another option. But the former looks more attractive to me
because of symmetry.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

