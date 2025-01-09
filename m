Return-Path: <linux-renesas-soc+bounces-12022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEABBA07D93
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 17:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E37A73A3D15
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD9C221DA3;
	Thu,  9 Jan 2025 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ninimN//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0922153800;
	Thu,  9 Jan 2025 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736440323; cv=none; b=f5VIWeYdI9COS0CyOSU2XflpfcAdm4TBqrYOPAONzdEbrjRayFylx61vZlR/6jbgryYM3YxhLZ4NZg4gMV0MwN+guFZxBftV5DdEyXhFWJJY2pOUieQx8cTm+NQWxzqSl9LBujOUq2OHs/W1agUGx7Rks2w41YodOcrOIo57uuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736440323; c=relaxed/simple;
	bh=7z+H3IV0LSHJJ8Jr+i+bPcQuVTp6atA4vvxRn03iitQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Szudca8fATjLVbDZZPl8tqLi4TgawOiNyZv78cWHpQQolxy7gh8PZZktrBXRRb7GQmpv7662HVvcHjjcY2Nrjwxa/ybwuLBrO7Xb9nfnd4m3UX8RATQPzfQUv3EqePkkKFZvDBbVU9ezsPMu5PGhbUDMnfEhDRtfeY5cudEcTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ninimN//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54824C4CED2;
	Thu,  9 Jan 2025 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736440323;
	bh=7z+H3IV0LSHJJ8Jr+i+bPcQuVTp6atA4vvxRn03iitQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ninimN//TwgdSRnPe9/vftonmHamKlYUtJR3KFr1FMZeMuh9dlW7zx3PYZkp/3Ium
	 8vnaf5FP8b7Dg11liAbLoT+PtkG+pC9n4yzwjGtD3ulw14SJnNvKxaRVGo8afeBK+P
	 x1sR05GKiJaCjHxZu3xkHigf992Nf6ryDQyyEvUWXY4k6blYapWNpdFDTa/Oyla4Qp
	 KwFcgMnKfAqJiuZzl5qjXk3LQjN1GxFCcG+RTFGUj5lmyHwvndmN0As/nOFo3B+7Zw
	 xtyQRCUoCDc5Nt2aEmFZmNZtrk/4s1YmNhhTjh0lTM6GOXDVfAKzVTit/1iDDAL/Qt
	 FqHcM6k8f6Ckg==
Date: Thu, 9 Jan 2025 16:31:59 +0000
From: Simon Horman <horms@kernel.org>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net PATCH] net: ravb: Fix max TX frame size for RZ/V2M
Message-ID: <20250109163159.GL7706@kernel.org>
References: <20250109113706.1409149-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109113706.1409149-1-paul.barker.ct@bp.renesas.com>

On Thu, Jan 09, 2025 at 11:37:06AM +0000, Paul Barker wrote:
> When tx_max_frame_size was added to struct ravb_hw_info, no value was
> set in ravb_rzv2m_hw_info so the default value of zero was used.
> 
> The maximum MTU is set by subtracting from tx_max_frame_size to allow
> space for headers and frame checksums. As ndev->max_mtu is unsigned,
> this subtraction wraps around leading to a ridiculously large positive
> value that is obviously incorrect.
> 
> Before tx_max_frame_size was introduced, the maximum MTU was based on
> rx_max_frame_size. So, we can restore the correct maximum MTU by copying
> the rx_max_frame_size value into tx_max_frame_size for RZ/V2M.
> 
> Fixes: 1d63864299ca ("net: ravb: Fix maximum TX frame size for GbEth devices")
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Reviewed-by: Simon Horman <horms@kernel.org>

...

