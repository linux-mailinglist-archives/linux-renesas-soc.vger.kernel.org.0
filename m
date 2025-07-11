Return-Path: <linux-renesas-soc+bounces-19517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCF7B01C71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 14:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5F167AD2E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 12:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E239A2D12E0;
	Fri, 11 Jul 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="amGhU/J3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B7D28BAB9;
	Fri, 11 Jul 2025 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238613; cv=none; b=chjbp4UVB49j48n0lbTGr0vQaBAp03ddIdeagrSYIUenLwCMA2Rk7jIX1mNBQeSsHMDHdN46K6FMfAvqr/7l5sEuvKOefrkjzLuJBEPHfFFQhcAzeLS1sWSSWMnOE3eJZE04XFx+ivdhKiWdZF7LBwfbHIQj6hcpqhnp9Fu54qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238613; c=relaxed/simple;
	bh=0p4MaFOIg3N6VS7YUc4ac6zt6bIBYOGJ5EDw95bFQmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLkiq1Pdbkk4JuAPJSkJIaa52W2TMP//+y+XEnFrXEj5cjRMYXg6kO7fUtYnoYTu3uZNbUETLPZJftyD/lzJUeR0/nH+Py2K6ipM6+l5ieqOWX9WnXzqlxGQL5IsMgCS3N8gSMqu8NKkh9L6tm5atcou7nyTBJrFOxnhhpDlf8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=amGhU/J3; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kdIY1TkUi1gK/N72Dx4YnsJolkvTvX4JwJQ3jELfTio=; b=amGhU/J3DDKxiY3+OjEcrjaoOF
	UTz4CqrkAe7+JmiFUwtpt/TkldYrLWrcw8o3f2oqJ4PUjvIh32UHMGzIme8RX0Q+NWNvV1mYb4dX7
	jRbgh3aFDBZRGNaRyTM5KpWfERPexbZMRLmljnTjBk6ejd4JjLKLAVTF/HmTKZzueArA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uaDIp-001ETL-Fl; Fri, 11 Jul 2025 14:56:35 +0200
Date: Fri, 11 Jul 2025 14:56:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phy: micrel: Add ksz9131_resume()
Message-ID: <64dc1932-9bc9-4ec0-930b-c329e92f2f09@lunn.ch>
References: <20250711054029.48536-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711054029.48536-1-biju.das.jz@bp.renesas.com>

On Fri, Jul 11, 2025 at 06:40:21AM +0100, Biju Das wrote:
> The Renesas RZ/G3E SMARC EVK uses KSZ9131RNXC phy. On deep power state,
> PHY loses the power and on wakeup the rgmii delays are not reconfigured
> causing it to fail.
> 
> Replace the callback kszphy_resume()->ksz9131_resume() for reconfiguring
> the rgmii_delay when it exits from PM suspend state.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

