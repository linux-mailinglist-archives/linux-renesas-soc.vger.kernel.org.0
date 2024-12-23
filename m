Return-Path: <linux-renesas-soc+bounces-11687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1C9FA9FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 06:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5DFC7A1CA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 05:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262E1481DD;
	Mon, 23 Dec 2024 05:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqSFEtfA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E317BCA;
	Mon, 23 Dec 2024 05:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734931351; cv=none; b=TG1PCJ7i15Yds6reIwOz23F/8YlMuJdGWhvwWZljKH03XlzvABjK3zbnBZKVPv1e0S86kfinUzcHtykXDU7qMwnyMG4NdsmsBSZl5orohcKWg6f8QNZw0w6KGbfl/QBFvkeGuk5IZME+mMhRV5PBJg8a7O8jqjkXt7xmfv34/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734931351; c=relaxed/simple;
	bh=SGhJXo8FuNqkQPr7MQD/4agu0L58VtnwoZEgjns1OO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chQrtY43T/c75hlMh0DaGvli8O+C8ubvXI9YHCeR3WnuhL8iEGTEY753CoaekUifInkJW2ML9tPYFR6cF1W+siCS0Kcly9eF+sY05kjLpKDfiUbjJYLRBssY0I/65zvx37JU2Xj4bSWYkFL5c2SuajJzdJBYIJbxjxRg0t9B+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqSFEtfA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734931349; x=1766467349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SGhJXo8FuNqkQPr7MQD/4agu0L58VtnwoZEgjns1OO4=;
  b=PqSFEtfAR4Guw4C7xfUG4PNhVKSL/uywlbIIpXORwmTF7ifJ4AXP08ee
   EjmIaQurkmBmoLpqoEhcBQS6bgG4uhoXnZHT9M+VwMJ7CvsiZ8yWoMsrJ
   cBpVmEqpSxaB17VF8d7rsLb0vpb2SjEV192rauW47LWoyWCXBgG8Llk4v
   AryEwbG8im/zRBAPSXQAtUZoGXEXDepZXphTO9zNy5z3Qe2G0xxPR3L8D
   D9Hy7GbJx8rWmvCb7ZFe6hPEN0JOiAXKh4g7LfQoSx+2iQO1MgnzoM2E5
   /uj/CXC8FwQo2+L2UXQPMGgc+uJu+fBv2ztk3Oty4wxAxqy97Dh00sblA
   g==;
X-CSE-ConnectionGUID: I20vjLu1QsGICHtDFAt2vA==
X-CSE-MsgGUID: 6iF/4aWDR8+XAZocQR9loA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35515768"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35515768"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 21:22:27 -0800
X-CSE-ConnectionGUID: MuzGL1UkSyCMd0Pu9zukpw==
X-CSE-MsgGUID: KAbYWSQDToaDsizxuzIiFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="99633100"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 21:22:24 -0800
Date: Mon, 23 Dec 2024 06:19:16 +0100
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
Message-ID: <Z2jy1EglD4j/ENvM@mev-dev.igk.intel.com>
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

I am fine with following exsisting style.

Thanks

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

