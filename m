Return-Path: <linux-renesas-soc+bounces-20-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3670E7F27CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 09:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB042B21B5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 08:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4CF1EA87;
	Tue, 21 Nov 2023 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DB695;
	Tue, 21 Nov 2023 00:45:45 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ca9114e0e2so17825267b3.3;
        Tue, 21 Nov 2023 00:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556345; x=1701161145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXX+oO634C+6kGvfLSOYqVmvQcGTaXU8w507eH4BnOo=;
        b=eueQjH/KsfKFuTC5gzmbYbMJp6x0j2RHc2ajU/JiYOVX5VpjPviMDQF96Asmf+2UL0
         ASp8Z6kW+xswEZvasVPucvyLk1aorccmqW6z5DG46gm9xaRwkppCoeGb7IN6d9tyfFUp
         F37bEGvPPzlC45gE+cDzOdDiPBDpJMkFbs2yIWY8d3ISttHMDFwKLcRIexD2zjDMmkK5
         rUbhO20TwaSeBELTyI3JRuJ51U70iAdfAAbF+FX+BYe1t2GbcLDn0rnh4vcMf/X/e3HR
         bV85s9A4H8Q6v9CB061BBbOz0quAZ3wkqd183kAij6Nf9ly84U36ix4Kkxi+NRgXNfQ4
         HDNg==
X-Gm-Message-State: AOJu0YzSBU6qp5g8Ag33C8NdEC6OOx57y2DeWPjw2Mence8ljTh5/jbn
	GBDYv+kvBuEBeHfwMxUyXjFOjAE+MXrvT9AC
X-Google-Smtp-Source: AGHT+IGqpKj3rQ+9MGJGdFv5kTv4fSPWqwnWokF01pWyHH3Y4KJzBtSeNrr93o8qwueVx/2d06jMNw==
X-Received: by 2002:a81:af59:0:b0:5cb:b5fd:c0c3 with SMTP id x25-20020a81af59000000b005cbb5fdc0c3mr607108ywj.16.1700556344849;
        Tue, 21 Nov 2023 00:45:44 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id a190-20020a0dd8c7000000b005a8d713a91esm2888427ywe.15.2023.11.21.00.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:45:44 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ca9114e0e2so17825097b3.3;
        Tue, 21 Nov 2023 00:45:44 -0800 (PST)
X-Received: by 2002:a05:690c:398:b0:5a8:204c:5c9b with SMTP id
 bh24-20020a05690c039800b005a8204c5c9bmr11702029ywb.18.1700556344413; Tue, 21
 Nov 2023 00:45:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org> <CAMuHMdUkfyJ9f22joXpAW1Gwk+zE9cqx+hbFqeK7Xc7ZTW1Faw@mail.gmail.com>
 <c187f8d6-6178-4ef2-958b-16e274a49b91@linaro.org>
In-Reply-To: <c187f8d6-6178-4ef2-958b-16e274a49b91@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 09:45:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSXHF8wQkK+bQHczCRyQTp3x74JOj-ue7v6HzPvRVjdQ@mail.gmail.com>
Message-ID: <CAMuHMdWSXHF8wQkK+bQHczCRyQTp3x74JOj-ue7v6HzPvRVjdQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Nov 21, 2023 at 9:40=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 21/11/2023 09:00, Geert Uytterhoeven wrote:
> > On Tue, Nov 21, 2023 at 8:45=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 20/11/2023 17:07, Niklas S=C3=B6derlund wrote:
> >>> Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
> >>> device provides Ethernet network.
> >>>
> >>> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml

> >>> +          - enum:
> >>> +              - renesas,ethertsn-r8a779g0      # R-Car V4H
> >
> > renesas,r8a779g0-ethertsn
>
> You can try to make a schema for this. See for examples:
> Documentation/devicetree/bindings/arm/qcom-soc.yaml

Thanks for the pointer!  Added to (long) TODO list...

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

