Return-Path: <linux-renesas-soc+bounces-24554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B552C57A52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D609C42442E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 13:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82076350293;
	Thu, 13 Nov 2025 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5e32cf9Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD5531A554;
	Thu, 13 Nov 2025 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763039213; cv=none; b=A571VTbxFThwi8cwLnCjg/tR2ScDCkjdUqZwT+KxnwtcblWrh7d2Im8brswB+fhe0vyFMfeQ8gwlUnh7ckZPyJBZVEyfdVPeqDBzX6RQycvfNVr5dmvN+kSnMGShRmj48FQCm54/DFWs74MXT4X1pdfK/zRf4Yzm9VM0LArhwqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763039213; c=relaxed/simple;
	bh=MSaoXbofYopsSWhGIFcEbL3FqKPo0g3w0hZnrNaeLQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y01tudtL89M6Xdvwfxu3cJkBl8HgjaYS8KEuYjpXvL7AU9uhG+mP/Cvvn9+iByaDBjQSyVxgzCZAyKkFXdy7uyfh8w9PM92PypPyG5R3DiYjAJo5sKcK69rtbz6+Yg4pbS4C/3BlNEW9hZUS0vvc9Wz3TyZ4etSzLDOOMYVzQTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5e32cf9Q; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Z+3/fwdG9bFOzWxb0nd1a0BQGDgCe2gR+4yRHxJTSqA=; b=5e32cf9Q0tSlZ86HUP0jqOvvaH
	md+rLM1i2WDKpJKq01lw3W4/yiwBf3XTt1r8lbYcfz2vuA4UTKp5Yq4jZP0wEm2g0UowhEUhA0jLW
	PBbRlCIFuP0zP/zsTsO4txwLVQJ2JZ/ZQV8zvQK38yr7NFKneUeHqXQ+gsdxz40wjqGg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJX1x-00DrY2-Uu; Thu, 13 Nov 2025 14:06:29 +0100
Date: Thu, 13 Nov 2025 14:06:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Parthiban.Veerasooran@microchip.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v4 4/4] net: phy: mscc: Handle
 devm_phy_package_join() failure in vsc85xx_probe_common()
Message-ID: <9bff0108-8fab-4672-bc6e-58c672cf8a22@lunn.ch>
References: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112135715.1017117-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112135715.1017117-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Nov 12, 2025 at 01:57:15PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> devm_phy_package_join() may fail and return a negative error code.
> Update vsc85xx_probe_common() to properly handle this failure by
> checking the return value and propagating the error to the caller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

