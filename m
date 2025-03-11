Return-Path: <linux-renesas-soc+bounces-14249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46027A5BB1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 09:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64B91893825
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 08:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB1E226545;
	Tue, 11 Mar 2025 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHGK8/Ee"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF201EB184;
	Tue, 11 Mar 2025 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683063; cv=none; b=lHVHMvH5rXaWlGyeiXlKsLHCDLtmHh+hn+J8AI2Kbf3WUck2wBP6+0vNdnhZ8W9oOWIfkA8lywG63SYDJeJDZQufZTULLiIaUHWAK9XAeVgPwJtXuFCT9mlpTDLm+v3KZxaH3dClv71eFoh0iHMDwA432+zNKi/orKLnA7fBmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683063; c=relaxed/simple;
	bh=HB3Zy1gU28m4kK/S0bB95ApFHZ/cYoMFfJxnYvIe3NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtUuXa/5VbJOLNgy/kzMHqZAesLF7lgG2t0oQI3U/GWvyjDIx/r29wkKecE3K3KzZ9dGgOsAfanH1f3dJLNEYchz4tYmtGtlnHMQDR3NlStr0yOpp9Hp3DdH8kqnPb4A1tedZa3Tg9D9E7idVK3o/c/T9Q2JN0ia18n/JnLBOlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHGK8/Ee; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523f670ca99so1193538e0c.1;
        Tue, 11 Mar 2025 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741683061; x=1742287861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwlKUmCIxRBb8ELz2q2Z4eNbzAimAiIA1z1E81e3a6E=;
        b=XHGK8/EeIvETJAIb6KP/+65N83+IAaSakmKL4AeeKLZGYA1sLmwL2cqOFNb8DwZFAP
         tazwIE3Xybn02xCH+Abvzb/LU45seiH3v4SxOkTW0PU5y8rT7VFx4S3p1HG/B1Ydnm5k
         WGktHu9fzWBeVED7mIdOUcoEJXX3roZZBM1PP4crZuJeVPW+qrGbPsC5L0BtYbGo1ypZ
         cosjSXUhNjvxMfpaNWjie6qdaw+eLKjTkMuqccZHx+Cuv2mAvGMErry1hCyJJTcc9mEg
         FRXu77KoUJ6QKKGuQPisclvF+tldvXqWcuzVmo5+phVbWZILGfpw8y9hnVb0FOCaxlpo
         Wx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741683061; x=1742287861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwlKUmCIxRBb8ELz2q2Z4eNbzAimAiIA1z1E81e3a6E=;
        b=sF+El0iuCbWW+oULypla+UVfkRrHYaRGKBqHRcjT+gsbYnCfLbD+I2zVOZwpwUzDgQ
         MoZSXEv7Z5yG0eSgoQ5ckBu3Eqp1B1RTtQ3+LpjkdcoMyBWcBazXv8j8avwG6+7+W1UO
         zT5ZYEjzyM0JXYtwbNLdFWQV09WZn8emTtI8IARy3gu1wWjYyPXaXvWjO/AogiBKJPA7
         gJhqNoySqNUiaBvYpTfW3FV0/d95y1hwMHmu9gmI2Y8JA6Qlv4LrVQ5BbIdZ5Lsz5MrU
         gRxU640Zu/oilPw409ySCZql32seeRILcMj+35llrLCOMf2bWU7+/RwRdO3HYjxaGWZ9
         /gxA==
X-Forwarded-Encrypted: i=1; AJvYcCVB6libishqZbcCXLjT2U/ZBg9lLFRKBXCgK+EPDgVq7yYWGUYb/NluYPC97ikTqISYTrAeEaZE@vger.kernel.org, AJvYcCVmY4ZiuAkrB4DrG7V7y47ACHDawoP9JplwbnJDn1Ek5n4y7t5xVZLM6UFFffiOT4foBI+gUqW/J5EyLM0D@vger.kernel.org, AJvYcCWDmF/vcQRTiPGhxatiRPDKxsLa/s8nyHSyONDLllFfh9btmgfcjRVLxkvIPTVz+2XAeJ1zzQV4Z++e@vger.kernel.org, AJvYcCX2etKFNJQsPfrweNC24mx26y9Ekg+PM5olexlDHC29r12ipGGWHNtIB2b43znuyJlE+jtWSFmyJbyR6f0fCYO8V5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQVQb/V6ZQNaWKvIMUvwu0NqRJ7N0TxtsJDAYLs3onRPvxaMYv
	oQw7TSkISb5sQnndqYyUsrSvfeicKTvyZoJ/ZFdId+AVWbdnl8IHeN1mVRE3VTSkqSg8+/umfSB
	QuH9M+ovQLiNGHltmdaqR+//HWU0=
X-Gm-Gg: ASbGncuU5uouqjNf1/j1jV0KcAInyv/ViQI9DGnCFbAikkRjVdY6aEEwv8JjxXx9rs1
	04el+B3FnuxCYfONJJYS1hf7BIIh8JIPAwykxEEFx0LbLKWgPLMgLV/vnbgvNkwgXFvy6tYAvd0
	GW55IOCFgToqzvho4KIXT3GH2N/XRQ5b8QMHTf
X-Google-Smtp-Source: AGHT+IFGrKexk2feh/g4AfZm+74DwDdS0TYifRv6+ZHmhZYsDPNrr70+NaB9JFJj6JVsuEewgbKE9y58HXVcfK0UqmU=
X-Received: by 2002:a05:6122:319b:b0:520:9b05:4cb6 with SMTP id
 71dfb90a1353d-524195c60cbmr1473579e0c.0.1741683060635; Tue, 11 Mar 2025
 01:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250310213056.GA904881-robh@kernel.org> <CA+V-a8uinTxr8FheR5-Pbv37j9wFR1cfrFDX6gExA5dW8WWPSA@mail.gmail.com>
In-Reply-To: <CA+V-a8uinTxr8FheR5-Pbv37j9wFR1cfrFDX6gExA5dW8WWPSA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 08:50:34 +0000
X-Gm-Features: AQ5f1JqlUV-XTA6x64ZwVgrVHcqYL_lO68H10alDV6JE3jPjNjWM6p7bkmkYfY0
Message-ID: <CA+V-a8v=q1aN_+4jQz3=StAXYP1-==OX5xZDrGXe8WWR4XbCKQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: dwmac: Increase
 'maxItems' for 'interrupts' and 'interrupt-names'
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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

Hi Russell,

On Tue, Mar 11, 2025 at 7:16=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Rob,
>
> Thank you for the review.
>
> On Mon, Mar 10, 2025 at 9:30=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Sat, Mar 08, 2025 at 08:09:19PM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Increase the `maxItems` value for the `interrupts` and `interrupt-nam=
es`
> > > properties to accommodate the Renesas RZ/V2H(P) SoC, which features t=
he
> > > `snps,dwmac-5.20` IP with 11 interrupts.
> > >
> > > Also add `additionalItems: true` to allow specifying extra interrupts
> > > beyond the predefined ones. Update the `interrupt-names` property to
> > > allow specifying extra `interrupt-names`.
> > >
> > > Also refactor the optional `interrupt-names` property by consolidatin=
g
> > > repeated enums into a single enum list.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > Note, for this change I will be sending a sperate patch for vendor
> > > bindings to add constraints.
> > >
> > > v1->v2
> > > - No change
> > > ---
> > >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/=
Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > index 3f0aa46d798e..fad0d611a75c 100644
> > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > @@ -114,6 +114,8 @@ properties:
> > >
> > >    interrupts:
> > >      minItems: 1
> > > +    maxItems: 11
> > > +    additionalItems: true
> > >      items:
> > >        - description: Combined signal for various interrupt events
> > >        - description: The interrupt to manage the remote wake-up pack=
et detection
> > > @@ -122,11 +124,11 @@ properties:
> > >
> > >    interrupt-names:
> > >      minItems: 1
> > > +    maxItems: 11
> > > +    additionalItems: true
> > >      items:
> > >        - const: macirq
> > >        - enum: [eth_wake_irq, eth_lpi, sfty]
> > > -      - enum: [eth_wake_irq, eth_lpi, sfty]
> > > -      - enum: [eth_wake_irq, eth_lpi, sfty]
> >
> > I think this should be structured similar to the DWC PCIe binding where
> > we define all possible names, but not the order:
> >
> > minItems: 1
> > maxItems: 11
> > items:
> >   oneOf:
> >     - const: macirq
> >       description: ...
> >     - const: eth_wake_irq
> >       description: ...
> >     - pattern: '^rx-queue-[0-3]$'
> >       description: ...
> >     - pattern: '^tx-queue-[0-3]$'
> >       description: ...
> >
> > And so on. Move the descriptions from 'interrupts' and drop 'items' and
> > 'additionalItems' from it.
> >
> Thanks for the pointer, I'll do as suggested above.
>
> @Russel, are you OK from me to add rx-queue/tx-queue in this binding
Apologies for the typo in your name.

Cheers,
Prabhakar

