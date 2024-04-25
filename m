Return-Path: <linux-renesas-soc+bounces-4902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F394C8B1C4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 09:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A3D1C20966
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 07:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998366D1B0;
	Thu, 25 Apr 2024 07:56:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CBE2AF1E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714031809; cv=none; b=sJjIHmqfju/60BkWwKO4yFbUp9cgjXVWSKlRF/a/ADGr5MWaULIN/K+diAQSfRQIqTtEzPnSRxwRSG0Gx69zOxWtcchQytJXjBAxz7qsECa5jpxcPZGUQDJPAIpcMSqJ0zl2dqOJT24g9VbeITKJIHlgPlpJbcYRrGcNGmn/gzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714031809; c=relaxed/simple;
	bh=ro79g3dkcu5ySaCcdtEE8p88oY+v0hcZq7FFmutw9T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZ3LXGg0xVhb/hrcXPWMii8IlzCfPB7T//A0Oi7LtcuyIumQ0gPUxKa5PWsFqMVem+tqxPxZwQ5uyflWy/hMQ/CDN4Y9HYj0CvbGXMeUyvlq/UKr1IPu9U4h4oaq27SNGYd9niQqUNSdZ44bzPBEhNs1K6ZRMQiUe3m+zR3prCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-618944792c3so7502947b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 00:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714031806; x=1714636606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duJUIQXjA7NfYxT08Ypdeq+8YzUVhXkzt8mUuj9SS6w=;
        b=KvK89YUe/waS8mAFYagGCFqvvuG9WWAVhBioLXSuJbFMw8vRmlleZ2xHcX7nSn8SBN
         1lFfTv/yEGNNNG1xidPyOVrt6Cfa6ji33K3FedbrMLEm1FpGg+8o//vCtXTv20qEaT0d
         JlrstCdeePwky3gq/piefQm8ZzjeG7d1bqWeO9i17PIzI2zwyZBfuPlzJyCgS+RgPSLC
         1zBazIjM0Lg9T7rYX3s2pkV0JW8IsvQjW2VHFe2FyfmdWmq1tB7ob+RbET+ceWaR81NE
         rFygIwHPJl6NbTuot5ecLp7JD+co+JymOrMkJyPGWolxqL46vPmK7cC+wSUzlXq7dqph
         TGeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnc62k80Ln7pjkvP7ZaYohDkysyQPLxxRiega9/YQ9+TPWkxKLRIIX1DOhWU643lgXLqvd3e+7kJuSc6y4XGNGRTtMS7GHnPqOy/15hw9f7mo=
X-Gm-Message-State: AOJu0YxS5w54YbnxNCdRKO/axqvdpwQGbs8JrchUJoyo6TGok7/YmCss
	TX0zo+zGI6M1DUeZ5iO1SwWffWfOCSkbiT/zvSkVvukbw+M9yvRHJic+VCzTUuk=
X-Google-Smtp-Source: AGHT+IGR8XVg7T8r20fE5PW3EwdeV6aVs5zK+b+f5ea7hvvao0C+WWzQ8hxKjOZnKJfJZkCR+sB1mQ==
X-Received: by 2002:a05:690c:64c7:b0:61b:6b6:5cb2 with SMTP id ht7-20020a05690c64c700b0061b06b65cb2mr5864158ywb.43.1714031806252;
        Thu, 25 Apr 2024 00:56:46 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id x124-20020a0dee82000000b0061b081ee071sm3436749ywe.40.2024.04.25.00.56.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 00:56:46 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de46b113a5dso745997276.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 00:56:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWX/9N9eAov1OQRt7YlQcnSf9RoUqeSPGyeGeNr3n2RwFmHD5AlxdMR8HqQdf6R+LZSp9ZqBQT0eDx47/I5zW1s9JKR4bbDiurE/cbgvbn+nNw=
X-Received: by 2002:a25:b31b:0:b0:dcc:fea7:7f7b with SMTP id
 l27-20020a25b31b000000b00dccfea77f7bmr5331981ybj.11.1714031805908; Thu, 25
 Apr 2024 00:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com>
 <20240229120741.2553702-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXWsnukKDjfQ4oHsXOVPiF+18odkURGP+9BWp4XN1DU0A@mail.gmail.com>
 <CAMuHMdXGTT9+c_MZpo1jSGD+HHd_Vxr-FAgWmd3EtDMQLm0Odw@mail.gmail.com> <TYCPR01MB1104036FAC0CB1C53095178A0D8172@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1104036FAC0CB1C53095178A0D8172@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Apr 2024 09:56:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeBL8damhb2sc=7W-5iVhughaaEG1nLOTA7E95d=_jVQ@mail.gmail.com>
Message-ID: <CAMuHMdXeBL8damhb2sc=7W-5iVhughaaEG1nLOTA7E95d=_jVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add PCIe Host and
 Endpoint nodes
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Thu, Apr 25, 2024 at 9:35=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, April 25, 2024 4:21 PM
> > On Thu, Mar 14, 2024 at 2:56=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, Feb 29, 2024 at 1:07=E2=80=AFPM Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > Add PCIe Host and Endpoint nodes for R-Car V4H (R8A779G0).
> > > >
> > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > > > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > > @@ -723,6 +737,126 @@ hscif3: serial@e66a0000 {
> > > >                         status =3D "disabled";
> > > >                 };
> > > >
> > > > +               pciec0: pcie@e65d0000 {
> >
> > > > +                       interrupt-map =3D <0 0 0 1 &gic GIC_SPI 416=
 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                       <0 0 0 2 &gic GIC_SPI 416 I=
RQ_TYPE_LEVEL_HIGH>,
> > > > +                                       <0 0 0 3 &gic GIC_SPI 416 I=
RQ_TYPE_LEVEL_HIGH>,
> > > > +                                       <0 0 0 4 &gic GIC_SPI 416 I=
RQ_TYPE_LEVEL_HIGH>;
> > >
> > > s/416/449 for all four lines.
> > >
> > > > +                       snps,enable-cdm-check;
> > > > +                       status =3D "disabled";
> > > > +               };
> > > > +
> > > > +               pciec1: pcie@e65d8000 {
> >
> > > > +                       interrupt-map =3D <0 0 0 1 &gic GIC_SPI 423=
 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                       <0 0 0 2 &gic GIC_SPI 423 I=
RQ_TYPE_LEVEL_HIGH>,
> > > > +                                       <0 0 0 3 &gic GIC_SPI 423 I=
RQ_TYPE_LEVEL_HIGH>,
> > > > +                                       <0 0 0 4 &gic GIC_SPI 423 I=
RQ_TYPE_LEVEL_HIGH>;
> > >
> > > s/423/456 for all four lines.
> > >
> > > > +                       snps,enable-cdm-check;
> > > > +                       status =3D "disabled";
> > > > +               };
> >
> > Do you foresee more changes, and plan to repost, or can I fix the
> > interrupt numbers while applying this series?
>
> Thank you for asking me about this. I intended to repost a fixed patch af=
ter PCIe patch series
> was merged into PCI subsystem. Otherwise, dtbs_check will detect missing =
the compatible
> "renesas,r8a779g0-pcie" in the dt-binding doc. But, it's under review now=
 [1].
>
> [1] https://patchwork.kernel.org/project/linux-pci/list/?series=3D844512

That's not a real blocker.
But I just realized the DTS (at least the second patch enabling PCIe on
White-Hawk) has a hard dependency on the driver changes, so it has to wait.

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

