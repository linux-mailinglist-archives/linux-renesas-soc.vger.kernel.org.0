Return-Path: <linux-renesas-soc+bounces-21219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE6AB4099C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 17:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AC691B61656
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B38E32ED5D;
	Tue,  2 Sep 2025 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIua+iHE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4EC32ED40;
	Tue,  2 Sep 2025 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828059; cv=none; b=ejgtMYg5xXCKZy/SAHBiYJkFFIpLrIYFAWCdlc0sHwOiN9YpQVdw961ADycKZvZkFBn+NMrIS87LnO7k5E/krqygrF/VyaActuqTrZcGk4G5ZB81gMsY+UEFyaJLH8JS1dnDpjmoOWzYOjASePjFfWw3eUPNbkEif6YF2K0xU3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828059; c=relaxed/simple;
	bh=9h8tItzbf7e/31rPkzwLaMgcy5D0JAu4p3qEClSErYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBT4vBA98qGSftPQ1QF0HgAYK7xdSCH6MkJLN7caGwwCTnnotqrEgAxqTtRxEukN9mDfGb4qq2yuyaBOW9ZXy6Zw6BiDv55T+rl59cEuCUaJMHoNmGWLgU/B5+6RtPAwOvgQApptyhMt/hmuIS0whnsg7ePdlff1braFcbAy4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIua+iHE; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b042eb09948so332412466b.3;
        Tue, 02 Sep 2025 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828056; x=1757432856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/F5S5aCKnKbWER3cwLRRgL9laoETfmCZ7U45E2983k=;
        b=UIua+iHEIE5c51wI65wyerVxweGECFbsEpcUasQF2EQW0hTIOnjBT4RIgXzAUGlJqF
         8/pcIg+OQohrP3Ey66rG9oLbca7Ed9hvS8IFrAqTt+Xg6pw87NeVF9XY9aspF2a1cfGy
         u9TYBygVl2wKKQkpTHYtdtJDWbxmIucNQsImG3RNXoyP2dlO1g0aC5wE/u+AXz8lANvE
         XRKZwO0qWT05x6bsNDG7h1ep146MV9Z/nSkPOjQPfHMqEBdswUgqHakmTmPoNaIEJPhW
         rPU9R22o//bGmUnVLhRZ1QJCNvwYtzx9VI7w16QrrD10cmBN+PBuUI1K2daAqJMiznp5
         Kd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828056; x=1757432856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/F5S5aCKnKbWER3cwLRRgL9laoETfmCZ7U45E2983k=;
        b=dEzilQacMrHTNzJDBLTvl0eUiEW1RZ5UT65wlTH1KW+N10+mrsWNaHRxlnXb90BLBs
         8b3jmsxwqheDQDfWaQ/7s79q6L8GkiWHvwb3I62KQM5YsGnuo/8AZHmDgeZ7uDla8ceP
         qBO5cDuK0XhLqCsKzsSQrHgp16j36i9MRaG5h6xcO3yvYXKzFRWhTL4gnyB8gRxlf4RZ
         TUMHE8Mn2sJLrtJACfTiIpWuu16ScoTg8kYN0Pj/WcIfeCMHOKWdbI3fDuByy+YVu/kS
         lRT/vD0+/cV5YkIm/9KOfRgl4IoXl7B+M9UVylz7zgwkRjXsq+2DkEwqDmGT/w0JH//+
         a1jg==
X-Forwarded-Encrypted: i=1; AJvYcCUKJ8PiLsC7HgkoPjLpKYfk2lcFW9fZax/eQ+JD+UCBPWLFoA9wUjjSXOQxUnZ1/QduCPAyoWMV/52s@vger.kernel.org, AJvYcCV9I+ropHpRJLequty7FT9MRfmexxj86HGQlGBiuTmDPiWfPcaO1fF0pLIDWbQBhdP1l+I4E+vwlJr0fRxJDKbz8LU=@vger.kernel.org, AJvYcCX5eCtjQmj7yE198JbnZgaDJ/gFjlnGP1Pcs3OXrn2fERQ+cUTp54wGrIj8xd1GL+1Oc4ynmQVL@vger.kernel.org, AJvYcCXF7bUg6KRZ4r3X1NJsAY0a4L2yYbxxWj8eoURXf/KuF5Kq4mlmuTMQwNsgOrhortfHCkR1r9YK3uKFV6zr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmo2x7m+L2T37tyLCJQUwRFzExJH1F+GUfeZXzXFFBUd9eBo4U
	F/bgr57gnD/tAQlbrPDJRbn6AXJfGAfEpqBnGM19OBnGtTUQCazltDD4eywob5oqAYRnwJQdw1q
	uUw7o5pkIFRthu1C/sMlen9OxV0rVFeU=
X-Gm-Gg: ASbGncs9W4SblpcvtC5/prxTc4SMPBO+fdSVPxDPzm2TnsT3n3Oir28/dMgjNIy77xn
	4H/+CqubakoUTi7JmdBlfYv2MzWNrbVKzN4Jqxi/dxwVXZSCQ8zQaKwtLE9/C1fccVMQWZo7ayM
	oyudk9Mv85JMsCH3ABhXaPbk0deu3XPcPeda9hw9hFu/0ER970JDgNZXvGAhc7APbuaH74kdHKq
	Mrq5rvMjdkRLFMqRFoabKWfT0g8Uqb5seQQKOUmuh/uVsloOm8=
X-Google-Smtp-Source: AGHT+IHO+sVlMfx8QSa3E+jJFs1XKq77eH6sT+Oi/0M3FytKmT7dw3Vd7isDjyUaRs4YzytFZXWn/W7miK4fa9ZB2ws=
X-Received: by 2002:a17:907:968c:b0:b04:36e3:c077 with SMTP id
 a640c23a62f3a-b0436e3c5c7mr610057766b.22.1756828055502; Tue, 02 Sep 2025
 08:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250902-gainful-meerkat-of-prestige-dd4952@kuoka>
In-Reply-To: <20250902-gainful-meerkat-of-prestige-dd4952@kuoka>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:47:09 +0100
X-Gm-Features: Ac12FXyetOJaltGA4R1b5ReNmp3InDleaQQESJFgb0N2JVhr0jmjLXveZ2CLraE
Message-ID: <CA+V-a8up6WfMzRCig=HCaU_QbC63FPCXyk1ZgJrNkGj+FsRbKA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Tue, Sep 2, 2025 at 10:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 02, 2025 at 01:13:00AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> > (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> > identical to that found on the RZ/T2H SoC.
> >
> > While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> > DesignWare MAC (version 5.20), the hardware is synthesized with differe=
nt
> > options compared to the RZ/V2H(P):
> >   - RZ/T2H requires only 3 clocks instead of 7
> >   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
> >   - RZ/T2H needs 2 reset controls with reset-names property, vs. a sing=
le
> >     unnamed reset
> >   - RZ/T2H has the split header feature enabled, while it is disabled o=
n
> >     RZ/V2H(P)
> >
> > To accommodate these differences, introduce a new generic compatible
> > string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> > RZ/N2H SoCs.
> >
> > The DT schema is updated to validate the clocks, resets, reset-names,
> > interrupts, and interrupt-names properties accordingly. Also extend
> > `snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  2 files changed, 138 insertions(+), 40 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.=
yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> > index 23e39bcea96b..e01763389164 100644
> > --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> > +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> > @@ -17,63 +17,112 @@ select:
> >            - renesas,r9a09g047-gbeth
> >            - renesas,r9a09g056-gbeth
> >            - renesas,r9a09g057-gbeth
> > +          - renesas,r9a09g077-gbeth
> > +          - renesas,r9a09g087-gbeth
> >            - renesas,rzv2h-gbeth
> >    required:
> >      - compatible
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,r9a09g047-gbeth # RZ/G3E
> > -          - renesas,r9a09g056-gbeth # RZ/V2N
> > -          - renesas,r9a09g057-gbeth # RZ/V2H(P)
> > -      - const: renesas,rzv2h-gbeth
> > -      - const: snps,dwmac-5.20
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g047-gbeth # RZ/G3E
> > +              - renesas,r9a09g056-gbeth # RZ/V2N
> > +              - renesas,r9a09g057-gbeth # RZ/V2H(P)
> > +          - const: renesas,rzv2h-gbeth
> > +          - const: snps,dwmac-5.20
> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g077-gbeth # RZ/T2H
> > +              - renesas,r9a09g087-gbeth # RZ/N2H
> > +          - const: renesas,rzt2h-gbeth
> > +          - const: snps,dwmac-5.20
> >
> >    reg:
> >      maxItems: 1
> >
> >    clocks:
> > -    items:
> > -      - description: CSR clock
> > -      - description: AXI system clock
> > -      - description: PTP clock
> > -      - description: TX clock
> > -      - description: RX clock
> > -      - description: TX clock phase-shifted by 180 degrees
> > -      - description: RX clock phase-shifted by 180 degrees
> > +    oneOf:
> > +      - items:
> > +          - description: CSR clock
> > +          - description: AXI system clock
> > +          - description: PTP clock
> > +          - description: TX clock
> > +          - description: RX clock
> > +          - description: TX clock phase-shifted by 180 degrees
> > +          - description: RX clock phase-shifted by 180 degrees
> > +
>
> Drop blank line
>
OK.

> > +      - items:
> > +          - description: CSR clock
> > +          - description: AXI system clock
> > +          - description: TX clock
> >
> >    clock-names:
> > -    items:
> > -      - const: stmmaceth
> > -      - const: pclk
> > -      - const: ptp_ref
> > -      - const: tx
> > -      - const: rx
> > -      - const: tx-180
> > -      - const: rx-180
> > -
> > -  interrupts:
> > -    minItems: 11
> > +    oneOf:
> > +      - items:
> > +          - const: stmmaceth
> > +          - const: pclk
> > +          - const: ptp_ref
> > +          - const: tx
> > +          - const: rx
> > +          - const: tx-180
> > +          - const: rx-180
> > +
>
> Drop blank line
>
OK.

> > +      - items:
> > +          - const: stmmaceth
> > +          - const: pclk
> > +          - const: tx
> > +
> >
>
> Just one blank line
>
OK.

> >    interrupt-names:
> > -    items:
> > -      - const: macirq
> > -      - const: eth_wake_irq
> > -      - const: eth_lpi
> > -      - const: rx-queue-0
> > -      - const: rx-queue-1
> > -      - const: rx-queue-2
> > -      - const: rx-queue-3
> > -      - const: tx-queue-0
> > -      - const: tx-queue-1
> > -      - const: tx-queue-2
> > -      - const: tx-queue-3
> > +    oneOf:
> > +      - items:
> > +          - const: macirq
> > +          - const: eth_wake_irq
> > +          - const: eth_lpi
> > +          - const: rx-queue-0
> > +          - const: rx-queue-1
> > +          - const: rx-queue-2
> > +          - const: rx-queue-3
> > +          - const: tx-queue-0
> > +          - const: tx-queue-1
> > +          - const: tx-queue-2
> > +          - const: tx-queue-3
> > +
> > +      - items:
> > +          - const: macirq
> > +          - const: eth_wake_irq
> > +          - const: eth_lpi
> > +          - const: rx-queue-0
> > +          - const: rx-queue-1
> > +          - const: rx-queue-2
> > +          - const: rx-queue-3
> > +          - const: rx-queue-4
> > +          - const: rx-queue-5
> > +          - const: rx-queue-6
> > +          - const: rx-queue-7
> > +          - const: tx-queue-0
> > +          - const: tx-queue-1
> > +          - const: tx-queue-2
> > +          - const: tx-queue-3
> > +          - const: tx-queue-4
> > +          - const: tx-queue-5
> > +          - const: tx-queue-6
> > +          - const: tx-queue-7
> >
> >    resets:
> > -    items:
> > -      - description: AXI power-on system reset
> > +    oneOf:
> > +      - items:
> > +          - description: AXI power-on system reset
> > +
> > +      - items:
> > +          - description: GMAC stmmaceth reset
>
> That's the same as before, no?
>
Yes, I will update it.

> > +          - description: AHB reset
> > +
> > +  reset-names: true
>
> Does not look needed.
>
Agreed, I will drop it.

Cheers,
Prabhakar

