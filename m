Return-Path: <linux-renesas-soc+bounces-8380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D27960C57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 15:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3091B28DE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9960C1C1729;
	Tue, 27 Aug 2024 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3m8AHT1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB941C0DE3;
	Tue, 27 Aug 2024 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766001; cv=none; b=FjQt+BmlvKUrg9r9IHnbgyj4jBxupV90iEMcTEDf62SEDK0lVdC32Ukd0vzdtJFYAOo3ryGVlsPKoGAdP55yogRgOKxc8bXW6vhT0H85Ot4lgXYG15aNOCQpHAp+u7/2aQb5fXNonmQv+wOGFhTF2+yq6TVNerEFFo92xERxKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766001; c=relaxed/simple;
	bh=joSayfGZbhAgfS7Af87lUtotvFzcgcb3h/kA/FP+0Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJI8WRr0AEImX55unfh5AYkb4t8MuaxsDUEUViljeHotW4EzgCtIvhqKh0AG5pkQW1oTCRCnSBUtLOs2Y6EiQ26r9Vok/hpNApx4Zy6vxjsUcGar7CCmA8mjhjOXPD+o0eaqi1APe/W/Y0kpzU3jiK3FyEMB1r8Z/GR+jwyou7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3m8AHT1; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44fdde0c8dcso31046121cf.0;
        Tue, 27 Aug 2024 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724765999; x=1725370799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+JzrrWhLwPRmVxAzC6IAz2guX6EbmEAvRvJoNjLnwA=;
        b=V3m8AHT1oCKwilqb9qbdN+zYeYDivmzaqkju2+emULL6tQFY1RTHDzLlC3az9JiFM+
         jqqLGkVK3OQdBTXoQe6JZlswuHJcGmaCeV2NJApHCZ8GmFRt1/sa8ko8fOBbsfLtWAWN
         cMWLmNut6OZGFfqxkZGrIn5z+tTJExnmDgS2gDOCGLgLIsKffBrVOaznwKQ/oGG9elgq
         o+5yKu+h+TRGjZqkCPWlAmMMPgACw2v/jiYVGn/agGxcEtNZKSu9c9zY9sBykGcS11Td
         xA+pVj15pRwFrD/hmQQi/5TgEAC6VQSdg5/T8yuNPi4G5d1hzm6pvrYYYS0FtM+H23Gr
         rBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724765999; x=1725370799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+JzrrWhLwPRmVxAzC6IAz2guX6EbmEAvRvJoNjLnwA=;
        b=nnhNywbCCOdZJI5VUX6XV0MCg9aSpEsioxci3g6f3kL7TUcbeik0w5Sgc3yE8azjgv
         ALKbwEjbl7TYj0IBHaKcdboYLLnAouxk+HNDVhc13/R8KiHx4oZ50e4F1LgpOkcrSksL
         S1fXMHB5AOt67LG70AyUt2uStYVRrcDNxtJE3HcqWbMNttG3kh1PDBscs3ivPj8uY/GF
         VVNWvVWKcVR4HvpTAkqN8WXAsnJgrpoXuUWZPaheOnR7x6uzOZiVH17n5uMrGFrg9uSj
         /xfHVE3RJah/RQm0uyyHIqBIkv/zkXSsprU/qe7RovEzw7hN7BriiGbcldBGkgq4y3UR
         5IAw==
X-Forwarded-Encrypted: i=1; AJvYcCVCNFpy6xQSYVZk+mAYMJioBANSaQGWvM3UtohSWreyG8oz2Tyb+aWdG+L2X+xCvEOhOIWhUXtlEAz8as+U@vger.kernel.org, AJvYcCW4xW2EnRebOZun78u/ot38tQfwRIPTlVPFPvwuac/XFMg4yKKAfaOZkmDlBXPfd/xTN1tXupsJflx+09ZjAcYZJzM=@vger.kernel.org, AJvYcCXu3Ewut3mtcg+HMNhcCVhlFQSfL4/zfaVUYjlUZCBQKs/H08eiVHytWYsesrEzrSECQ68nH0Go5X3r@vger.kernel.org
X-Gm-Message-State: AOJu0YwJPdv1KJILLyLSSWR1H3y79MWSatibP8yMnwv0818O1qbLjIGW
	l8jPgwm/KfGuwz5gq0KEG6GV0XeKbT3fs9YynhMJAbtbZqPIa84gME6JldVi5H5+dcxQU4Ko2Z2
	PtAVtTQSPLPF+nsho1VGclbyiEoo=
X-Google-Smtp-Source: AGHT+IGJ8PhaVJ/ECaHF2mR2KdRB/84usJc1sUbmkZvFaKSqLou+KRIZSWHQY7dyo5gAcjE6tSLXwS8btDovdvbGKuU=
X-Received: by 2002:a05:622a:4805:b0:446:5368:cce4 with SMTP id
 d75a77b69052e-45509d37d36mr159127051cf.48.1724765998857; Tue, 27 Aug 2024
 06:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240821085644.240009-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW2=u8enge6N+A617V+5oNYnNmhw_VFW9qbcX=TEbJKig@mail.gmail.com>
In-Reply-To: <CAMuHMdW2=u8enge6N+A617V+5oNYnNmhw_VFW9qbcX=TEbJKig@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Aug 2024 14:39:31 +0100
Message-ID: <CA+V-a8t+ri3YtU+=MhVx4ZkPOvoUS6ZY+Hj-nvuXkVKrDUX9pA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] arm64: dts: renesas: Add initial DTS for RZ/V2H
 GP-EVK board
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

On Mon, Aug 26, 2024 at 1:07=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add initial DTS for RZ/V2H GP-EVK board, adding the below support:
> > - Memory
> > - Clock inputs
> > - PINCTRL
> > - SCIF
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > @@ -0,0 +1,61 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/V2H GP-EVK board
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "r9a09g057.dtsi"
> > +
> > +/ {
> > +       model =3D "Renesas GP-EVK Board based on r9a09g057h44";
> > +       compatible =3D "renesas,gp-evk", "renesas,r9a09g057h44", "renes=
as,r9a09g057";
>
> Board name/compatible (and thus file name) are still under discussion...
>
As discussed internally I'll update the board name/compatible to
"renesas,rzv2h-evk" and rename r9a09g057h44-gp-evk.dts to
r9a09g057h44-rzv2h-evk.dts.

Cheers,
Prabhakar

