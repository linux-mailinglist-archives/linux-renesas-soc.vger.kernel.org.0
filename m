Return-Path: <linux-renesas-soc+bounces-21877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A0B58510
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 21:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC890203A23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 19:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE3027D781;
	Mon, 15 Sep 2025 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHZxTLHg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0624468A;
	Mon, 15 Sep 2025 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757962905; cv=none; b=Osr3KyqNr2NnAbQXWG5H0sGItGpN6Ok6jFCff8I/mMiXJsG/5HN6Ml+40cegwy5rB3ppbLR3gvkoaR5TEOPw/2TSU2yAvXL+Jyc08i2Ezs/m6biawdy96rN7oqv3PQJ5rMR7yBbxJRTO7wMf9JHUs0lHMNYctGhUvlMxOGPlBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757962905; c=relaxed/simple;
	bh=rW6Doj/V/1jwZENtntpdww4VOQI8GBIOXyCNi7i+CF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwBpHeGTv24rZAk/w1Aiolw2lIjjY1jx3a71T+vLitX+WQdnDo4sszzcrQNNWpG7M1MAdawVrLnuNBXIKBChTKlvkuIM5iCiBxTdmyTwrjsnXXHDcQmssXoMfkjHDljkWzxqkIeai/DeiNaSxHOauEmijdbxkyd8WB9PZyHkYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHZxTLHg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88FAC4CEF1;
	Mon, 15 Sep 2025 19:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757962904;
	bh=rW6Doj/V/1jwZENtntpdww4VOQI8GBIOXyCNi7i+CF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHZxTLHgqO5G6KpRv0xiVpR0+WkR9rmmuKklz1CHxQmEAA0e43HpdUUll8ar9bFEU
	 P+2wHRFrDxVGVPIxxmJg/M8/Z/kcReCHPHbzl9zIgsE0CMfgSqrJY5DGs9LtNjTGeI
	 LNtjplVC7B2FKdbxH/9N4IUnR+bOF63fzLW8tk8t+7StIyte5L3OH2TtfxgChcab57
	 6bjZSMm3WKEIwt/6vP8d1Ta4MBQMHbtjs//MbDO+2boOs7yIeArW+FhcAWh5tDUxiu
	 O2jed2TCbvCq8uKG+rzoNkkRyCT/idduf/HGL+LUjZi1OOKfmS8ReFvjEJL0QfOCfV
	 IOWPYwZ20PY5w==
Date: Mon, 15 Sep 2025 20:01:39 +0100
From: Simon Horman <horms@kernel.org>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: renesas: rswitch: simplify rswitch_stop()
Message-ID: <20250915190139.GV224143@horms.kernel.org>
References: <20250913181345.204344-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913181345.204344-1-yury.norov@gmail.com>

On Sat, Sep 13, 2025 at 02:13:45PM -0400, Yury Norov (NVIDIA) wrote:
> rswitch_stop() opencodes for_each_set_bit().
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

This does not apply against net-next (rswitch.c seems to have been renamed).
So please rebase and resend.

You can include Nikita's tag when doing so, unless you feel there
is a material change to the patch.

Also, please tag the patch for net-next like this:

Subject: [PATCH net-next v2] ...

-- 
pw-bot: changes-requested

