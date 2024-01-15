Return-Path: <linux-renesas-soc+bounces-1590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9482DE24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 18:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A4FB1C21DB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 17:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C9D17C6A;
	Mon, 15 Jan 2024 17:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oVwAVo5/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F6017C61;
	Mon, 15 Jan 2024 17:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4BF6326;
	Mon, 15 Jan 2024 18:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705338415;
	bh=uwLriwGBwVqO+vIJmWA62zXQ9unh/1idFNknbmZDxdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVwAVo5/G8XYNZl4mOZD2oAS8pK8lDrySsWleTwgGo8iWg2oZWrOdhSPzjr4cdTBp
	 GjhD/Efh0ly7Lpk2oJadrQ6MSf9RSlp6xFEU8/bK25JTkuJ0wxo9JnN1C672+V9MdN
	 lky+IvCUGq7n/aDIJoC7tQTyhgj9yPCFfNXIMUhc=
Date: Mon, 15 Jan 2024 19:08:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document input capture
 interrupt
Message-ID: <20240115170807.GJ5869@pendragon.ideasonboard.com>
References: <fb1e38c93e62221f94304edd980a2fb79c1f2995.1705325608.git.geert+renesas@glider.be>
 <20240115-wages-secluded-b44f4eb13323@spud>
 <CAMuHMdWY3D45NGHvGXSZRLZz4TyCRgRCQLZV6CzYs=mSFcherw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWY3D45NGHvGXSZRLZz4TyCRgRCQLZV6CzYs=mSFcherw@mail.gmail.com>

On Mon, Jan 15, 2024 at 05:48:18PM +0100, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Mon, Jan 15, 2024 at 5:13 PM Conor Dooley <conor@kernel.org> wrote:
> > On Mon, Jan 15, 2024 at 02:45:39PM +0100, Geert Uytterhoeven wrote:
> > > Some Timer Unit (TMU) instances with 3 channels support a fourth
> > > interrupt: an input capture interrupt for the third channel.
> > >
> > > While at it, document the meaning of the four interrupts, and add
> > > "interrupt-names" for clarity.
> > >
> > > Update the example to match reality.
> > >
> > > Inspired by a patch by Yoshinori Sato for SH.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> > > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> > > @@ -46,7 +46,19 @@ properties:
> > >
> > >    interrupts:
> > >      minItems: 2
> > > -    maxItems: 3
> > > +    items:
> > > +      - description: Underflow interrupt 0
> > > +      - description: Underflow interrupt 1
> > > +      - description: Underflow interrupt 2
> > > +      - description: Input capture interrupt 2
> >
> > Seeing "input capture interrupt 2" makes me wonder, are there two (or
> > more!) other input capture interrupts that are still out there,
> > undocumented, and looking for a home?

Maybe writing this as

      - description: Underflow interrupt, channel 0
      - description: Underflow interrupt, channel 1
      - description: Underflow interrupt, channel 2
      - description: Input capture interrupt, channel 2

would make it clearer ?

I'm also wondering if we really need to add interrupt-names. Drivers
can't depend on the names due to backward compatibility, what benefit
does it bring to add them to the bindings ?

> SoCs can have multiple TMU instances.
> Each TMU instance has 2 or 3 timer channels.
> Each timer channel has an underflow interrupt.
> Only the third channel may have an optional input capture interrupt
> (which is not supported yet by the Linux driver).
> Hence each instance can have 2, 3, or 4 interrupts.
> 
> See "RZ/G Series, 2nd Generation User's Manual: Hardware"[1],
> Section 69 ("Timer Unit (TMU)":
>   - Figure 69.2: Block Diagram of TMU,
>   - Section 69: Interrupt
> 
> Note that the documentation uses a monotonic increasing numbering
> of the channels, across all instances.
> 
> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2h-ultra-high-performance-microprocessors-quad-core-arm-cortex-a57-and-quad-core-arm-cortex-a53-cpus-3d

-- 
Regards,

Laurent Pinchart

