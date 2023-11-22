Return-Path: <linux-renesas-soc+bounces-158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4BB7F51B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 21:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C43AB20D66
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 20:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309954F60B;
	Wed, 22 Nov 2023 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3wQf91a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9865C8EE;
	Wed, 22 Nov 2023 20:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D52C433C7;
	Wed, 22 Nov 2023 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700685207;
	bh=cz4obRXjTk9QRnekWaIUaaqum8G9p/5GWvU2svqr3mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3wQf91a0vxWXuA8dtiDSxIhDC85pzGrXnf/VSBbyVh27Xv90XzIQfEu8Poy+voR6
	 sbWnycwtfh+LnRVnOI+AIqs8CqEQ01MSv2vniNqKOY1Fge58mQoRnQf9RONOZpSYAi
	 Lw6Ok7t3sjTG2DtBGTU0Wi+mAEjBXTknm7KyCLdYZwnzaXsObXtg/6WF4J18y5U9kH
	 66sU31QcgtVHM/1Cuj3s0P4SAijVhf2hKW+QDniq3fBYM4Kc23IZQNsh2j2lurMPSD
	 vptt0Gt1uF4quL+BeV1y/OyRkSWS6nyzBxdkg5ACy7jF1juAC3BBFmP1ZaXpf4Zi34
	 iOIZPDBJfGvpw==
Date: Wed, 22 Nov 2023 20:33:23 +0000
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [net-next v3 4/5] net: ethernet: renesas: rcar_gen4_ptp: Get
 clock increment from clock rate
Message-ID: <20231122203323.GG6731@kernel.org>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
 <20231121155306.515446-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121155306.515446-5-niklas.soderlund+renesas@ragnatech.se>

On Tue, Nov 21, 2023 at 04:53:05PM +0100, Niklas Söderlund wrote:
> Instead of using hard coded clock increment values for each SoC derive
> the clock increment from the module clock. This is done in preparation
> to support a second platform, R-Car V4H that uses a 200Mhz clock
> compared with the 320Mhz clock used on R-Car S4.
> 
> Tested on both SoCs,
> 
> S4 reports a clock of 320000000Hz which gives a value of 0x19000000.
> Documentation says a 320Mhz clock is used and the correct increment for
> that clock is 0x19000000.
> 
> V4H reports a clock of 199999992Hz which gives a value of 0x2800001a.
> Documentation says a 200Mhz clock is used and the correct increment for
> that clock is 0x28000000.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms@kernel.org>


