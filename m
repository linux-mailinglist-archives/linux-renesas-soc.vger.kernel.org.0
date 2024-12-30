Return-Path: <linux-renesas-soc+bounces-11747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5E9FE584
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Dec 2024 12:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AECA7A0446
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Dec 2024 11:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E3D1A0739;
	Mon, 30 Dec 2024 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1OHKFCW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB6199938;
	Mon, 30 Dec 2024 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735556537; cv=none; b=mivPnc59icaokpKIO4EoniB2BXPFLUVb0pY4MEsvQ2l89zhB/c4OYpXIxVCDzoShpDzfsAR97/zA7UST1ED2fAszf63fHYi814jYZUSWVAOkxWi6oLCZGHCJLkahI2lO7aaRB5SGOfQejqySp1DB7TV1e9dN8cmu53CHbqXz2+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735556537; c=relaxed/simple;
	bh=1gX56AfqzLoM/+fJxWChrUmEKPBLT4+ioaz/iwmVG+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4MfvRE9hy/0lPfHjjIRRGN8cMfWmMkW38LNlIHB/AKstnP3jvflD272ezBJf56/wNlSoAR3PuE8JmhPxdCX/ZLtl1ztrTqIjcc/GQEVfsO37Tak2HNuzcbIeBiXwkUPCSXUSFidzwj6nRD8clK+2GEtrRBVjuRKF/ZyRC/6i3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1OHKFCW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735556535; x=1767092535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1gX56AfqzLoM/+fJxWChrUmEKPBLT4+ioaz/iwmVG+8=;
  b=i1OHKFCWN+6YvD8JNUtOdDvBO09yfDOAcAkyV7LA6Dun3sacpBaYxf0o
   IUYnFXuAA86Wwxps1QGT/ZNel4QmXkMquA3yynqzPLcKZg2h1SEVez+8R
   DSvnmY5gg4DiQ9xIzJ+Xhh3FduvzvS/WcZGxBIV4RK/Bb91q1GBuSmj3P
   N6GoKI57ObHy+ZFwBTcTQlrAPURpkK+Q5B5smRXKc5Pu0Rq/NOnkOBhVc
   lmFIVUQBQkZFYIDkIrj52p63v7QzC7Lq9HOh1eY7TGf1ObtfWbhvp0rMv
   817EIRKkEUYoSvT7vmRNZHYQ759fcxfqdiFzxrIgUfwwNKyxCAZCZ7cuE
   A==;
X-CSE-ConnectionGUID: pyl4Qr2vTrWOgjS23BjiTw==
X-CSE-MsgGUID: PJG38TqtQA+QrFgwqf0IEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46336779"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="46336779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 03:02:14 -0800
X-CSE-ConnectionGUID: Z9NcEiZhQQ+sulWEg60mOw==
X-CSE-MsgGUID: ySvCqat2RomAVE7n+Ha1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="101171243"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 03:02:10 -0800
Date: Mon, 30 Dec 2024 11:58:58 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
Message-ID: <Z3J88onQr44Gfa3p@mev-dev.igk.intel.com>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <Z2Up3mE5ED6uYVGP@mev-dev.igk.intel.com>
 <0e95c4dc-e155-4860-b918-13e47bf9b9c6@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e95c4dc-e155-4860-b918-13e47bf9b9c6@cogentembedded.com>

On Fri, Dec 20, 2024 at 02:11:26PM +0500, Nikita Yushchenko wrote:
> > > +	ret = request_irq(rdev->irq, rswitch_gwca_data_irq, IRQF_SHARED,
> > It wasn't shared previously, maybe some notes in commit message about
> > that.
> 
> It can be shared between several ports.
> 
> I will try to rephrase the commit message to make this stated explicitly.
> 
> > > +	err = of_property_read_u32(rdev->np_port, "irq-index", &irq_index);
> > > +	if (err == 0) {
> > Usually if (!err) is used.
> 
> Ok, will fix it.
> 
> > 
> > > +		if (irq_index < GWCA_NUM_IRQS)
> > > +			rdev->irq_index = irq_index;
> > > +		else
> > > +			dev_warn(&rdev->priv->pdev->dev,
> > > +				 "%pOF: irq-index out of range\n",
> > > +				 rdev->np_port);
> > Why not return here? It is a little counter intuitive, maybe:
> > if (err) {
> > 	dev_warn();
> > 	return -ERR;
> > }
> 
> It is meant to be optional, not having it defined shall not be an error
> 
> > if (irq_index < NUM_IRQS) {
> > 	dev_warn();
> > 	return -ERR;
> > }
> 
> Ok - although if erroring out, I think it shall be dev_err.
> 
> > > +	}
> > > +
> > > +	name = kasprintf(GFP_KERNEL, GWCA_IRQ_RESOURCE_NAME, rdev->irq_index);
> > 
> > In case with not returning you are using invalid rdev_irq_index here
> > (probably 0, so may it be fine, I am only wondering).
> 
> Yes, the field is zero-initialized and that zero is a sane default.
> 
> > 
> > > +	if (!name)
> > > +		return -ENOMEM;
> > > +	err = platform_get_irq_byname(rdev->priv->pdev, name);
> > > +	kfree(name);
> > > +	if (err < 0)
> > > +		return err;
> > > +	rdev->irq = err;
> > 
> > If you will be changing sth here consider:
> > rdev->irq = platform()
> > if (rdev->irq < 0)
> > 	return rdev->irq;
> 
> Ok
> 
> > > +	err = rswitch_port_get_irq(rdev);
> > > +	if (err < 0)
> > You are returning 0 in case of success, the netdev code style is to
> > check it like that: if (!err)
> 
> I tried to follow the style already existing in the driver.
> Several checks just above and below are written this way.
> Shall I add this one check written differently?
> 

Just follow the style. (Sorry for late replay, I was OOO).

> > 
> > > +		goto out_get_irq;
> > If you will use the label name according to what does happen under label
> > you will not have to add another one. Feel free to leave it as it is, as
> > you have the same scheme across driver with is completle fine. You can
> > check Przemek's answer according "came from" convention [1].
> 
> Again, following existing style here.
> 
> My personal opinion is that "came from" labels are more reliable against
> future changes than other label styles. But if there is maintainer
> requirement here then definitely I will follow.
> 
> Nikita

