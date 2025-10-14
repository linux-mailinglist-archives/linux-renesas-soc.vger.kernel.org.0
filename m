Return-Path: <linux-renesas-soc+bounces-22998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 602B5BD9030
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 13:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4757218A4DD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 11:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5526D30C614;
	Tue, 14 Oct 2025 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJwTX4Ey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FED305063;
	Tue, 14 Oct 2025 11:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441214; cv=none; b=CXrgIQYmI11zGU5ZUH8ZD0CygiYPo4qBKJc8z+H6W+OhBbrknqPXSAxeXmkFMiZsm9Y/J3B71gmROdvBDACSKbr5IhGXIc6YzbmQbaon4uLl8czjBTHrct9d3ogX8wRyHnLpej7/rcZChMLh6Mu4IzPO+TDmeABABwphv7cDcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441214; c=relaxed/simple;
	bh=qaxYZXuRXFgjBi4WTEOpecu/+I6bHI2yH4gD7lgIbPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9UTixPKeu+ET/H1YR3uuFFt/Xg4PleI0GJ1RmGLX8GAF3cjiJwUHDI+Pcw7aWWvzyZMR8Cb1/3anVd+z9SeQmuwQordnszmeNtOZvbfmjU+ajWiVHKpdz++odoUcpVpysEuei/VDrWRycTt1gjJGlvXOuzx5z0tA46D8IkHAlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJwTX4Ey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2D8C4CEE7;
	Tue, 14 Oct 2025 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760441213;
	bh=qaxYZXuRXFgjBi4WTEOpecu/+I6bHI2yH4gD7lgIbPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJwTX4EytJ0bCdLya9AnSUbpbOVEWuSkrdULKQtKBnuqle10jIzs0xDyfzYsoeFvn
	 YRGAcDKcBrcFBKW/DEMDYVh307onwvMOYGiij0iCiUatwgBoilU2zW5Nwc3gYATBKj
	 VtfvyzEwGrLdaQBDBpo5UnmunD0dDVehQRkMoNfwNhKBhIArj7My3ZCWgmR2pnQHKv
	 /wSym03EXY0L5DgciTSXJBR2L5mFSIPndTYUKlgSKbyHctWYigmhQ/2z7pZhIVzVEm
	 DlDdrbEhW4mS0a/F/VHyIHR43oWGzja4MOoXN46AFMs9QIPTy4UOZT0I1ZSgYXT6RM
	 zeKzWzWV853Ng==
Date: Tue, 14 Oct 2025 12:26:46 +0100
From: Simon Horman <horms@kernel.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Igor Russkikh <irusskikh@marvell.com>,
	Egor Pomozov <epomozov@marvell.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Dimitris Michailidis <dmichail@fungible.com>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next 13/14] net: hns3: add hwtstamp_get/hwtstamp_set
 ops
Message-ID: <aO4zdkFjMlv5trhB@horms.kernel.org>
References: <20251013163749.5047-1-vadim.fedorenko@linux.dev>
 <20251013163749.5047-8-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013163749.5047-8-vadim.fedorenko@linux.dev>

On Mon, Oct 13, 2025 at 04:37:48PM +0000, Vadim Fedorenko wrote:
> And .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks to HNS3 framework
> to support HW timestamp configuration via netlink.
> 
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

Hi Vadim,

This patch adds warnings about the functions it adds being unused.

I would suggest addressing this by simply squashing this and the following
patch, which uses these new functions, into one patch. I think the
resulting patch would still be small, internally consistent, and easy
enough to review.


