Return-Path: <linux-renesas-soc+bounces-7720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D478947914
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 12:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB664282E3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 10:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00BB154434;
	Mon,  5 Aug 2024 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4yJhM4u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F05614F9D4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Aug 2024 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722852590; cv=none; b=E8X2VuPyhfF7lVBvLRxOW8VizL6rzUxrG+ZM8AUahAg9KRiZG1Fbk6HWNp8QtOUvGPLdoYxMEZ/4PHRL6DDA2Sx+rb36NVvj/o+lbu3X6cW5FGJyXmjISQjAhcV5F2O8k4ovgtgI0KLPU1wM8D88zx8fdrxkjXjuvjWIvAhJaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722852590; c=relaxed/simple;
	bh=+K9hSpGtE/3iLHQcSO8dUwYSy1HxcajpYURwgaK4bfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmAEO7VrKfNMh5f5gNifv6U7qdRziz/MbxFmGTfOwzWycX5iNMX6sWjDsHmcamXy1bxZ1kbX578YlkxyFfGWwE2Iz5Gz/iVADZoerkUdGkfPQbRDUnBK/oZ+F8jK3DxAe71Ndvrndpbik5UGpfmBdBepIxrjtJRhETcDYZZZfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4yJhM4u; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e0bfc0ee203so1794299276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2024 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722852588; x=1723457388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PndH4jnAZ185cGSKb8aNel1LJ2ETeEsYl8hD1+owehA=;
        b=d4yJhM4uaAAOBaRyU5bMwBHuHP9Ntd3SOpgRm0Ub4Zn1xSBmB9s2FU9H+S+H+xllew
         cI6gMbWdrg5TTrUNbXwI3y3HcWzh4msDIEmYLVp/4tXEBsVIAaVpCEprm8jXa/yoX3FB
         h//MgtmeQkzayhoZA6NsGwgBU+uzG7A0g3Lu6aPxe0ZE+Yw+CupccWLlUeUgAIEpocSa
         vKpXapd0i8UyaVJxV6Zu2XsFOn4VD9PrS2QJ3zJvf8W8avev9Jh8cnK2dR/uM7uHYEZi
         y2ita2wjeEQx1A7ykRlK30fZ+xwJYcwHh6KGgorMhLz55KPoiveqFKmtJxJepisHn38y
         Qbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722852588; x=1723457388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PndH4jnAZ185cGSKb8aNel1LJ2ETeEsYl8hD1+owehA=;
        b=ogaGl4Z1h6iVnmP7Xx53UyVbB2lxG5IDEvCcrmAYGW9kG0iQJI01hAS/hOdFZuzYJM
         Mz4WyH5bKozQNLSrLzzNKhxzP9DzShNc4vELid6LWAOYZ99B2j/pv3A/nRPpxrSaImWe
         6BHBwWLx2yMLqW/U7H9jf61QQ5yTzQzzZnrYkAhDtp4ywUlb4V0BsSAoT7CWr02epgG4
         PLKhm5Tpi81p3wyhJg4nFG0eIC3dFdqQ6JczW1HUAKpotlqGbfP/FEMtIbT74S/5G2zE
         gzy81BS9MkCDa2lFGmGyV5ILCKFlecxWrhjHYY2R6O6rpF/W/7SQVRX8Q48gFfau/bdi
         MSMg==
X-Forwarded-Encrypted: i=1; AJvYcCV7gnDEu2ajJfIY2xkbeFEUdStP9TjFkj8ktbV8EbwztGRoevVbNgEmQFjOCfqmdxibUen67TGmJgfYFVjVUCKRBqUnC90AS/KVSjmnu2fGW7I=
X-Gm-Message-State: AOJu0YwL3DYIOvE9wY9v8Jqs2w3H0h3Y+otNQPdPqHJ7YBitiP9HgK9D
	tR+c0HUAQ2oBC9vCwpARgF8H+W3CQ0NBQF4NGu/BmFo6yGhx4ciHgHcium8ZHrG4bxRigdSna0W
	1A9ENXh0kdGcwQcHBhPN6HtOHATjvIQBmrlHruA==
X-Google-Smtp-Source: AGHT+IGg/GAsaKY8g93SL83rdsel5V/KlOUKwAqZsoGoMsz8VtQS+2FhX5IVmdELMhBPT3sA0+WSrmuA7ocZtIVCyHY=
X-Received: by 2002:a5b:1cb:0:b0:e0b:1519:e0d3 with SMTP id
 3f1490d57ef6-e0bde2c64acmr11465264276.6.1722852588222; Mon, 05 Aug 2024
 03:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240724182119.652080-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXkPwfVT-iJp70pEi5ubpc5YBKt=a2C5NmL_tjbocXKRQ@mail.gmail.com> <CA+V-a8ttfEHwXqUU2OqxhjJ3E2jt+xCBrbziHtOUs1g74tandA@mail.gmail.com>
In-Reply-To: <CA+V-a8ttfEHwXqUU2OqxhjJ3E2jt+xCBrbziHtOUs1g74tandA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Aug 2024 12:09:12 +0200
Message-ID: <CAPDyKFppZPadtEBocoVyQJkchKzQ4WgnLb0_CYgeHWk+noVbFg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Aug 2024 at 11:32, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
>
> Hi Geert,
>
> On Fri, Aug 2, 2024 at 10:11=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Wed, Jul 24, 2024 at 8:22=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to tha=
t
> > > of the R-Car Gen3, but it has some differences:
> > > - HS400 is not supported.
> > > - It has additional SD_STATUS register to control voltage,
> > >   power enable and reset.
> > > - It supports fixed address mode.
> > >
> > > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g=
057'
> > > compatible string is added.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v4->v5
> > > - Dropped regulator node.
> >
> > Thanks for your patch, which is now commit 32842af74abc8ff9
> > ("dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support") in
> > mmc/next.
> >
> > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >            - renesas,sdhi-r7s9210 # SH-Mobile AG5
> > >            - renesas,sdhi-r8a73a4 # R-Mobile APE6
> > >            - renesas,sdhi-r8a7740 # R-Mobile A1
> > > +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
> > >            - renesas,sdhi-sh73a0  # R-Mobile APE6
> > >        - items:
> > >            - enum:
> > > @@ -66,6 +67,7 @@ properties:
> > >                - renesas,sdhi-r9a07g054 # RZ/V2L
> > >                - renesas,sdhi-r9a08g045 # RZ/G3S
> > >                - renesas,sdhi-r9a09g011 # RZ/V2M
> > > +              - renesas,sdhi-r9a09g057 # RZ/V2H(P)
> >
> > This looks wrong to me.
> > Did you want to add it to the clocks constraint, like the third hunk
> > in v4[1], and was it mangled in a rebase?
> >
> Oouch, yes you are correct, this had to go in the clock constraint.

I am happy to apply a fix on top for that.

Kind regards
Uffe

