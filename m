Return-Path: <linux-renesas-soc+bounces-17568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197CFAC5CC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 00:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E91B47A94F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 22:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5832221770C;
	Tue, 27 May 2025 22:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4sQ7EdI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB2216E24;
	Tue, 27 May 2025 22:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748383510; cv=none; b=fBZupTP/Vvn2mbYTYFOZplQ3uAVV2dZY2E0Q1Jw6m5RNRB/b7+jzflxfjp1axGU1FDzUQlkka7GhRrfGMIwzm2FbnqkMfBrKOse/VCgdh4R604U+CKu8/e1GPtrl8f0FRwFzQxKc9RdOcLdTo45bmeiX2AhBJvRuuZm+cI0cApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748383510; c=relaxed/simple;
	bh=4NFsYd9R6QzobE2c85fQqC28+pYgiuIn/VbNigatOtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNCqAC3tvemmc2sczjiMnLPk0qgE1gowA+yVoYqzFdUYCQU5oPPcKRT8lLG5hbF9ti0MaCq6/M0rx5cv8Sqpp0GRNwj1Oo+NsyNMkjJIlda9pmXJqpQZSKrIYLolXkiA8Ch7mwb37xw3dbaH/nBGhAMMdW1xGFZvzQ7OgzMF/c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4sQ7EdI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36e0d22c1so2586378f8f.2;
        Tue, 27 May 2025 15:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748383507; x=1748988307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KG8BjnFz725w+RJTFOBJ8/xx3WkWJOjksuYHfHNSoPA=;
        b=N4sQ7EdItuUv8QOTUJ0HwbHaPUnEdX6CmHXUA/Yf0e8lvrYSkCd3E0kIIr+bhQWk5/
         Jp2RKHSDEELBUVXxXlVILRki5DNk2DA3RdqaF+IMer5Rt/46+ecNTuGZzSSQ3Kjq9kFV
         cYtoO8JPI5c8lmN2DuImz2Sy8S9JZOCBgdAFUpzXh86U76cre3dIppO94JS9yRy6TD2C
         tbtH1FfpN7/lEbIFIzk4YGANf/WGuz/QoYgj7BH3tys2mbobIysZqZSa5iEabqh60o0z
         ovrhiuAl46Wt0S0uyyDEQ/YkjwnhkgLU+yeN/gU8m+7a/8BlDoFyqBzeXMhqdpoVn9dj
         vtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748383507; x=1748988307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KG8BjnFz725w+RJTFOBJ8/xx3WkWJOjksuYHfHNSoPA=;
        b=cxRxV0MQ5tvX87MbACBpT8Bg6GXGEOfzhRQ6ZA7xyCX2vuzJoXAcR3ZmmUpqwJnWGY
         Bi409YOiO/VMb0NDm+Q+QwFeRdkxzV3P7gC2NoHmtzbXhB928y1N2EKqgUQH9qBChxbF
         Ahhd6kHfEJtW9Fw8iz3kK3rvNYOnHqb+/kvwlcYSB8vqspC/5hquoj3Uko+ZzTf18tzh
         +zImJTjk/1efAyLexOyK6ib6iqOZZ//sBIIdXniNdK2Jn8w57RQu4hGFPaK+WSey4QCp
         9CWnYO2ZtDm2Bvhg1EQ0BbpYR8RF2BLl96ahWicUNAkT1mu3fXK2lj/HOXxdhfB6O1Et
         Xvcg==
X-Forwarded-Encrypted: i=1; AJvYcCV3MLq/0ulv2kOagOQ/p6y3aKP8ZGC2w0fYF+mgoD4YZcMQEdajzM1OXXPsLjaWHtmlsf4QQnEB3dqO@vger.kernel.org, AJvYcCVHB6zTgjS8egX1z1HW1VmvoWltQF+LR+Ily6/iqiV7TNJ63fIPbOi2Jag8enC+H1qyys5si2HtZI6kmtgT@vger.kernel.org, AJvYcCWkipnIGMIQy6R6tFFiPwpu5pReZLFwzpdQjTHtfsVPCLHwb4KxOkuNnw0oWfyFEBPhM9faYby8+3Mw@vger.kernel.org, AJvYcCXnS6K2iNm4mKfY6bzlZZKVD0pRm5+T6yTml1Tc7Kp12zHqcaiOGcyd8BBCuPYg6Kk6argIM3ua8CmnBNY2dbc0ghk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwofMcihn6jgtQQfmWPimwVWT6ProGLRrfpOsc2XiDm+w3iNIad
	2RNleuPJ7v8haV6TPP0rBoRKSz+OTlWI2Jvp08nStHR7weKrFxB1mBaByMCF5FqLqPmUdwYlAfo
	1AIO6Q1Op/AdmoPs4YFU21D2d/fl6J/I=
X-Gm-Gg: ASbGnctniQylcahRPE805U4N+aLWDVQZ5n4kMrM0jEjrpuqURbnqbChvIzaQ8fjSC7A
	rZoED4IYcL3biPNrT8CYqqS8iFjjBDp+qxE/AHhH3PDlXMOzcUc4ZA/mpsAiNGW+TO4e7LyFl7s
	0/DwS5bBFM3quYT0rFtC8XL5HHq2Sb0ZGAqBDixhNfX92emVNxjZPkAc+UrwlaKbcH4g==
X-Google-Smtp-Source: AGHT+IGWzHwVyMPWLupHxdlIZ7x8pSXYNOI5yOCN63qH5VjrNlj/jeGAmW+KftK3jzltxm09oZuPLSrF0CmPFP7qfnA=
X-Received: by 2002:a05:6000:430b:b0:3a4:d13b:4aaa with SMTP id
 ffacd0b85a97d-3a4d13b4c6emr10639950f8f.5.1748383506671; Tue, 27 May 2025
 15:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU__dxi4wvS3ikBQefM7uwWWK0bCcHv=TL-Td678pEi9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdU__dxi4wvS3ikBQefM7uwWWK0bCcHv=TL-Td678pEi9Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 May 2025 23:04:40 +0100
X-Gm-Features: AX0GCFvzEXrNrs8pB60A-DbmcANSH2AumZoYJ7_LJzs0X887u5z28IVnMfYtap8
Message-ID: <CA+V-a8u7PBz31L+b=x8+B_yXCRzOC351PArw02rx+yYNidT2OQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, May 23, 2025 at 3:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that=
 of
> > the RZ/G2L SoC. While the LINK registers are the same for both SoCs, th=
e
> > D-PHY registers differ. Additionally, the number of resets for DSI on
> > RZ/V2H(P) is two compared to three on the RZ/G2L.
> >
> > To accommodate these differences, a SoC-specific
> > `renesas,r9a09g057-mipi-dsi` compatible string has been added for the
> > RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > @@ -14,16 +14,17 @@ description: |
> >    RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, w=
ith
> >    up to four data lanes.
> >
> > -allOf:
> > -  - $ref: /schemas/display/dsi-controller.yaml#
> > -
> >  properties:
> >    compatible:
> > -    items:
> > +    oneOf:
> >        - enum:
> > -          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> > -          - renesas,r9a07g054-mipi-dsi # RZ/V2L
> > -      - const: renesas,rzg2l-mipi-dsi
> > +          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
>
> Nit: I would add the new entry after all the old entries, to preserve
> sort order (by part number).
>
I'll move that later to preserve the sort order in the next version.

Cheers,
Prabhakar

> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> > +              - renesas,r9a07g054-mipi-dsi # RZ/V2L
> > +          - const: renesas,rzg2l-mipi-dsi
> >
> >    reg:
> >      maxItems: 1
>
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

