Return-Path: <linux-renesas-soc+bounces-8672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E096A760
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 21:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6536B286742
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 19:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBE91D7E47;
	Tue,  3 Sep 2024 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5ZaBWPd/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56201D7E46;
	Tue,  3 Sep 2024 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725391718; cv=none; b=pytvrlAhqKlqNwyKbA95XdtBAOMSQXFWVn34savHSEDhC0/yo/7MWqFtIYTq/x+ALk/LZ9JBEC0XBiIdcxhu7dUKgINTHv6vArSuwwpwbqwU/z1HNEQrdiLenVjNRXbNNiNOji5UhmEnqAgPH7trT+nhyphawWcVkKcqUoD/w00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725391718; c=relaxed/simple;
	bh=OTSFf8kj252HGXPAG43nb9k89jBnY6/UNwFFZLqO4tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEfw3oYkbyhhyPMts7F1aQYVzZdWKBVbIn2cC3qi6gzmHAgAbpe/+G5H+4mICN1212UNci7Z8e1vFSBg9tpW5WtziJv4YJEDvf5DKPhYWw1/EPdnUDCq0sNW9uYzCuzlOIvikPnXJb3+tSP+FZKLyE2MVOEsKam99LW68k58vBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5ZaBWPd/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=w1+KyzeqNr4rzdqTfAjN87CcbaRGsYHUYc3Jeiu0BKs=; b=5Z
	aBWPd/IYlk9ykV+HxCMDUStRvG90shF4ME0jkvPP4WQ9MNtrdU56r5Vylvqg030+/oCrJ8Zqb6UiY
	kpYNyroXwyMRkbZ+jBoHPdJVM0vtTJ2T8nxB5DOV0HVqyWfTdz8M8ni1/ph72n26ZSMHLBUA8bsQl
	vwn2sBW0mli86sE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1slZCV-006Ssg-4q; Tue, 03 Sep 2024 21:28:27 +0200
Date: Tue, 3 Sep 2024 21:28:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add MDIO read/write support for
 C45
Message-ID: <e0833448-1d00-497d-9f1b-b6075493982d@lunn.ch>
References: <20240903171853.631343-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903171853.631343-1-niklas.soderlund+renesas@ragnatech.se>

On Tue, Sep 03, 2024 at 07:18:53PM +0200, Niklas Söderlund wrote:
> Add C45 specific read and write implementations to support C45 PHY
> access using SIOCGMIIREG and SIOCSMIIREG IOCTLs.
> 
> While the core can handle a C45 PHY using only the MDIO bus C22 read()
> and write() callbacks there are PHY interactions that are not possible
> without them. One use-case is accessing PHY registers using the
> SIOCGMIIREG and SIOCSMIIREG IOCTLs. Without these callbacks trying to
> access C45 PHY registers using these IOCTLs result in -EOPNOTSUPP.

This is the wrong solution. You should not be reproducing
functionality which phylib already has.

Please extend the IOCTL code to do what the core does:

int __phy_read_mmd(struct phy_device *phydev, int devad, u32 regnum)
{
        if (regnum > (u16)~0 || devad > 32)
                return -EINVAL;

        if (phydev->drv && phydev->drv->read_mmd)
                return phydev->drv->read_mmd(phydev, devad, regnum);

        return mmd_phy_read(phydev->mdio.bus, phydev->mdio.addr,
                            phydev->is_c45, devad, regnum);
}

mmd_phy_read() will fall back to indirect access if need be.

Just watch out for mii_data->phy_id and what it implies.

    Andrew

---
pw-bot: cr

