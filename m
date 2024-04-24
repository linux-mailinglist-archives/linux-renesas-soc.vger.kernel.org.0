Return-Path: <linux-renesas-soc+bounces-4898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1868B166A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 00:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4E9BB245DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 22:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD03416E87B;
	Wed, 24 Apr 2024 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Z9ia8oKm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E999416E879;
	Wed, 24 Apr 2024 22:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713998750; cv=none; b=Cy8O2NLb76vIqkwG8dCMi35rf3fjQQfvpDkNMve3JKNBa1xDHNNXeEYu0nszkdiCAvip3LEhLxMRl/5KKKB9B7EXbya/K3CK0HU7Hl7y05qtLA7SbiZCykZwQSpftToHd0npW/JG+iv8/+lihF2bGpiV+N2a8GR1ZXOXhtGodC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713998750; c=relaxed/simple;
	bh=2bVYRRQaaSANIAiBxPXSRAarBno2eLafIZwTUiWnNpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBslqUXc5rl8vfbf/P2agAilY+Lu+smENAvDO9BdNGMZa1B24Ue2GYyax2/gEQIXTgQVXfJraeR0iixPuiWYXdnwooxn+e23vVFFmpAmSpoxwujKMDAKk3x3+nRZR1fgzk+4xD/2Uf4DzQxCmhrsv+AeU/cHaZPTWPl57F8GTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Z9ia8oKm; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Q6vQC85ZngIOR8bR4u952PNrCjyiBnCelYS1okjQp/g=; b=Z9ia8oKmH7gQiA1k3XDKCHwSDc
	IvT6Hp3eOFiuhkkzrx09/bp5NSIFCTavHmVn3u9uewpT4/L3dDCePJjmpTshvZ9fI7nRZatxgXMu1
	J4Vl+j1pQrMUwiqaHP4ddxAHIviSrOnfVOWfoyXJU7kWQb/GGtTUNMZLG4+pnuLfM8+E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rzlMt-00DtX7-Cy; Thu, 25 Apr 2024 00:45:35 +0200
Date: Thu, 25 Apr 2024 00:45:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] net: ravb: Fix registered interrupt names
Message-ID: <1f131230-56a5-4547-bc77-c508e61e8a55@lunn.ch>
References: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>

On Wed, Apr 24, 2024 at 09:45:21AM +0200, Geert Uytterhoeven wrote:
> As interrupts are now requested from ravb_probe(), before calling
> register_netdev(), ndev->name still contains the template "eth%d",
> leading to funny names in /proc/interrupts.  E.g. on R-Car E3:
> 
> 	89:  0      0  GICv2  93 Level  eth%d:ch22:multi
> 	90:  0      3  GICv2  95 Level  eth%d:ch24:emac
> 	91:  0  23484  GICv2  71 Level  eth%d:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  eth%d:ch1:rx_nc
> 	93:  0  13735  GICv2  89 Level  eth%d:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  eth%d:ch19:tx_nc
> 
> Worse, on platforms with multiple RAVB instances (e.g. R-Car V4H), all
> interrupts have similar names.
> 
> Fix this by using the device name instead, like is done in several other
> drivers:
> 
> 	89:  0      0  GICv2  93 Level  e6800000.ethernet:ch22:multi
> 	90:  0      1  GICv2  95 Level  e6800000.ethernet:ch24:emac
> 	91:  0  28578  GICv2  71 Level  e6800000.ethernet:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  e6800000.ethernet:ch1:rx_nc
> 	93:  0  14044  GICv2  89 Level  e6800000.ethernet:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  e6800000.ethernet:ch19:tx_nc
> 
> Rename the local variable dev_name, as it shadows the dev_name()
> function, and pre-initialize it, to simplify the code.

Another option is to call dev_alloc_name() soon after alloc_netdev(),
to give the device its name earlier than register_netdev().

	Andrew

