Return-Path: <linux-renesas-soc+bounces-19402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1227AFD867
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 22:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A38581C2537D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 20:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2508E189906;
	Tue,  8 Jul 2025 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iR1cnEVI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B414A60D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Jul 2025 20:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752006822; cv=none; b=kAuWDFUXWNYAs8YXoO6tlSNN90wM4iD77y0rJWvtF/r/Gq/toYBOdOHFIriYMxsYTpZ5y7r78IJsS6W5U2PMs8LShypzh5lHR18rHivoIx48t/Qi9835nr7Fuz0frGS44avedgeaWI1FcTf9Fqh68O7RvUnpBcSNmkLV1B1wWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752006822; c=relaxed/simple;
	bh=FeUqmzlAKVLxc8rx1lrgHkEV98G3B2X4+zEX7xfouVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzg5nqRiwu3rwcWUUpeYy5rSVjKpya3PVo9uFrWnc9Gg+JrIyNoPP/GXOCiqfOFasLput5RRcohzYcpbFeZBTijKMvgg+y0bezeIpa95HTqmiw/QCDPYJKqu4d79YEq90L+LJ5JwaYFkCl6URy/HkXQbhCuEczjrMVyB30QkB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iR1cnEVI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FeUq
	mzlAKVLxc8rx1lrgHkEV98G3B2X4+zEX7xfouVk=; b=iR1cnEVI5U5uxe29qdrI
	ljmiZ/v/lHp8BqPHjI0gye6eK1Hw1R2Br5IdXdmXSDONtxnEP4zuuxvwcP1woWlz
	tycmOo11/ZhylhC+YFH647QFYWssykKatFn7uH/jSqReT6QgrNvD4RCniOKy5v9+
	Kenw+EL+dBHKyPuHClVPoMfizJESjbfCTP96Rxy6TbNdTqeMexbpTmtqArkGqVWy
	5ESa8MlgpzThokZNzlGq/ylgUE8jut7jBiJJFqDAA8zFNCuFOZjsjCR+T++2qk9b
	oLyzp6G/48ZLySfoM/xfYtBBea5q/zOlF/OpQkz9dU0OJ38hhy0m5ZUH52zzBiso
	Eg==
Received: (qmail 410077 invoked from network); 8 Jul 2025 22:26:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jul 2025 22:26:55 +0200
X-UD-Smtp-Session: l3s3148p1@HzH/x3A5Ho4ujnuW
Date: Tue, 8 Jul 2025 22:26:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <damm@opensource.se>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/6] ARM: dts: renesas: genmai: add rpc-if SPI NOR flash
Message-ID: <aG1_DpJy_VS-rK0s@shikoro>
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
 <175174255437.83411.8624204632703877341.sendpatchset@1.0.0.127.in-addr.arpa>
 <CAMuHMdWxZGB4KD_L2scf97Af96TbhjMaS_b9WBoPu+usRYiKYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sSVrnp2D2nzmZnVH"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWxZGB4KD_L2scf97Af96TbhjMaS_b9WBoPu+usRYiKYQ@mail.gmail.com>


--sSVrnp2D2nzmZnVH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Removing this breaks the direct-mapped FLASH ROM, which may affect
> userspace, and prevents using XIP (but I understand no one cares about
> the latter anymore).

What is the gain of using rpc-if vs. memory-mapped?


--sSVrnp2D2nzmZnVH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhtfwoACgkQFA3kzBSg
KbamKRAAjdAV6o/d0a3i84ed0Dum2dCAIoqwBTAY3nRAtU7G8/ZgSfvi8gDlGWDO
/5ba/iCBGwSKstxbq4aHAmaBCMtKd8Hhu4kxdz/YD7XhmUXv8HJyKD2e991sFJHj
39yPs+b7Ov6A3Loei1/P7vPkGK5Qn0fmfnyA2phCXE1Uc9KIkHva9uPDrFv/dz8d
+ZGswekqxNwqpZ60rAHhozDCLkUSGqz5rA8C/EHczo4aYVvYTjcGxUviqfZ9gUL1
YdlbSglCbFbWkODbwFJE/X+84SNCaKvT1WSXkpksFBG3JGmQdIuK7/GdqonowNgC
1+rs4SbSJ+qjpmYSXcL99wjz8RwI2Ek9S8yZCmd82fORR4gHXIiZmtoyDUdivq90
17RyT46Ag+ZIOwoDGI3yni3Bgg68JRVAltmKUqLjeC8m/YE7UAaybMXs1abdaNaF
6Y6FAL8bmby3JLOQjJmaY7p5mwa+/Bg9IPpHjxOR/A1WE2Qo/3erNzuNeARzjrp1
GZ4w9gxGiTCHK4l0XZHbxX3pjK+Pq6/Q6qbKTlayHht1sMyV/gkEMCIxbPn021Rv
0QI7SMuzohYIQomufDbT+oj/j5YMVNhw0Wzxf9yRlaKhhR1MdXeBI0LrJ2+zokDK
juTPZ4ZcilBubfHi1+1hUZQPvScs2w9qPq2y226v+ukzNSK7ZFw=
=uo33
-----END PGP SIGNATURE-----

--sSVrnp2D2nzmZnVH--

