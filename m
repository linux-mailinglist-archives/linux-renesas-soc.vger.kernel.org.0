Return-Path: <linux-renesas-soc+bounces-7703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CB7945B07
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 11:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7B9E1C20AC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 09:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6183D1DB438;
	Fri,  2 Aug 2024 09:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBWJvtI6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA11C3794;
	Fri,  2 Aug 2024 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722591136; cv=none; b=tMMX4vagn4ZB2QbU4p525lkF8wyP/uXV3P+UqtctGT3OL2+V6eTAmiL+YMCo7eJ/+OP7qeS/jYe+R511F02PpQv+YQOTQzqPiDq5qPKCekBxdWruoDje+lfXHun9MQbCVtUTkoxC1ksRU74tlx8pI1lIIMq2NRvF5B0BOI6hOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722591136; c=relaxed/simple;
	bh=s+sLvkGwuumdPtKUk9zYbK2vjsXFUVodqhuzpomDCas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1uTHYOsLo2GXVzfDjiPyKoN+JEosPvShOEbWgbGl1/2kM1UjJZ0bF2Zjv4DqxHcxqi9W1octqxZ5nTRZVD02qJCTe8k4d+TUGLQLsw1wZqf9qx/rVR2YbZ4V9L1CFI5pTiT3S6U3VyftoIKaP3AkhhuATrA77nySHsFVylTl4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBWJvtI6; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4f52bd5b555so1801632e0c.1;
        Fri, 02 Aug 2024 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722591133; x=1723195933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xQBppPhJLVrlatbcBmrhWSJbyTB6bm3E+Px/uHEes0=;
        b=YBWJvtI6NlBTtlZjXyfcydHo7GJaUdEIMnp3h1toPczrt+SqtOSUx1xCoogNSsIvcA
         MP45Nbrv6iApVJK4BQ23BV89DB6pg7Ne4AxZD315FY0wShwluiJ5Hcq1s3tmHhgf95TZ
         zYLEdRqLK4wHS4V5NU8xrRRBu/ph9oVEtpVmr+umyehJ+v8nwi4lgiwQK7SAsyBkwpau
         BzyE/GKzff/LvoDxSVcFKSq4/1TEK5SbqX3uA6lKkjLYf5vcYQgfDKtIdfns0VjqTgo7
         bs7sOiafa9rVEXXVi++WHG2j25oOl4y7ATr9o33V4qfPHkaIWsD2kAWb+dgwtswJJjV0
         Pnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591133; x=1723195933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xQBppPhJLVrlatbcBmrhWSJbyTB6bm3E+Px/uHEes0=;
        b=jnrsRiCiaGlCI8/o5dfIRBJZ0uTSU041+vEQUoxKviq+ScXuiqEtkz13mN4u7DFxIh
         sQuxh47h7d9d+vO79zguMSXN0/DceQ7YLgxWKEtY0Yv76YBxgnOHpKOFyvTyM4lZkgvd
         SK6rxjVTzc6UHqUB6xd4J9K6s9PnabI7+Wj53W0bDYHpPkgdQsTWPtY7n2T9ea46BFKU
         GZoDaflyhboBTsNBFSHauAJ8iTI+CufsjYhw1Wc428qgxSSEJMIK2wIMMTnP1NkgwzmZ
         2OsC0vegvkbDgXwKlh5Ppgad490C0C3f+35cKGzUKcjus7/tF805KCNI//HzHISOQvmm
         8FRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxTUpWcu6kQntv5PqeccBJDYQ6P3BskokjlWa/5hTRyFogYCA3IbZ3bKg6BFqJePuP/eQbKLO8THw5PM524SnDX7qH8hBRuONwp/lhPvVrEAsCpV0ERa01qUbWgdFAxiqE8VVdvVqX5nRF1Q0rx77gnPHCeaA5mBpSju9ZL6M0LhNdynyrtmk5fs97lIPeClTXLevlK79DoYcxGXKYqxl0DihCCl76
X-Gm-Message-State: AOJu0Ywh88SFl1DYrBitTNNOFTq2BqY5SkOB4QaeaD75grIbRmeHgmpC
	1wqx3WYwmYs8LyqX571ldVBywJ/mBfhbvHqQAS/FP31Ow2iUCotElWPU0xiXkNhytLu8ObCGND+
	t0jip4eSGWLhXntTR/idMQqRyimM=
X-Google-Smtp-Source: AGHT+IG5fDGf/TAqQ0kpTEdw/kScuUczMNpki2X5hxJit0YT/ur8m+U9uqlfn9bZ4pkB0lQXyGnXXQHvY2aCED5WQAs=
X-Received: by 2002:a05:6122:2210:b0:4f5:197a:d679 with SMTP id
 71dfb90a1353d-4f8a0d8e6e3mr2656574e0c.1.1722591133416; Fri, 02 Aug 2024
 02:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240724182119.652080-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXkPwfVT-iJp70pEi5ubpc5YBKt=a2C5NmL_tjbocXKRQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXkPwfVT-iJp70pEi5ubpc5YBKt=a2C5NmL_tjbocXKRQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 Aug 2024 10:30:05 +0100
Message-ID: <CA+V-a8ttfEHwXqUU2OqxhjJ3E2jt+xCBrbziHtOUs1g74tandA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
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

On Fri, Aug 2, 2024 at 10:11=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jul 24, 2024 at 8:22=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> > of the R-Car Gen3, but it has some differences:
> > - HS400 is not supported.
> > - It has additional SD_STATUS register to control voltage,
> >   power enable and reset.
> > - It supports fixed address mode.
> >
> > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g05=
7'
> > compatible string is added.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5
> > - Dropped regulator node.
>
> Thanks for your patch, which is now commit 32842af74abc8ff9
> ("dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support") in
> mmc/next.
>
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -18,6 +18,7 @@ properties:
> >            - renesas,sdhi-r7s9210 # SH-Mobile AG5
> >            - renesas,sdhi-r8a73a4 # R-Mobile APE6
> >            - renesas,sdhi-r8a7740 # R-Mobile A1
> > +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
> >            - renesas,sdhi-sh73a0  # R-Mobile APE6
> >        - items:
> >            - enum:
> > @@ -66,6 +67,7 @@ properties:
> >                - renesas,sdhi-r9a07g054 # RZ/V2L
> >                - renesas,sdhi-r9a08g045 # RZ/G3S
> >                - renesas,sdhi-r9a09g011 # RZ/V2M
> > +              - renesas,sdhi-r9a09g057 # RZ/V2H(P)
>
> This looks wrong to me.
> Did you want to add it to the clocks constraint, like the third hunk
> in v4[1], and was it mangled in a rebase?
>
Oouch, yes you are correct, this had to go in the clock constraint.

Cheers,
Prabhakar

