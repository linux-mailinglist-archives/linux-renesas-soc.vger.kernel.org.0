Return-Path: <linux-renesas-soc+bounces-120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B2E7F4B32
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 16:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0A9E1F20CFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 15:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC6355773;
	Wed, 22 Nov 2023 15:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0516C2705;
	Wed, 22 Nov 2023 07:41:53 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5cce5075bd6so2134947b3.0;
        Wed, 22 Nov 2023 07:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700667713; x=1701272513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFZqsVfgRqiOD91xrpniJbD3hy+jg6Mb4nasXbDgGQI=;
        b=hL8USkXMMoGl/BNsfRPmuiSb5X37/LrA2kS1qgxDme4yDih5kP7vpR6wpsedlL57Fw
         5UR4wEzTKaJZbG++rKyXl2Rm71ZoZFkqLyk907NnTxwVQmoqSgQYSi46FskQIyyU0cJo
         RcVA11Cz8vtL/zjeuw9B61gCnV7X11s6OJPW/H0mhn1SoVfSiXbUbayxu83BWhedp4yr
         2yUzz0tSwwvHV0Sosk/pM+2CaiIDdUOJnFrdFUfbzlnHRP2NTC/1X+jHmvSTk/cnSNGW
         qd3Js8fKE1+ilTCWzBoEPTYaxMWnE7KmmIDDAdQbtgljjR2ZVR1vsPNxN3PquD3CwU/S
         zd+Q==
X-Gm-Message-State: AOJu0YytUfbbnlWAq0BtmQtKsD+Iof55Bq5qA70DLYmXbnqvT+DIxHb/
	K0ibS96lTrbRogyzjrF5FvvF+Q3xz1123w==
X-Google-Smtp-Source: AGHT+IG/goYMXuUzgOytIxNuIDF0icJenMbqSH9fsdEuUXJt+OEKtqLJ8myE9MZf+UJCffzDczhPAA==
X-Received: by 2002:a81:6c06:0:b0:5ca:4b7d:87e3 with SMTP id h6-20020a816c06000000b005ca4b7d87e3mr2258761ywc.3.1700667712806;
        Wed, 22 Nov 2023 07:41:52 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id t19-20020a817813000000b005cb63f630bcsm1331801ywc.31.2023.11.22.07.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 07:41:50 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5ccf64439bdso1064937b3.0;
        Wed, 22 Nov 2023 07:41:50 -0800 (PST)
X-Received: by 2002:a0d:d6cb:0:b0:5c9:b020:71b3 with SMTP id
 y194-20020a0dd6cb000000b005c9b02071b3mr2165932ywd.11.1700667710443; Wed, 22
 Nov 2023 07:41:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org> <ZVyeMKjVhjW2F2e0@oden.dyn.berto.se>
 <badce6b1-c614-4fc2-b3a2-5b1b5c011a80@lunn.ch> <CAMuHMdWYFrx-CUapCQPX=hJtZBHycRTyN-dq8fXSXZwOiPJDMw@mail.gmail.com>
 <7fce3813-daa6-41ac-8167-21ccdd733fbc@lunn.ch>
In-Reply-To: <7fce3813-daa6-41ac-8167-21ccdd733fbc@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 16:41:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXTKoewsQaw2o5oqE3BfjCAYNxYNoNX9ujhOSSyR+W7fQ@mail.gmail.com>
Message-ID: <CAMuHMdXTKoewsQaw2o5oqE3BfjCAYNxYNoNX9ujhOSSyR+W7fQ@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 2:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> > > In general, we try to have the PHY add the delay, not the MAC. So i
> > > would start with hard coding the delay to 0ns, and only implement
> > > these properties if you have a board where the PHY cannot add the
> > > delay.
> >
> > If I understand the KSZ9031 bindings correctly, that PHY is limited to
> > a skew of up to 960 ps, not 1800 or 2000 ps.
>
> Reading ksz9031_config_rgmii_delay(), it implements the four
> PHY_INTERFACE_MODE_RGMII* interface modes. So it should be able to
> provide the 2ns delay. Sometimes the tuning ability is relative to the
> base delay. So maybe it can do 2n +- 0.960/2 ?

Oh, I do remember the regressions when the KSZ9031 driver started
implementing that :-(  See commit a6f51f2efa742df0 ("ravb: Add support
for explicit internal clock delay configuration") and the commits it
links to.

> Anyway, try interface mode "rgmii_id" with the MAC not providing any
> delay.

That's more or less what we had before, cfr. commit 9b81018185965a30
("arm64: dts: renesas: rcar-gen3: Convert EtherAVB to explicit delay
handling")...

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

