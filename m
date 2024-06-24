Return-Path: <linux-renesas-soc+bounces-6681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DA9147CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 12:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442D428222B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 10:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3782B136E3F;
	Mon, 24 Jun 2024 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3924qSP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB01136E34;
	Mon, 24 Jun 2024 10:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719226017; cv=none; b=RarxlI6p8LBAumv/DIJ1AuA6nCqX0Pkzh+VbRBufCx2DDNYg2P7/oQfaYwYqmQQY83q5QS81eCRlmj6sRRDNCacA0MFOSTgaDb14vdVJx+mGQGVZqJH91J2rBWcyii8vhJVzLLFhaYsBJJspiie+1VUkDuNcy1RIQ72YarOWX2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719226017; c=relaxed/simple;
	bh=34AhcBrHk0/QA6Hts8/W9KxjxfUiCL56HuPt9Pbw1f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKQ92VrNAj92Lu+N0K7uqrTVFR04mN0HzSAxng67ydaNe2iQsrUr2NUQgvJb0Gw0XV0o9uPKg4lDGNdV7JMVT1/pDPyPa/SYNmqYGT4ym8+qALgijazRNQMDtA/TKzzeaz4/P9RDZpjxkAGMVZcHqO/7Bj9A83IPP9zSe1wBsWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3924qSP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4315C4AF0F;
	Mon, 24 Jun 2024 10:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719226016;
	bh=34AhcBrHk0/QA6Hts8/W9KxjxfUiCL56HuPt9Pbw1f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3924qSPlLqcApltriYgCh9/v1WYqiNWJMMLpx6tYfk6bZki6SZWjE2vl3KY9Ke8d
	 0TWnjOZPjdosnSZxVK5x4Le9Jc+Hxr79ISh+BPfp6kzf+1fwkkHmfJ4dU1Pm9eXV5I
	 2UG2XKLPb5B1JcYRPB4Z25qIa83LvEO8IWm/85Sa+eYgz3ccmXjDJYEc5MThcpfY2q
	 m+2v2xDKVUA2KR/n/vCgDVmD8h/1oBtusOUa4mVAqlKAEPBMH7qE+pe2l19sAvVkJD
	 URL4oNQpqHc4fGzhPAA0B/z6xSN5EGAQGvPSoX4+vXeX62DB735Glu60WsFE+/3g7L
	 s/8YVX5QyGCrQ==
Date: Mon, 24 Jun 2024 11:46:51 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: tmio: Remove obsolete .set_clk_div() callback
Message-ID: <20240624104651.GO1318296@google.com>
References: <cover.1718897545.git.geert+renesas@glider.be>
 <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
 <20240620170814.GW3029315@google.com>
 <CAMuHMdVdTusWYK0cD_Ez5bv21iKVF2MOT24+_VR+94W3iqDK5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVdTusWYK0cD_Ez5bv21iKVF2MOT24+_VR+94W3iqDK5A@mail.gmail.com>

On Mon, 24 Jun 2024, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Thu, Jun 20, 2024 at 7:08 PM Lee Jones <lee@kernel.org> wrote:
> > On Thu, 20 Jun 2024, Geert Uytterhoeven wrote:
> > > Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the last
> > > user of the .set_clk_div() callback in the tmio_mmc_data structure.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  include/linux/mfd/tmio.h | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> > > index eace8ea6cda05a3d..aca74ac1ff69e6f7 100644
> > > --- a/include/linux/mfd/tmio.h
> > > +++ b/include/linux/mfd/tmio.h
> > > @@ -101,7 +101,6 @@ struct tmio_mmc_data {
> > >       unsigned int                    max_blk_count;
> > >       unsigned short                  max_segs;
> > >       void (*set_pwr)(struct platform_device *host, int state);
> > > -     void (*set_clk_div)(struct platform_device *host, int state);
> >
> > Any ramifications for just hoovering this up?
> 
> I am sorry, I am not familiar with that expression.
> Can you please elaborate?
> Thanks!

If I take _only_ this patch and leave the MMC one, will something break?

-- 
Lee Jones [李琼斯]

