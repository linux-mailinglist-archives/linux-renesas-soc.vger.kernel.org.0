Return-Path: <linux-renesas-soc+bounces-26654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2583D175A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 09:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AAB2300A1E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 08:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FEA3803EE;
	Tue, 13 Jan 2026 08:43:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CB636AB4A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293822; cv=none; b=vAyZM82jooa+oiZt2Ah8wr1QMdIPpJnLwjxlnkkT7g8bN5E2qgzssghcUW1kdgpabQWgbLVU1J4qw0/18oq7W4ut+7KcCDvbbGcpfIf5JAw5DaHvojqQEDUDt5Ol6YmF5f9E9R9K2onRRp6nszQOxxKV3CJoIuTdqG2gWPpUO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293822; c=relaxed/simple;
	bh=Kw29Mu6HT2HxD5ti7IZmn4LO6W3EDHSFizK6jJGxelw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2+JJIJaPQdRK4DJ/l7axtHRnE/xtcyFyoPzQ0U4wu9hztFEFjMBAuYGNJVenOtkD/bs+qEtZzBABccCkbcl7a0PtL1pSnMsySIu9xZ0+PJ2HwrwGwHxq11coHLWqYOMbgZLuw3q6zCb1wyMLmh6TDCe1MlCItxuzHySjSdZC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f65.google.com with SMTP id a1e0cc1a2514c-93a9f6efe8bso2141772241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 00:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768293820; x=1768898620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1oQ15jpRcmphl58tx08AUKGIdjS+7SOa3S3k4/U/kw=;
        b=ZCycXtqF/KYdVltDghzFZ6TAohA1pyVCZ100+OVipFMZ58D1ti1FftNzj8fm5L6U+N
         f6uaWKFOOn78Kej0IirBlSZvWI4azutelbe5kCKs3gM6pi76jHYMrQO1qXbtdChuvVdE
         RG5I1wLLQgNwcIdJJiHPE7MvzbAJoAkbaI3MBLbofGyq7RPjGTf/6TFBlbfjYhrdFO1M
         cuznlzGMtBk/zH/S9Jap/EaHTIypoKvcRNYEFjsqlDVCiqZHahifyClxWqUKUnOgtKIK
         W1LHzd27QYVft4cfj8/UqbsK84EOUBc0/azV+ZQ6KO5HpBX7WBet20XYrqu6IG59TZ8s
         r4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVlRRHkFwXfmgxmcemrR4BoFrja/n1IBY2BOVVRr5jO7IRrAEDxhBF0qFVX7tANHlfK1aRybfgLyo0Rj2ao+l3kfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1L8pYbGIODLdZe7Ga4RrWCKOXU908pm9POcrBd8OWH8OyBZue
	90AMKjvzGpCB7GwLcVXrqlXVEGTf4Jawh6Dl/4JizzO73ksPVuwOJEEA8GJR9DvZ
X-Gm-Gg: AY/fxX429UyI5eJbRXE6iCoKIXGc+/AXWdBAfD5P7wV3PFB+FTAW9J9XOa/XVVCXDUM
	55814EqsoLbqHAKsRryvzhtoVR/GZLt3EZoKJJ5esB/aD4v+Atx4lEMTDSLPGfqe06iNQjTaoh5
	SVBXjiTQBFOACBoZwbCzU+R4C7NNU8RAZM01fozHAeCAm4FT535S4CgRlnObdYZvqzlEncsKGkJ
	su6uAqcKnLrrcUBdSHBp2s3a5j+w56CmSF/wAHmNFlUdyZ7TehQilWDRcFJmL+0mR+TaZlkK2Cq
	D1EjDhjeHNEp8uqaeRfDEFQuG0fR61SNupb01KLAdx+QDzSE8DUEqXQR52WoowbMqz30zuLxa1t
	9zZHVUpMraIsmMIwDtEW4FCOl2Nsen/3xJ5ygRPq78DZ7N0sQzUSesYN0f2M8WbZn6s5L9HQONM
	y0Dz6X2EjIwMy6W3+SK0wLuGNOETj8z8wWf5GoxqO90hUxrkqZw2lvfjtN7Z4=
X-Google-Smtp-Source: AGHT+IHWvUdAZoWoNJcRJSG6WMRQ9FprWOeEozpa9m/JqzLdN7cYrKwBeUqCCVGZhebRLn2+UnWg1Q==
X-Received: by 2002:a05:6102:8088:b0:5dd:b2a1:a5a4 with SMTP id ada2fe7eead31-5ecb1e731d9mr7613209137.5.1768293819905;
        Tue, 13 Jan 2026 00:43:39 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5efb5bb6d11sm8358054137.4.2026.01.13.00.43.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:43:39 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94240659ceaso2406837241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 00:43:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV66cTrkaDTelbUAhu3qRe33fpQg7fu7RgnuRs1oj5WyRTijX9VUefKtJQ8Uz8mCFfedkHZ8554D0fFuYfJ6JhDfA==@vger.kernel.org
X-Received: by 2002:a05:6102:290d:b0:5ef:b3fa:c89a with SMTP id
 ada2fe7eead31-5efb3facb2bmr3596566137.32.1768293818629; Tue, 13 Jan 2026
 00:43:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
 <20260112174945.GC26365@pendragon.ideasonboard.com>
In-Reply-To: <20260112174945.GC26365@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 09:43:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVH9v_Yn4+UA8TAyPu3st55yWFEPFmA6-ZeGkkxs44O+g@mail.gmail.com>
X-Gm-Features: AZwV_QgQdMvlnOnaTNIaFzNr0xfqYvjdFzLdwf3uc17UQjijTlMqSdyHwcT5Hzk
Message-ID: <CAMuHMdVH9v_Yn4+UA8TAyPu3st55yWFEPFmA6-ZeGkkxs44O+g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: nxp,tda998x: Add missing clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 12 Jan 2026 at 18:50, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 12, 2026 at 05:02:40PM +0100, Geert Uytterhoeven wrote:
> > Some TDA998x variants (e.g. TDA19988) have an OSC_IN pin, to connect
> > an external oscillator circuit or clock source.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This fixes "make dtbs_check":
> >
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >     arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> >           from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> >
> > This patch can be considered v3 of "[PATCH v2 2/3] [RFC] arm64: dts:
> > renesas: cat874: Drop bogus clocks property"[1], as the pin is actually
> > connected to a clock source on that board.  On BeagleBone Black, it is
> > also connected to a clock source, but not described in DT.
> >
> > The linux driver does not use this clock directly, but I suspect[2] the
> > use of this pin is controlled through the AP_ENA register value, as
> > specified in the second cell of the the audio-ports property.
> >
> > [1] https://lore.kernel.org/97b949cddd7e30e9c05873800330dccd3483b12b.1663165552.git.geert+renesas@glider.be
> > [2] I do not have access to the programming manual.
> > ---
> >  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml        | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > index 3fce9e698ea1d2dd..1205c8e9de329bbc 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > @@ -19,6 +19,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  clocks:
> > +    maxItems: 1
> > +
>
> I wonder if we should add a compatible string for the variants with a
> clock pin, to let drivers manage the clock.

I am not sure if that is necessary, as the clock is optional, and thus
devm_clk_get_optional() can just be added to the driver.

> If the clock does not need to be controlled, an alternative would be to

I think the driver should control the clock. Currently it works by
accident, as on (at least) cat874 and boneblack the external clock is
a fixed clock that is always running.

A simple solution would be to use e.g. devm_clk_get_optional_enabled().
A more complex solution would probably involve using the AP_ENA
register value.  Anyone who has the programming manual for tda998x?

> drop the clocks property from
> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts.

Cfr. my RFC v2 linked above[1] ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

