Return-Path: <linux-renesas-soc+bounces-5048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 386818B9FAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 19:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68B391C20B68
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 17:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA5F16FF47;
	Thu,  2 May 2024 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hJNP/kF9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD1516FF3E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 May 2024 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714671793; cv=none; b=FrscHSJ065of5/vyWHjpVDnqE7Ff2vuv2Ko/0EK8gZR0J/o7yY9S49difji1CgK1jUtzc2frAL9kAbsmALpOWTnywBN1sn8Aif80OX1wY1YYZ7q+kLGAuWoQbUUCo8cWYxbzB0Pdo7IePbphQaFsGgTJF2uRl/MsgdVNRubRjLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714671793; c=relaxed/simple;
	bh=Y5ekIZwPfHQZZ4zAd1mbempq7CrzxXibwR0O5Re0qNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OANyAqgBm0vqZakWE/9G5E8uYZitTkN2shf7pXcMD8qMfDtQtjwQE5H6wkwa8voViHCI6etbeTY9uz+13B+qBDxlEb3tAt+fRaT5bvcTa0RJUwt21GmXA6wlKR0VzmPZLyDwZUX0tMSCdfYa4b5uwkT4/8B1miRkpLXt55TaB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hJNP/kF9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Y5ek
	IZwPfHQZZ4zAd1mbempq7CrzxXibwR0O5Re0qNk=; b=hJNP/kF9066QRVxBntrp
	XBX1uwuVAsRaXvyqFMMzfwgxsQSmi0zvlbr575Y/JL7/obTBCHLuJBP65M+wGqrR
	nNPZbeGd6lIoAUCVnFchesMHy6cks+scr6Wzy1m0MDAa9eiqELEG0hrjflsIQYSZ
	AU4jbniV1vwUvS8RwwyjEC+ugw/1Izc6UCQjoojNbjZAfiOZfgyPMAEI9LKmxfg9
	PpmIaCLMRQ8dZTmjENLhgVc2R7EvewXXiH5sQO8+KfzHo6PFa1B+mc8VGwAufVua
	Sht7Z0ftF1W0har40HaR7pvEsPsko2XpsDhwqvy2Rho93XhUWeGZXSnSjGiwa8MF
	Qw==
Received: (qmail 3324393 invoked from network); 2 May 2024 19:42:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 May 2024 19:42:58 +0200
X-UD-Smtp-Session: l3s3148p1@dLpEInwX9q5ehhrT
Date: Thu, 2 May 2024 19:42:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
Message-ID: <20240502174257.gfmk7al3qkv7jiyj@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
References: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jyhn2ybajmt3qznt"
Content-Disposition: inline
In-Reply-To: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>


--jyhn2ybajmt3qznt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dirk,

> using drivers/tty/serial/sh-sci.c (on 4.14.x Renesas BSP) what is quite
> similar to [1] we got [2].

Do you know if the system was about to shutdown/reboot? Taking locking
into account, I only see a race condition when shutting down. Perhaps it
is this one already or I still haven't found it yet.


--jyhn2ybajmt3qznt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYz0KEACgkQFA3kzBSg
KbYCiA//SGZmniAt3ke2soM3ewrMGc0+W0jB7+D875ZL3JhkgvSkwIzqvYmBSmkJ
qMIyUbDJuhf5JRhPPCDrhSkcS/9OJi/7a34ZDdt7/jw0YDItXhoeB+wP4nz8XBm4
sFCMEwnKzf2jPJ1gSfxsiPxonPK7WFuvRuujxSf8qAHEFIzmXKy7UW4tcxYMU36A
xQWOnSZQ5aA1rhN1+Am7UgW83eiIjLjP5sci52Oyf3p0okurM1lQvmoJtgG6slbK
FvcCt0raPUo/FPmFjfJeCifyPUkjFWbCFIGzJbjwymAcE5OYvTYo/LNYa2h1lH1S
5b74xg/NdN9mdfWOF0SyYUu8HPwFG15uUJar/JCf+hbObHCYHdQtMraD6XL7d/Lu
EHa/XpduY/SLh7Z9YA25tAHbQb+6cXLX/ZThxEeaYwpKik83KobNQ9PHijMX7xS8
mgt3t1RKlDEujFn3fA4cXttA1A+2frXXF2LwdYRson+y6LFhaMwd4bdzA8iG9nGF
2070PnUytcbR41TCvUUIHlcBiTI9uTeXY+cJBVl+fuC+RWwK0PhQsNAN50y09c1u
uwtXOKhwyQSgHHuhNOGarz4hIlDRJqVEtbMEdzX5Iu/cYmMTmT8/yDx3KSJXS9yP
CpTaTBa3Dql2cAiTQF2L1Ssw+IAaeKlce/O6OGb2JZeV2T/I9wo=
=T5wc
-----END PGP SIGNATURE-----

--jyhn2ybajmt3qznt--

