Return-Path: <linux-renesas-soc+bounces-11580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342B9F81A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 18:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6912C188D955
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 17:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076EA1A9B47;
	Thu, 19 Dec 2024 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jvSghn7i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16033155757;
	Thu, 19 Dec 2024 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628553; cv=none; b=MlQqWhh+0KZai1gYf6yQcSaZbTMsaoUY7vyMxSo5QJa0JQh3BOYlqb1YbdhuNOQVGW/4uRYKOgM8f/lzSFGL5auPTzxW23vb/fTJisNfiBhxWlih13eZYESQ6tuJdZTxTsyA1m9zsMUgb7uaLj/eSKP7looZvYZTvqrguCDYqQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628553; c=relaxed/simple;
	bh=PrFMJath0AI7V+ueZKvT/syVDmwYDHFVw6Y2+ShBjKI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxuefxu649vLpSRI6Yqs0g/PjzLmnAYLW8Bh+a1o0IvH/1DBNPLFLLKcRC/H84vZdC2Nn7OclS6CnnJnXjwJk8+LtxqEwxunvy0aMfX0tq0X1bjnoHy3rxbm1UaZZOpfEy/TqCJituKy8UT/Sxaa/mcZ1ELGSfFFMOdNBVydbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jvSghn7i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED54E163;
	Thu, 19 Dec 2024 18:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734628511;
	bh=PrFMJath0AI7V+ueZKvT/syVDmwYDHFVw6Y2+ShBjKI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=jvSghn7iEazEVEmPAImFuHSS/kcMarzOeo76iQFxhmTk3eJg5qXdVAIuq+glm/KyD
	 jj4cQPaFpex0oKUAOiUeWYl+KiNhEVE8l3Drtc0VKnCBzSespK/2hJ4nUu3ya0gAss
	 m2WbLqIusni3xnkJpmVL2YkuqrSkDWjgN5rtghy0=
Date: Thu, 19 Dec 2024 18:15:46 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 0/4] renesas: r8a779g0: Enable VSPX on R-Car V4H
Message-ID: <njgjpk6ez5ydahpeexvuuo43m7y3axylspgckthjwllliuf6bd@hrng5ceynoaw>
References: <20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com>
 <Z2RF4vGtTd1wDjJS@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qhufuk5dzuxkhdvs"
Content-Disposition: inline
In-Reply-To: <Z2RF4vGtTd1wDjJS@shikoro>


--qhufuk5dzuxkhdvs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Subject: Re: [PATCH v3 0/4] renesas: r8a779g0: Enable VSPX on R-Car V4H
MIME-Version: 1.0

Hi Wolfram

On Thu, Dec 19, 2024 at 05:12:18PM +0100, Wolfram Sang wrote:
> Hi Jacopo,
>
> > Compile-tested only series.
>
> Can't this go ...

Ah yes, leftover from v1 and v2 where I hadn't access to the board
(yet)

>
> > Changes in v3:
> > - Test on an actual board and fix the VSPX and FCPVX power domains to
> >   use the ISP power domains
>
> ... because of this?

Indeed!

>
> Happy hacking,

You too :)

>
>    Wolfram
>



--qhufuk5dzuxkhdvs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmdkVMIACgkQcjQGjxah
VjwrZhAAm+NVFm9MDlMIM0gv2K5mEveIyoNqFQTacOSTH2GXVSXz0YLpMYELdeTI
5834NWnDzjiDkrr4G+nnJo6BLzgTPDzRQYt6dJ7Fb9BTtcU/hqnaBy5g7GyBpOb3
9x6pSMht5DXbyo3RHKL/BILwedO5NA9zz/XkiO8pBuLM0DlrV10shmWuzOnopFSs
aKMSxrcwsO4UEfNdwZ0MTiGnK7VXLnz7MvAP/zJ7Ndm0CLxkfJC4/HUZU1kDoBF1
1WxzCE9MDYpL0KJR7zZdrZvHvOLtUL/Tc7rOrooiVFPhV2pHLphtCAAk3cjrbHA7
zLiTTXf7JnK/aqy2Ri9ScCFHmmutYNHs/onTByGqoaYyAsWAIYbp71MDI2UlXjV1
fhmsb9fha81WpDPJz0JRvn+AaRr81QrFu83pU4nKDxbO9z203C0sN/2BokL2de0Z
YFkRCgID9fJQjzSu4+eAGn340GAgzi33dbCxE86UohEqkgamfYIwRwpGcHyJWrQO
afL98rKhlRZWZBKIKXLe1pZiYDmeDlc1HKD7jcbWYVvrb4yaZ6qalihHjYIiko9S
cjPSh7EKn5PvOmjO6H84hPFZhrwMrmRPgJS/At48pu6x2ZSMt9EUqKUSfURwGlrL
n5WkjJH5z14UxM9P2rtGIbeylETPvB+GbzmXP4fh/MaMaZmhvrg=
=s57P
-----END PGP SIGNATURE-----

--qhufuk5dzuxkhdvs--

