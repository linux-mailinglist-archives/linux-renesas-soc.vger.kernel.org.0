Return-Path: <linux-renesas-soc+bounces-6718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6471191619C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 10:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D90FD1F24D02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 08:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435771494C9;
	Tue, 25 Jun 2024 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZTW9Lqp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F04149011;
	Tue, 25 Jun 2024 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719305272; cv=none; b=leTCJ8HUpE27tCaVAA/sWmrXqgGrAIOLzh6nPUoTogsDSDQ4ZmkzpVtMTDYX5btsDwu/OM255Ieqqw4fdeTzR2YQ5l5oXBsDsFkGspnGQkDE8ApJv+qMnFuD8/+BMnhYL7wECdpbsN+q619ZWXAJG6XOVtXx36V+OcZMhRhet6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719305272; c=relaxed/simple;
	bh=So6QwmI/MgLmUF3flwvaM8Bf8+yW1a5lQaEMjRlwTLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5iJcr2Q8DlhGe8oXOgq94WssqQz30AfEThxyDPPUXsJEhu1YAfrA3+3Pep1ipkUmQsJQEYVd/BAp1YvtuG1uDyQNZpx3Jb8PnFG0xdiSerHU68yhOKJhEMRkGe49tstjtYpDrGdXoknEM7GI85YyuwKwWCX1jzSNYLBXA3VyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZTW9Lqp; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-80f6cc81a93so2120588241.1;
        Tue, 25 Jun 2024 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719305269; x=1719910069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMvXnn9zXEzw3+jkV6vLmQsIDPwVmACDgr8EUxhiawE=;
        b=RZTW9LqpyL7jsJbh2EAACJ8/JWzFnz2qahZPbhUuyQclfE4cEC0U/38DxSrArnPqGX
         yTToANKWNzW31K98O+DyXnr1BlUdxORxrtZ4JRXjRcsEBVT9I41C1XIm4ybHO6UJW+hV
         +Z10K4qwwCjNxzKi/9AJSW9YZdIMCok8jN5SnzUbcsIsqeE7nImCtZcy0COD9qPpX6Mc
         BdHimrkMRg9yXA9F/oOol1drtcBHvijCsd5/lvL+3lTpdMWJvF//6OLVNzlEyKv/tPc8
         a3SkVX6nr6VCT4MVlRQk8yOPvVenI7rqCBeWzN8MAVBxyeb7zRHK0P9C3uZgKuCoXmv8
         aZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719305269; x=1719910069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMvXnn9zXEzw3+jkV6vLmQsIDPwVmACDgr8EUxhiawE=;
        b=BhAioGBkw2Lf8LcMuSzjGJUFUjbFziZkGFD96aWq/BAKvYexImBqZc1kxp/N/rH5Ci
         f4lwzEm/48wGhIvYTbQkRvTIJb4Ud7hJQRc0K8RSFTvYbi/60Pwwb8Klxeg19pwg9xYV
         5Yh4HJiRiP9u4Ij2irzOXiV2wW7+jT/0+B4kTN2yKVcgPGRj7l2CgaKxRcJxInPx+cnb
         x42F/Z7/Yg315JYIh0LVP20XA3l6ARYjGd+vKdfurtPaDFlqUAl253nIIees5suiqHZn
         wJdOjXKdxLUZIxkU+h1HaOAc+ACufy6i5yMGqIitBcNz2cWY0pz73Do+92FOnF/4FWid
         FPkA==
X-Forwarded-Encrypted: i=1; AJvYcCXtlebp2JU7XW/YLWYH2MIH9IqgHS4KLi4EoSDwa58zmJp4iEob3Xp1wmki4s+fsmZj4PdJFuog795Fw1jeR1C8HOTtdZLBt8Tozu233XGe6GXGtwS6r1iP7ouAul+jVSxO26SVkUFCZ1AngMEp6mgD+01gUI4IenDi2ZWIlKAKjwwMSaebf2Fi2sYK3kmQXXXg5axS7/gN8Q3AEjoEOJoTLtAKX2re
X-Gm-Message-State: AOJu0Yw9fn3ZucPwLiJqyg9bMITTmKj7KPRnMPGit8RZUmW4mjSOv/B6
	cCvAOodFBB3kJV31L9podiM52UhNmoVNVYrqCAKyZJIVJvWrnvoviflP30Kv/yNXIjQz27mW8Yz
	XI+rNim1lRFF/SA1ZHrqZG2VCmqA=
X-Google-Smtp-Source: AGHT+IHe/ogTl+oOtusu+EGCKy7sJnEYaptfEU5/7z1LV5OQwmufiKxuyWUdXTSdbMZjOzsPd0IW1ArpjQ4rMwv3SNY=
X-Received: by 2002:a05:6122:4127:b0:4ee:244:b0ab with SMTP id
 71dfb90a1353d-4ef6508a088mr6675566e0c.2.1719305269452; Tue, 25 Jun 2024
 01:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU0r+B_Jmh7E6sopRbfzzX7DtZKpY=Xte2vLDC-ORwdVA@mail.gmail.com>
In-Reply-To: <CAMuHMdU0r+B_Jmh7E6sopRbfzzX7DtZKpY=Xte2vLDC-ORwdVA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Jun 2024 09:46:54 +0100
Message-ID: <CA+V-a8uhb1Visg9jUV-Te3ZHkfdRonM08s823RYa6k=KAHYgQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Jun 25, 2024 at 7:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Jun 24, 2024 at 5:33=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> > of the R-Car Gen3, but it has some differences:
> > - HS400 is not supported.
> > - It supports the SD_IOVS bit to control the IO voltage level.
> > - It supports fixed address mode.
> >
> > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g05=
7'
> > compatible string is added.
> >
> > A 'vqmmc-regulator' object is introduced to handle the power enable (PW=
EN)
> > and voltage level switching for the SD/MMC.
> >
> > Additionally, the 'renesas,sdhi-use-internal-regulator' flag is introdu=
ced
> > to indicate that an internal regulator is used instead of a
> > GPIO-controlled regulator. This flag will help configure the internal
> > regulator and avoid special handling when GPIO is used for voltage
> > regulation instead of the SD_(IOVS/PWEN) pins.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> > - Added regulator-compatible property for vqmmc-regulator
> > - Added 'renesas,sdhi-use-internal-regulator' property
>
> Thanks for the update!
>
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -204,6 +207,31 @@ allOf:
> >          sectioned off to be run by a separate second clock source to a=
llow
> >          the main core clock to be turned off to save power.
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,sdhi-r9a09g057
> > +    then:
> > +      properties:
> > +        renesas,sdhi-use-internal-regulator:
> > +          $ref: /schemas/types.yaml#/definitions/flag
> > +          description:
> > +            Flag to indicate internal regulator is being used instead =
of GPIO regulator.
>
> Do you really need this?
For cases where the status is okay for the regulator but still the
user has phandle for the GPIO regulator or shall I drop this case?

> The status of the regulator subnode already indicates this.
You mean to use of_device_is_available() ?

>
> > +
> > +        vqmmc-regulator:
> > +          type: object
> > +          description: VQMMC SD regulator
> > +          $ref: /schemas/regulator/regulator.yaml#
> > +          unevaluatedProperties: false
> > +
> > +          properties:
> > +            regulator-compatible:
> > +              pattern: "^vqmmc-r9a09g057-regulator"
> > +
> > +      required:
> > +        - vqmmc-regulator
>
> I'm not 100% sure this works correctly: does the checker complain if
> a required subnode is disabled? Note that I haven't checked that.
>
Here is the experiment which I tried and the checker didnt complain,

&sdhi1 {
    status =3D "okay";
};

&vqmmc_sdhi1 {
    status =3D "disabled";
};

But the above is still a valid case where the user wants to use a GPIO
regulator?

Cheers,
Prabhakar

