Return-Path: <linux-renesas-soc+bounces-21916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC269B595DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 14:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95C734E5D53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEB025C70C;
	Tue, 16 Sep 2025 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eJ25TKuI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C722B2DA;
	Tue, 16 Sep 2025 12:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758024991; cv=none; b=WxgwWhuVx7ZTzd2dvOH11LE3SgPk84MOPym9LyUs4gKcNygDM/lM//cd4Fr0MB8NKL4bOYVHJPi9B32ZT8sFQG/gtEfIqVACK2Np4dSTGDypHDhkQkuSYfFc6aRWO/5pI1Y/tOyLQTlangdzDMUtI19kwUK3dRLmvId6IkpDJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758024991; c=relaxed/simple;
	bh=//WXLnsbo913jW/ph2oCWNSa2lJbuZ3HeK/nOhtS1UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5vuHvyFzaqk9kOBbfO50Okl8uZNyQBFK84rgFP02lVJUNfXHPxVBboY8RMOM+8TE0gbwhHyICSjWPkLczHLJwUD6AnBrEK4YcRF0jVNMHemHSmapRH8m2EiDFKEy5CW7YwrQhsQxUMh+K7upp8bw6DhlV9jW/h5jAKAW7SVaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=eJ25TKuI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=9YAYoewyIrzMInrGau7uGA5IbwtA1c1OKdZG0pmIQqU=; b=eJ
	25TKuI8r8mOz1tif7vnf0SG5OVEMFknfND5LsGGocYVXhkW7jLECG/FSGGr+l+JSKq9KKTC0M1sO/
	a+aefEMxe1+aJn1fryp+0j5QXNY5Dcm3V/NgIpOa9NjDkEkXR1DqGwXA0bvYT4g+p2PqFYgqFOOJ1
	SkW1IAASHQplHW4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyUbR-008YbO-LJ; Tue, 16 Sep 2025 14:16:09 +0200
Date: Tue, 16 Sep 2025 14:16:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 1/6] net: rswitch: Move definition of S4 gPTP offset
Message-ID: <bff98e48-ae2c-489e-b422-3cae28bd0e16@lunn.ch>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916101055.740518-2-niklas.soderlund+renesas@ragnatech.se>

On Tue, Sep 16, 2025 at 12:10:50PM +0200, Niklas Söderlund wrote:
> The files rcar_gen4_ptp.{c,h} implements an abstraction of the gPTP
> support implemented together with different other IP blocks. The first
> device added which supported this was RSWITCH on R-Car S4.
> 
> While doing so the RSWITCH R-Car S4 specific offset was added to the
> generic Gen4 gPTP header file. Move it to the RSWITCH driver to make it
> clear it only applies to this driver.

This is a nice simple patch to understand, which is good. But i do
wounder about naming schemes. Since this is a RSWITCH define, should
it use the RSWITCH_ prefix? 

Are there other implementations which have an equivalent of
RCAR_GEN4_GPTP_OFFSET_S4? How are they named?

	Andrew

