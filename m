Return-Path: <linux-renesas-soc+bounces-12881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED61CA29750
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 18:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C6FB3A146B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 17:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A671DE4E1;
	Wed,  5 Feb 2025 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="cQJQL+7P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A853E2E64A;
	Wed,  5 Feb 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738776278; cv=none; b=sw7ShAVc02VZBUvVogqwBGTmX7+X4WgCaa+e1isb6tBOcEo5tt9QGLQ0T1w2yTXOIKlhuP4z3HLOlrDEonCrPpAflk2TrFxmtbXmMunB7Bi6iEkoM6I9kyMHpiM5TGyK9vws2ZQKjRv9kjLj7gES8tV1FNQG2rNvfTsRQsx43wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738776278; c=relaxed/simple;
	bh=S9fokhhJa6Jwtua/H5Dra0dqKsvHzFJ6psHbNOLIuN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHlDsPqYcyTiwdhX0CPKzxa+QJz8/yg1/RakEsVXGa09Ac9vkG1DLJfbj054zrA6bNpPac7mP8+7/LU5pIK0o2wLlOl61dZybMRlMFY9zVyrs8+atjJqNmkNsG7s6UK56BIg1y/32KAYu2g3x86AZu7QmHLJkSn8t85F4lESHhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=cQJQL+7P; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iiXE6ImDeXhqYWAO+mw4d1zn1BVCUrtoSSuTrLxEg+o=; b=cQJQL+7PTZAtKcaPqresuEaFo8
	YYMZFbvZF7rMmnHW6TvjbdG35SoFUk2bJuiKxw8Wi8Slqs3EYdMI1p2ObFTbD2qsRLbnpFYcDy59s
	YKCy4GuREXv8pXUuVvMDLSVWWGCzTU4OdDqsmFdcOQyaSX6BiG0KkD7eB2lgd3FQgYHc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tfj8T-00BFe9-63; Wed, 05 Feb 2025 18:24:25 +0100
Date: Wed, 5 Feb 2025 18:24:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Cl__ment L__ger <clement.leger@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: pcs: rzn1-miic: fill in PCS
 supported_interfaces
Message-ID: <ce0f9fc7-b646-43f4-8b3c-9eff2e916b7b@lunn.ch>
References: <E1tfhYq-003aTm-Nx@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tfhYq-003aTm-Nx@rmk-PC.armlinux.org.uk>

On Wed, Feb 05, 2025 at 03:43:32PM +0000, Russell King (Oracle) wrote:
> Populate the PCS supported_interfaces bitmap with the interfaces that
> this PCS supports. This makes the manual checking in miic_validate()
> redundant, so remove that.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

