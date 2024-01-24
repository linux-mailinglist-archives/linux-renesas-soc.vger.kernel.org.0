Return-Path: <linux-renesas-soc+bounces-1788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A3883AD50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 16:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C6471F22254
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 15:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321AC7A708;
	Wed, 24 Jan 2024 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4ZPc4di"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D917C67
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706110199; cv=none; b=ZmNxMP+JHiidNh98z45eGLwJf2y8b7VE8zI2WmDcLwiRzPeOQBPddlgg7mbQUoWVSlKBGK8HN3BVSnn0Lz230HMtkUCoiL33Umgrgf7ibjnNVI+KQ50rYb9PoHGsfz6MOlTs+pUJmLZdIPiSJST4woiXN3SZTM0GmOiMQVk/gEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706110199; c=relaxed/simple;
	bh=AImHQFHrbx3+APwszkcRDmWdLLX+UPoyPTQIIXc+W+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvxZ/7oR+4WO+/sObUIDYAU9COaZ28gkR2v4lXQ52N8MWMgHgd4uh21mOmAh+vBbcEllF4abTTnSf20lAgAUYF0ix2ORX6gdLBs52UrdCoK+mNMu7k8NXg6AuO+eSuCpUU6yec2/OmYDfCy745hz93XiUEVDReamTLpU4dwz9lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4ZPc4di; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F40FC433C7;
	Wed, 24 Jan 2024 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706110198;
	bh=AImHQFHrbx3+APwszkcRDmWdLLX+UPoyPTQIIXc+W+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4ZPc4diThwDrAZXQuagpv/kOAG6Fsqn/uCJ15Xql0CLxY4E3jE3tvFO0jWWgqTvW
	 tchcWbOnrS2pq4Vzilwbbs7zK3JPe7fOIX0N61slk9PiKWZoTYaYCVosNmcBXRhbp4
	 Wa81PRcwNxIjRLN7PyMZIoDQjGvSrfCNLc1eBQJa+TRU446pOD44443VZm1d1axGg8
	 9kkuHhp6KHOhaU/aQzYO4Jl+yAhz56JxDbykv8rsnlPHW86QvR+4avo2EdUxFYCAnI
	 ImZVXXmzjubJ2VtpP5CeszqvRc4G5WDlulQpF/Ft5cuqwKczHGvH7NJ3HsDGQYBROG
	 h+kOzxRtw8GhQ==
Date: Wed, 24 Jan 2024 16:29:52 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 7/7] arm64: dts: renesas: r8a779g0: Add White Hawk
 Single support
Message-ID: <ZbEs8OTAB1VwNo-A@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <7f9c840ed44dfd57da545e87b5937b58f35cb9c9.1702309604.git.geert+renesas@glider.be>
 <ZbEKR7GO_aeHsmwe@ninjato>
 <CAMuHMdUYrjtvSpv=_501+f_SD0_gkPu9ezqAED3uC0Qd0n09+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iGQfmBZT5MkRDmjc"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYrjtvSpv=_501+f_SD0_gkPu9ezqAED3uC0Qd0n09+Q@mail.gmail.com>


--iGQfmBZT5MkRDmjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +/*
> > > + * Device Tree Source for the White Hawk Single board
> >
> > Maybe add "R-Car V4H" here? Maybe even "Rev 2.0"?
>=20
> The existing r8a779g0-white-hawk.dts does not have such a comment.
> Perhaps it should be added, too?

I think so. I mean, the whole point of the series is to make white-hawk
includes independent. I'd conclude that the actual users of the includes
should specify which SoC this instance incorporates.


--iGQfmBZT5MkRDmjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxLO0ACgkQFA3kzBSg
KbbUVA//eS1G/TxtKGzxWCgPtzkPIn8NSpkEJ2E4832MrAPGvhEv8EhqAMPJSh9r
gxg2X9D6PaqOZDOUaaujpBrAse0Cj+V8h1/Z6fIjSyGk74Hc6IZxIbS3sYxMB97h
kpGriR+TmBk2D/APGfSdozMtZofB1XiBDHjxnNlT14+43BALKEazJ+6oafRUONBb
iMi+5fON7BVJmjIRqk+cu3ukBTECiDd0i9xto4wK9RDLhm0BvpImC58WXRHyGZp9
fzqr2w0ZpSwMFBNMUphEs7MQcZYd4L0rc3u29FD8k9RjrAIK3fh7+ykIY5Oz70yy
o/CgsOaJxtL9fhaPBVU/TF2yn8S7CatpeE1NSH876qwqUgMMkH+gHaLPEXeH6qNJ
YmqaQzCBycDfylyJ5Iy5SsVc9s4WGe0/2f4HEAM5GNhOaaokwnWuQx3fMTyyzvrA
5CREbppTw3R3gKAo1UfOiwB6VukLirSR/+QX2Rzuj/EO8G1kJzN3BIBmhaLOwteP
p1V5rupVcjD6vmCjB8uEtilrvPYq2IoIH4b17jaGkyV7K9zgsusPq6XGgpFxJKy/
cXq8mXmFIs20R3yjc2TkhyCAMVNO8Rm5UwZuSbYxWxCSpspZ8p3rK1gjnsZYqxoa
n2h2tN71dKE2192MXdLr23zSy4pebXOX778HzN269c75KxOElXc=
=/Iv/
-----END PGP SIGNATURE-----

--iGQfmBZT5MkRDmjc--

