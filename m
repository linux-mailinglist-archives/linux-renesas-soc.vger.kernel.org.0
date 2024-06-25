Return-Path: <linux-renesas-soc+bounces-6720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F31CB9161F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 11:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DD2D1F23606
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 09:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2962B1494C8;
	Tue, 25 Jun 2024 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWfaSLo1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8381494A4;
	Tue, 25 Jun 2024 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719306491; cv=none; b=k+TiUvcp9ytIJ8sPwzVxQWdvf9ju9tIyQGL4nZZuIKWgD9TmfELsZTrWNDe9BJh8uIZZfS0yE33MTrOU7qjlosHmuVadDqOhPnGRjRPZtPyEj635lEU3IS+NxY3DArOGspzJoyR5QQIOQzVIbvwLgV+ihVXOXL5IfCBztE5/G2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719306491; c=relaxed/simple;
	bh=SEWBQUoZ7P8jkFskPK7Gv4C8r4RGvfOAgyM1UkPx54g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNWsMrQIm5qp2GhhH2iOocwouKj9Y689mM9GXwr2XkIXSC80BwBr6zUd6gX1ZFwSvaWuOvy2/aDPoRMqtD/YS1AJQxpdfgRP6elAijRbCxSMDR85I/aqj12WbUzCdNWgRU/FWPd0PBalzLMLh+CIctmerlJ//nqBfNJ0Mb9z5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWfaSLo1; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-80f551808e0so1391055241.1;
        Tue, 25 Jun 2024 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719306488; x=1719911288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vB6dv/uw7lUtFFyv1iClQz2bRsrGe4g7MjZsks8EP0=;
        b=CWfaSLo19GjERcSCA49sRECTfGd7bG9/Wqkgj/RrbyLN+LWAy2OEuIoIBfqTn09iCh
         TnsfgAvP4QOiP6qgoGk/OO8Ak0j0xKpLT8gQisCHHAqfMpl0/WDmWcOcgtVU7xfac7k/
         hT9bajVG5r9ZWTXNCPFAq7KotcsrdpeAgRSbYx6Qc8XbHoga+ys61j97EIAqXqwPHHBQ
         +Rbl4frhzXssfFkvqaMmEKtZq+eW3C1bW2fQp2CtfS8aEO69Do8oJcn/+Wes9895WZhk
         JDs6rDrPcKj243I9q+IKRMen4pJKLUYCVCM6ql/0UR231HFKcqVewWdQ7pnOZwDc5ovn
         uLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719306488; x=1719911288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vB6dv/uw7lUtFFyv1iClQz2bRsrGe4g7MjZsks8EP0=;
        b=EZ4scuOd/IZPDXwuBj2qZiqs+k7Wce9W33Ev9/4hnEp429fpQPEQr0tJW2gUrUGYE0
         DfCQd2vwRj6KeOAkywGduDt+zg5PZIWcCHuxDumLXMtCnpVxNiZ7FkxG+QQHWcKkLf5V
         kanZEYWvltv/G2ucWZcLUW7OTj6MkjmpExaA3BRvrTkZQKwYqnRgQLgEfcb4LeSCtNZn
         tejK8vPTFQVcWXp9iOfMfqQtsuDh8GDqkU7z9jWcws7Z8DXYxbioZ3+bi1rEelnOlO0j
         vJUo+b0TZKoWDssN42kPNeh+XFGmsHbeOGavuKu8bX/A57EYW2dXVJifvcth9QE+k1Aj
         zZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEt4K6yqBXqid6UFfr+thIzktPqJk24/pS4INTosgC/2NrEGCJVnT5SVtw8oIpr+8GxvDTNi5ZmlMxnp36Wc6thhjbsqHtHpED9K+rbSEjMgZwTlTFseetGw4/8Z2Vv809PuwV+xt7n/Ju9mdFSu9Qiicv0FcbzHwGtSkMSy1EJLsa17dZzwL6QkBq3bs0C64ly1KLlRHPvaeTlViLFHDcSulpWgXi
X-Gm-Message-State: AOJu0YzZcHQ75dhDW31Mu73J+MkyKCWqXrJnC/vTAtGwz508rdEjgTGy
	Xp+BYW3vyGro3ADHkhqK2uKk/bZtw2bKUV8mkDrjQUW6c9KjvyrQ+gWZHtY0iPLNFn1Fgwwy0zh
	p4mQYHb38zhmt4AqyBO+AuFR5Rzo=
X-Google-Smtp-Source: AGHT+IEPkvu7Ma8dMRJoojx4z4jjbeIyB9PnWNm5uMVryrc0YvBpEpJ9eNGjDXhSynwmmXdXhSgkvNiJZIzG1Vd4uyQ=
X-Received: by 2002:a05:6122:7ce:b0:4ef:5db8:fe15 with SMTP id
 71dfb90a1353d-4ef6d829d18mr5835586e0c.9.1719306488344; Tue, 25 Jun 2024
 02:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU0r+B_Jmh7E6sopRbfzzX7DtZKpY=Xte2vLDC-ORwdVA@mail.gmail.com>
 <CA+V-a8uhb1Visg9jUV-Te3ZHkfdRonM08s823RYa6k=KAHYgQw@mail.gmail.com> <CAMuHMdUkcJFv3JRUSpgEd4_zTd9dxD9e96JjxSco4tNU-rv6wA@mail.gmail.com>
In-Reply-To: <CAMuHMdUkcJFv3JRUSpgEd4_zTd9dxD9e96JjxSco4tNU-rv6wA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Jun 2024 10:07:13 +0100
Message-ID: <CA+V-a8vZyU+hpeaxWLUbZ5VA0K4S0wZV+XA8vhsebkSHDuzyZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Jun 25, 2024 at 10:02=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jun 25, 2024 at 10:47=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Tue, Jun 25, 2024 at 7:57=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, Jun 24, 2024 at 5:33=E2=80=AFPM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to t=
hat
> > > > of the R-Car Gen3, but it has some differences:
> > > > - HS400 is not supported.
> > > > - It supports the SD_IOVS bit to control the IO voltage level.
> > > > - It supports fixed address mode.
> > > >
> > > > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a0=
9g057'
> > > > compatible string is added.
> > > >
> > > > A 'vqmmc-regulator' object is introduced to handle the power enable=
 (PWEN)
> > > > and voltage level switching for the SD/MMC.
> > > >
> > > > Additionally, the 'renesas,sdhi-use-internal-regulator' flag is int=
roduced
> > > > to indicate that an internal regulator is used instead of a
> > > > GPIO-controlled regulator. This flag will help configure the intern=
al
> > > > regulator and avoid special handling when GPIO is used for voltage
> > > > regulation instead of the SD_(IOVS/PWEN) pins.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v2->v3
> > > > - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> > > > - Added regulator-compatible property for vqmmc-regulator
> > > > - Added 'renesas,sdhi-use-internal-regulator' property
> > >
> > > Thanks for the update!
> > >
> > > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > @@ -204,6 +207,31 @@ allOf:
> > > >          sectioned off to be run by a separate second clock source =
to allow
> > > >          the main core clock to be turned off to save power.
> > > >
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: renesas,sdhi-r9a09g057
> > > > +    then:
> > > > +      properties:
> > > > +        renesas,sdhi-use-internal-regulator:
> > > > +          $ref: /schemas/types.yaml#/definitions/flag
> > > > +          description:
> > > > +            Flag to indicate internal regulator is being used inst=
ead of GPIO regulator.
> > >
> > > Do you really need this?
> > For cases where the status is okay for the regulator but still the
> > user has phandle for the GPIO regulator or shall I drop this case?
>
> I think that case can be ignored.
> The regulator subnode would be disabled by default in the .dtsi, right?
>
Yes, agreed.

> > > The status of the regulator subnode already indicates this.
> > You mean to use of_device_is_available() ?
>
> Exactly. I.e. only register the regulator when it is enabled.
>
Okay I'll use of_device_is_available() and drop the
'renesas,sdhi-use-internal-regulator' property.

Cheers,
Prabhakar

