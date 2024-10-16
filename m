Return-Path: <linux-renesas-soc+bounces-9805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF819A11CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 20:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41462874C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 18:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E713020F5BA;
	Wed, 16 Oct 2024 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVD3IEru"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3F20F5D1;
	Wed, 16 Oct 2024 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729103923; cv=none; b=I5gJbo3Uhds6r6eaCiWJdvUpPaF92aNuDAwL36wO1gJDoKI8p24p56XJl5Yqds2JE0UPUrjFz00fB+q5jJp5Cwxekc7csIWMsNxa/Kd7xXjbaGhsD+HuJ6xhfOCApokmevb86DoJOV4ykxjRLKRsLcL2vhGI0Y0/hx8r5OQ30iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729103923; c=relaxed/simple;
	bh=oEDn4K3a0qeagZHW5mDcN6tcq5ry+kcG1OZOwBLK9Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tal54+KQXgivJEnqWFtu869wlljYJsO/0tMxq2WaQIJrTG1G4YGLtMZzGcQUlxb6ZoqPJ0MEe8blZoIDOUIY1QVs9vJLHL0jCJohDOadvz51cUokRe6TnJL2G4Dz7pTH6zF23kWPk2LdfJVpKxzr5PZS+OxHCiyh7NvxbEi7oE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVD3IEru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9A3C4CEC5;
	Wed, 16 Oct 2024 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729103923;
	bh=oEDn4K3a0qeagZHW5mDcN6tcq5ry+kcG1OZOwBLK9Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVD3IEruaWkVA4dqRzYwaaNT4kfkPzdP25GYhhdfPaRyTGk19CeRqStpKWX2sY5VG
	 AtX0AO40lCeP24qT72/XEPHpWRb/8CgHp2yY5GXJlrrOUe63BoBscdu0BefNO4JvKA
	 8KjCKQIvUSP9JLUwRTaSR58hg2oyEd8rLW8Aj9u3840OsP3Rjb0l1yKlSFgA4/vrMG
	 2cPCT10zDdv6xqp2q+TWshfAXnTXVjCgcqewIkgm6X5xOEU/v59ji1e8i5Ft0JWFTU
	 Fx1mOfWm2OJPEC5rvMWGoq7YPISj2T4Q8sDPdcMUCb1Mp02BBlkZpmm9Xq5dizCL3o
	 Ei9gHbjldY4rg==
Date: Wed, 16 Oct 2024 19:38:37 +0100
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
Subject: Re: [PATCHv7 net-next 0/6] ibm: emac: more cleanups
Message-ID: <20241016183837.GK2162@kernel.org>
References: <20241015200222.12452-1-rosenp@gmail.com>
 <CAKxU2N_vK8WROUYdSRHnh_Y5tyW9dX+kk1BCTk-zU=pFH7HTwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_vK8WROUYdSRHnh_Y5tyW9dX+kk1BCTk-zU=pFH7HTwg@mail.gmail.com>

On Wed, Oct 16, 2024 at 11:28:49AM -0700, Rosen Penev wrote:
> On Tue, Oct 15, 2024 at 1:02 PM Rosen Penev <rosenp@gmail.com> wrote:
> >
> > Tested on Cisco MX60W.
> >
> > v2: fixed build errors. Also added extra commits to clean the driver up
> > further.
> > v3: Added tested message. Removed bad alloc_netdev_dummy commit.
> > v4: removed modules changes from patchset. Added fix for if MAC not
> > found.
> > v5: added of_find_matching_node commit.
> > v6: resend after net-next merge.
> > v7: removed of_find_matching_node commit. Adjusted mutex_init patch.
> >
> > Rosen Penev (6):
> >   net: ibm: emac: use netif_receive_skb_list
> >   net: ibm: emac: remove custom init/exit functions
> >   net: ibm: emac: use devm_platform_ioremap_resource
> >   net: ibm: emac: use platform_get_irq
> >   net: ibm: emac: use devm for mutex_init
> >   net: ibm: emac: generate random MAC if not found
> why is this set to changes requested?

That isn't clear to me either.
Let's try this:

pw-bot: under-review

