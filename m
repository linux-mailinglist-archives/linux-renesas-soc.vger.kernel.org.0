Return-Path: <linux-renesas-soc+bounces-12039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F01A08F8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 12:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6D5161FD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 11:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B715820B215;
	Fri, 10 Jan 2025 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tevw5jgZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E01F5435;
	Fri, 10 Jan 2025 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736508965; cv=none; b=mEyeMnPee8tDfcFyLriT4V1ytQtk5DOnst5TQYhEDF4seI5Hp6BYs+Ciweg1tM3Diub8KlVM0FicYp1+0xUnyjJJ4BcqZQvymI+lIbR20Ag6W3hyQ8etjisjK4FhFLHL0rqrwZpPMVZaFhyM4i0Mcxjlm3tf55fWgh7uN8zA834=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736508965; c=relaxed/simple;
	bh=kwC+vuxIyyNJprbjpHkXY2NNAC/jFXJ9EGCU+TXHnN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fG/zULkY/wHdUae0Qi6jol8hU2+pLHjtFSlteLOcPKtsXTq0rjzTv0p/4qvOf8VffQyv7z1xhgMlgvbQm1ydyUuYgYWrTXy0irNsGNPvfaZqMwE8JA6eo+rC3uZhDqBuzXwVrnjvLzrTilUrI9QAKu+xjyWjUwJRuZhlUwQtgm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tevw5jgZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00A53641;
	Fri, 10 Jan 2025 12:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736508908;
	bh=kwC+vuxIyyNJprbjpHkXY2NNAC/jFXJ9EGCU+TXHnN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tevw5jgZuL9lGj20UrL6TT3Yi6ippAnnimR2EDi8zLFm2aYDySg0NW7JmxC4OrVON
	 9SVPRA4um0V346wQrCInwwuXdlNZRKM6uCWp9hzvIbDebDMGrNY/cOnTt/UM89qN/7
	 CRRQxzRv3P2Ha6QX4I4CJhdBLu/sRStXXgv8sDS0=
Date: Fri, 10 Jan 2025 12:35:58 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add FCPVX instances
Message-ID: <yszbtnmghspdxwdsv2bhoaej3hooo4ck52moirnmqtnfazpk6u@wwbdjqquwyzb>
References: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se>
 <20250109125433.2402045-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW1D=o8aaPOAQLPEZw-Y-9MVzzCRGEykEU=39CYeuRW2A@mail.gmail.com>
 <20250110105833.GC308750@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250110105833.GC308750@ragnatech.se>

On Fri, Jan 10, 2025 at 11:58:33AM +0100, Niklas Söderlund wrote:
> Hi Geert,
>
> Thanks for your review.
>
> On 2025-01-10 11:44:21 +0100, Geert Uytterhoeven wrote:
> > Hi Niklas,
> >
> > On Thu, Jan 9, 2025 at 1:55 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Add device nodes for the FCPVX instances on R-Car V3U.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.15.
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > > @@ -2890,6 +2890,42 @@ port@1 {
> > >                         };
> > >                 };
> > >
> > > +               fcpvx0: fcp@fedb0000 {
> >
> > I think it makes sense to move these next to the existing fcp nodes.
> > If you agree, I can do that while applying.
>
> The rational here was I sorted it based on addresses, but I'm fine
> either way. If you can fix this when applying I would be grateful,
> thanks!
>
> Same for patch 2/2.
>

Just a note: for r8a779g0 I sorted the VSPX nodes by unit address
as well.

> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
>
> --
> Kind Regards,
> Niklas Söderlund

