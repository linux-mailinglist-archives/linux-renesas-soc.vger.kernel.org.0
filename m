Return-Path: <linux-renesas-soc+bounces-9813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A661E9A1DAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 10:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B97D1F228DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 08:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600181D63F4;
	Thu, 17 Oct 2024 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1eXAmKN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA6F762EB;
	Thu, 17 Oct 2024 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729155487; cv=none; b=kte7PirOzsg/6dagLWIo7hHiKrzAF0Ygq7hW80gQyiD70v3F6kTrcyVRkdVbv6PxLPGfOCi8LFetX0Rgm144Q3YQdnPtd6cQAM+cAzoFbkwAJ5O0psrUH7g+cDxI+lIIPWfFbTVPebJ0B96ln1OLQqbpkO1eywP0sHTXvY6HHW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729155487; c=relaxed/simple;
	bh=492DZi2xWFhOAumNcACKXQaQl1yah9Ahp5T4snk6DbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddvD//+w5zRIOkXbHIny5dqymjzH650jmj8tJq3e7Y5rRS2FJMklJu7TkxwVJEGGMsfmTv8iL0MU1obI4BuO20Ml5UPZFXZKmWbpoXxG2E+nmF1Q5SPjmavki3po9O9f26YugGJaiCvAVZLmzAm+5udDE+ZSjXRQC3Vrepkq4nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1eXAmKN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F32C4CEC3;
	Thu, 17 Oct 2024 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729155486;
	bh=492DZi2xWFhOAumNcACKXQaQl1yah9Ahp5T4snk6DbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1eXAmKNLWNBi9dB2rkATO6IgpxV3/0wJ3CY2gbjLSU/c3d3nPKaxTVd27TQzYshn
	 MDnaUTQg15T+NSOLud69ksX7/LniFvo9tK04QgEfKU/n3TgnWYz4ATr6BuPAmncc2z
	 kxKNtjGp7FMt5eF0q2D6Ouca1ma7pDr31LrZJp4RY+tmQPUHBn1IL2JG91mEa72lDq
	 XBhcKaYmulNY0AaJ12XDozF2OPoapZaR0i8+Six9AzQolX2/JBJa/6wrfuigrsRdWU
	 9TPgOobYtfUZGicjWq8qLEtBShShtgejp8FBTjhXpt3DG4yVqmTIckPgcrdM/BHYB2
	 qrscq2e9GQmVg==
Date: Thu, 17 Oct 2024 09:58:00 +0100
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Breno Leitao <leitao@debian.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv7 net-next 2/6] net: ibm: emac: remove custom init/exit
 functions
Message-ID: <20241017085800.GP2162@kernel.org>
References: <20241015200222.12452-1-rosenp@gmail.com>
 <20241015200222.12452-4-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015200222.12452-4-rosenp@gmail.com>

On Tue, Oct 15, 2024 at 01:02:17PM -0700, Rosen Penev wrote:
> commit c092d0be38f4 ("net: ibm: emac: remove all waiting code")
> introduced EPROBE_DEFER support. Because of that, we can defer
> initialization until all modules are ready instead of handling it
> explicitly with custom init/exit functions.
> 
> As a consequence of removing explicit module initialization and
> deferring probe until everything is ready, there's no need for custom
> init and exit functions.
> 
> There are now module_init and module_exit calls but no real change in
> functionality as these init and exit functions are no longer directly
> called by core.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


