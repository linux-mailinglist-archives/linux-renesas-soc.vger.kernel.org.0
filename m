Return-Path: <linux-renesas-soc+bounces-19403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE5DAFDA33
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 23:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83EEC4A6CA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 21:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A40123E334;
	Tue,  8 Jul 2025 21:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wFJnqQ7s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21123ED6A;
	Tue,  8 Jul 2025 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752011566; cv=none; b=fBn5KThpHRM3cFjGqhb0YXqgQPPbi8Ppkp4VXSCAqFLfodqvpxKvtvQWIdkxzGIM5VmcQrd0ypGGz6zwLqnxg0SjDKzhyUCLBTGxMtS/EwzqTnJkw4c7H4nbNoleggoR4NFyTMAm8bOZR8M23/bhIiyyTTKEmqrxWlGC5vbVxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752011566; c=relaxed/simple;
	bh=sZT7/FiU4wu3TqeGX9Xe9Li6u30D1wvahg+LJYy8ah8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD4tvC7cTQFNG5KZ6iBoZBg3FbIxSXqCt92Hb5BYGtEWZ3uDx3mFA2cCnQ6g4BPS79HJJFgknMAi8ZmkqUPVxMOcRxJBCpbo0jKpJWAfP74MSA4YmK5Zj8U7qVRI/t41S8UvksR8QgHI3CpNAWCm/f0JtHj6Ywy0hBVxNs2Naxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=wFJnqQ7s; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bHGWEdWyIOyvoy0kMMHI3XUzHHAlWuif41SqNTxpPoE=; b=wFJnqQ7sGETEHXQC7932cMaaHU
	eRrk2vKaKIRDeWwltM8eTWZ07mHvVgsmtnPBqOC3gC8b84TyoIIuu22YbwJl/dx1bicg28GTI8ipr
	8Bb7ITaKzMFjrSJIkvqJgQxNOYYNWn3KA8/BgctWS/odymiXkHA2ENR5TQkEJqFFvHcQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZGEo-000sDS-1d; Tue, 08 Jul 2025 23:52:30 +0200
Date: Tue, 8 Jul 2025 23:52:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Message-ID: <49f58ebc-04cd-469a-9dcb-6a2a7e0ff0f7@lunn.ch>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-3-f91f5556617a@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-add_l2_switching-v2-3-f91f5556617a@renesas.com>

On Tue, Jul 08, 2025 at 11:27:39AM +0200, Michael Dege wrote:
> This commit adds hardware offloading for L2 switching on R-Car S4.
> 
> On S4 brdev is limited to one per-device (not per port). Reasoning
> is that hw L2 forwarding support lacks any sort of source port based
> filtering, which makes it unusable to offload more than one bridge
> device. Either you allow hardware to forward destination MAC to a
> port, or you have to send it to CPU. You can't make it forward only
> if src and dst ports are in the same brdev.
> 
> Signed-off-by: Michael Dege <michael.dege@renesas.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Since you are submitting this, your Signed-off-by: should be last.

	Andrew

