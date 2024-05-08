Return-Path: <linux-renesas-soc+bounces-5236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E71158C033E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 19:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2494D1C2111B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 17:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BEA14A8C;
	Wed,  8 May 2024 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2QUxa6go"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FD8E57F;
	Wed,  8 May 2024 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715189791; cv=none; b=VXym42hgxWsFHsZ45CWS8ASaDA6ingDD3pVKM8ei5gsP6wkxKZG1IjH4nZo5ymZnfO8m2L0T769EUGaNEG9sWPYOq52bTYESHUc/xi8MjAmD4bHm43y6ybuiBJNG8K0jLOhJoTCWo4iacFdSYjEeEnr6dQE3aPL4gRhY3OBbnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715189791; c=relaxed/simple;
	bh=WvGRDpFnU7bdvexiQnVTby+Q8hc/HiA1N+1bPXgNymI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bu36QB4TNbQ4opj4AXLDDsCY7/PdI+HNIwuPuQj7XuTHryB1eSF7arMXk1xV1q/DCpCHDFTlbUHQG5Z1pssDo3CmGTWdF5AbA1kNZJ5LFKrDSW54btOFqGHhRWokD8c3QEOYESIyxrjVK+FMgpDIewd8uZJQlsD2QLo6gW3oxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2QUxa6go; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IJWHD6fJD+RTBbtpWt6pxNfFmH4N0xHA3T0EGF6awZY=; b=2QUxa6goXrmd7mthrh8ujrZ590
	+3ABIjgJ/XwGcyAuqlsvFjwD7XKCu2xvBKAFb/JJQnYFqiyXaj6I/Y7pVCMqtPJ89ojccc3lbS3ep
	J2L2+9mcoOn120iQVHIrHPA6PICHVYsDVIL+Q01EVP5CVarRztYx2Qr6+FQDbr5eDwI0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4lDF-00Eyhb-Qb; Wed, 08 May 2024 19:36:17 +0200
Date: Wed, 8 May 2024 19:36:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <c4c84b76-ac3b-4f5f-ae4e-4712dede8dc2@lunn.ch>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch>
 <20240508105831.GB1385281@ragnatech.se>
 <ba35173c-eaba-4f13-a2ed-011f6f7a48d1@lunn.ch>
 <20240508125557.GG1385281@ragnatech.se>
 <51b6a4f8-ef48-400f-acb6-fd20e661802d@lunn.ch>
 <20240508151043.GH1385281@ragnatech.se>
 <CAMuHMdWQNQWtofKqAcdWurk5eV+gKaG3b-pWNd+Fjpg89BLkWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWQNQWtofKqAcdWurk5eV+gKaG3b-pWNd+Fjpg89BLkWA@mail.gmail.com>

> While explicit clock management works, please use pm_runtime_*()
> instead, as the device is part of a Clock Domain.  Also, the TSN
> block may be reused on a different SoC, where it is part of a real
> power domain, and manual clock management won't be sufficient.

Please document this in the commit message. It was not obvious to me
at least that pm_runtime without callbacks can effect clocks.

   Andrew

