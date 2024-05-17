Return-Path: <linux-renesas-soc+bounces-5401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B95278C8C4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 20:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 634F91F21433
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 18:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA73746430;
	Fri, 17 May 2024 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="a+MP68A6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA22433A6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 18:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715971068; cv=none; b=WPJ2b+ffCj5HJ+xu9O7E8UtWTZrzblf55vjqgpncqBlZyO3U1IhvWLhP59Add++5fO7K4S+YmWzfPRcPchXj9ngGqfCsrK+j/X+m0gCQRmLqEOf6IFTQ5RfuMLmiABlZ0V4P4TGkaiwYn0Ur9NcS0WLDfX2/5g6gyVjHqI0wOvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715971068; c=relaxed/simple;
	bh=Jx+LCJ6kKfs/evdnTRoR4BciL3QWHDB+3dVsloFxCb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMZ3ZFKUi10KnBFcINNWpJPke/ed/QkpteaRb77fjbEfUwvps4zeSF3bdF5anp7BypOFBxisERKhuhNL0PqI1xA+dsBlnJnbOEmSISqIg1WxN0kzdV9VDHzirRmBWAq2YtMlF6wajufej7NfDOzpiWmYkVXsH9ck+teJ9lS0sh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=a+MP68A6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=S7Wy
	LTcVYX8Vi7rNvQ/OEPPRvtbwkgUi/hh2C3Rkygs=; b=a+MP68A6u90zVAq/Fujb
	1PR2yx6k9uj5kaGJOLXv6ZDkpdIeQqVjwN1xP+34KobtLmh04DZmQ4pJQ9960/EB
	XlwWUr4UpGCJEL6W6qx1AHIuYDYevnRVNd08QusU7dMhtSljIbIa1Q7fNEDPr+L6
	tz60QnqS8JZXR4Che+S8JTxcwvYF4LTksQOBHjaTo/DYi+SiD/XTz1u+nrcEM+YV
	yiaf1tp4fwPjJTT+/1Ma/YdrDdndJIqBu/hMsYifNp35fZR0tAEc/B67c6Jczao3
	DurPcLjFOBvnKyLBcCpeoL+x4C6OLly2iEL4iWLeY8NnqrWnuBWiLpfOZyXBuCfC
	8Q==
Received: (qmail 3576725 invoked from network); 17 May 2024 20:37:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 May 2024 20:37:36 +0200
X-UD-Smtp-Session: l3s3148p1@Z8BFpaoYLIxehhtP
Date: Fri, 17 May 2024 20:37:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 0/4] *arm64: Add CAN-FD support for R-Car V4M and
 Gray Hawk Single
Message-ID: <ksoagxg6p2v2liikgdqx7iz3aqenpxyrqwsqpz3p33ixna2fwy@5jgfdomffaf6>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org
References: <cover.1715956819.git.geert+renesas@glider.be>
 <r74ymblr7f7ruwjzo3dfnr5y7xu3z3nf3e4esadicixdiexxf3@ycwbwxdskzzc>
 <CAMuHMdVBWDtfa81bOnbPneDEc=n4hC8wbM=EeXNddPHU8rd0ZQ@mail.gmail.com>
 <CAMuHMdV__ZZYPdN04CS=iLSRawgCKOf=EO0WGioTAZsrc_=XQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="owhw23ea3rdaaoov"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV__ZZYPdN04CS=iLSRawgCKOf=EO0WGioTAZsrc_=XQA@mail.gmail.com>


--owhw23ea3rdaaoov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> rcar-canfd driver) lack CAN transceiver support.  Backporting that
> didn't help, but now I have something more to investigate next week ;-)

Yay, at least something!


--owhw23ea3rdaaoov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZHo+oACgkQFA3kzBSg
KbYc4w/6A4IxbfbIBKNkJnSLckUdFo1xcWztYim7gVL/1+/fS4I4531p36Q983O1
wTL0pstYTBI8sn5891+gxK4K/yT2SWhN2DOjGMCVThFbVTnwaLT2gwyZKJ0A+2Iv
avN9gb1WiS5Qk4PlPD7hoFVY8kcU35K0HNxWfutzJCLkpc/Bzx3VBSt3G0BuIsYT
Z5CmX/DiKsHKZVQbnuVouMGPIOrKs7MjurTvs9ehL43kPMC0TuTUHahlckJgxBRl
dXKLgYrFI7IeYAlMrAe3wBca5LjzR29uKSxPIzr+eoEC79JrPq0/FnsGosECvjuk
SLUA1vxGHkqzaX5gt7qa9AW/YjI1sF88me64OCDzRAIdgW9W80umQ3/giWdXuSgd
v6Wj2QFa4MnIUbgiGw6feQ1voHqPrx0AiNL72u4oAckTtTaeYhVfmFOpNj9tod6S
GruhBIwRW6jFKBHswHHJJVHcscD1nvMHVbA2V7Mpdn0yjPuNvxQu+GFhByEffgY0
MWDQJ3p1Xn7FOKZ9kXIo+ATAeDunI7I7cpXhPsSUpyEiKmQPbzfT/h79f5gXSaO8
g6E7kHX02YhV3JVS4aJbt2cPqAqsd3eV7jYKMX9WXIynCRDrRGFZcJnfr1nCDZhd
PLxKKIrq5srbzwSQVip/Xy46nuU31ntqN+wOLWnOEi1guuHLIa8=
=rRdZ
-----END PGP SIGNATURE-----

--owhw23ea3rdaaoov--

