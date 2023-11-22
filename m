Return-Path: <linux-renesas-soc+bounces-155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC637F51AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 21:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C0C4B20CEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 20:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8234D597;
	Wed, 22 Nov 2023 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJbiNhyG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA285CD09;
	Wed, 22 Nov 2023 20:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FDAC433C7;
	Wed, 22 Nov 2023 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700685146;
	bh=XZotiTN2MKJ0on+DecBKoIqgQIxFy3Ws0xTK75lMA5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJbiNhyGdD1kpR12CArXbDf4i5UHTzOTX1JVJdpINaKWPb18cJM3sy2zKgkRRcfZd
	 rIpVCuIFk068gxjRHg1rBts2VaWu6btt+r+BDnA3fIJSyXA7hrfDKST1MBPtK48i0A
	 XyBJEiPF8ZgpFEFg/ND/pKQdGmiwEz62+iRL1RBVdSR//JQbEi9N8zFu1x1mtToLca
	 Pj4hc7jb/sL4tS8xIcXRsHF2cVLrJLDedfrotR3qH7ch+0Mx+hxjGWerxqxh6q7Xxf
	 kB1hHLEMuse97qC35LptBk3ofjMys+o3KwXx//VvxgmSm4tGwhp09dXUFgw6q67mV5
	 1AcDdxuZoQiwA==
Date: Wed, 22 Nov 2023 20:32:22 +0000
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [net-next v3 1/5] net: ethernet: renesas: rcar_gen4_ptp: Remove
 incorrect comment
Message-ID: <20231122203222.GD6731@kernel.org>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
 <20231121155306.515446-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121155306.515446-2-niklas.soderlund+renesas@ragnatech.se>

On Tue, Nov 21, 2023 at 04:53:02PM +0100, Niklas Söderlund wrote:
> The comments intent was to indicates which function uses the enum. While
> upstreaming rcar_gen4_ptp the function was renamed but this comment was
> left with the old function name.
> 
> Instead of correcting the comment remove it, it adds little value.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms@kernel.org>


