Return-Path: <linux-renesas-soc+bounces-25684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B3CB0E56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Dec 2025 20:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2190A301CF90
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Dec 2025 19:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9348630147D;
	Tue,  9 Dec 2025 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUs7MWCk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617C3230BF6;
	Tue,  9 Dec 2025 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765306977; cv=none; b=YEXajh59XnKfzsMNhmiSpUdDzRdJkeNkVqdhK/tnk1UBYTd92um1ZGWaJVXN6u7L8UX1NSFAL+EgKlZPQUmHQOllc4g7K+n78sTPLUj+/XztBTdok1xYKcpVM3JgCvwbdC+FnboqHgIp7jj/Us+4exDK0H0qs8cz1/6NFnmBEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765306977; c=relaxed/simple;
	bh=W91mDGUT+fVf9qRNx5z3Rn1jWIavo7jjER0IHtDfaGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H68aiH5yIc5YOBXFZVAwXPteQev38owBenoM6Y1ggorWCWnPKGwEDgYhY9RklO+fKlFfx+FXKFARS7sz75ijRuFe9AoQeToPw44WPZMhDKiK5EOXjkfcuYQQz5FAcEd48hk0zWPGo4QGZ8ABELxioeiXyxvw8yYeso7P5c6ERA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUs7MWCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF9FC4CEF5;
	Tue,  9 Dec 2025 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765306977;
	bh=W91mDGUT+fVf9qRNx5z3Rn1jWIavo7jjER0IHtDfaGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUs7MWCk/mgmeAjt/M+LpQhfnJK53kNxpTFrfc0e4SOxrml9aElCYQ9OlcqdNpvVj
	 09Qagkgv3BsbZFn1n8/4JCIOY70wvwfhBKyVZ8cHthTRobQ9aiJNyBhWnUeROtLeha
	 m8CUIeIdvhaqZzfq8E34RgIcFq/pduCnNqoEw+3oR4yRtLYyiH41lQJLC5ByV4GS1H
	 tDW97z1HD5rI8Jbn2+QvyfTWnMKAjG1h+PYu/N08IqgKmEheDw0FznIdjTWpYTbOEz
	 lt9+u+pTrjX0tPn8osIm6ftZGx1UbX20bDWGIRmeHF66f4+BxG0616Q0rpWdFLVTX/
	 YdsGY99N6XgkA==
Date: Tue, 9 Dec 2025 13:02:54 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"biju.das.au" <biju.das.au@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Message-ID: <20251209190254.GA927812-robh@kernel.org>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
 <20251129164325.209213-2-biju.das.jz@bp.renesas.com>
 <20251204-cute-slim-husky-aa4dc4@quoll>
 <TY3PR01MB11346AB991A69C28F3D7D512286A6A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346AB991A69C28F3D7D512286A6A@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Thu, Dec 04, 2025 at 08:23:06AM +0000, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: 04 December 2025 08:03
> > Subject: Re: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document RZ/G3E support
> > 
> > On Sat, Nov 29, 2025 at 04:42:57PM +0000, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add documentation for the serial communication interface (RSCI) found
> > > on the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is
> > > identical to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage
> > > FIFO compared to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode
> > > operation. RZ/G3E has 6 clocks(5 module clocks + 1 external clock)
> > > compared to 3 clocks
> > > (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.
> > > It has 6 interrupts compared to 4 on RZ/T2H.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v4->v5:
> > >  * Updated commit description related to IRQ difference
> > >  * Added aed and bfd irqs for RZ/G3E.
> > >  * Moved reset: false to RZ/T2H SoC and dropped the else part for RZ/G3E.
> > >  * Updated conditional schema with interrupts and interrupts-names.
> > >  * Dropped the tag as there are new changes.
> > > v3->v4:
> > >  * Dropped separate compatible for non-FIFO mode and instead using single
> > >    compatible "renesas,r9a09g047-rsci" as non-FIFO mode can be achieved
> > >    by software configuration.
> > >  * Renamed clock-names bus->pclk
> > >  * Rearranged clock-names tclk{4, 16, 64}
> > >  * Retained the tag as the changes are trivial.
> > > v2->v3:
> > >  * Dropped 1st and 3rd items from clk-names and added minItems for the
> > >    range.
> > >  * Added minItems for clk and clk-names for RZ/T2H as the range is 2-3
> > >  * Added maxItems for clk and clk-names for RZ/G3E as the range is 5-6
> > >  * Retained the tag as it is trivial change.
> > > v1->v2:
> > >  * Updated commit message
> > >  * Added resets:false for non RZ/G3E SoCs.
> > > ---
> > >  .../bindings/serial/renesas,rsci.yaml         | 99 ++++++++++++++++---
> > >  1 file changed, 88 insertions(+), 11 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > > b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > > index 6b1f827a335b..1f8cee8171de 100644
> > > --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > > @@ -10,46 +10,72 @@ maintainers:
> > >    - Geert Uytterhoeven <geert+renesas@glider.be>
> > >    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > -allOf:
> > > -  - $ref: serial.yaml#
> > > -
> > >  properties:
> > >    compatible:
> > >      oneOf:
> > > -      - items:
> > > -          - const: renesas,r9a09g087-rsci # RZ/N2H
> > > -          - const: renesas,r9a09g077-rsci # RZ/T2H
> > > +      - enum:
> > > +          - renesas,r9a09g047-rsci # RZ/G3E
> > > +          - renesas,r9a09g077-rsci # RZ/T2H
> > >
> > >        - items:
> > > +          - const: renesas,r9a09g087-rsci # RZ/N2H
> > >            - const: renesas,r9a09g077-rsci # RZ/T2H
> > >
> > >    reg:
> > >      maxItems: 1
> > >
> > >    interrupts:
> > > +    minItems: 4
> > >      items:
> > >        - description: Error interrupt
> > >        - description: Receive buffer full interrupt
> > >        - description: Transmit buffer empty interrupt
> > >        - description: Transmit end interrupt
> > > +      - description: Active edge detection interrupt
> > > +      - description: Break field detection interrupt
> > >
> > >    interrupt-names:
> > > +    minItems: 4
> > >      items:
> > >        - const: eri
> > >        - const: rxi
> > >        - const: txi
> > >        - const: tei
> > > +      - const: aed
> > > +      - const: bfd
> > >
> > >    clocks:
> > >      minItems: 2
> > > -    maxItems: 3
> > > +    maxItems: 6
> > >
> > >    clock-names:
> > > -    minItems: 2
> > > +    oneOf:
> > > +      - items:
> > > +          - const: operation
> > > +          - const: bus
> > > +          - const: sck # optional external clock input
> > > +
> > > +        minItems: 2
> > > +
> > > +      - items:
> > > +          - const: pclk

Isn't this still just 'bus'?

> > > +          - const: tclk

And 'operation'?

Sure, renaming would look nicer, but better to extend than just change 
the binding.

> > > +          - const: tclk_div4
> > > +          - const: tclk_div16
> > > +          - const: tclk_div64
> > > +          - const: sck # optional external clock input
> > > +
> > > +        minItems: 5
> > > +
> > > +  resets:
> > >      items:
> > > -      - const: operation
> > > -      - const: bus
> > > -      - const: sck # optional external clock input
> > > +      - description: Input for resetting the APB clock
> > > +      - description: Input for resetting TCLK
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: presetn
> > > +      - const: tresetn
> > 
> > You did not include lore links, so I cannot check whether we already talked about this (why you still
> > do not send big patchsets like this with b4?), but you are mixing here devices with completely
> > different innputs. This does not make the binding readable.
> 
> See the links.
> 
> https://lore.kernel.org/all/20251031000012.GA466250-robh@kernel.org/
> 
> https://lore.kernel.org/linux-renesas-soc/20251030-regroup-garter-c70c7fc6a71a@spud/
> 
> I use the below command to send the patches, is it wrong? I will try b4 next time.
> 
> git send-email --annotate *.patch
> 
> > 
> > Split the binding.
> 
> I can split the binding, if Rob/Conor/Geert is OK with it.
> 
> Ie, Always put per SoC changes in new dt bindings files to make it more readable without any complex if
> statements.

There's no hard rule. It's a judgement call. If the if/then schemas are 
longer than the main schema, then it is probably time for a split. The 
downside to splitting is then there's no motivation to keep resource 
names the same (and makes it harder to review that).

Rob

