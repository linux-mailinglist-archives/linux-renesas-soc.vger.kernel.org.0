Return-Path: <linux-renesas-soc+bounces-6712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C9915556
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 19:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E1A71F2333C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 17:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3C919D8A9;
	Mon, 24 Jun 2024 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmdgNRmQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2733D7604D;
	Mon, 24 Jun 2024 17:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719250047; cv=none; b=scue1CFX49MHeaZQvWeGthUA+YVlgeHXdXvfaHO5Qf9lR6K3UZR9rDS3oNMTLqn/TQRJlP1rBif/FkaOnYe6i7WwP0sQEru+Wz1Ldo6c24AMy8T5euslh2jLUrTYqRx8sN9bgPqk0ObTwwpIXiRs1nqzcAtvjRPvT8rFm1QSJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719250047; c=relaxed/simple;
	bh=2rcPwoShgJdmSyVCPpy8glYPvtkJajNKVhG219tP3jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFNq5dDKF4vad9TdGrz5YShCMFLAtSLpWxTtBQYXn9L3lZtwd6pi2u2b0zm+fD/ezQ6nKzeaDS9VHoxxQ7QDAw/oWzifZqgkpZuhfhCnXBEhDuVzES5NC7PyQqbhIOZ40a1iGZmRnlW7RumBwlZgc5Mu55+CSJqeY9xoxxvWUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmdgNRmQ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b505f11973so39857516d6.1;
        Mon, 24 Jun 2024 10:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719250045; x=1719854845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMdi8tUy/m0VYQvA5cPdOSnqaZAhOWgJFYMqqkliSqU=;
        b=nmdgNRmQ1JqXak2MKBZ+AfxYsB45Dep6mS50eGSU8DQJJSXLBjUtNE2hEKXE0F0m3y
         K+Ru9t2mWTO+rw0LoPItRbYtINNYMrp57nLSL7+9iR7ZIZ2U1mcfPEEsk1O+aiznawCV
         SOKQi/a9DY3PbHAd1olph0dDReQazL0vVrg7dhSVDS2A+WQlfDQyB4nULrJIKreb0QEI
         HX7xy6Ye2WgnPE7TgJL1URjDk+E4GUwur3qU/wiAKTD9lxUQX0GyP34FpDaq7QQwX3Lf
         y+eFFSRcPfhDaxg08ky0EhT7vJrxUpl+YYMqxNLqRlH+WmD2B6WAJAUIyMQSYPNgXCBr
         6/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719250045; x=1719854845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMdi8tUy/m0VYQvA5cPdOSnqaZAhOWgJFYMqqkliSqU=;
        b=c6Y1VqUxSp1Y7A/KIquSm0nhJNpXi4gIquLx1yHn12tgn2hl3Rrc2i3l6sfEuNFWA1
         JmTEyhCkAbFDaTfBW4D1nGBxu1w4kQKXN3nbU5OnLg+bNOGDoUdIV7qEGF5Rb+Xm2C6d
         1DQfuXXE7Kx8N6e7uSMHjLVuqFnG7pnERJhbSkrtMuWagl6Q882PhatiCCOCOJx+NPXX
         asvUSNfbQEXGEw/kQ9/Q2xpoavk3f6l1cSsGOtROHM9gDamVfc0JlmRuejDxW9d/kP3q
         6+tr6bqjEYOLQuJ8XlhAIhYDLDt9v7LpMBbkWyafHdrRmpq5zg1BF3oZUrt+114lYixN
         R/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5GJuf+x0dP1+mXnfnuC3gELndsaAH/iXxgYeEm7iCv1fSwRKtzaSkIt6rqPiM/nZL+HhZDTucx6HXMqkfkMv6cN9BGIRydDFmW+8gfXZCm4lMmguzLINlzASzyYcLVyLbl99sBx/hUmFoCz8jTPM1tj/I/JkPEsJSeoPd/m+ZZ0xUivsOLcIlSGr91Op7cFrvqy1aaRtPSnxmX+reXxkG3z1PW9yS
X-Gm-Message-State: AOJu0YyLnactMfVYM9A7vBPb3uNLhbU0fsKAGRZdVSHiEJm1m7Nh/N3A
	hM11lMdyc+6CxdnCwJDpbLVgPemP+AJV8Cr37gmNHQpD8VjT+t2igcf1HQQ7ACzJDzqiJUK1y0K
	8GIV44tcYpICG7l85I+s00XFEEjc=
X-Google-Smtp-Source: AGHT+IFGHDsqhHq9XnFXeklHI5Ipm8OA/hVOwcHjiGnUcm/aw67ox19AqnUEdu/1vVvOeF0GAqvmx5+ew7vXn6HzvNQ=
X-Received: by 2002:ad4:4ee7:0:b0:6b5:2aa3:3a7f with SMTP id
 6a1803df08f44-6b53223157dmr97187856d6.20.1719250045001; Mon, 24 Jun 2024
 10:27:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240624-request-demeanor-d66965d27935@spud>
In-Reply-To: <20240624-request-demeanor-d66965d27935@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 24 Jun 2024 18:26:58 +0100
Message-ID: <CA+V-a8vJ_fCONw1wpsGB1qqd-FReqhLR1JhLgM4RneeC5=eShQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Conor Dooley <conor@kernel.org>
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

Hi Conor,

Thank you for the review.

On Mon, Jun 24, 2024 at 5:39=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Jun 24, 2024 at 04:32:27PM +0100, Prabhakar wrote:
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
> >
> > v1->v2
> > - Moved vqmmc object in the if block
> > - Updated commit message
> > ---
> >  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 30 ++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/=
Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > index 3d0e61e59856..20769434a422 100644
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
> > @@ -118,7 +119,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: renesas,rzg2l-sdhi
> > +            enum:
> > +              - renesas,sdhi-r9a09g057
> > +              - renesas,rzg2l-sdhi
> >      then:
> >        properties:
> >          clocks:
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
>
> Please define properties at the top level and constrain then per
> compatible.
>
Ok, I'll move them to the top level.

Cheers,
Prabhakar

