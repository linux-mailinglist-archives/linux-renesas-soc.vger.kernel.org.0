Return-Path: <linux-renesas-soc+bounces-1661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6DC836CB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 18:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DDDD1C25598
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731633EA97;
	Mon, 22 Jan 2024 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO8HccBY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AF53EA8A;
	Mon, 22 Jan 2024 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705939463; cv=none; b=NcrSzmGapqYey+CK7KrT+KLORfWyAjzHx4RVWB/uvDNuHHmztOQeepefAbZcG6d316WNNHNd7KzA0Lq/wuYvWLpxz95NsErEvWE3jyyMjfHuzhpr9kTxsjaID5PS8sb+dSFb2HpH3YifyafQy8Pa621zVVBTkfqnPnbD5u5eXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705939463; c=relaxed/simple;
	bh=qLSgpbBBjjg35owhN/n1BlJHspH8+vAvlKmDPma2+BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsX+Vvj2J/cGARBs7VKH4mCCJYW1Vz2al6YyimPnuGj8bfOEtnkUNjiazMtaG1wxFyxkMXZMo3fokLyYYfpvgPtOw0vjkKhBBRS529Rkcc0Txjfy35C8bazWcsbwEnq4j0J7aVmNDRu/GiRtJK3Tk7A9X64Jyu/yagKMOKYgbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO8HccBY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9465AC433F1;
	Mon, 22 Jan 2024 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705939462;
	bh=qLSgpbBBjjg35owhN/n1BlJHspH8+vAvlKmDPma2+BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YO8HccBYFKH8Refu6bMmvbllXSeC0OF/Efvh/rVL0L6W9YV0Fqse3g36Jhh8enxa8
	 avDc+ZvDTR4gXd4Apqd93gGxsC2E73xQanifhYh4+ovSHe5/cfNIePcaJFo8vtW8Rd
	 UwJuxO3+dKAumwrow+VsBmGMHfTk0Nc9IzdxyY6rdeTY4nOE3HbIWOGbn7VhqlX3E8
	 kByuuqEcUtCdrm6Xn+t7eTC/QbXzmdmR6h8OkeENMFm+oGRu0AsUurZSZT4ou9l7yU
	 Ts34s+romNCTlZefwEMLKEIYUdIWuAEh7IOdaH0cgG4ezmgEzNadC15vpqMUXPyiTx
	 H6fKjzHZP1ZvA==
Date: Mon, 22 Jan 2024 10:04:20 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Aymeric Aillet <aymeric.aillet@iot.bzh>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH v5 resend 0/4] drivers: clk: renesas: ignore all clocks
 which are assigned to non-Linux system
Message-ID: <20240122160420.GE601827-robh@kernel.org>
References: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV1GLYZGn_TgYbxfPakkLpUNTsP5hsEk9tUqLzpb5wOdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV1GLYZGn_TgYbxfPakkLpUNTsP5hsEk9tUqLzpb5wOdQ@mail.gmail.com>

On Fri, Jan 12, 2024 at 03:21:41PM +0100, Geert Uytterhoeven wrote:
> Hi Morimoto-san, Rob,
> 
> On Wed, Jan 10, 2024 at 2:14 AM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > This is v5 resend of ignoring non Linux system assinged device.
> 
> Thanks for the update!
> 
> > v5 resend
> >         - add Acked-by from Rob
> 
> You mean Reviewed-by?
> With an Acked-by, I wouldn't have to ask the next question ;-)
> 
> Rob: How to proceed:
>   1. I give my Acked-by, you merge the series?
>   2. You give your Acked-by, I merge the series?
>   3. We do the immutable branch dance?
>        a. You apply 1-3 to an immutable branch
>        b. I merge the immutable branch and apply 4.
> 
> You get to choose, as there are more DT than renesas-clk patches ;-)

You can take it. I don't give Reviewed-by nor Acked-by if I plan to 
apply it.

Rob

