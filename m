Return-Path: <linux-renesas-soc+bounces-12380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E21A1A1B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D59907A5644
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A539920C48A;
	Thu, 23 Jan 2025 10:17:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B611BDAB5;
	Thu, 23 Jan 2025 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627473; cv=none; b=hGtiOAXiysUfxdIWX6RDmQXqeFoakH/3x4CVc9rmqvspa0qycgaPXDlNtcsvoaEEW+1QavYNXt2pRxr5B3A1SSP4qLOJx+hBnpdIg7uEG/DeyY0eJo7n6wVBPQCEqgFQoiXlPcn1gbIGXdH0ulcNPJD4B/Kol3GC6RZaM0zChBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627473; c=relaxed/simple;
	bh=P2RUfMtUaUMwXyCXljeugv1SZ6fb7UPccSCKE4Oi37g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/pJF8MI6NNwil0XzcVFn9dKeUWHSqmExLOfJQeefNLNoeZTbRsIDZiQHgz6+LAilcX2ggVj+QSrcxKIfwvPVmUXoBtAnLbvl2s8ED+C2Dx7+s4WOs7j8AX/EdEygXc7zkFWS7/phiqUWXQwizdbcI5OjPLAMDO0PuyQaNC1FkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-860f0e91121so1048387241.0;
        Thu, 23 Jan 2025 02:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737627470; x=1738232270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWJ1WtZtJWByVu29sfFsD4zbEKtC/5gZ6ueoqSs0P9c=;
        b=M8+nCDAvsojaOLCAEYWnKXjTc0WNzMaMRZtVGp231Y/d9P5YkJ5n9Sjnksl2sTFmWG
         N5Qx4B/MKKaqHtd8xP66CcR2XPT02aIJTvf0/5seJxepulvr0l/UA65lzsgrVQ6/aX80
         KFDJhMwGGQMOFb2pOvlqE8tP7lrwkPAwV0WoDkRi22HmdM0iRgDnWmmzIDka4Os7l+zQ
         /wZ+6PD8196T7OWLSfdSu4m1GBWjamSfPXJzuf258DOcbLaVJuSpyROLTmmyKjDfDgEd
         UtJGAeuRGwCikahTJJGupD+hXtxgd8O3O/hg7YBIBIFfD0G8Xi6ypFlmE8uxP5m9+Btz
         MsGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFP9ODbNUzF9kMpyb48sGbZvGI5x/lX7ESCMBdttg6V0AdzXAkEPhQ1MktwRUtOLsH0lBL4BamImKS@vger.kernel.org, AJvYcCXSKAeXgbf8xPMCmm6gpiX26XP75RbpTfbfA3km8aK6KT7SO+nbF8BUBUi2kXWidJeMh3lwK0L4sDHL9ArBApHjSI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxg0FxIbgxYFhDR3BHrEAHcoyjeYQ+sOzRlZfoxZKI09WJF6sT
	mwcVyPA4bgEYN16y3jpycUdxDv1vIA6buXvL3zUy/c3Qa8phh2cmItl0MMpq
X-Gm-Gg: ASbGncsCCLHKlvrrJslp6vRglovMelL7sR7z1+n/YhVHgGorp6ieroWMUIFHrFj2gQe
	9B62Gaze4em1tRShMwGqGfjUZc9HPR0FN4Xey6HMlkBhUCzoHIjDVAfAA8WIC1ByY4Q2mjCquQj
	IuUuZJuz4za6bId0fHx/UCEOS2f0sU0uFvZ7OW8iyR7cyqNEhT3uoP/TysKv7pvdy6UlEXk9M09
	z2puCs2P/kIWc0PxwoLdc8gm5G8qwsrtQr679VfR+65NeN2lakbCTosXuyX9tqRSHhUkTs1uBrS
	h4d6EU+NlOeDnZAY8tCKP5Jjr+d2y2dilFt3RarsCyQ=
X-Google-Smtp-Source: AGHT+IEqJwQ4LvIyZsN8EJItg4uKJnSgJYDAxndkaWk2zQy9SUGz5ffsrtvB+DxzDGRPt6OEJW4BWQ==
X-Received: by 2002:a05:6102:3f0f:b0:4b6:9f4:7df0 with SMTP id ada2fe7eead31-4b6f7afc7c7mr2179928137.12.1737627469869;
        Thu, 23 Jan 2025 02:17:49 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a208576sm3120377137.8.2025.01.23.02.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:17:49 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afe2f6cecdso916674137.1;
        Thu, 23 Jan 2025 02:17:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/ap2c6W3eX3fIc4fCjymK7JJP7J2XjEhR3ircgsBeLGJwU6VzSJCOWrbxyqPiwGaZpKKWprRXrnistPUgNTm7D2c=@vger.kernel.org, AJvYcCWXhSicMSpcA2XguMNLvU/epfs5zh2tPvvL573dFXVptMHSW4TvMtBuRjLXR/sa3aqvCH2YfEXfKp5c@vger.kernel.org
X-Received: by 2002:a67:fb06:0:b0:4af:f576:b639 with SMTP id
 ada2fe7eead31-4b6f79f2ff3mr1533565137.4.1737627469202; Thu, 23 Jan 2025
 02:17:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-6-biju.das.jz@bp.renesas.com> <TY3PR01MB1134612C1DF4639F12D829FF386192@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134612C1DF4639F12D829FF386192@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 11:17:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFexFfaqjBUbuEpurnDA1LPywB2pJ9ZJQZ=_3mmfgxoQ@mail.gmail.com>
X-Gm-Features: AWEUYZlQG2m5DJ4g5IqAjuWd1hMZYirr_cI7KtfNlfaIPvVh-8dSdZ_F1_Bj83g
Message-ID: <CAMuHMdWFexFfaqjBUbuEpurnDA1LPywB2pJ9ZJQZ=_3mmfgxoQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable watchdog
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Jan 15, 2025 at 6:20=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Enable WDT1 watchdog on RZ/G3E SMARC EVK platform.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> > index c063d47e2952..33b036b6a93c 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > @@ -29,3 +29,7 @@ &scif0 {
> >       pinctrl-0 =3D <&scif_pins>;
> >       pinctrl-names =3D "default";
> >  };
> > +
> > +&wdt1 {
> > +     status =3D "okay";
> > +};
>
> I will move this node to SoM dtsi on the next version, to have consistenc=
y with
> other Renesas RZ/G2L SoM modules.

I can move it to arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
while applying, so you don't have to resend any patches related to
other subsystems than the watchdog subsystem.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

