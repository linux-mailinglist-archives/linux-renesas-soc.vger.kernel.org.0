Return-Path: <linux-renesas-soc+bounces-12885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EF4A29BDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 22:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAC071888D1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 21:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65DF214A92;
	Wed,  5 Feb 2025 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pHccHxv+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54AA208989;
	Wed,  5 Feb 2025 21:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738790908; cv=none; b=Qbgqa2TAVSVkgICkwyhz9As+cOtrU71CTWnppfLuApR5CLwrp/7R9rIjwkNMRtrvfbmT/xOLHp/7VA3YXudGGTCipqS13M9mjSCPDon7YuRAS7Y9TFDLwTyZnZxKEajA46fN/nBBtTDHZz9GKt9ylRxsn9iIz4lBA3Oojs/M8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738790908; c=relaxed/simple;
	bh=gOkfrYqL7w8l55M5OlrVyygWCxWRJtwdTuF7Ge7wl2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oteaXV8/1ZeZUt95SW2Q8GR8AK2ORgxG2nH8gFcc1wvP3wVBp4AA/cJoLWRk8YMB4NfumUaBhAAldLYuYavPqFvqaD2PRgOss5vjwKwVeXwEgTtV3NEZ7Qxv0cXNlCfjp681Vi84JKoyd4XeADrdM4cVbFCwnv1lkcfvodzoKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pHccHxv+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=py0hkrfL9mowZAkyiO6n2iutyc+zdodl2pydFVt894I=; b=pHccHxv+o0N1JXp+atykEsyqak
	7vB4EXU9NU7BuDQ7RsYwRFZli2uwjDariB58UL9RlOySGtAxR8sptAxyp4Kk+hGlkLCRcrfHQLgF7
	03Ipn4btSTKc0XVJYaVp1cpxFQnfmEBd6ME4lQ1lkD3/gwPtOdOdKQmrMatJOb20cJDA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tfmwM-00BJES-LG; Wed, 05 Feb 2025 22:28:10 +0100
Date: Wed, 5 Feb 2025 22:28:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
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
Subject: Re: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
Message-ID: <04f35c2f-f6ab-4fec-b282-e04c9008e47b@lunn.ch>
References: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
 <18a72981-9896-4725-8f5b-5783224de300@lunn.ch>
 <93856925-b451-408c-8dee-bfd8dc2d56b3@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93856925-b451-408c-8dee-bfd8dc2d56b3@cogentembedded.com>

On Wed, Feb 05, 2025 at 09:26:10PM +0100, Nikita Yushchenko wrote:
> > If the interface mode is 5GBASER why set the speed to SPEED_2500?
> > Also, USXGMII allows up to 10G. So this all looks a bit odd.
> 
> 2500 is hardware limit (or at least the datasheet states so).

Then it should return -EINVAL if the device tree has a phy-mode the
hardware does not support.

USXGMII is maybe a bit harder, since i don't know if the higher speeds
are optional, but my understanding is that USXGMII allows up to
10G. Is it really using USXGMII, or 2500BaseX?

	Andrew

