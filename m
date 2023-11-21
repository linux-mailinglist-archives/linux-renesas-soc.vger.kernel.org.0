Return-Path: <linux-renesas-soc+bounces-46-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD117F33C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 17:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5049DB21A76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 16:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09C05A115;
	Tue, 21 Nov 2023 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="C/2B3Lml"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67683CB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 08:32:14 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50aab20e828so3673655e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 08:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700584332; x=1701189132; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OwQRTXsCZ6W9EzEssWH2ys7zWoGL4d7d9Ovs4AO0xTI=;
        b=C/2B3LmlKgzEv9QBPuUZgjfyR/sIijSow/WGnCfXT333ZMM6oexEJriLF37VlRMGeN
         y3Q7xpitj9Zbh1K3l3D3j9M/BXPsUv8LLX0/aAFHPPTSz5Rc++IbF91fzuFO04DSOWV5
         /zWFlsSKnadNTn681kpWxQdzcfMaLcpRORk7E0SasZFCa/s6dlZuUdM+eE5m1Qf0Nj7k
         UTwE1rppoLT+ZU3zmvRIFrDWyNeRrTsMJ30GGzgricW3ZUc2UjisT9h+BQYaRSUQQL35
         TOmjEB4RZ8qm73hoq9SQPynFrryvKQ6Wr3sMXsAqlo5O5+iDsy5ED3Z5D2Wtb0CbJAiZ
         U2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700584332; x=1701189132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwQRTXsCZ6W9EzEssWH2ys7zWoGL4d7d9Ovs4AO0xTI=;
        b=Jhddi/DlXtTCrzvxDSkbVzZsar6dzFxO3FQ5KTGbVtJzV5Aflz4CHbKqH6+Zb65Xlq
         H/P0LuMwHfPwRCMYIUUWjhedQXmYxmtvt+3VKvYl6KzqKLih9tG2EtyJp1YfuAVYaSso
         1oKzI8n7syOeUW/17hM6/9dLlVHoOmBCOEMTgJ+ZrgqifiRCE0Fc8O34+D6t7mbZdObS
         M2D1AiHOXx8HcTejyARK4N4WUOrR7eSHQxFubT1BTmeZqwsGi6rnryvts7mlTgfwR2IJ
         9Tk8BZSHZor/mhjou6czZwRuamNaQ0KVxxE1PHDUv04bv6B/ppSxsmdEg/5NreltJnlm
         QMRw==
X-Gm-Message-State: AOJu0Yw2eNyvtY/4B4Df++IwxFtZRUGfW5gMmqwMPiLEGX64a0YZNchE
	3+9SwbxUX2c9dnfOrxP6B4cEtQ==
X-Google-Smtp-Source: AGHT+IGLJ/jbKWSuBrNEE7DXEF5uRL+d+0AaQDezH5w3UIwHZ92x/YHMQanCNLGUoQ8hMpm/jtfjTg==
X-Received: by 2002:ac2:43b0:0:b0:4fa:f96c:745f with SMTP id t16-20020ac243b0000000b004faf96c745fmr7599826lfl.38.1700584332537;
        Tue, 21 Nov 2023 08:32:12 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id t13-20020a195f0d000000b0050919538b00sm1598348lfb.79.2023.11.21.08.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 08:32:11 -0800 (PST)
Date: Tue, 21 Nov 2023 17:32:10 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
Message-ID: <ZVzbigCtv2q_2-Bx@oden.dyn.berto.se>
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>
 <ZVyeMKjVhjW2F2e0@oden.dyn.berto.se>
 <2ffb39c3-7939-46f2-8ca9-2b2cb44caaff@linaro.org>
 <ZVymJF2dd7XssGaQ@oden.dyn.berto.se>
 <CAMuHMdW3+YWuBefga9fXWxp6=yXoUPO9EK0nwEzHcbvsevx5Pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW3+YWuBefga9fXWxp6=yXoUPO9EK0nwEzHcbvsevx5Pg@mail.gmail.com>

Hi Geert,

On 2023-11-21 17:11:52 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Nov 21, 2023 at 1:44 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2023-11-21 13:20:54 +0100, Krzysztof Kozlowski wrote:
> > > On 21/11/2023 13:10, Niklas Söderlund wrote:
> > > >>> +
> > > >>> +  renesas,rx-internal-delay:
> > > >>> +    type: boolean
> > > >>> +    description:
> > > >>> +      Enable internal Rx clock delay, typically 1.8ns.
> > > >>
> > > >> Why this is bool, not delay in ns?
> > > >
> > > > The TSN is only capable of enabling or disable internal delays, not set
> > > > how long the delay is. The documentation states that the delay depends
> > > > on the electronic characteristics of the particular board, but states
> > > > that they typically are 1.8ns for Rx and 2.0ns for Tx.
> > >
> > > I don't understand that part. If you cannot configure the internal
> > > delay, how could it depend on the board characteristics?
> >
> > Each of these two properties reflect a single bit in the device
> > configuration space. If the bit is set the {Rx,Tx} delay mode is active
> > or disabled. The documentation for the bit simply states,
> >
> >     Tx clock internal Delay Mode
> >
> >     This bit can add internal Tx clock delay typ 2.0ns*.
> >
> >     *Refer to Electrical Characteristics for details.
> >
> > Same paragraph for Rx but a typical 1.8ns delay.
> >
> > > > I looked at the generic properties {rx,tx}-internal-delay-ps but they
> > > > are of int type. So I opted for a vendor specific bool property. Do you
> > > > think a better route is to use the generic property and force the value
> > > > to be either 0 or the typical delay?
> 
> This is not dissimilar from EtherAVB, where the hardware also supports
> only a single bit, and whose DT bindings have:
> 
>   rx-internal-delay-ps:
>     enum: [0, 1800]
> 
>   tx-internal-delay-ps:
>     enum: [0, 2000]
> 
> (with additional restrictions depending on the SoC, as on some SoCs
>  the bits cannot be changed).

That is a good point, I will switch to use the standard bindings for 
delay in v2.

> 
> > > >> Why this is property of a board (not SoC)?
> > > >
> > > > I'm sorry I don't understand this question.
> > >
> > > Why setting internal delay is specific to a board, not to a SoC? Why
> > > each board would need to configure it? On which parts of hardware on the
> > > board does this depend?
> >
> > Ahh, I think I understand. It is per board as I understand the
> > documentation. It depends on the electrical characteristics of the
> > board.
> 
> Exactly. These bits (and also similar bits in the PHY) are used to
> adapt signaling to the board trace lengths between MAC (on-SoC) and PHY.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

