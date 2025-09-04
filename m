Return-Path: <linux-renesas-soc+bounces-21366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D69B44569
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C0497A47D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 18:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40064251791;
	Thu,  4 Sep 2025 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XnhXtiuL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A257D241103;
	Thu,  4 Sep 2025 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010610; cv=none; b=lOrWJSMEsHuByWCJefCRa2+X+pJh4UkpQiODXmmBE9eOVPz5i05nPTsYcLd0sQFvlpeymDuom3cmgn097hV1xqL2o4HBVW28F9oHLc+2fxX6OB8JHVCzx1Tuv6MkBMZ+lzqVEZ690PeqBPGhvIF74ws/3/ve8b/CF9svsgxfIms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010610; c=relaxed/simple;
	bh=ctyxHoBmGEd19N/XShEyFaX4n4/YV9lEFOn0IiD96ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPMb7xX3oIACH5wF0iIftT67RgLpOb8vB0jFOBhwTgvIADB4yDsuLc8ELKNNUPMCaERwjmbpYM7wFBUExt7koN9kabuw6wFNwSBMkd2lEck7Rwz+kV2jX6XEp/JrvlM8zaTM91zrdx6G1f381LxHiAAuuKALsRHtDLe9vPuSbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=XnhXtiuL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YB17rAFknzA/OC+TRlgDPtiCWVcjyS4YaD/1FsIUIKw=; b=XnhXtiuL2Uvt+67eS3YPLCUZrM
	/G2XUyl99mJBMEa0UpQEmQdjnpWTwluhWj56krN5qg67nteuiT3hw5plsjYi0b/qOSlAPcrnyCz79
	CEYWrFbDva2qi8r77PrO3mtEy3uFS/sypq/DcaAE6Uj2gmM2GVlbb9UwEBjS+SptT+Bk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuEiY-007FiI-8O; Thu, 04 Sep 2025 20:29:54 +0200
Date: Thu, 4 Sep 2025 20:29:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] sh_eth: Remove dummy Runtime PM callbacks
Message-ID: <0f2a2181-f885-48a5-9f90-28483734dc83@lunn.ch>
References: <cover.1756998732.git.geert+renesas@glider.be>
 <ab2a8bb51eb7d02426f4072c27523c8f41ac1ad4.1756998732.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab2a8bb51eb7d02426f4072c27523c8f41ac1ad4.1756998732.git.geert+renesas@glider.be>

On Thu, Sep 04, 2025 at 05:18:56PM +0200, Geert Uytterhoeven wrote:
> Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
> ->runtime_suspend|resume callbacks"), unassigned
> .runtime_{suspend,resume}() callbacks are treated the same as dummy
> callbacks that just return zero.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

