Return-Path: <linux-renesas-soc+bounces-2685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D028530A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 13:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E19A1F221A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 12:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412913D387;
	Tue, 13 Feb 2024 12:40:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF053D994;
	Tue, 13 Feb 2024 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828020; cv=none; b=ZadY92+h6bOHg6xr+ns7Ba7bVQwxzngktiQn0phOMNK1dXOFl1J1YEnOhurMaS9fFHb2hwhp7Y6JLbY10wx5+4cF8HfezssriEl0P9iAtx38VM7ZQS4Ie9o7Ht9Xf+0tpaH9qDgTVY6jqS2c4e9gW/HA/JXsW9KSn1Vhzo8ZYd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828020; c=relaxed/simple;
	bh=wUJyXXbGTBOy94MIUIV71WzTBb8rRYur4YremCO0Cno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKfQsXhCz6hwGq0q9Kk5DWI1sFSN9Xo70DGqLMEKRYoHDhQMRXTwoEc7H480NxtJeKQMK7uRjE5yIbnMfMbfhJJgWyO8WTEWAxDAQIIfTkjCaXoRLynzcrd9K3gSUmH/N27pKiKrQcRaO+e84mN5FWcrPsUfXSwE3pTdaow7Qu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc745927098so3576809276.3;
        Tue, 13 Feb 2024 04:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828016; x=1708432816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHxqgeHF2z9NmdWD9679XNCgSO+veA7sR2au5H0s50A=;
        b=FnRfvkoffZPLCPD0c19FjPy2mE96biLFj59+rYCuVUhgDAou4kL3AoM4nD5t9ywKCc
         sDoAgtkaudWGT2WrYb89gjEFqE5t6sSeZCKsiR2OukV2zhg7TyUwUKhGIuhyjvwld6UI
         hOprwBh4jCXNqyABFJ7qVYHoVKFmhd7Mb1/WAIavhzKUl8BWlxKQwk2DyLGwK60AqCJO
         Z3ICTcj8o/47ZXSskjDwGbUjal58UpgFem1257ami2BnnGNMS16+89hNsfhmzH1Uw+Vq
         V7e60VHb1WA0WCBTpRH2buNes8KfG3FIIuDndawBgwV3e5ejfFXOadYvms/qOJOpxxgT
         oyOA==
X-Forwarded-Encrypted: i=1; AJvYcCWFGbNrZMjuah0zrp2+JWbQVIxjmMiMgOXK84RJG5HJyMjrt/p/tiyd1iVRDcU61oPiA3Gm4pOZribWpJnr/c5CPTJJAAeaXpvdQmcanycTh70/OM/souA1Wa5/3pVodf71uACmPLkRuKobwzRf
X-Gm-Message-State: AOJu0YyWwYmtn9f8gAK3M64G7HiEzRmBhvAgYO6j1+yK/wYyBGveg4Be
	NyaPLbWpuKotAkrfroe1aZVzJ07heDcot0wcBnRmP30gav1GUIgGdy+0Mwq3Iw0=
X-Google-Smtp-Source: AGHT+IGQ5XX7OaiGgKZn94tFBpih26UsZYpso2EbvW+HlNQ11VyveV8wv65aTU37jDoEi+gVGcoOCg==
X-Received: by 2002:a81:8313:0:b0:604:727c:695 with SMTP id t19-20020a818313000000b00604727c0695mr7379915ywf.42.1707828016440;
        Tue, 13 Feb 2024 04:40:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6agGFl+PpJBinAQEYZufrNMIgRpRlkxBLcRetM//rLXIMVnYj0xStMrY/mKp6gQs2srnhoi4MLrGBBwET/lC42/X/imSk9a3B5FnzgLKEPg4euB3SPDSEJ3KhmmZN1FQ+qxFKN3UvRDo2bg3n
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id em7-20020a05690c2b0700b006073145eccesm1044071ywb.13.2024.02.13.04.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 04:40:16 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso594216276.0;
        Tue, 13 Feb 2024 04:40:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7d2QgfiqV1ffxBDeuMozaVjm2vdN+MdaSd3cmbpUPwKdS9SdWFB+oozZpUKNESakCwxOpt5wY63pa8nnxZF+Sd9SaPEwey0rIR8O4KpK+6UZG+meA4E5g+gasuVBCNIItAd9q1sVuP/XljMzg
X-Received: by 2002:a25:5f09:0:b0:dc2:2d75:5fde with SMTP id
 t9-20020a255f09000000b00dc22d755fdemr7699131ybb.29.1707828015982; Tue, 13 Feb
 2024 04:40:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUJ0U9qnxtdJmVUJQqRhbmu0rmOxpyDZ8Lp=+hv=Oe4Og@mail.gmail.com>
 <20240212233836.GE1870743@ragnatech.se> <CAMuHMdXBYfi==T_EzbagJFVYkvYU=usEsru1T7Z=rBHFHt-CMg@mail.gmail.com>
 <20240213123046.GF1870743@ragnatech.se>
In-Reply-To: <20240213123046.GF1870743@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Feb 2024 13:40:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+YwSHqH=CKgj-xWOQYQ28OEjJb1SPP1CGPyQLOrRfJw@mail.gmail.com>
Message-ID: <CAMuHMdX+YwSHqH=CKgj-xWOQYQ28OEjJb1SPP1CGPyQLOrRfJw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: renesas: Document preferred compatible naming
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Feb 13, 2024 at 1:30=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-02-13 09:29:55 +0100, Geert Uytterhoeven wrote:
> > On Tue, Feb 13, 2024 at 12:38=E2=80=AFAM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > On 2024-02-12 20:36:12 +0100, Geert Uytterhoeven wrote:
> > > > On Sat, Jan 27, 2024 at 1:20=E2=80=AFPM Niklas S=C3=B6derlund
> > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > Compatibles can come in two formats. Either "vendor,ip-soc" or
> > > > > "vendor,soc-ip". Add a DT schema file documenting Renesas preferr=
ed
> > > > > policy and enforcing it for all new compatibles, except few exist=
ing
> > > > > patterns.
> > > > >
> > > > > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org=
>
> > > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ra=
gnatech.se>
> > > > > ---
> > > > > * Changes since v1
> > > > > - Split the "SoC agnostic compatibles" section into two to make i=
t's
> > > > >   intent clearer.
> > > > > - Improved the documentation for each group of compatibles.
> > > > > - Reduced the number of regexp to create a larger target area. As
> > > > >   suggested by Krzysztof the goal is not to validate each SoC nam=
e but
> > > > >   check for the correct order of SoC-IP.
> > > >
> > > > Thanks for the update!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.y=
aml

> > > > > +      # Fixed legacy compatibles
> > > > > +      #
> > > > > +      # List cannot grow with new bindings.
> > > > > +      - enum:
> > > > > +          - renesas,bsc-r8a73a4
> > > > > +          - renesas,bsc-sh73a0
> > > > > +          - renesas,dbsc-r8a73a4
> > > > > +          - renesas,dbsc3-r8a7740
> > > > > +          - renesas,em-gio
> > > > > +          - renesas,em-sti
> > > > > +          - renesas,em-uart
> > > >
> > > > Perhaps combine these three: "renesas,em-(gpio|sti|usrt)"?
> > >
> > > Will do.
> >
> > That does mean these lines need to use
> >
> >   - pattern: "^renesas,em-(gpio|sti|uart)$"
> >
> > right?
>
> Yes, a pattern is needed. I will try to condense the lists as much as
> possible at the cost of strictness as this seems to be the common theme
> in reviewer. This will be,
>
>     pattern: "^renesas,em-[a-z0-9]+$"
>
> Or
>     pattern: "^renesas,(em|foo|bar|baz)-[a-z0-9]+$"

I'd rather keep these as strict as possible, to make sure no new ones
pop up accidentally.  I.e. I prefer "^renesas,em-(gpio|sti|uart)$" over
"^renesas,em-[a-z0-9-]+$".

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

