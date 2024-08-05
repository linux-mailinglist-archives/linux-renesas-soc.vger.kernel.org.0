Return-Path: <linux-renesas-soc+bounces-7721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126BE94791B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 12:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EBB2B207E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 10:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAD415380B;
	Mon,  5 Aug 2024 10:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMuU8+/o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05254658;
	Mon,  5 Aug 2024 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722852712; cv=none; b=mT5BKPN3UfB9LQJWn1kCy0/VM/37WzglzZSq5I5HxCtxaRZ5N0X4sB5psrvCdmrw0tKzLazSo8igFpxLVUuoDapTxiqOIEQDzucyL0V469jGxmBTo7hQKmC+MGZ3vYX7Hea+8nZzrFEBLaljGRgXneMs87bdTek5Rxz9OIdg3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722852712; c=relaxed/simple;
	bh=uz3PDbQf/CwBdPu+FujzDuwVltGEBBlEGjdTm3NRYUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNNlwwcegOWfCffiH0RT6Un5+Piuyk1xM7dCU5nDdbCEtm4+fzm+qRHy02/GD2lIJSmQPHs9XDVvdEEBZ7DJX82uG23a4U4EHghxy3CQCYle49uNOEME0e/xXjxcnAATJ1m1g6Oe9A2cpmT/xLspfSJVhUg3lD0B1fmIBqGXPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMuU8+/o; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4f6abcf0567so4004548e0c.0;
        Mon, 05 Aug 2024 03:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722852710; x=1723457510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqFy68ctx8OCSrJN8siALtfuI02hTJzmjF8cLmFCihg=;
        b=AMuU8+/o4hoMZCeooc4tnygU7WujjPGgc3o3YvsJ2PM7A/bKxG78gRD7l6OKZC31Rp
         M+4KgAzQPU/9bIfJMHrhVftHYS/9KM6JiNX4PtCs54q4qH5/Bcy57mo6LcIdTq0UKERK
         NOEEvq/Yv+aMzOYwqG3MzZidcZ12zb4h1htVsqfBx189ShSso5yqNz33rjAQuVftOMs/
         +sQh0QGn/HRijkBWdHmS5hkiuYDgLMJ7yu29uVFauWbdxYBZ4mFiioLo73kxC08Uwese
         vMCceK+Km9/5sHdrclS96Mky4tQzu/rOsp2NLxAcAhZZy+H8nSYwzWKTQqPb2PYgx1D2
         0OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722852710; x=1723457510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqFy68ctx8OCSrJN8siALtfuI02hTJzmjF8cLmFCihg=;
        b=JqR1nTkoHW6QwsSD3w+Aid2zrpgLvpYysBtXoZxZw2pa+piB4+tmMz1vGC4XwYvb1T
         E4tW5U9ryIzecNnd1O137cfGwt9WlVHU019xF/PX+BWQjzPIsJYa1QYa4XVCl3hbC2qF
         Ii7oHpb8VYe4JKwRfQ2nya6CepqPgCUCtAGcu/cu2dMyhejPcvP7WDCyeAGW0LvGMYxn
         5mFOgK8le1PYdTBD/zRmNYzVafDoVKeLCH957AGrKCOIwmuvtVPZ/ksAgZ2GEbXK5yhE
         Rh0d5YbJZS77aRQrCPrFRAKnev8Ll/qX7QbSamVy4YaFiZxdPHTlfApyI3rzNwgZujYQ
         Yk0w==
X-Forwarded-Encrypted: i=1; AJvYcCWSVLOJexRN6bhLjiD6tfdiTN4XQ+Ak2Bfm4mn+M4uYJsGPrEZ8hRUgbZ0JNSawTs0J4DBEJaiBOXfCebxzHTAYxKwX2vLz01D4NY7TBLqG0eK9xQV1sDaFFHyVG8rewiMrV3khQo0HONtMpYvkjzMta93rNrXVKzBNdVWWMcEyQann95hB/lbdHRwqD4pDC/3A7rpvBAcRVrAPsv5obVJf3lyEmG7H
X-Gm-Message-State: AOJu0YzSXo+TF8O84b9FTtgLJW6y2aNtkNJScX2dGOQf6gpcAOQz7IgR
	dNywE6ej7O24kVTGvQ+KDfK+n3mzPFpMjYOzBT0VV5F7mXHMNyf0qdxHVlUR9fc1eCRBRv0h5fD
	AUWkjz/7GMxJrnLS69WzctdVR4UE=
X-Google-Smtp-Source: AGHT+IFg7GqQOIIN2kz6j2VWZtb0Tq4sECQzl2p977ZAZCgH3AQoNCnI8QcpGbtOt8/SiBP5RCfGJHndYciSyyiUG2w=
X-Received: by 2002:a05:6122:2027:b0:4f6:b240:4af8 with SMTP id
 71dfb90a1353d-4f89ffc8d2cmr12151574e0c.11.1722852710137; Mon, 05 Aug 2024
 03:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240724182119.652080-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXkPwfVT-iJp70pEi5ubpc5YBKt=a2C5NmL_tjbocXKRQ@mail.gmail.com>
 <CA+V-a8ttfEHwXqUU2OqxhjJ3E2jt+xCBrbziHtOUs1g74tandA@mail.gmail.com> <CAPDyKFppZPadtEBocoVyQJkchKzQ4WgnLb0_CYgeHWk+noVbFg@mail.gmail.com>
In-Reply-To: <CAPDyKFppZPadtEBocoVyQJkchKzQ4WgnLb0_CYgeHWk+noVbFg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 5 Aug 2024 11:11:24 +0100
Message-ID: <CA+V-a8tjDjaGMBgdyuxUxjA=O4DqXdpMjAu5GN3i+ADOFZoGKQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Mon, Aug 5, 2024 at 11:09=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Fri, 2 Aug 2024 at 11:32, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> >
> > Hi Geert,
> >
> > On Fri, Aug 2, 2024 at 10:11=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > On Wed, Jul 24, 2024 at 8:22=E2=80=AFPM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to t=
hat
> > > > of the R-Car Gen3, but it has some differences:
> > > > - HS400 is not supported.
> > > > - It has additional SD_STATUS register to control voltage,
> > > >   power enable and reset.
> > > > - It supports fixed address mode.
> > > >
> > > > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a0=
9g057'
> > > > compatible string is added.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v4->v5
> > > > - Dropped regulator node.
> > >
> > > Thanks for your patch, which is now commit 32842af74abc8ff9
> > > ("dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support") in
> > > mmc/next.
> > >
> > > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > @@ -18,6 +18,7 @@ properties:
> > > >            - renesas,sdhi-r7s9210 # SH-Mobile AG5
> > > >            - renesas,sdhi-r8a73a4 # R-Mobile APE6
> > > >            - renesas,sdhi-r8a7740 # R-Mobile A1
> > > > +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
> > > >            - renesas,sdhi-sh73a0  # R-Mobile APE6
> > > >        - items:
> > > >            - enum:
> > > > @@ -66,6 +67,7 @@ properties:
> > > >                - renesas,sdhi-r9a07g054 # RZ/V2L
> > > >                - renesas,sdhi-r9a08g045 # RZ/G3S
> > > >                - renesas,sdhi-r9a09g011 # RZ/V2M
> > > > +              - renesas,sdhi-r9a09g057 # RZ/V2H(P)
> > >
> > > This looks wrong to me.
> > > Did you want to add it to the clocks constraint, like the third hunk
> > > in v4[1], and was it mangled in a rebase?
> > >
> > Oouch, yes you are correct, this had to go in the clock constraint.
>
> I am happy to apply a fix on top for that.
>
Thanks, I'll send out a fix today.

Cheers,
Prabhakar

