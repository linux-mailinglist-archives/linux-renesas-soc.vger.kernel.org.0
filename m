Return-Path: <linux-renesas-soc+bounces-44-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F77F3357
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 17:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D65991C21C8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 16:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FF75A0E6;
	Tue, 21 Nov 2023 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8337D4C;
	Tue, 21 Nov 2023 08:12:06 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5cbcfdeaff3so6117977b3.0;
        Tue, 21 Nov 2023 08:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700583126; x=1701187926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKEP24gj4FWmAlyC3jxzEUqpjPNrhkMCvodVxEHrSFM=;
        b=TBf4Fym7lIGPZ2XSqOD1YywYXTNGh+IYKa/59du8WHw5LRhqHV45vQ1jaTti1i57r/
         PYYjBF2u1JlEIERWJy1Asya2mQZN2qzs3AFdKWgb5DCooAAV92rGBk2wTAvgy6JW5pyU
         919lIsAlhecAPnJjPHFoDCPXmLBhwX/tvPC+MYG467qhzMIKNA3+8vMB7i6IH8BCyMJI
         obnWQIzDZO8cULNfFUTsIcFLhnrQZQ/bx8+T7Np3/ohIAlBjk6JSKDCvEoLLJkFZkxXb
         /RVvm2o/mGG2Zg70z/RHva8DaoAskdk4moEvhfmDuA8cZsUiS+zjh2UBCaVcFInIiAtJ
         qXHA==
X-Gm-Message-State: AOJu0YxWPQ0p9Gj9qXxvDdMMWOdhNHewH0Gn7oK3zSATJNDBWHHc5LgY
	6KOLPfpxe4baDWxyotfneAMbPAwueAZDUPa0
X-Google-Smtp-Source: AGHT+IE4hXPH4Di1AUcpPOSbHnKn5Je7XKCJk2uRlA2Sp2O4isPAJ1eI1hSDaGQVjv2welMSPUuJrg==
X-Received: by 2002:a0d:e004:0:b0:5a8:207b:48d with SMTP id j4-20020a0de004000000b005a8207b048dmr10838223ywe.11.1700583125712;
        Tue, 21 Nov 2023 08:12:05 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id g4-20020a81d444000000b005cb0d7c2e46sm909315ywl.19.2023.11.21.08.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 08:12:05 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dafe04717baso5270976276.1;
        Tue, 21 Nov 2023 08:12:04 -0800 (PST)
X-Received: by 2002:a5b:949:0:b0:d9b:3ed:41a5 with SMTP id x9-20020a5b0949000000b00d9b03ed41a5mr10258239ybq.21.1700583124594;
 Tue, 21 Nov 2023 08:12:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org> <ZVyeMKjVhjW2F2e0@oden.dyn.berto.se>
 <2ffb39c3-7939-46f2-8ca9-2b2cb44caaff@linaro.org> <ZVymJF2dd7XssGaQ@oden.dyn.berto.se>
In-Reply-To: <ZVymJF2dd7XssGaQ@oden.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 17:11:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3+YWuBefga9fXWxp6=yXoUPO9EK0nwEzHcbvsevx5Pg@mail.gmail.com>
Message-ID: <CAMuHMdW3+YWuBefga9fXWxp6=yXoUPO9EK0nwEzHcbvsevx5Pg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Nov 21, 2023 at 1:44=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2023-11-21 13:20:54 +0100, Krzysztof Kozlowski wrote:
> > On 21/11/2023 13:10, Niklas S=C3=B6derlund wrote:
> > >>> +
> > >>> +  renesas,rx-internal-delay:
> > >>> +    type: boolean
> > >>> +    description:
> > >>> +      Enable internal Rx clock delay, typically 1.8ns.
> > >>
> > >> Why this is bool, not delay in ns?
> > >
> > > The TSN is only capable of enabling or disable internal delays, not s=
et
> > > how long the delay is. The documentation states that the delay depend=
s
> > > on the electronic characteristics of the particular board, but states
> > > that they typically are 1.8ns for Rx and 2.0ns for Tx.
> >
> > I don't understand that part. If you cannot configure the internal
> > delay, how could it depend on the board characteristics?
>
> Each of these two properties reflect a single bit in the device
> configuration space. If the bit is set the {Rx,Tx} delay mode is active
> or disabled. The documentation for the bit simply states,
>
>     Tx clock internal Delay Mode
>
>     This bit can add internal Tx clock delay typ 2.0ns*.
>
>     *Refer to Electrical Characteristics for details.
>
> Same paragraph for Rx but a typical 1.8ns delay.
>
> > > I looked at the generic properties {rx,tx}-internal-delay-ps but they
> > > are of int type. So I opted for a vendor specific bool property. Do y=
ou
> > > think a better route is to use the generic property and force the val=
ue
> > > to be either 0 or the typical delay?

This is not dissimilar from EtherAVB, where the hardware also supports
only a single bit, and whose DT bindings have:

  rx-internal-delay-ps:
    enum: [0, 1800]

  tx-internal-delay-ps:
    enum: [0, 2000]

(with additional restrictions depending on the SoC, as on some SoCs
 the bits cannot be changed).

> > >> Why this is property of a board (not SoC)?
> > >
> > > I'm sorry I don't understand this question.
> >
> > Why setting internal delay is specific to a board, not to a SoC? Why
> > each board would need to configure it? On which parts of hardware on th=
e
> > board does this depend?
>
> Ahh, I think I understand. It is per board as I understand the
> documentation. It depends on the electrical characteristics of the
> board.

Exactly. These bits (and also similar bits in the PHY) are used to
adapt signaling to the board trace lengths between MAC (on-SoC) and PHY.

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

