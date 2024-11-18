Return-Path: <linux-renesas-soc+bounces-10566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C09309D0EC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2024 11:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 515551F212BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2024 10:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25756198831;
	Mon, 18 Nov 2024 10:39:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A25F1946DA;
	Mon, 18 Nov 2024 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731926380; cv=none; b=XrLuXOfG17dzZ799EMCRlHD+QC9xnZ0ohL/V20lq7u5odK3trEZqfqiabl6i7BIbDkvK8cU3+q5VAZDCjwvmXSrFdlHKep9TKmD7xYVnTfGeG7SLLkc7qxKIAJsLW2I9/FZ8kaT1SmC0nuiRuN1SOfVC8z0AfMZOtCLlCA2r8uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731926380; c=relaxed/simple;
	bh=86ctVHHF62c9QKCmQkelqaKPlBd83Hp9NwTb+rJ/BBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGLYTlMemw/9Bh7mxRJkOVfi2gkoGc/Tc2BQ6KFjv/EDZulRKsd4fBM22b1RiRBBwB+7xJJms/G8vctAVRvmCtdZRrMtD7DfcLsOE1bzn77w4kpY3paZ54tKQfU+VtqXEWkvcX2X6PB6dmtkP+SQvjHvRzQ4+gjc88j73q+UXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6eb0bdf3cacso27500697b3.0;
        Mon, 18 Nov 2024 02:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731926376; x=1732531176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YudYAA/FdmtQU8G1GU+7NMyfOqDxCPcpLBPv0+eEnQ=;
        b=sw8MrrJL68CenzJNRp+J7y3rpBmN+p0w4AOVGi4RXZ0cMIU7tqmgFtrma6Rx0i48Ig
         SQ+XSW1BRUesp2JcajTCHy9mbWjfrvP769t0S0NlOzKstBI35ze5DSgm9Tk8iFnqOhpm
         96n47ijNnKv3y1LMSNiJMpSJWOVfK6n02csiY+03/OoJPFylwwwsOL9w+zhQtiSzRhrn
         CVnNSoI4UHc4D2JSQqe6GUgv3Zrn24eGo4fngNAgQH0Jcd2p/C03hfmFcUn3lsqk8Ya4
         Mgo9yrqGV5fO1Mip8zi5mJOpbk7N02rep+GmPTxr1qTtmDTgklg9zaQdTCsnMuRzDEQW
         Xjuw==
X-Forwarded-Encrypted: i=1; AJvYcCUnKUIVRDYYMr11QKGxqjOJIDxNv4pOVazD7kqvsvA/K9nkcV9LKPl2+wpAWC5SuUPtoqG1py0W0k7r@vger.kernel.org, AJvYcCUx5/sUS2TohkUHxvOPEndCQGJjhVi5zI+IakN1rg7OrmRTK0+Y6Hu2wC0cHWS5NVx+MbwHqAFG@vger.kernel.org, AJvYcCWTc1ZrIJy/MjWtLPMa/YhiynZbLbPZGaz1yySji5HtmAuyO0ZvTPWR15Zgat5LQn3p5KoZtvpixheqSbv8dHm24Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxmdJm21R/k/8zl+vaYA8zyIuqlBUzvaKD+B4uBKuZYefRNYe
	jKj1qDUua7ifLTMe68rGzccntfFEvZEEYIkWM78MXJqj3iyiRQTPZ48ysNzl
X-Google-Smtp-Source: AGHT+IE3q4muWl+GYknCOPfXggnsdLCYNJpVU29bvPwb8jAJ8tsZOKoHTcBZTCp/LnHU0KVgVaO5fA==
X-Received: by 2002:a05:690c:3707:b0:6ee:5104:f43a with SMTP id 00721157ae682-6ee5104f4f6mr114010657b3.20.1731926376543;
        Mon, 18 Nov 2024 02:39:36 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee713423d0sm11497617b3.88.2024.11.18.02.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 02:39:34 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ee745e3b2bso9943247b3.0;
        Mon, 18 Nov 2024 02:39:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVc8dEpUp7PYbIN7/yfGQI2xwL9eRyfrgHpKW8S9qp/hHHGlCQe9ZjqsU80Wr+pyFjoLZMOlWAOODXjMtuP5LYRvw0=@vger.kernel.org, AJvYcCWd+0+GW6DWVimjF9DLljlQzGZ7LdCQQj5keOqYnJf2hYU59hwtDDnHlOQeIxKyxc0vE4EZczTY@vger.kernel.org, AJvYcCWiKmpbZeVR9kfgW9ORx1yfly7HgNZRLbzo3jM46sHmKsslbaaQeadWWPaaD5jWNb3FWok3xwDVIx61@vger.kernel.org
X-Received: by 2002:a05:690c:9b11:b0:6e5:2adf:d584 with SMTP id
 00721157ae682-6ee54f4efb0mr80229547b3.14.1731926374413; Mon, 18 Nov 2024
 02:39:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <943cb31d01d0da3a63911326e24fbf9b328f7206.1731580776.git.geert+renesas@glider.be>
 <20241115150210.GA2680735-robh@kernel.org>
In-Reply-To: <20241115150210.GA2680735-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Nov 2024 11:39:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV01hv-riCFEBD024pX6jL37C6hp7Cjjy1rtaUnrhvK3w@mail.gmail.com>
Message-ID: <CAMuHMdV01hv-riCFEBD024pX6jL37C6hp7Cjjy1rtaUnrhvK3w@mail.gmail.com>
Subject: Re: [PATCH] [RFC] dt-bindings: net: micrel: Convert to json-schema
To: Rob Herring <robh@kernel.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Nov 15, 2024 at 4:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Thu, Nov 14, 2024 at 11:42:50AM +0100, Geert Uytterhoeven wrote:
> > Convert the Micrel PHY Device Tree binding documentation to json-schema=
.
> >
> > Add a simple example.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Notes:
> >   1. I specified Ben Dooks as the maintainer, as he wrote the original
> >      bindings. Ben, are you OK with that?
> >   2. This schema is never applied, as there is no compatible value or
> >      select statement. Adding
> >
> >       select:
> >         properties:
> >           $nodename:
> >             pattern: "^ethernet-phy(@[a-f0-9]+)?$"
> >
> >         required:
> >           - $nodename
> >
> >      and changing
> >
> >       -unevaluatedProperties: false
> >       +additionalProperties: true
> >
> >      would fix that, and is mostly harmless, except for possible
> >      conflicts with other Ethernet PHYs having more than one clock, or
> >      using different clock-names.
> >      Documentation/devicetree/bindings/net/qca,ar803x.yaml has the same
> >      issue.
> >      Is there a proper way to handle this?  Are there other options tha=
n
> >      mandating specific compatible values for Ethernet PHYs?
>
> The proper way is simply, if you need to describe your phy in DT, it
> needs a compatible string. MDIO phys are not special.

So that's gonna be a bunch of "ethernet-phy-id0022.*" values,
especially as the least significant nibble is the revision number...

> We really need to split ethernet-phy.yaml into common properties and a
> specific schema for the compatibles it contains so that we can change
> 'additionalProperties: true'. That's one reason why all these properties
> and typos didn't get flagged.
>
> If you don't want to retro-actively add a compatible, you can also do
> something like this:
>
> select:
>   anyOf:
>     - required: ['micrel,led-mode']
>     - required: ['micrel,rmii-reference-clock-select-25-mhz']
>     - required: ['micrel,fiber-mode']
>     - required: ['coma-mode-gpios']
>
> That doesn't catch every case nor if you have a typo in the property
> names.

Indeed.

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/micrel,phy.yaml

> > +  micrel,rmii-reference-clock-select-25-mhz:
> > +    description: |
> > +      RMII Reference Clock Select bit selects 25 MHz mode
> > +
> > +      Setting the RMII Reference Clock Select bit enables 25 MHz rathe=
r
> > +      than 50 MHz clock mode.
> > +
> > +      Note that this option in only needed for certain PHY revisions w=
ith a
> > +      non-standard, inverted function of this configuration bit.
> > +      Specifically, a clock reference ("rmii-ref" below) is always nee=
ded to
> > +      actually select a mode.
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: rmii-ref
> > +    description: |
> > +      supported clocks:
> > +        - KSZ8021, KSZ8031, KSZ8081, KSZ8091: "rmii-ref": The RMII ref=
erence
> > +          input clock. Used to determine the XI input clock.
>
> Don't repeat the clock name in the description.

Actually I kept it on purpose, as the driver treats the "rmii-ref" clock
differently than any other (unnamed) clock.  Obviously I failed to
relay that information, so I should enhance the description ;-)

> > +  coma-mode-gpios:
> > +    description: |
> > +      If present the given gpio will be deasserted when the PHY is pro=
bed.
> > +
> > +      Some PHYs have a COMA mode input pin which puts the PHY into
> > +      isolate and power-down mode. On some boards this input is connec=
ted
> > +      to a GPIO of the SoC.
> > +
> > +      Supported on the LAN8814.
>
> Another reason to add compatible. You have per device properties.

So I have to increase my datasheet library first, to discover all
the PHY IDs.

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

