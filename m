Return-Path: <linux-renesas-soc+bounces-7193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF292B3E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 11:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F380B22B36
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 09:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B9E153804;
	Tue,  9 Jul 2024 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5HEUZ47"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC7136657;
	Tue,  9 Jul 2024 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517617; cv=none; b=Joj8vjtXj0UE0utQpqxDmxes1QYuJXpAf1ZPQ09yZUCp1WanOvt3DO+pCxnvD6WERdckNbPEE1x8DqnPQ5Q/tPjZEqvFToi3hH/Zpw2ZrRcr598trC3kz7eXI3qUGzEhzcD8S8qfCdymXPsss/her1zm0oZ741HliXXLl1YG0ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517617; c=relaxed/simple;
	bh=OG0iT8EGH218BuMSqUrA0G08/WrtG0mn2OrXecjDaeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RissicrEHmiMyPGFS8b3NIwdn+HUBH+glZxxA5EDt1n/uQGt3Wqmh82jmCIgJ2SzRK1QLJvaFjnloKHVEgGV5PlmWA9H+68hMygdlnkzbNwFdlAXFpwjxXtZyP7QFV948D+dJxdyNO9XCC5k9gMqI3o0n3OvHujXJS3EGtp/ttY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5HEUZ47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353DCC3277B;
	Tue,  9 Jul 2024 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517616;
	bh=OG0iT8EGH218BuMSqUrA0G08/WrtG0mn2OrXecjDaeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5HEUZ47WK9+RACJAlO1OWT7ISoJlbNy252GiK2GUEP6dOlepkIPwbX+3JIc+hS4+
	 OxRg1Qjid4tSWs4oR3SktBAYPvpCPiS6knMl3XXBiBMrcCQa8c3X+zGYfubdY2Krwk
	 rseLLfmaVBu6s2lMZIjiVGjO7GlacPMrMn8wRzEhQHKeWhvok6EYnkUOaoNX5nPen5
	 41aBoBnaax4uu/KlaonMIjuUw2GlkZgsTPCZKtvjfITyrmfXXIy7aAIZc4Rvuwu7vp
	 8xe3FF0WctbzDHNxySE5E1t4uXDKRQEHecB/vU60O/BOxRPoHd64CIqen1JlZTJBBX
	 5L3O8BED5x6iw==
Date: Tue, 9 Jul 2024 10:33:32 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 0/6] mfd: tmio: simplify header and move to
 platform_data
Message-ID: <20240709093332.GD501857@google.com>
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
 <170870160052.1698319.4712751560931025638.b4-ty@kernel.org>
 <Zooqfe1sJQsvltwj@shikoro>
 <CAMuHMdU6OquhF_WRxD+YxRfJwASepOb-pJp3wT7bvcpb1PHLDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU6OquhF_WRxD+YxRfJwASepOb-pJp3wT7bvcpb1PHLDQ@mail.gmail.com>

On Sun, 07 Jul 2024, Geert Uytterhoeven wrote:

> On Sun, Jul 7, 2024 at 7:41 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > On Fri, Feb 23, 2024 at 03:20:00PM +0000, Lee Jones wrote:
> > > On Tue, 13 Feb 2024 23:02:19 +0100, Wolfram Sang wrote:
> > > > Changes since v1:
> > > >
> > > > * rebased to rc4
> > > > * collected all needed acks (Thanks!)
> > > > * capitalized first letter in commit subject
> > > >
> > > > The MFD parts of the TMIO have been removed by Arnd, so that only the
> > > > SD/MMC related functionality is left. Remove the outdated remains in the
> > > > public header file and then move it to platform_data as the data is now
> > > > specific for the SD/MMC part.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/6] mfd: tmio: Remove obsolete platform_data
> > >       commit: 58d6d15662e4039fab7d786f0426843befa77ad4
> > > [2/6] mfd: tmio: Remove obsolete io accessors
> > >       commit: e927d7bac109d8ca1729dda47a8dbc220efdb50e
> > > [3/6] mmc: tmio/sdhi: Fix includes
> > >       commit: bed05c68aa8f078206143700cd37e42a0084155f
> > > [4/6] mfd: tmio: Update include files
> > >       commit: 3ef94c41db82573dc1e1dd6c259aec8ef6caaaf3
> > > [5/6] mfd: tmio: Sanitize comments
> > >       commit: 2d417dda59123b9523a19ce75fea3fd1056c3b4c
> > > [6/6] mfd: tmio: Move header to platform_data
> > >       commit: 858b29729c9d319b9cd1441646cc3af246d3c3f9
> >
> > This series is not upstream yet?
> 
> FTR, it entered linux-next in next-20240402, but disappeared after
> next-20240510.

That's very odd.  I cannot explain that.

I'll go apply it again.  Sorry for this.

-- 
Lee Jones [李琼斯]

