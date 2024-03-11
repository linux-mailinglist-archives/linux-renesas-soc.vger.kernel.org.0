Return-Path: <linux-renesas-soc+bounces-3666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7021877C9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 10:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3288EB2122F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 09:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07101755B;
	Mon, 11 Mar 2024 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZnG5iUd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D951A5A2;
	Mon, 11 Mar 2024 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149097; cv=none; b=Q2KLX3DYKKU6NHjfy/Tw2mRR4oeiFGygOeV/NqHYQUgiJKoQZJ3QyrgyKzObuH7awKZe3iypUzCDAqxwsMGRhbc2jyv7o5c/n7agIfGEXlYiHuSAKAO0y4g0J16U7nAzSQ3j6IluTT9Tg0LEkh/E8FGDI8QFkEkH1OAzpWr7F5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149097; c=relaxed/simple;
	bh=lUsFfYrqsjzIgKlaFhtZh7Tk4Qy6v6I2lw5v6QFcCjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DX3L1qZQtjcOqlgwUIfZGPADrp/n7XWvtqAK+xNzeGC1jAPkxCBDaiS3osRl83O+32lkF00Fy56VgsgQfPoumOH21E/E8xBuRTc2UOzi8CucIGR7iSBwZHuaVHV6jhBGuiou7CZ+/6t10cd32HJNIjj+JC8VJ0AT9FM4uzAf3Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZnG5iUd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C97C433C7;
	Mon, 11 Mar 2024 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710149097;
	bh=lUsFfYrqsjzIgKlaFhtZh7Tk4Qy6v6I2lw5v6QFcCjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZnG5iUd4BQsPquJkTQeFGNviiMCKY8kwCUr0QIg4kE+hmVTv73uPLRGJ3DnjeUtc
	 mlT2u6ui+uWxI3jiMs68R3g9Hl76LYiRfvgx0CWZosw98U/wpHCq+DanAyocBphnlt
	 qyrcZG/5wWQKtWphdlBv8sD9SDxj9lBbeoDKkHiCqaXhfjvj/N1yNPAQvuEUWgIIwa
	 T3zk0JvUphSTwBX91K1UnfiPUUDOUDoxEVKOVbAxx9RcYiXqcAEQEgaFdl7eHg7Oxd
	 SvD/EPxhpZv/+K48/4ahNt64uMiC2vjLrx4OSo/ZOnJJCvXVZqMm0gWGLc7lUuGS1X
	 miyrtgG1EfJgA==
Date: Mon, 11 Mar 2024 09:24:49 +0000
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] ravb: Correct buffer size to map for R-Car Rx
Message-ID: <20240311092449.GI24043@kernel.org>
References: <20240308224237.496924-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240308224237.496924-1-niklas.soderlund+renesas@ragnatech.se>

On Fri, Mar 08, 2024 at 11:42:37PM +0100, Niklas Söderlund wrote:
> When creating a helper to allocate and align an skb one location where
> the skb data size was updated was missed. This can lead to a warning
> being printed when the memory is being unmapped as it now always unmap
> the maximum frame size, instead of the size after it have been
> aligned.
> 
> This was correctly done for RZ/G2L but missed for R-Car.
> 
> Fixes: cfbad64706c1 ("ravb: Create helper to allocate skb and align it")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms@kernel.org>


