Return-Path: <linux-renesas-soc+bounces-24463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B154C4E19A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 14:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD6E61897CFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 13:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8E533AD82;
	Tue, 11 Nov 2025 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qseSiCY8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733FB3AA195;
	Tue, 11 Nov 2025 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867542; cv=none; b=rvA7woYuqZO/vhgpBurp97wpwG1CYBlLVCZlmkJgHg4/A+8tkpdL/8ApaiP51qvjyrJq3U/BUYmEjP94ZUqlkBc5mCGukmuEPq4HV26lmSY156cyMFTK8ThPM6Bn2MKokSz5hvHUdWjOVa+zGY/cV6siV37JR5j3xJZCY6C6qtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867542; c=relaxed/simple;
	bh=5EsWKWab0TfZL8rkWe7sw21X3iamkdttZZhN9YtiHCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nr6A3b71ctqpIldN+l7j5FYGLumxVxNIN/U9Fzwy4BPNLieb6N6Codi9mkG05tR6vx1RzW8GPgdeK7ps6/7r9N6hbUnPhqpZrYCH3bCpJf0r3J1fmRg06w+3j6rgNKCeyUwK8IyRm2giN+XNncDLpz6TdHV297QQJk53JncmObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qseSiCY8; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=GKa8ZOphxJu5jRoljgElqypELQNbesZ6BiyaAGakH38=; b=qs
	eSiCY868eh6OcYFU9gT6nQ5BRurXjjq4H4ZABkXQP+hqG8PxbaYDCl8e5hRIfHN5t/0791ZnKxGLi
	DEJeaR22EBRlrdxVclCjhme+R1w4a9bw8UuroTZA2FTztBVfjHcne+pTdRTzk6i8VqMcsYbWBgpXU
	hZ4rn9ZQ5MrGkvs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIoNF-00DdHu-8T; Tue, 11 Nov 2025 14:25:29 +0100
Date: Tue, 11 Nov 2025 14:25:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Parthiban.Veerasooran@microchip.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, Horatiu.Vultur@microchip.com,
	geert+renesas@glider.be, vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: Re: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
Message-ID: <59e68865-fc18-4180-8e18-91ba78b40118@lunn.ch>
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <40e744b5-cc17-4b33-8d0b-1e9987eece7c@microchip.com>
 <CA+V-a8t5Ac_pb3iUGsQSEiJ_Ji-TrKGr-E6xCJEcx_cK2nKeFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8t5Ac_pb3iUGsQSEiJ_Ji-TrKGr-E6xCJEcx_cK2nKeFA@mail.gmail.com>

On Tue, Nov 11, 2025 at 09:56:12AM +0000, Lad, Prabhakar wrote:
> Hi Parthiban,
> 
> Thank you for the review.
> 
> On Tue, Nov 11, 2025 at 9:50 AM <Parthiban.Veerasooran@microchip.com> wrote:
> >
> > Hi,
> >
> > On 11/11/25 2:40 pm, Prabhakar wrote:
> > > +static int vsc85xx_probe_common(struct phy_device *phydev,
> > > +                               const struct vsc85xx_probe_config *cfg,
> > > +                               const u32 *default_led_mode)
> > > +{
> > > +       struct vsc8531_private *vsc8531;
> > > +       int ret;
> > > +
> > > +       vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
> > > +       if (!vsc8531)
> > > +               return -ENOMEM;
> > > +
> > > +       phydev->priv = vsc8531;
> > > +
> > > +       /* Check rate magic if needed (only for non-package PHYs) */
> > > +       if (cfg->check_rate_magic) {
> > > +               ret = vsc85xx_edge_rate_magic_get(phydev);
> > > +               if (ret < 0)
> > > +                       return ret;
> > > +
> > > +               vsc8531->rate_magic = ret;
> > > +       }
> > > +
> > > +       /* Set up package if needed */
> > > +       if (cfg->use_package) {
> > > +               vsc8584_get_base_addr(phydev);
> > > +               devm_phy_package_join(&phydev->mdio.dev, phydev,
> > > +                                     vsc8531->base_addr, cfg->shared_size);
> > Don't you need to check the return value here?
> >
> Good point. The orignal code didn't check the return value. Would you
> prefer a separate patch on top of this series or fix it in this
> consolidation patch itself?

When refactoring, it is best to not make changed, keep the code
logically the same. Then add additions afterwards. If something
breaks, a git bisect then tells you if it was the refactor or the
additions that broke it.

	Andrew

