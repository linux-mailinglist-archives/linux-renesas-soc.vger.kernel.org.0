Return-Path: <linux-renesas-soc+bounces-25546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D50CA2BA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 09:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3D54304EB4D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 08:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F7831D36D;
	Thu,  4 Dec 2025 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwMckvU1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDC31B81C;
	Thu,  4 Dec 2025 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764835247; cv=none; b=mo6qVLRZvQWX315pFdY1KC/rhzvgYW6UaaBH6JVaG9TIATL/co5AbJmCBygLIP6RDTSE/akIP1KpImABG9Coi2Rc6y9lIXYXjOz8oAPrmU4VmfeehAI51PPH0exkKJOCnbt810l8q2zR+QycpUqROUkWz0GEUGa+44XgdeDYWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764835247; c=relaxed/simple;
	bh=CFQx3rXkbEzKJUIuFYShbGvPaG+LRVxfOYcv/eN7ngQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzYmWrntcQfOi5BIsBWK4v47BXZZTiW3ld/bMtlWkMyD2e5RbXIISZZgn5oZX+52umweixXEWq2TI4EZ0vHeP4vPA0/X0qsXU+5yEx/MY5i2e2lMX4yJQviuA/brQ8ByD+u3HG9H961GvVJlLd7SMC9H/pPbi8sBo4XbTBiPc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwMckvU1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CEAC4CEFB;
	Thu,  4 Dec 2025 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835245;
	bh=CFQx3rXkbEzKJUIuFYShbGvPaG+LRVxfOYcv/eN7ngQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwMckvU1sONffoqSgHqR1UaZ44C3ikVgO5OUHM5KjWo9oAJLajhJtaHrJcThB4rJc
	 AvuuoZUinIfbcrdfFZrCn/TnkZZdXoly5KI7Z56QDmumic5FPmxc2E0nYS9NUd9Sb0
	 H2YB0yH6vZfFjQ02mb6E0Un+luRYxy1Db1UiE4mZXGQa8utipeR1PcXKcSdJ4L4mu3
	 ayZDhjbmJ2bGbwHHBeskutG2APeF4kt5Czf3L2Gukkf1Es2/Apj8fe38le7Iq3k6RA
	 hWO+GzHtTcU7WkkDlcURyofT+1y5kAeR8+rKQMWeu5bwkhiYwtcVlyk9/P4PkGl7jl
	 rC3cEvINVUycg==
Date: Thu, 4 Dec 2025 09:00:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	"biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	wsa+renesas <wsa+renesas@sang-engineering.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Message-ID: <20251204-lovely-cooperative-frog-28addf@quoll>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
 <20251129164325.209213-2-biju.das.jz@bp.renesas.com>
 <176443699313.11808.1467058497468917565.robh@kernel.org>
 <TY3PR01MB11346C9A7B587AF03D533AC9E86D9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346C9A7B587AF03D533AC9E86D9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Wed, Dec 03, 2025 at 08:13:13AM +0000, Biju Das wrote:
> Hi Rob,
> 
> > -----Original Message-----
> > From: Rob Herring (Arm) <robh@kernel.org>
> > Sent: 29 November 2025 17:23
> > Subject: Re: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document RZ/G3E support
> > 
> > 
> > On Sat, 29 Nov 2025 16:42:57 +0000, Biju wrote:
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
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-
> > sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-
> > sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-
> > sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-
> > sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-
> > sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-
> > sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-
> > sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-
> > sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > 
> 
> Can you please check, bot is showing unrelated errors?

Because the base was broken by thermal patch. Original issue was fixed by
Rob, although of course the bot might need to pause when the base is
broken :(

Best regards,
Krzysztof


