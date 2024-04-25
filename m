Return-Path: <linux-renesas-soc+bounces-4900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BFC8B1BCE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 09:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F1A31F25170
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 07:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5210D6BFAC;
	Thu, 25 Apr 2024 07:21:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63186BB5D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714029672; cv=none; b=N4XffP+y9RBQIZCXPmTqOPJXoQuSWbq+8PPOt00IbxibTZv2xkFx9Ov17fi1eLhzywKcLSUeNa3mqEtht30zKUFrnZEA2k+e+HyLk8bZC4EsQ53Owo/fmZI+YZwnfuN2LszC8mduEuptrYl0eIi1qdUcqOfy93wDRJomr8tir1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714029672; c=relaxed/simple;
	bh=XOZUcNcWMWI4rgXg0pDMgZ8ye5SBdvzpK4xy+ib4bQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GS1P+Pyne4VCifknGv2o9430QkD0mhmcM3Jh3lRfT833fDKECnnUtu/WM9tAhaCpvWgziA1f8MRVut9IBlTExHmpXlVnCkTo1rWFkZ5Xf/9Xs+8VhIc+tvYfydFF1fYbrDJ6BsyYuAriKI2pMv1P+wDbpvj+Gw5eBBaacKKkNb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de56d4bb72bso810627276.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 00:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714029668; x=1714634468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoSLbTxrFVj93Xy7Uv4aUaGtAkL8pIKZ+TEe+sDZuoo=;
        b=P3WO1l4ryk6Ec+nOiFcgFkWVzg8a+mM7MD1hRZKo93Wp/sCxSoqNK4nqPKsar5f4Et
         8tQcCNzSyTBJ2lCzCsvBI0F+GsRRD8N9+w1abcrm4N1Nag6EU45sCkkGPbojKm+bDD31
         LllXQAVDCHeuxYYolHyyZk5tJyyQLRxmyGmHS0qoR955QQJjdswaV+Lke/nXK8UxlFBB
         bLGxA6gkRhSLiWCcplkzKDQppvjIzP8uG7mFd+54+XJtf4j4FMaGzaqetCntKLGjmWPK
         Pu6DLwnoBvavT3E0yKuJ8fQ1+F7788DxZpdkxedIDgDIg1OgoEz6PY1V+IFmqbmbYASx
         P22A==
X-Forwarded-Encrypted: i=1; AJvYcCXftSULrCiGh0uknZugiTWhBGTYY6tES620vqGqWjWpf1K8k+UjbdXGMubwNsHMI0AtJcuYCBYh/uKfpmOsLf7DMmP+TKo7dWlaNQ6fUJbXHt0=
X-Gm-Message-State: AOJu0YzoaC+mgCSdjWuPL/I3kj9YkzO9fFdUlE6CA9ktngTOwPRPrvzb
	MmGG9F4gHNck4YhbzP0Ma998PlDQ/qEEqfhSq0MYl5Q5LjbJ512o10v6k89DqBc=
X-Google-Smtp-Source: AGHT+IG7L9sCbj4WvYcW0zSxXHNRx43cuvy1UX/KPSDnkg11njr1t4N8OavAl6lrsiiBsnDPbJYjpg==
X-Received: by 2002:a5b:ec2:0:b0:dcc:6d85:586a with SMTP id a2-20020a5b0ec2000000b00dcc6d85586amr4996528ybs.49.1714029668189;
        Thu, 25 Apr 2024 00:21:08 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id w15-20020a056902100f00b00de4fbaf346bsm2599778ybt.4.2024.04.25.00.21.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 00:21:07 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de46da8ced2so792184276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 00:21:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9OV0OBEnzwldWYG+dnZbUiaT2ehg64eS93cvvJL6pltUtpHipmfqY6pQwLeTdAeXxTkz3fuxmyv2jfQjJxEyZugzS1b8ZJbQR8/3sfUBlOCY=
X-Received: by 2002:a25:6606:0:b0:dcd:2aa3:d744 with SMTP id
 a6-20020a256606000000b00dcd2aa3d744mr5210372ybc.17.1714029667548; Thu, 25 Apr
 2024 00:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com>
 <20240229120741.2553702-2-yoshihiro.shimoda.uh@renesas.com> <CAMuHMdXWsnukKDjfQ4oHsXOVPiF+18odkURGP+9BWp4XN1DU0A@mail.gmail.com>
In-Reply-To: <CAMuHMdXWsnukKDjfQ4oHsXOVPiF+18odkURGP+9BWp4XN1DU0A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Apr 2024 09:20:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGTT9+c_MZpo1jSGD+HHd_Vxr-FAgWmd3EtDMQLm0Odw@mail.gmail.com>
Message-ID: <CAMuHMdXGTT9+c_MZpo1jSGD+HHd_Vxr-FAgWmd3EtDMQLm0Odw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add PCIe Host and
 Endpoint nodes
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Thu, Mar 14, 2024 at 2:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Thu, Feb 29, 2024 at 1:07=E2=80=AFPM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Add PCIe Host and Endpoint nodes for R-Car V4H (R8A779G0).
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > @@ -723,6 +737,126 @@ hscif3: serial@e66a0000 {
> >                         status =3D "disabled";
> >                 };
> >
> > +               pciec0: pcie@e65d0000 {

> > +                       interrupt-map =3D <0 0 0 1 &gic GIC_SPI 416 IRQ=
_TYPE_LEVEL_HIGH>,
> > +                                       <0 0 0 2 &gic GIC_SPI 416 IRQ_T=
YPE_LEVEL_HIGH>,
> > +                                       <0 0 0 3 &gic GIC_SPI 416 IRQ_T=
YPE_LEVEL_HIGH>,
> > +                                       <0 0 0 4 &gic GIC_SPI 416 IRQ_T=
YPE_LEVEL_HIGH>;
>
> s/416/449 for all four lines.
>
> > +                       snps,enable-cdm-check;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               pciec1: pcie@e65d8000 {

> > +                       interrupt-map =3D <0 0 0 1 &gic GIC_SPI 423 IRQ=
_TYPE_LEVEL_HIGH>,
> > +                                       <0 0 0 2 &gic GIC_SPI 423 IRQ_T=
YPE_LEVEL_HIGH>,
> > +                                       <0 0 0 3 &gic GIC_SPI 423 IRQ_T=
YPE_LEVEL_HIGH>,
> > +                                       <0 0 0 4 &gic GIC_SPI 423 IRQ_T=
YPE_LEVEL_HIGH>;
>
> s/423/456 for all four lines.
>
> > +                       snps,enable-cdm-check;
> > +                       status =3D "disabled";
> > +               };

Do you foresee more changes, and plan to repost, or can I fix the
interrupt numbers while applying this series?
Thank you!

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

