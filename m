Return-Path: <linux-renesas-soc+bounces-9815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D0C9A1DB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 10:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3404B1F22149
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 08:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517C91D799E;
	Thu, 17 Oct 2024 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwjWpD/3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252AE1D7996;
	Thu, 17 Oct 2024 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729155540; cv=none; b=iTYvVdnOFE3NOUSsktbTuU+cG7gJpeeoEgZGQHelVUBMpzGDON39Lci+DYnWuOl2TgUZJoF+TYt1Xo1/ghDt2hoGn1UqQtCtzwxNGHAF/2/2CBnFohta2cgKXYFa+CcpnJPXrV1tnOkzAedCnJoKct5S7xDEaGB7VpOsax8dT7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729155540; c=relaxed/simple;
	bh=l32QBf7Ydpv0UfOXGtjji83gO7qLXEQRgzkYtcP6NUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3Pj3QUKeJMdIj+fgMddKzxyyklNid9NGZVOms9gTj0lOvuz5K2JPpdUzXz4cLTQ1A6BJgQqD6nz/uUDQKH0DY/rauEDCayjr7r8qtiy+DfKl7y36BHskSNw6fvIkcRtPZjIeOdo85jcVsX4PnwvjpiDw8lcKuaUpjI4pkkDoFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwjWpD/3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECCEC4CEC3;
	Thu, 17 Oct 2024 08:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729155539;
	bh=l32QBf7Ydpv0UfOXGtjji83gO7qLXEQRgzkYtcP6NUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwjWpD/3D7bKZljV7PRHcYswQ0aitCyhZdLuPmfjBLQXh9+8GlXzTTY6MMiqPxmLs
	 5s8staspLLj9ygOzBDONUxmj9mcB+rHeOeRmVSAJRIwtnxbU7dLEDoh8H0Hz8jVlQc
	 U0oypsIzTOysdbQoED44fttLaijGShvXB9zF0CM/npocXCQmC6A8kGo6FjvBcTcSpr
	 qkoqIuXGR/O83Hl3bPKx9qUFup2Hd/zrhAhbKrt0CzstORt8zgdETLVj5p7Z6P20J1
	 urlF86LAjX30mUtweec72UxFfYmDrS0FD4RQYrm/9H2XiuMGpPG0gj7QNt11j/8FuF
	 po7OmiHpS8rKg==
Date: Thu, 17 Oct 2024 09:58:53 +0100
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
Subject: Re: [PATCHv7 net-next 6/6] net: ibm: emac: generate random MAC if
 not found
Message-ID: <20241017085853.GR2162@kernel.org>
References: <20241015200222.12452-1-rosenp@gmail.com>
 <20241015200222.12452-8-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015200222.12452-8-rosenp@gmail.com>

On Tue, Oct 15, 2024 at 01:02:21PM -0700, Rosen Penev wrote:
> On this Cisco MX60W, u-boot sets the local-mac-address property.
> Unfortunately by default, the MAC is wrong and is actually located on a
> UBI partition. Which means nvmem needs to be used to grab it.
> 
> In the case where that fails, EMAC fails to initialize instead of
> generating a random MAC as many other drivers do.
> 
> Match behavior with other drivers to have a working ethernet interface.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


