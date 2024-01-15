Return-Path: <linux-renesas-soc+bounces-1587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1F282DDE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 17:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F146B20B88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 16:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DB817BCF;
	Mon, 15 Jan 2024 16:48:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B05C17BBB;
	Mon, 15 Jan 2024 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5e778e484dbso79355617b3.0;
        Mon, 15 Jan 2024 08:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337311; x=1705942111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Xom6xncqDax048LAWipCjONrGVwUc7wt4+JM1uzSZY=;
        b=LEPnoPuxuer9/ZiDq7iJe/f/qr99jDh0kOBblKLqTzFQBGPNlJe7zoY6Q6HbdHlSq0
         w+XqVnLTRzjT4esFBesrfYOzDnRETPo2U0vvCrHTPjnLTE4h0KgJqO00+mO2zYlNTReH
         78mhwEZrvCR/31LFqIjeY8FULcV/vLcd/9OrlQWZFvdDVEtA0Etg7cZUb21G+PnKNJKF
         fcFZs4es0Cu+uY/UyOZh1jL+ePX6pN3FRX3jcmaf5wCD4gIkcQjU8SKj5QhONcIhvm+f
         1V/N3thToMo53XXh4W4mvfV+nRcIn6LrO33WvxO2HZBHXAf40puvW1DIxO9vbN3bPwUi
         yLGQ==
X-Gm-Message-State: AOJu0YwbEyw7PeJztTrTvFtHDj3jw8Hr41A21AuPGcgtpiZWL1yA+b69
	QpdtSCGfeUqA92fB7+Dp7LJootIbyAIfdw==
X-Google-Smtp-Source: AGHT+IGPc2kGPa+rPHUjg3iCnVulW/PAu7ISq1WSFpkeugYPVjR21uP5oCa4oMaYP/IDjafAuXlNAA==
X-Received: by 2002:a81:ad1c:0:b0:5ff:3ee4:956c with SMTP id l28-20020a81ad1c000000b005ff3ee4956cmr534904ywh.23.1705337310737;
        Mon, 15 Jan 2024 08:48:30 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id d70-20020a814f49000000b005fdc47c460dsm285001ywb.23.2024.01.15.08.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 08:48:30 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5f0c0ca5ef1so87109787b3.2;
        Mon, 15 Jan 2024 08:48:30 -0800 (PST)
X-Received: by 2002:a05:690c:a98:b0:5e9:f386:dd63 with SMTP id
 ci24-20020a05690c0a9800b005e9f386dd63mr4282644ywb.39.1705337310443; Mon, 15
 Jan 2024 08:48:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fb1e38c93e62221f94304edd980a2fb79c1f2995.1705325608.git.geert+renesas@glider.be>
 <20240115-wages-secluded-b44f4eb13323@spud>
In-Reply-To: <20240115-wages-secluded-b44f4eb13323@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 17:48:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWY3D45NGHvGXSZRLZz4TyCRgRCQLZV6CzYs=mSFcherw@mail.gmail.com>
Message-ID: <CAMuHMdWY3D45NGHvGXSZRLZz4TyCRgRCQLZV6CzYs=mSFcherw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document input capture interrupt
To: Conor Dooley <conor@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Mon, Jan 15, 2024 at 5:13=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Mon, Jan 15, 2024 at 02:45:39PM +0100, Geert Uytterhoeven wrote:
> > Some Timer Unit (TMU) instances with 3 channels support a fourth
> > interrupt: an input capture interrupt for the third channel.
> >
> > While at it, document the meaning of the four interrupts, and add
> > "interrupt-names" for clarity.
> >
> > Update the example to match reality.
> >
> > Inspired by a patch by Yoshinori Sato for SH.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> > @@ -46,7 +46,19 @@ properties:
> >
> >    interrupts:
> >      minItems: 2
> > -    maxItems: 3
> > +    items:
> > +      - description: Underflow interrupt 0
> > +      - description: Underflow interrupt 1
> > +      - description: Underflow interrupt 2
> > +      - description: Input capture interrupt 2
>
> Seeing "input capture interrupt 2" makes me wonder, are there two (or
> more!) other input capture interrupts that are still out there,
> undocumented, and looking for a home?

SoCs can have multiple TMU instances.
Each TMU instance has 2 or 3 timer channels.
Each timer channel has an underflow interrupt.
Only the third channel may have an optional input capture interrupt
(which is not supported yet by the Linux driver).
Hence each instance can have 2, 3, or 4 interrupts.

See "RZ/G Series, 2nd Generation User's Manual: Hardware"[1],
Section 69 ("Timer Unit (TMU)":
  - Figure 69.2: Block Diagram of TMU,
  - Section 69: Interrupt

Note that the documentation uses a monotonic increasing numbering
of the channels, across all instances.

[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors=
/rz-mpus/rzg2h-ultra-high-performance-microprocessors-quad-core-arm-cortex-=
a57-and-quad-core-arm-cortex-a53-cpus-3d

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

