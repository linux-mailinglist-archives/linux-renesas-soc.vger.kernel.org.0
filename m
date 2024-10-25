Return-Path: <linux-renesas-soc+bounces-10129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2839AFE0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 11:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CED81C20E09
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C716E2076B4;
	Fri, 25 Oct 2024 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9fQybTm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3532076B3;
	Fri, 25 Oct 2024 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729847752; cv=none; b=DR3ptLL9WBI8c9hmDjy2jr+mtmQV6HdZh5FwoBhDkhjo+4cLtSsoSm+yzB/Yz7bwfrIMC2Mwo/SMGZOB+b05zkR+wAa5ilRaZqM7CAYYF17SgFc0JSOUY9DfpgLxznC+/qUEuiwI/k3ikg+12Hrg6AUatUxri3CWUlwmJEGdKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729847752; c=relaxed/simple;
	bh=cxmhOhqQP0gKwEV9A9rSoyyT63ke9PLb36fVG9fnGUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9wi0btz7OhRVqqvD3jAJYijOmXkfBuHjggzcmTsyxG6z9zpMItyURKeKbQLxBhjQGN2M0ELf8DigcS7IYiObzy4rbiavOC6mLSGla1I6nXpgHnb0v3rTd8nbtGPOg7P1jdrR3Y1Y5P6MTCB3MHQGPoajpd88vqLCV1yAF4NM9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9fQybTm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFE9C4CEC3;
	Fri, 25 Oct 2024 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729847752;
	bh=cxmhOhqQP0gKwEV9A9rSoyyT63ke9PLb36fVG9fnGUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9fQybTmeIlMkIkczNrQcjTrnymkrSW67F7YlGxVCt8epF/gVAMc9mU7PQ0+mRsrk
	 6FEVhrwcmKpRaWLmcawygWkSViStEBldCFlLjRLCEzAGboqMm9Z3qEDImDgYpap46q
	 lGta/GBsTQN/CANBJLpKLG8VPEl6wy72R/YcI67i5dtAaCw8Ki78vjicbfJb4JLiJZ
	 kchWU+HsaM5J7y+KukIRiLfrqenoamhhlZcnJ/Zu+s5FTjB7/E+Po1R+cXfQriKUul
	 QTdmsdeTxjG80FRaFS5k3Ek3b2QLGQqKvybykOkNFJu56bKTMTyZzCl2BJluw40T0g
	 YKQhucTcEcnMA==
Date: Fri, 25 Oct 2024 10:15:47 +0100
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
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv3 net-next] net: dsa: use ethtool string helpers
Message-ID: <20241025091547.GJ1202098@kernel.org>
References: <20241024195238.176131-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024195238.176131-1-rosenp@gmail.com>

On Thu, Oct 24, 2024 at 12:52:38PM -0700, Rosen Penev wrote:
> These are the preferred way to copy ethtool strings.
> 
> Avoids incrementing pointers all over the place.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>  v3: remove curly braces from ksz_common.c
>  v2: remove curly braces from rzn1_a5psw.c

...

> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 9201f07839ad..2bb1832d21bc 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1180,11 +1180,8 @@ static const struct b53_io_ops bcm_sf2_io_ops = {
>  static void bcm_sf2_sw_get_strings(struct dsa_switch *ds, int port,
>  				   u32 stringset, uint8_t *data)
>  {
> -	int cnt = b53_get_sset_count(ds, port, stringset);
> -
>  	b53_get_strings(ds, port, stringset, data);

Do you need to update b53_get_strings() so that you pass &data
rather than data? Otherwise, doesn't the call to bcm_sf2_cfp_get_strings()
overwrite what has been written by bcm_sf2_cfp_get_strings() ?

> -	bcm_sf2_cfp_get_strings(ds, port, stringset,
> -				data + cnt * ETH_GSTRING_LEN);
> +	bcm_sf2_cfp_get_strings(ds, port, stringset, data);
>  }
>  

...

