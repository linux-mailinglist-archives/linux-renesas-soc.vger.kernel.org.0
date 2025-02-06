Return-Path: <linux-renesas-soc+bounces-12916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215DA2ADC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 17:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4AAD188B855
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 16:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEFC236A81;
	Thu,  6 Feb 2025 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9Utx0If"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413C1F4199;
	Thu,  6 Feb 2025 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859402; cv=none; b=gIII5ozX6/EA0eXEDnyUve2rOivNYFwB48JNAYqxTPjad+VUQDPgI0OZRjYcX6iFyVF8j6mWEdtm9hzIh/9RSSkPUueaomkKkugk88nPUJRosarorQq9a3pAoBj17YHsx1gaUXzgUAKZVfV+1L3096o4d0qoiwVrW7SPkIhHj9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859402; c=relaxed/simple;
	bh=81NrjgCnXD7DSczcSEeZnY7pa/85ZiSEAh6VI4FZN5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWWhCZYJqCgTlt1ojcEUNHc6Ip1hMC3MJA2lZMs/Zv4c4Xyxvs79Us8JhojZfcSTdm7NSyPDxuQx/IH7GKQ4wn8j/vudkhOifpAn1dFZv2YUVdokX35RgBBRi3q6jJ2DTq0aWlcagj5y8/zj1UWPh9KbGIcv4ARAbTRK7yYl8Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9Utx0If; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3446C4CEE2;
	Thu,  6 Feb 2025 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738859402;
	bh=81NrjgCnXD7DSczcSEeZnY7pa/85ZiSEAh6VI4FZN5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9Utx0IfxTtLtKIf6bqy7cv1DpzUTcTy4MCnn0dI0vKtHwLbpM0mMTgzWF68JZ8St
	 JPOMUMEvvne5y533/Noqecy7CN5gwmKyQ6xH4nNou+t++GVZw3mJIJdGYULGBkjXci
	 JXQsriVdg4+1TQPB8BYAWeVG2ZwhOL9UUZOV7rtt3g/iXSjxt9t2mNx+acuB4LHcws
	 gV/A5xy3JNkpg9mln0WFUJ/ObPYubZtsr0RuJlDxrg38s+vcbjnIagGTovkQrvIDbF
	 l2YM6kwQR58LJ2TisKUS6VFxrn5iCuDf1Mi+rxvnUe8V0RO1WbUmnQWjLBlzxFciXW
	 EB39cavUh1YNw==
Date: Thu, 6 Feb 2025 16:29:57 +0000
From: Simon Horman <horms@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] net: pcs: rzn1-miic: Convert to
 for_each_available_child_of_node() helper
Message-ID: <20250206162957.GX554665@kernel.org>
References: <3e394d4cf8204bcf17b184bfda474085aa8ed0dd.1738771631.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e394d4cf8204bcf17b184bfda474085aa8ed0dd.1738771631.git.geert+renesas@glider.be>

On Wed, Feb 05, 2025 at 05:09:47PM +0100, Geert Uytterhoeven wrote:
> Simplify miic_parse_dt() by using the for_each_available_child_of_node()
> helper instead of manually skipping unavailable child nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms@kernel.org>


