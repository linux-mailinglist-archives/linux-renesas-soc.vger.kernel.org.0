Return-Path: <linux-renesas-soc+bounces-21973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A9DB80CE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 17:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B21A3ACDB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 15:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB302FD1B0;
	Wed, 17 Sep 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1U5IH8F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0555C2494FF;
	Wed, 17 Sep 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758124682; cv=none; b=ilF8fCw82RMRH3lhZchYzWwddT6VyxGkQmogFzVsWJ24/+LZqQGlGfBzQ9nyezvEhMg+9HKFK4W3BVnGghRhBsvEJwuxAEsDyhcd+4uOkKDfOsvFOW9y4hnQoi1mvhnvXA81xWOa3tpnYEAhuPjrnyWn2B8EmDbw5/aMEL4xkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758124682; c=relaxed/simple;
	bh=xG22n7axY6Ofs7ii3TGXeh3hEeXxxgfUykSiRa+z6SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6YjqfBrqULtIXpIWMeinsPBBtYOp6Uqv+hRSp6LcIjalwkcTBDe4nSnhAmJcBUkxxESXC5IMZx7xGriVe0puJOmO2R7K+pSG8alRQaoqMkZay5/BMtmJoJCH5Kq69eVlTOY+OngJPST4bv6bvjQ4eoPnZgNSd9tBOIDynaGK7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1U5IH8F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46656C4CEF7;
	Wed, 17 Sep 2025 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758124681;
	bh=xG22n7axY6Ofs7ii3TGXeh3hEeXxxgfUykSiRa+z6SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1U5IH8F/mMJ5c+Wfzm+wjTVqPpBLRSE78+bHZCrCgSaU9RlEG8cHA4HVknSu/QVJ
	 tq3EeihS+0AJ8R9xiEDoCKJCVG4/5Fha/mPLE/6UZB4HhZ87XTvVdhll/hNEGFyR/U
	 NM/qOxfKZQIbH910KOFIe7XGLnL4gs2oyhB65VyeDgfYPPQAa6CVpmpIlpW9ralswQ
	 F/h2MWg7BMCpNCB2Nw65TifuQjr7qXVqhpet33GSUyH/xxkJfM1x5O8kJnk+H+PdFM
	 NQ71rCf7J9CdRRPtFmj/MyBx8U08RUG9GwdaEmV/TaZkg1iFa2mMjlxv6McvH+1m7h
	 hg2GLRW1wVIDA==
Date: Wed, 17 Sep 2025 16:57:57 +0100
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
Subject: Re: [PATCH RESEND net-next v2] net: renesas: rswitch: simplify
 rswitch_stop()
Message-ID: <20250917155757.GO394836@horms.kernel.org>
References: <20250916163516.486827-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916163516.486827-1-yury.norov@gmail.com>

On Tue, Sep 16, 2025 at 12:35:16PM -0400, Yury Norov (NVIDIA) wrote:
> rswitch_stop() opencodes for_each_set_bit().
> 
> CC: Simon Horman <horms@kernel.org>
> Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
> v1: https://lore.kernel.org/all/20250913181345.204344-1-yury.norov@gmail.com/
> v2: Rebase on top of net-next/main

Thanks for the updates.

Reviewed-by: Simon Horman <horms@kernel.org>

