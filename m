Return-Path: <linux-renesas-soc+bounces-19250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D96AF9A27
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 19:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8ED9C7AB77A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 17:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76B1288C8E;
	Fri,  4 Jul 2025 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CsAWwwTj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2E1FF1BF;
	Fri,  4 Jul 2025 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651600; cv=none; b=BtzTQfFva6jcDo8MQeYn5hl715OSCCt4S6Vj+Cvs8fX/3N008Oh8DBjwVZZW1d936VZns7mRGTY8DUOcK1gIu3ibo106vaXHzIIlURn+bU+A925VggYbfRUQ9QbCB3E0kkf8QnMrC0MFHRm+LmvEoR+d9LEw02AWdd05rM3OsTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651600; c=relaxed/simple;
	bh=a02edtCij3cZvXYBmVyT4BxwOjMAk4YCSqwdFh9SoSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBKzcFIJuMEJBbfLzfI2zFg3r1BLaYLl94XLxPts29QA51TS7GfgRuo3XFzyxZ58wJS4NNUW9kAzpBbdGoWj2g6TBXeFRQk69A3alqM8HXw8aVWtrhvnfngWWIbwVjut9N4iAGa/eLg13MCs+X2IxqUzi94exn1XXSqpg4XB3Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CsAWwwTj; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hqYSMmJaUKMrrQ0d6K8F5kvg+JtqUzGt7LbPy35JGiE=; b=CsAWwwTjKoxhQWnxNQ/MvD6naC
	4tRlFhzx+bbXX5d/2JZbjciPl5qq4zJZHhOZ6Bp0UpzRZAzeUkisQRgJxkay57kwwInYfYLdW7/ms
	p4iPrrpbn2DeYp5h+oEr46Nrdc/s0/KQMuTc9rN92oqV3IrZGpjO/V7GpXmYlR6BYrsE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXkay-000HBf-VY; Fri, 04 Jul 2025 19:53:08 +0200
Date: Fri, 4 Jul 2025 19:53:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Michael Dege <michael.dege@renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading
 for layer 2 switching
Message-ID: <27047e61-8307-472d-96dd-1e5b89dc427f@lunn.ch>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <4310ae08-983a-49bb-b9fe-4292ca1c6ace@lunn.ch>
 <79a57427-fd4a-4b9a-a081-cf09b649a20e@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79a57427-fd4a-4b9a-a081-cf09b649a20e@cogentembedded.com>

On Fri, Jul 04, 2025 at 11:05:14AM +0200, Nikita Yushchenko wrote:
> > Looking at the code, it is not clear to me what would happen with:
> > 
> > ip link add name br0 type bridge
> > ip link set dev tsn0 master br0
> > ip link set dev br0 up
> > ip link set dev tsn0 up
> > ip link add name br1 type bridge
> > ip link set dev tsn1 master br1
> > ip link set dev br1 up
> > ip link set dev tsn1 up
> 
> Per design, it shall enable hardware forwarding when two ports are in the same brdev.

So in this case, the hardware offload has been reserved by br0, but is
in fact never used, since there is only one port in the bridge. If i
was to then do

ip link set dev tsn2 master br1
ip link set dev tsn2 up

br1 would not be offloaded, but done in software.

	Andrew


