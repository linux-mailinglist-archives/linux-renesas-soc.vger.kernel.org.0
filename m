Return-Path: <linux-renesas-soc+bounces-7049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11246926D5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 04:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BCDF1C21911
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 02:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244FA11185;
	Thu,  4 Jul 2024 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZWf1Opp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE465101C4;
	Thu,  4 Jul 2024 02:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720059372; cv=none; b=e0gSZK5BYlyFMy4Ut9F8x5ySyWm7sfj1UyMK/yk/HQuh6UryN2+atj1AfDABXhnIqhX3oVHqF1eL45A0EUcC7akTF3lW2kkizz+C4jI+Yxk9vPJ/Gr4NE6RoBh745akG5dtT/3cKF+yQvWcaOS3iA9KwqNMtQoakCL2qFMSUdUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720059372; c=relaxed/simple;
	bh=CL6GwSWigN6Jqzc9HaieXsNoFLwbQYKKp1tkc4ku6zw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ePbXH0FSklkvnn83MJALf4kH71nMExhvLCnIxaEEfEeiC3OiCwvMUvR32vMYsoqz02FLAB8yl6MBqzTzcVGt1rKD+/MMmPD2VMtp2ycWFyNKQJSSCC5b6O9AqDU+lC35y1yiI2ToXpyeEMfIW2FtVfh9tLCBqR8A97JeIz5p4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZWf1Opp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239EAC2BD10;
	Thu,  4 Jul 2024 02:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720059371;
	bh=CL6GwSWigN6Jqzc9HaieXsNoFLwbQYKKp1tkc4ku6zw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OZWf1OppTt+PYCEiaLBxR2b5fhwPT/wbpwVS6PPs04O9t9IWnG8E6MoUC1xqXLcMZ
	 umqcSQfnr89VNP3ait6WKIba7uReM4dLLrZumUCAk4oak3nN3KiMWUktehYTrTf9Xx
	 TJDZaiB1CC3LWpr0ch7GJBavm0OT4knRp0/dAIF6gM4kYuNOpt5E0gicSp6/2PUdko
	 Qb6h8f44oZ20mTsvRDd3eEsb+BziQzQhhE9zgzFcvP17Dv2T3UWGS+G/kfFZE67fpP
	 9PgMMskWk9wZYJCGrARZ1MFAVgX31WRRWhjZytPa7VRiOLFKZ9hChufoCg/kFo1As5
	 PKLEoLYrjdLWA==
Date: Wed, 3 Jul 2024 19:16:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Radu Rendec <rrendec@redhat.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] net: rswitch: Avoid use-after-free in rswitch_poll()
Message-ID: <20240703191610.30bd4ba8@kernel.org>
In-Reply-To: <20240702210838.2703228-1-rrendec@redhat.com>
References: <20240702210838.2703228-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  2 Jul 2024 17:08:37 -0400 Radu Rendec wrote:
> The use-after-free is actually in rswitch_tx_free(), which is inlined in
> rswitch_poll(). Since `skb` and `gq->skbs[gq->dirty]` are in fact the
> same pointer, the skb is first freed using dev_kfree_skb_any(), then the
> value in skb->len is used to update the interface statistics.
> 
> Let's move around the instructions to use skb->len before the skb is
> freed.
> 
> This bug is trivial to reproduce using KFENCE. It will trigger a splat
> every few packets. A simple ARP request or ICMP echo request is enough.

Please remember to add a Fixes tag in the future. I added one when
applying.

