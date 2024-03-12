Return-Path: <linux-renesas-soc+bounces-3733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D62A879E27
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 23:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EC171C20AFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 22:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A3214375F;
	Tue, 12 Mar 2024 22:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gxGzxolD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EC3143732;
	Tue, 12 Mar 2024 22:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710281112; cv=none; b=PxJjLjAo4ExXaPVqjFiGMapp912CSXmrjoM+rTz8+HruJMzG5jI9HRZBYne/Sq5GbPbxySqZY6mgMZEO6XkQdVrNLGoh+3QfrdiXcOesCx+M2fo0sD0CumJLaFO3MqMtotb6Mj3xYEhRUQEh2rbJV8x9QIywLF4oxBn1VJ58KtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710281112; c=relaxed/simple;
	bh=ELExRnyyQft/d3yTHHKTBI0MgLMqv2PTqtyynbm8f7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cz4G5Ar3U6sWwsBZdlwQJNgX6B5sE/ddmupPloew7lzImeTxBDywXR81JXb2nXxezlW7jRhvsb9qY+1Qe/Tz3NrGp+/zxzORN+ZAk2+IE1boK5AhTF9Hslxw4kAPFc62n6jEYyznzN1l6b07MlqhXHOOmTTJTyOkHyd2TMxbxw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=gxGzxolD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=SY2RqLdZFChLPLAviRsAsP9PDiXlVjdiL9oodKrSpMA=; b=gx
	GzxolD8ggyww3BSSxAIUgOqr3KwzQCkBxb8WUMYaPMOu9EkXMRruXvdUrKUFDR+Ou3KB7vh1SHFf+
	+MTl+wZx9tLdlcZs91q4G9HAoj6xokqo9nIsnH098PoNDpH8Vpq3SJ9tK/mNzZ/6p6+q/8qkJu5yd
	Dr6JZmbobjFw3cg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rkAFb-00A5Gi-3x; Tue, 12 Mar 2024 23:05:35 +0100
Date: Tue, 12 Mar 2024 23:05:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v3 2/2] ravb: Add support for an optional MDIO mode
Message-ID: <fc6b2bc7-cdd8-4b9a-a698-618cf144e387@lunn.ch>
References: <20240311141106.3200743-1-niklas.soderlund+renesas@ragnatech.se>
 <20240311141106.3200743-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311141106.3200743-3-niklas.soderlund+renesas@ragnatech.se>

On Mon, Mar 11, 2024 at 03:11:06PM +0100, Niklas Söderlund wrote:
> The driver used the DT node of the device itself when registering the
> MDIO bus. While this works, it creates a problem: it forces any MDIO bus
> properties to also be set on the devices DT node. This mixes the
> properties of two distinctly different things and is confusing.
> 
> This change adds support for an optional mdio node to be defined as a
> child to the device DT node. The child node can then be used to describe
> MDIO bus properties that the MDIO core can act on when registering the
> bus.
> 
> If no mdio child node is found the driver fallback to the old behavior
> and register the MDIO bus using the device DT node. This change is
> backward compatible with old bindings in use.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

