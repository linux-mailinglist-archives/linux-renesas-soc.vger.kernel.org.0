Return-Path: <linux-renesas-soc+bounces-14354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD947A60773
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 03:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39AE23BB09B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 02:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BA038F82;
	Fri, 14 Mar 2025 02:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVEUyqe9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4218B03;
	Fri, 14 Mar 2025 02:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741918969; cv=none; b=FKC8VpBkThJsi/FR5K5VtmNR5Q+cA4sPNdrAcLs6wazyoOwcFFhzVZTQqY1snMJQ0dctqWC9bxn1AgoqqlfrF6ziwjH2PuRxuXE805jBf1/Fxf8yoZTHYGcJqWpsjTcDIBi7mvCTO8xQ26J2aBE1YQ4j4BApZdqIM7ywGkzQ0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741918969; c=relaxed/simple;
	bh=sWKXN8cKrNB+gGdwxIZoWICKKlVuMO6GlnugQx/2dZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAUPIuRqWjM3fgPS4AxSwexaFev5oki2dP8GPSBouChq2nELSrnLHv16PeJT0Q2kryeLcVtbM4w7PoBcdsmcneDPn611Irq3IB3evP1JJ2Vrq0CsfsrSGCbDIopO+ChMieAa+8/augXHrZNXsusjnCk7BaOP4Mguub63ZZFLiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVEUyqe9; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-524038ba657so1451635e0c.0;
        Thu, 13 Mar 2025 19:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741918966; x=1742523766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pUSAt2gBWS/THix03rDWEWBe6ltaTHViojJEsG79IE=;
        b=JVEUyqe9S0pc3xLgmFRmCg0gQXqijaJhY2QKO6zaknGbsOIszjX56pMiVMK0TQzDbo
         rOD8K/QL+eWjWjlpPbgAK6JtZ0KnpoNJ0/3rUIB429b0tJsVNt6di9XPkimeIXcxybL9
         r16nchIjG+KcPf8ISDYpRMIxGi/QqY/o2F7nXZSBMuYdEMV1TqMqUo+L5QCWNkD6zGTN
         OBeoS9F3SiChvvBa7vLEyAK8IevYnlDT5OltvO4TXVz0xu7Mm7vhgVbMajwGPeevAYoE
         Vvmtmxu17JRl0vlIUuSvQwFnLvkZWvxMes8nXwDHy/lnyDXUELxqYlrvkOImgPQ2tEz1
         UEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741918966; x=1742523766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pUSAt2gBWS/THix03rDWEWBe6ltaTHViojJEsG79IE=;
        b=IThG/lI9Z1Pl0rWRRPyee2/g8x5cLf8A2j1nkEajHEQc/QjTLlNTv0HRgvbuOVQoQC
         GaU6zXmToHJM4j5qLcmXn0WVc3kNQ8ZZWml7TXASH3e1uA9iZoO7emrGIMU6vU/K/cUM
         aRGiXrgg5kYecSM7xT2dqKaeeG+p8ZUl0jlkkaBmu7Aq5KvvDpEQWlEnF38IdySuX4by
         UuuBVjTHUjXvrmb9dxi9pm6jVlDagV8IiAFMIn1IC3KRFknWCp/VGIVd8D+yIlIb0O8z
         YRRvyXGCFtIUCOleByZaeSG2hcLtIjW6YJEyMe9OTn0d9nUlmnfU5i8/42FE1UOYUivZ
         zZkw==
X-Forwarded-Encrypted: i=1; AJvYcCUZKitR8VIA+5eH+T7XS5wjpetCAzPjcpQPNsAQ5ZIpgU3npNeaXX4eAoIjWZ/vZXYd9gv1bfNHNFD6KGaZ@vger.kernel.org, AJvYcCUoKto7+J9o6G9/7XPxQb+ezcGfVjT0V1KrV6drUIo3cRckKllwtpIjdK0VmdkSDS6mUgiAUPqOxLl5SZyqxPXh80g=@vger.kernel.org, AJvYcCVrv7IqZklrJ26v1x3D2nn0SE25YIIX+aUQyQXl+NMcQq2Gop8nTzQfu07QlKHp/+R9dpo1286txE7O@vger.kernel.org, AJvYcCXeuvv1coHO78YbJwp+pkeXVcnr1NYE/6YOpRkZgUJ/1r3w6alyQkADGfJWhIn72GnYQPMH7qQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfOvnPaIy5iZuizhpB8jX2hBYiRNqsYjxTYE9GG+eDRP2w6h1
	4fCvODKZeAURD4dU0Da1eMpbqUCxSi+fai3UJ6T5NMcSTIG8+pi6QIpffmEu4HLHjLMsxW05Kgk
	GANtaUcAhUwPwIvoA7dNj2gGRe7U=
X-Gm-Gg: ASbGncvMD/3hcqWhgN3TKAtqFEcPQdSONejnxCjUk3rFo8cET9uTC+WxZ5CBjT++uEv
	q/mEX6P+mvzBY+pZgZ5/2ag6dpYIwEPLmlMQ4LkDPHmjM3O3O+FZG3T0i4H0ZrR2HoNgi1NC2kT
	6SQ+EvNyjJDJr8X2asXN6fU1aQ9Q==
X-Google-Smtp-Source: AGHT+IGs2NI4xge/a4lyvxOg3g3F9PYZhdFTackqpL56vrER50A7S7MWIvWppAene15n03kRY8o9uLvEhOJigkhj1z0=
X-Received: by 2002:a05:6122:881:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-5244a70f321mr354682e0c.0.1741918966551; Thu, 13 Mar 2025
 19:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250311221730.40720-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250312131623.GA489176-robh@kernel.org>
In-Reply-To: <20250312131623.GA489176-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 14 Mar 2025 02:22:20 +0000
X-Gm-Features: AQ5f1JpzjU4xztKpl7U06A1goxhOy8oR5lsFxv1C9RO1B1QjTjJrg3KeCUuStEU
Message-ID: <CA+V-a8vvd7uGx=M=vUauKGA4O5uhwsCgRzVqb387Z8JUXFBHBQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: dwmac: Increase
 'maxItems' for 'interrupts' and 'interrupt-names'
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Wed, Mar 12, 2025 at 1:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 10:17:28PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Increase the `maxItems` value for the `interrupts` and `interrupt-names=
`
> > properties to 11 to support additional per-channel Tx/Rx completion
> > interrupts on the Renesas RZ/V2H(P) SoC, which features the
> > `snps,dwmac-5.20` IP.
> >
> > Refactor the `interrupt-names` property by replacing repeated `enum`
> > entries with a `oneOf` list. Add support for per-channel receive and
> > transmit completion interrupts using regex patterns.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Note, for adding constraints to vendor bindings patch [0] has been sent
> > out seprately.
> >
> > [0] https://lore.kernel.org/all/20250309003301.1152228-1-prabhakar.maha=
dev-lad.rj@bp.renesas.com/
> >
> > v2->v3
> > - Dropped adding `additionalItems`
> > - Moved interrupts description into interrupt-names
> > - Replaced enum with a oneOf and added Rx/Tx regex patterns
> >
> > v1->v2
> > - No change
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++++-------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Do=
cumentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 78b3030dc56d..bacec6e6514b 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -114,19 +114,25 @@ properties:
> >
> >    interrupts:
> >      minItems: 1
> > -    items:
> > -      - description: Combined signal for various interrupt events
> > -      - description: The interrupt to manage the remote wake-up packet=
 detection
> > -      - description: The interrupt that occurs when Rx exits the LPI s=
tate
> > -      - description: The interrupt that occurs when HW safety error tr=
iggered
> > +    maxItems: 11
> >
> >    interrupt-names:
> >      minItems: 1
> > +    maxItems: 26
>
> Oops! I assume you meant 11. With that fixed:
Ouch, I will fix this in v4.

>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> >      items:
> > -      - const: macirq
> > -      - enum: [eth_wake_irq, eth_lpi, sfty]
> > -      - enum: [eth_wake_irq, eth_lpi, sfty]
> > -      - enum: [eth_wake_irq, eth_lpi, sfty]
> > +      oneOf:
> > +        - description: Combined signal for various interrupt events
> > +          const: macirq
> > +        - description: The interrupt to manage the remote wake-up pack=
et detection
> > +          const: eth_wake_irq
> > +        - description: The interrupt that occurs when Rx exits the LPI=
 state
> > +          const: eth_lpi
> > +        - description: The interrupt that occurs when HW safety error =
triggered
> > +          const: sfty
> > +        - description: Per channel receive completion interrupt
> > +          pattern: '^rx-queue-[0-3]$'
> > +        - description: Per channel transmit completion interrupt
> > +          pattern: '^tx-queue-[0-3]$'
> >
> >    clocks:
> >      minItems: 1
> > --
> > 2.43.0
> >

Cheers,
Prabhakar

