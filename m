Return-Path: <linux-renesas-soc+bounces-21920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59497B59645
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 14:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D71FB1BC0E15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449F92D3233;
	Tue, 16 Sep 2025 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EtGB3hi2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618CA2DBF5E;
	Tue, 16 Sep 2025 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025974; cv=none; b=TSPZ9q7SviUmhGmdNWDxt3Zq5NDl6S3uWBNXP8wx6eyllFy4/tOVQ89xLyCURrt8zCq9qDkumt+cJcGST/luQgUBqSGzLjEQJBMjFe89syyD8X24vq2WZ4Q/Dsinsc7N/jg201FuSw6RDSuE/sU01OD+SWnWe0AegVY8wva/Nq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025974; c=relaxed/simple;
	bh=aFFJQ3c3cKy0cTqTwtO7pqGldxJqu1mCv2bidJ7C+2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDcsn3YQNGjVu3BoiGlZK34lmZnzv6eu7XChaX+GVD+q8AELCWaYow0Tv6yUiao3T9XvFfU6pWGc3UZjj8Z0Llu3WluUkNTzTWXGZQozr2hYjzHtDkFoMp6IbZedFxpewSVMVbsDtF2a4Ctebhk2HsfiVI9n3AhqBOBm+qrbYAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EtGB3hi2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=SZlYo6B8YW/emlghHc4MKfQxPkRtnwrIZO7LDI4zirQ=; b=Et
	GB3hi2aiQsaJh66KdUKhBXsGB7EJNNKv/lQfsMkcr8bpwjlnRi1oSgz2V5p9Vck/V5HUzskqKL3m/
	4ZRQ62ezhdez3Yb6eDSS2/7YsRrFZeWC/rRSsz0gQdL+5VXFyq5AnXBiy822q5aVfnbyT1uPxhn+S
	cbScYLzSRZFWJzg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyUrJ-008Ykb-Hq; Tue, 16 Sep 2025 14:32:33 +0200
Date: Tue, 16 Sep 2025 14:32:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 5/6] net: rcar_gen4_ptp: Remove unused defines
Message-ID: <177c71c1-c281-449a-a8f4-4858ca488f55@lunn.ch>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916101055.740518-6-niklas.soderlund+renesas@ragnatech.se>

On Tue, Sep 16, 2025 at 12:10:54PM +0200, Niklas Söderlund wrote:
> The driver specific flags to control packet time stamps have all been
> replaced by values from enum hwtstamp_tx_types and enum
> hwtstamp_rx_filters. Remove the driver specific flags as there are no
> more users.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

