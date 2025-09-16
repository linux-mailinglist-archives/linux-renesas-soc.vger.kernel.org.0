Return-Path: <linux-renesas-soc+bounces-21931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 399F9B59AD0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 16:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC6C16D3E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 14:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072F8346A06;
	Tue, 16 Sep 2025 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aA+2vuDf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6FE345752;
	Tue, 16 Sep 2025 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034100; cv=none; b=W251eaXOa2+iSwPwegOPzwCajxDRX6+R4kg8hhwBC52mf1JrQwlltH4IUnBF5FZJFrS1Iq81Ki/KF71/b6rAeJWPaF9Y0QXVHFnpv6g/eK156QU+OR+CjhrKY8IvJ5ZFqd8HMxOcHb1KjmMOaiCNcLRabtqxvMnuPux0cyHnMq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034100; c=relaxed/simple;
	bh=CXrQbmAAPCdFfNP2ODalbJjSr2f4p5P/pB6C9b016xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUOYy3Cwu+6nem5iljelvdhv+puP2NMk/CWyhUPaFQVnQs6BVtd65OqOeN4iaQ55khqVKtvfA4l6IrEuQmXNcCE8bOPWDWk8lWCl2/rsfjsX1pIUAqPCrU/pO2LPUCTQv3ePYyo3o32C957w1rJ16qmxYN4aFH06cRdwLtvgPpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aA+2vuDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB11C4CEEB;
	Tue, 16 Sep 2025 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758034098;
	bh=CXrQbmAAPCdFfNP2ODalbJjSr2f4p5P/pB6C9b016xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aA+2vuDfTgddzPeBptarS26VSs2gOVvvWeCJidsDEFuhceBFFXaZoUfCAlDweUfT1
	 mlgDfeVZwNrVasQtVBkCMuc6DgH3LGcdulTfXxjv543vcfT9TCCkqG/GK8pWbJ97L8
	 lU3R8ybSsKQJKsvZnScxtt5vznQBGm3sJIh0ljmDqjWGaKKTzd6+aVxNAqQaQ/l3FT
	 ka0LdD/6nU924r98Oa2j5sae9SKBEJI0BFAp19dQFmP3G3LY27RejTCRSpRdP83bYm
	 bxKqrAHBSs1CliE39wz6S/n6JuQn4WotAlzjjbgERtW2CN7ziFtpqkOpBvRasC2Xz3
	 YUZ76AZTaKt0A==
Date: Tue, 16 Sep 2025 15:48:13 +0100
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
Subject: Re:
Message-ID: <20250916144813.GG224143@horms.kernel.org>
References: <20250915195231.403865-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915195231.403865-1-yury.norov@gmail.com>

On Mon, Sep 15, 2025 at 03:52:31PM -0400, Yury Norov (NVIDIA) wrote:
> Subject: [PATCH net-next v2] net: renesas: rswitch: simplify rswitch_stop()
> 
> rswitch_stop() opencodes for_each_set_bit().
> 
> CC: Simon Horman <horms@kernel.org>
> Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
> v1: https://lore.kernel.org/all/20250913181345.204344-1-yury.norov@gmail.com/
> v2: Rebase on top of net-next/main
> 
>  drivers/net/ethernet/renesas/rswitch_main.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Hi Yury,

I see this marked as Changes Requested in Patchwork.
But no response on the netdev ML. So I'll provide one.

Unfortunately it seems that the posting is slightly mangled,
there was no Subject in the header (or an empty one), and what
was supposed to be the Subject ended up at the top of the body.

I'm wondering if you could repost with that addressed,
being sure to observe the 24h delay between postings.

Thanks!

...

