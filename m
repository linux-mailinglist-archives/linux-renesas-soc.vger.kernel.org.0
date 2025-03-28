Return-Path: <linux-renesas-soc+bounces-14949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF90A74582
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 09:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E2A1889F60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 08:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD67C2F3B;
	Fri, 28 Mar 2025 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6L1bPMj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE4D211485
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150838; cv=none; b=pg7YqK8IEW7BKjstTb/T8t5uNACW7WRitoQz9u2Q/touiUSZw9Min+qR+lk8XuRtw0a6uyFkWZwsxxWgBdHzDphBz3IzYKLs2DpTgoAVEahGzpclhGgpsXe3bEmC6Lzu66eYBCgo/fRBMxLyecDijCwfjw4BPn1lCbUrGUIV5nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150838; c=relaxed/simple;
	bh=eMEnL0OsFZSCI0yNtZWM24RWrew3pL9N01fsZGi/FGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LE8F94K3kh4P0fzVXeVS3VC/zz9vqrQ9vsa/+FIVVMbgyrndg3f59mKOOQCOuxAAl9o4waBkmH8eI6yr+mGlwKpWeJuHZ/Up23xMDIksprgTz1CTsqupt/O7ju6FtoZA/LEfQas9AAvFLgfooO8lNCwTjEz+VsZs02JnQw+DOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6L1bPMj; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d2fba8647so1872879241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743150836; x=1743755636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9lqAO87QMmKowO21ICkdyh5XZVPFnZayTlHdDH+FSA=;
        b=l6L1bPMjDHMcyR2uXmw/XVn/icJz7/uSRVdupKSRgTE6fvb5lFBDknzCCjpj+rPqzO
         k60g4bdtxGG6FHyttOLuRpf0RFjo+t1fZvKHUkWp79mVHf0sEe8WHqYnQNykaPNOqOgW
         WLIZ3OviMmNRqdTvlJPy8rvQ5jKkShuLadRTgVUPLsp3iKvaKqN40VhGzCy4k6OdVqL1
         8DMlqgXRQCy9SZbX6iQOYD+sDrUDbyiaYxAO0rZcXHMa5K6LYvqLNG6WwUAICaQdWHkL
         iws/Hd5fXioYUVg12FV8VJXz1vAY+YlfGcv99irmEarvzBi45oCHjlrw/Uz18PxVNCeu
         GEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150836; x=1743755636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9lqAO87QMmKowO21ICkdyh5XZVPFnZayTlHdDH+FSA=;
        b=tmYchtCMHuKFqBKpf62VAeN7XiV2ILhJ+sWcp/Q2zyV4r7a61CX+akIipjbkocSJ7O
         avdzfKcNuobAQYWTeEy8M5kaz8uHCDGGqj7jcnrtxaqAk/0Qjrv0EU9I5JZPmYFR6T5K
         UHkIFgz1Bpi4scjvP9wZaVkQvIBko86CBu0w9H1Dc7mIm3ILlX1vLkJLFeQI7fjI6pHL
         wwvTDscLIuHZygIGsKcFfwCmWKfOllYgWmHEp4Jo9wvHrFFbyvn0BGvnIjjzy1NYqPsP
         DcDFj+lQXy7LiJL1PiShRSBoCq5cHuddy2JJ2Py2UTjZmD+VgQtX2rHXr6KnbqwnUcWe
         VFmA==
X-Forwarded-Encrypted: i=1; AJvYcCXrpMltTfM++0f1SwbjhXX/UE8xj6A7f4l/+NHttF921PbOS3xD801uAlXE0H3OOVAR8xeQI55F8LqWPHwAvSQ73A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfZvjGNZrEXZJmxSlSUsz9bYEJGnphrsc2zIMj2vLZkZEhCzUk
	Z2af5+9wsVENig5cMnep+jl/5nQnsORqGVgdxxBrHM+hwkPo8Z0Qk6tl7MkxjH7tEgH0wPSuKU5
	E0y15uXwCRGxRlEJsll37DwttSJTL4IPXZqo=
X-Gm-Gg: ASbGncvgO9YSjEOHVi4vK+jEbdlhepoJtaeaxyYOXvWCu2iA00oezoUjVEXMV4XhWj/
	OQgiFehND0YgMEkGu007f5vR+1EcAz3yPbcEdfZ1VAmABToiZi55HRs+7czF27msiVFT7sxH4Ge
	cPEEjquN201bJU07sDCGEP9JL49qYz+afYusCY
X-Google-Smtp-Source: AGHT+IEgK1zBKfQjPdfumb8AvJ+WerKh2nslgBYdDRx/8rLS0C2XBrWW8suTMVaV/wMoFmB1mMnJB7kQpPidqqVdRts=
X-Received: by 2002:a05:6102:41ac:b0:4bf:fb80:9429 with SMTP id
 ada2fe7eead31-4c586ef67bdmr6270169137.4.1743150835750; Fri, 28 Mar 2025
 01:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <TYCPR01MB11332B9F7292BEFFA29547F2586A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332B9F7292BEFFA29547F2586A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 08:33:29 +0000
X-Gm-Features: AQ5f1JrBmaRLyNYn_GUbDeONL5Ij6qXSHRFk5ldWTKZY4nr33z99g3IEWc8UGlQ
Message-ID: <CA+V-a8tk4M0xgy5LtVitxwYc508m-4KdtnnD8P5Sru5W-gUC4A@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Mar 28, 2025 at 7:15=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 27 March 2025 19:33
> > Subject: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs=
 by default when ARCH_RENESAS
> > is set
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> > Adding default y if ARCH_RENESAS to the relevant configurations removes=
 the need to manually enable
> > individual SoCs in defconfig files.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/soc/renesas/Kconfig | 42 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
<snip>
> >  config ARCH_R9A09G057
> >       bool "ARM64 Platform support for RZ/V2H(P)"
> > +     default y if ARCH_RENESAS
> >       select RENESAS_RZV2H_ICU
> >       select SYS_R9A09G057
> >       help
>
>
> Can we add this changes to newer devices for eg:RZ/T2H, RZ/V2N?
>
I can but I'm not sure it will be a logical change. Also we will have
to touch this file again when we add dependencies for example for v2n
when SYS driver is added we need to add `select SYS_R9A09G056`


> So that previous devices, they don't need to patch this file:
>
> 1) If they want to do a standalone build for Image size optimization,
>  just remove the unwanted SoCs from defconfig.
>
> 2) Debug some issues, some people just use defconfig from
>    different kernel version to try it out.
>
Cheers,
Prabhakar

