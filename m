Return-Path: <linux-renesas-soc+bounces-24295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2BC3E41B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 03:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C48DE3AC4B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 02:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BFA2E6106;
	Fri,  7 Nov 2025 02:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HIq3gVse"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B292DECC2;
	Fri,  7 Nov 2025 02:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762482790; cv=none; b=c3xtcQ17NiXx6gBkbEyzOtu8Dsu70MbWUy9Zb/72MN7+SMCCtThE62x1Z+W5kehgey3GOE6mg2vpBeySojyf11r0WSS8M2UMi7r2VClK5Lfn6eDmFK7/BzjBfrLDMArpopnz0jdNHvwDjFzoqhMSHNtWpMqtqZwWD5ILkypa0wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762482790; c=relaxed/simple;
	bh=U64EFPOpamQaJacRJPb7d/XQfvNHoQeeHPePZntGGAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZET++fI2uo9btFdJGWj5oSJ4kv451RK3Zw0H6Z2MQDX2PZF4gIK47nzN4OORntw+t54jSKxLX2hu+fVszKvPqLb1iBdNZxO+7woPpUqAryeHIUVorHg/exBnee06H6SeVMSjmiY/Rwi7/NyUctuKhzfI7EqrRIl0JucrkkFmeDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HIq3gVse; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=phFtGS0Afldhcoum+tQSenmeT2+6JBZq5dncCaR739c=; b=HIq3gVseM931Oyo3EHELPHlH9h
	zF1Z0Iqvp/uMt5jiIqJ9EYpn3Y/DBr22dcYK0qfQgXcXDmGpisfOFAtlFbTFgCji1U/ZA43JXEKfG
	OHRAbm5M8Ek1xVnl6Me4UFxELT8iCVTsxTvzc7RnkjbHfmKadAtjKk4/bHZNAlI8QZ6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHCHZ-00DB68-Cw; Fri, 07 Nov 2025 03:32:57 +0100
Date: Fri, 7 Nov 2025 03:32:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH net-next 10/10] net: renesas: rswitch: update error
 handling of probe
Message-ID: <adfd8b4a-c89e-4368-b4ee-7d65f95e7128@lunn.ch>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-10-dcbb8368ca54@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-add_l3_routing-v1-10-dcbb8368ca54@renesas.com>

On Thu, Nov 06, 2025 at 01:55:34PM +0100, Michael Dege wrote:
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Update error handling of probe function.

What is wrong with it?

     Andrew

