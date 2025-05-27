Return-Path: <linux-renesas-soc+bounces-17567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A904AC5CBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 00:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C95BC7A53F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 22:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42884215F48;
	Tue, 27 May 2025 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM20J+T/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B72144D2;
	Tue, 27 May 2025 22:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748383338; cv=none; b=ZnyONmPjk0vJAsNARHZlVuwGcvAyWVEHNHH9uSd8cuhcaidvJ8s+f8T6aZTFp9iKWtQDPz7dgisCWrsZ5xuFnvMGlWAIcycQYRuMu8LPFLGpkpKvoykMXUb7mkQrYbUtprYF+5gfPTVJLXIfKLvHGHXvRglzMC1+9xLYon+B+KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748383338; c=relaxed/simple;
	bh=ug75B5/nEVNJLBeNACxh9fxs20rN0S2FsbQ2QOmoeBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tflhr9boTaFkPqLiFjid6vRGU9Mc8zEFL2fkxblYKfVwsyRMVkwvqKgXiKw6p7dED3++RrrFtzOaFGBj6Ku1hGNlL74gMsJqWBkS6v1clGrPqFn8ttV8G2QsE61DREOShiEWiUKBEpDFIeAjLACKo8BF06pCC0rVT6KmgHIZHQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM20J+T/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4c9024117so236573f8f.0;
        Tue, 27 May 2025 15:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748383334; x=1748988134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45g7cTsi43/UtEC2z2Icfcjh5OvH49gjNKxt8eXISRs=;
        b=EM20J+T/cRC56lzVO1HXrbICY8OJTQCZPWLM1Ljp0a75NI5Kubr7zATKeC8PMy2faN
         kmUu26xgVSSl7TLwhT5uqTOTq/A098+F/R8lk1gH10NZyxpcT19Ax1doBWNuoQL/5Oxd
         4r7/dT07EQqR6JWNRlT7FUZRiC0rnWULOSplPMBy05NsF6XLFSY/aPP1fGG6pBPn/xCo
         MsgcoNdlmp7yMu2Zqe3WjAHKAEq1S6qzquMSjTdaYMh41TfZATA/LDJnk/3iZJegrAdn
         oMT1Qt54qTxvd2yG7I8XAK/qRIuUPmwcaueIQkqniW+9RJp+cUmxV4DwAgz/qvp393X8
         t65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748383334; x=1748988134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45g7cTsi43/UtEC2z2Icfcjh5OvH49gjNKxt8eXISRs=;
        b=QtBNKlDH1MhL0AMz43/13hWLo6xFztC/wsJJGkWHOuh6y8iMWNelTeTLqp6aCycnyK
         PtS1dWaMiCFLHbaRQJ0ZfXXHdOHcc/riGLhE19xVu7FxyMJmpvQMy7HJ2uK9grzdwDgx
         246ikgSwFHXN4s+9QvZm/FaMtdjJrt9Vy5SNR9yqTgW4wucC3fJZr9dorvmUdV2OgvNv
         LDlpYx+hdt87aGEg/Q+nW1z+0DZ72afREmVOsAY9sjrD7VpZzJWy3Ejj3lA5F/3WoWPo
         FLJPPfrgKXLSqmHVigGR9WsrgdBqruMNNRAQrJFobcMMMF1Zy5yQld7U3p1vk4HO1FV0
         7yUg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4qL74VNpUVmpvXdzfPjkR5g2xsV1xvmyqGPiyLctNMBLV7yVgDh6+AfZXM45O5vMTG2KLndmkqSG@vger.kernel.org, AJvYcCUkgrCh22QX0dVfSmVOE+8zBx/Mn0HB+lxnK6abbyEWjdAPT1ccxXK0URBak59iqDTh8yIW2MoIGwO2VTzv@vger.kernel.org, AJvYcCVtaA83He2qptbBqmxl4kqMEbPgKrU98dW3mpgGMssAxHmyq/1Z3gh7/bRcDTGiqNB2yZ4DcpMbZ3K9fgSdU358Vqo=@vger.kernel.org, AJvYcCW0H8l/9jwXdp0atlfxHPPX4C+zZknqRw6aBOseZywdbOkycwNeKb/21PrDJvU3DJ47ahUqZK22jSoG@vger.kernel.org
X-Gm-Message-State: AOJu0YyGzXWQ2q6+JHtv7smJ2ZNDwAxcoDIi7MknQsyRlrNuHbYUeIm8
	9UCnWAQ/0Y+B2ifjF2UToW495gdOC9aB2hHAQ1lUThc6eHS2gjMkMwCgmEmJd294L0RqcbpN7Ml
	5fCT/D3avMFHXoyiRXoVsdc2e3Ue7kPM=
X-Gm-Gg: ASbGnctSoC0UuT2lMh0rveg6R4Ak0iuEPQTV1t1GrO9yb4gBUJ/uuS74/+sAPiSuw0p
	m7ixnMCc1qRm5uhDW9D5+5xePc1HyC3Ma6l8CV9HVWyLITVeBWfLAOc9b1kx0po+DC7RSKk79HY
	Tsj2uSWnGmK3hCodwP4wha/Wxxw7j1HiJG7I2CZ5Q0dd2OeQhdhmYL+TCfjjZ8q46WZg==
X-Google-Smtp-Source: AGHT+IFV2BFPgujhQs4DdxUDNb0iFOQ+SgBxmAaYbPCrwwOVCCCvsVFgokrJDqO5z7MDKzRcAoB+dMACMrcQtNTeHsY=
X-Received: by 2002:a05:6000:2087:b0:3a3:70ab:b274 with SMTP id
 ffacd0b85a97d-3a4e5e5e733mr1937547f8f.12.1748383334572; Tue, 27 May 2025
 15:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV9NM3SPeZAxDnh=ez0uBvt9077_64oJe9A727p1r9QOg@mail.gmail.com>
In-Reply-To: <CAMuHMdV9NM3SPeZAxDnh=ez0uBvt9077_64oJe9A727p1r9QOg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 May 2025 23:01:48 +0100
X-Gm-Features: AX0GCFv-92KbzruYA4EmbsOqV1BnynHkN1flWzPNsQopGLMTzP2wm88SqFOuVcU
Message-ID: <CA+V-a8svK52e-o=EYR=+NH4BZU42A8ytwdVkmG9JB+3Gfvuoaw@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, May 23, 2025 at 3:46=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for the DSI and LCDC peripherals.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -58,6 +60,9 @@ enum clk_ids {
> >         CLK_SMUX2_GBE0_RXCLK,
> >         CLK_SMUX2_GBE1_TXCLK,
> >         CLK_SMUX2_GBE1_RXCLK,
> > +       CLK_DIV_PLLETH_LPCLK,
>
> CLK_CDIV4_PLLETH_LPCLK?
>
Agreed, I'll rename it as above.

> > +       CLK_CSDIV_PLLETH_LPCLK,
>
> CLK_PLLETH_LPCLK_GEAR?
>
Agreed, I'll rename it as above.

> > +       CLK_PLLDSI_SDIV2,
>
> CLK_PLLDSI_GEAR?
>
Agreed, I'll rename it as above.

> >         CLK_PLLGPU_GEAR,
> >
> >         /* Module Clocks */
>
> > @@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_cl=
ks[] __initconst =3D {
> >         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCT=
L3, smux2_gbe0_rxclk),
> >         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCT=
L0, smux2_gbe1_txclk),
> >         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCT=
L1, smux2_gbe1_rxclk),
> > +       DEF_FIXED(".cdiv4_plleth_lpclk", CLK_DIV_PLLETH_LPCLK, CLK_PLLE=
TH, 1, 4),
> > +       DEF_CSDIV(".plleth_lpclk_gear", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV=
_PLLETH_LPCLK,
> > +                 CSDIV0_DIVCTL2, dtable_16_128),
> > +
> > +       DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
>
> ".plldsi_gear", CLK_PLLDSI_GEAR ...
>
Agreed, I'll rename it as above.

Cheers,
Prabhakar

>
> > +                      CSDIV1_DIVCTL2, dtable_2_32),
> >
> >         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DI=
VCTL1, dtable_2_64),
> >
>
> The rest LGTM.
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

