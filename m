Return-Path: <linux-renesas-soc+bounces-14246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 126A2A5B99F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 08:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44CA1171412
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 07:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8E322156C;
	Tue, 11 Mar 2025 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmuQ2Nsy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475821421F;
	Tue, 11 Mar 2025 07:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741677441; cv=none; b=UtW1Wy5Pczig930BSrR4VeujIoqnX/5AMdzageiFkERxDmkxGHUOc34J49XgDXteQA8Bf9uBpWKrgjQ5kSQfOHedspfvEOnPBjqpefgu4ymtLK84/rX8KVf8BwfJElf4z2zDjh4uhwFMkTNYBmUrjT+vgUzd7oCRP0Wh+7Xca7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741677441; c=relaxed/simple;
	bh=lMQHpotAZT+or9bRBn1RXMX/D7xRB6YRlUt12c1LBPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVehsAxCDfj2ttAhnvhNxZXdEB5ASvAHl7XcDBpqAsLsx3CarOnOSHs3qHX4GdqeN7hf4ha0q3snDBeHcy5NaIMfXoZuGeKWjMvkYUQ7cfwH0F3h2RVF0bAFAs/wHz6PUgBGo05P63KjHRie+xD08s20z+CwbphRjeZaNTU8iH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmuQ2Nsy; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523dc366e42so1980696e0c.2;
        Tue, 11 Mar 2025 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741677438; x=1742282238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgXuDCwAmQulDTtjzIIH53l6D34oij/uowJ4XpgRVJo=;
        b=jmuQ2NsyE8noLdtxc+TREY9oLrDvx9VBoTXoUmPe9JDF63vBIRCMzoMPoPOF0CTgE0
         A3uZa3Mv565E6ZCX4A9H9yP0TKV1mjAdX80osSGcXYxoIwftBkSogxlnMwh6PQ8QmYWt
         terLKAh7bVkCeKM9tZkP5Ytt1cMP3PGT+d8AwXQJ8M2Ze8DBY3eGVMX4eHj5bzFLAz+D
         hS3Y0POn6viCl2NHNxIqoKdXJx/xlA8YQHeJuHsaQ/g6ZaOo2nV3f98vZMHgGkJSCQIW
         uGF6yepsce4ILOnK6Y4pexCRHgJPhHUYewhAIOKK8hnWcmVN/KeGAd3iQAeW43JNwMMN
         D1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741677438; x=1742282238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgXuDCwAmQulDTtjzIIH53l6D34oij/uowJ4XpgRVJo=;
        b=XgmqXqB4z9p/xl14qHBgQfetvxid479XV/o557fQiG8kjN6KrIi8nmOyzWKHKwHCHH
         9K3zUGjgJMHNlrIX8l247YVp3KoIxyPoGVFQ22klkhSUwLMWZqHSkFB837z1d7+7Lv/z
         rFb7srbA5K6oOH7m7N//mA+x5xhwb2cGxvZb8iLnaICq2mk5S0TtweYMiIAvTCQrSKvV
         SCnNmufpDu9dwDrfSkdhdU41Pq74em1PVbQNZtaXNaVWEYqbEXmQclNb7RNt7hSot7wN
         YaXYgJw7glOsp/weNYkoP2tVBKcxNKHL+a0fjjP5jSCPyChpIVrLdB/xa6Kf8QTXmv30
         thkg==
X-Forwarded-Encrypted: i=1; AJvYcCUFB7Y5aCYNAcWIkl+rv1zOX0id+NgNaSMVOyxG8bKUNVlinfhEjinE9TEtMHAlYhHBa/ciHzYwzGxk@vger.kernel.org, AJvYcCUY9dIax7uzn0ry0xAUH4zcOB1mjzhB3XAXwdbeP2wS1CMEa4DUYLXDIQTfdEW4UxH7eLOnKap7nq8XrQRC@vger.kernel.org, AJvYcCW2k4Q5awaEo87UM/6ISLLinjjKWNT8o6HDviAU/aOK29+JFAM0LXNuPhyJdL4wUntITr6kp82A@vger.kernel.org, AJvYcCX05hZFok/Ridsh6EYYSeNlzMwmHg0HrF5/HUd5McdacZj+plwfRDddJp5HZcCFF/omN8lvhlxVaTkZ2X4aygRsnm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZuunyrTNG+TEJXYMwYajY3d3agXJ/PLxNMUy5kLv4pD+SG/sk
	tER1pUV2a++zoxzpngSOlttUUN+SCSAstWK7E1yy4+aEIQAPLx7ER3iSaCCqGxhq9B8Ktw8I8g2
	fDQykB7tXYFTpv7gObticqICFASw=
X-Gm-Gg: ASbGncsLH8nr631j45bwGhMt1XsY2c2LGSHibwGKXL7ThyeRU32/XpdcqR5m6cfIupF
	ZcvTuMTR5vmy6MFwCCTVVXU6Crp6813GdCdoKmrykyeJvEvRpnEHlQr7YTtcuYByHx1Yd5yIoUa
	jPoekfsaYC4SCBrlsOihdlCt6fAA==
X-Google-Smtp-Source: AGHT+IHL9bGh1peMKIZaQk5HkCRcMvybeFANZeZSC4bWbrbEOygDwgyxh5TwDNL6xNH9/SVkNxI01E1JJlfqV10gxoE=
X-Received: by 2002:a05:6122:1809:b0:520:60c2:3f1 with SMTP id
 71dfb90a1353d-523e3fd2c81mr9612329e0c.0.1741677437848; Tue, 11 Mar 2025
 00:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250310213056.GA904881-robh@kernel.org>
In-Reply-To: <20250310213056.GA904881-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 07:16:52 +0000
X-Gm-Features: AQ5f1Jo8YORcwnFwKCITHCfJ8Sp8085yTfEpHt0PYoBNnCKqikUJMGmDGgK5HdU
Message-ID: <CA+V-a8uinTxr8FheR5-Pbv37j9wFR1cfrFDX6gExA5dW8WWPSA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: dwmac: Increase
 'maxItems' for 'interrupts' and 'interrupt-names'
To: Rob Herring <robh@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Mon, Mar 10, 2025 at 9:30=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, Mar 08, 2025 at 08:09:19PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Increase the `maxItems` value for the `interrupts` and `interrupt-names=
`
> > properties to accommodate the Renesas RZ/V2H(P) SoC, which features the
> > `snps,dwmac-5.20` IP with 11 interrupts.
> >
> > Also add `additionalItems: true` to allow specifying extra interrupts
> > beyond the predefined ones. Update the `interrupt-names` property to
> > allow specifying extra `interrupt-names`.
> >
> > Also refactor the optional `interrupt-names` property by consolidating
> > repeated enums into a single enum list.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Note, for this change I will be sending a sperate patch for vendor
> > bindings to add constraints.
> >
> > v1->v2
> > - No change
> > ---
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Do=
cumentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 3f0aa46d798e..fad0d611a75c 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -114,6 +114,8 @@ properties:
> >
> >    interrupts:
> >      minItems: 1
> > +    maxItems: 11
> > +    additionalItems: true
> >      items:
> >        - description: Combined signal for various interrupt events
> >        - description: The interrupt to manage the remote wake-up packet=
 detection
> > @@ -122,11 +124,11 @@ properties:
> >
> >    interrupt-names:
> >      minItems: 1
> > +    maxItems: 11
> > +    additionalItems: true
> >      items:
> >        - const: macirq
> >        - enum: [eth_wake_irq, eth_lpi, sfty]
> > -      - enum: [eth_wake_irq, eth_lpi, sfty]
> > -      - enum: [eth_wake_irq, eth_lpi, sfty]
>
> I think this should be structured similar to the DWC PCIe binding where
> we define all possible names, but not the order:
>
> minItems: 1
> maxItems: 11
> items:
>   oneOf:
>     - const: macirq
>       description: ...
>     - const: eth_wake_irq
>       description: ...
>     - pattern: '^rx-queue-[0-3]$'
>       description: ...
>     - pattern: '^tx-queue-[0-3]$'
>       description: ...
>
> And so on. Move the descriptions from 'interrupts' and drop 'items' and
> 'additionalItems' from it.
>
Thanks for the pointer, I'll do as suggested above.

@Russel, are you OK from me to add rx-queue/tx-queue in this binding
file or would you suggest different names for it. Please share your
thoughts.

Cheers,
Prabhakar

