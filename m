Return-Path: <linux-renesas-soc+bounces-6686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8BA914DC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 14:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADB3F1C225A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 12:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2367C13D2B8;
	Mon, 24 Jun 2024 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvhOMY99"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFD913D283;
	Mon, 24 Jun 2024 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719233750; cv=none; b=ZjFNWi2+gi7As/GFP5h2NQErx2RHze5iA62Ck7jQhLBM+dNVYZaZE8LLvBkGP/uYY54H9uk34sC0/zY/gblr3PspvodFb2w0VTPltgAfdV94dMmkT0JQPmbvVyh7csQ+AyWDLWv1Bdm4dNOKi9WGrCWMeVvJ/K2ZyBOtTFwto2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719233750; c=relaxed/simple;
	bh=bxMvkRh05jPUoSJrdFv+XYH3Fi1aGCJ/Un0LUaZ8sLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8goI/EvRer/NIzhuhX5r+ATdZz2zQQWgs/45y5JZQamHYyZUF442OZUEiaj2O2bfYkQT95QQoJStn5xfUtSK4FoNUPZ2j2Yk973jLztq2Fve4InpCcJGO69YsbbZV0FQBw/cEhyoNs/2/+cOJ3uwP9oiK05uq1RZenXAXiXwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvhOMY99; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6460C2BBFC;
	Mon, 24 Jun 2024 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719233749;
	bh=bxMvkRh05jPUoSJrdFv+XYH3Fi1aGCJ/Un0LUaZ8sLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YvhOMY993uzdeQhyvNlhGgCHx/zIu5M22R2cTDmCG51GwmhJrB3b0beL7jHhrmlQN
	 orsD/hvVO1AdNdie6fdqB2VV2jl3zwN3fDVIUWs8oQM7Q5VOcBI12bS5MLPptNJmTx
	 dgfIPyzPBXFFF1dfe8T3dyYICSY3bKrFkX1fSgcMcssI2SKI/uIfutEyfLwQZww6Z/
	 bbt+jJprJ13j4+wSOWKLoDAlY08A/J+5x24n3aB1rvhY6aL0WYIebbkq9eibu48sM2
	 FtSCz5JnOy1Mwi6cav0SPsYKSi+cBj5r52TYb0uIP9oZxjHMEf4VYc85hPqL2Ysirq
	 o/qCzYnGRGC9A==
Date: Mon, 24 Jun 2024 13:55:44 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: tmio: Remove obsolete .set_clk_div() callback
Message-ID: <20240624125544.GV1318296@google.com>
References: <cover.1718897545.git.geert+renesas@glider.be>
 <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
 <20240620170814.GW3029315@google.com>
 <CAMuHMdVdTusWYK0cD_Ez5bv21iKVF2MOT24+_VR+94W3iqDK5A@mail.gmail.com>
 <20240624104651.GO1318296@google.com>
 <CAMuHMdXHDHF5guDk1hUajBCX5Y1JyPUXBmWz+KpPzcNn7pA-4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXHDHF5guDk1hUajBCX5Y1JyPUXBmWz+KpPzcNn7pA-4A@mail.gmail.com>

On Mon, 24 Jun 2024, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Mon, Jun 24, 2024 at 12:46 PM Lee Jones <lee@kernel.org> wrote:
> > On Mon, 24 Jun 2024, Geert Uytterhoeven wrote:
> > > On Thu, Jun 20, 2024 at 7:08 PM Lee Jones <lee@kernel.org> wrote:
> > > > On Thu, 20 Jun 2024, Geert Uytterhoeven wrote:
> > > > > Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the last
> > > > > user of the .set_clk_div() callback in the tmio_mmc_data structure.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > >  include/linux/mfd/tmio.h | 1 -
> > > > >  1 file changed, 1 deletion(-)
> > > > >
> > > > > diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> > > > > index eace8ea6cda05a3d..aca74ac1ff69e6f7 100644
> > > > > --- a/include/linux/mfd/tmio.h
> > > > > +++ b/include/linux/mfd/tmio.h
> > > > > @@ -101,7 +101,6 @@ struct tmio_mmc_data {
> > > > >       unsigned int                    max_blk_count;
> > > > >       unsigned short                  max_segs;
> > > > >       void (*set_pwr)(struct platform_device *host, int state);
> > > > > -     void (*set_clk_div)(struct platform_device *host, int state);
> > > >
> > > > Any ramifications for just hoovering this up?
> > >
> > > I am sorry, I am not familiar with that expression.
> > > Can you please elaborate?
> > > Thanks!
> >
> > If I take _only_ this patch and leave the MMC one, will something break?
> 
> No, nothing will break.
> 
> It will just (a) make it a tad more difficult to apply the second patch
> to the MMC tree, as it has a contextual dependency on the first patch,
> and (b) cause a merge conflict for linux-next and Linus later...
> Perhaps it would be easier to just provide an Acked-by, like you have
> already done for the second patch?

Considering this is only a one-liner, this should be okay.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

