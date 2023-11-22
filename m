Return-Path: <linux-renesas-soc+bounces-92-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F837F3F0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 08:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14C6A281BCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 07:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC06208C8;
	Wed, 22 Nov 2023 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03498110;
	Tue, 21 Nov 2023 23:41:09 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5cc69df1b9aso3402117b3.3;
        Tue, 21 Nov 2023 23:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700638868; x=1701243668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piATMgfmDLCre75nyUf/C7Ei+/it7nudpeRu37ZJQxg=;
        b=w1du0yA7mmCAJtHk3bYHIGZvdfT/Cv/BeHwFwh9K0och5aRmS06zo35do1ztK8Z+18
         V0jVfo89CC3oPqr1NcIDzRlwpNwJrbZlm38LEpVCHn+FGETPQ8FjAe3Dj9G6wABvgs/7
         GSZlUZZ1sg/UgumZiG9G+SktcGFwYacsprWO/5Tn38calCZXr9EA+wVA8gDvYzBP2+fJ
         drw1NMHwizfHS63uCO56exsss4Y/O7I5s0FQEj5f2siMzFNBnaJPcGU07WccI7MsclVn
         CX576i9HVGm5+2IvG1Wfr9siVLC04X5lRB+aCsQclHdnQsJdPQaVVKUvJdNpDgzecGtV
         JpWg==
X-Gm-Message-State: AOJu0Yx1AgH7ow0UsT+jrmDo8G/leo0u+TBVSUBPMJ7g2OAGJSsP2PkJ
	1l0upG5lJC35Qq/eDNNKOsj5SsCbYiPdvfyz
X-Google-Smtp-Source: AGHT+IFi7xwOk2HVqgmSbY4V8SWzU60K/6WKl/NJCpc8yhrAlpfzE/cl7iTt8zhWGWqzQcFAL8J9Kg==
X-Received: by 2002:a0d:d982:0:b0:5cb:532e:1b45 with SMTP id b124-20020a0dd982000000b005cb532e1b45mr1430062ywe.33.1700638867942;
        Tue, 21 Nov 2023 23:41:07 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id u192-20020a0debc9000000b005ca5e2eff7asm109534ywe.79.2023.11.21.23.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 23:41:07 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5cc69df1b9aso3401947b3.3;
        Tue, 21 Nov 2023 23:41:07 -0800 (PST)
X-Received: by 2002:a0d:eb07:0:b0:5ca:151:1cf5 with SMTP id
 u7-20020a0deb07000000b005ca01511cf5mr1465783ywe.15.1700638867377; Tue, 21 Nov
 2023 23:41:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org> <ZVyeMKjVhjW2F2e0@oden.dyn.berto.se>
 <badce6b1-c614-4fc2-b3a2-5b1b5c011a80@lunn.ch>
In-Reply-To: <badce6b1-c614-4fc2-b3a2-5b1b5c011a80@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 08:40:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYFrx-CUapCQPX=hJtZBHycRTyN-dq8fXSXZwOiPJDMw@mail.gmail.com>
Message-ID: <CAMuHMdWYFrx-CUapCQPX=hJtZBHycRTyN-dq8fXSXZwOiPJDMw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Nov 21, 2023 at 8:54=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> > > > +  renesas,rx-internal-delay:
> > > > +    type: boolean
> > > > +    description:
> > > > +      Enable internal Rx clock delay, typically 1.8ns.
> > >
> > > Why this is bool, not delay in ns?
> >
> > The TSN is only capable of enabling or disable internal delays, not set
> > how long the delay is. The documentation states that the delay depends
> > on the electronic characteristics of the particular board, but states
> > that they typically are 1.8ns for Rx and 2.0ns for Tx.
>
> Do you have a board that actually requires this?

We have several users of the corresponding properties for EtherAVB:

$ git grep -W "&.*avb" -- "*renesas*dts*" | grep internal-delay-ps
arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi-
rx-internal-delay-ps =3D <1800>;
arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi-
tx-internal-delay-ps =3D <2000>;
arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi- tx-internal-delay-ps =3D <=
2000>;
arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi- rx-internal-delay-ps =3D <=
1800>;
arch/arm64/boot/dts/renesas/r8a77970-eagle.dts- rx-internal-delay-ps =3D <1=
800>;
arch/arm64/boot/dts/renesas/r8a77970-eagle.dts- tx-internal-delay-ps =3D <2=
000>;
arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts- rx-internal-delay-ps =3D <1=
800>;
arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts- tx-internal-delay-ps =3D <2=
000>;
arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts- tx-internal-delay-ps =3D <=
2000>;
arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi-
tx-internal-delay-ps =3D <2000>;
arch/arm64/boot/dts/renesas/salvator-common.dtsi- tx-internal-delay-ps =3D =
<2000>;
arch/arm64/boot/dts/renesas/ulcb.dtsi- tx-internal-delay-ps =3D <2000>;

> In general, we try to have the PHY add the delay, not the MAC. So i
> would start with hard coding the delay to 0ns, and only implement
> these properties if you have a board where the PHY cannot add the
> delay.

If I understand the KSZ9031 bindings correctly, that PHY is limited to
a skew of up to 960 ps, not 1800 or 2000 ps.

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

