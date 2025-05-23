Return-Path: <linux-renesas-soc+bounces-17435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EFDAC2287
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 14:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23EAB3A7E68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C49D234971;
	Fri, 23 May 2025 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZMMWkoa6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA5C231855
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002876; cv=none; b=TeJE+7czLkA8j+1A6c8HB7m6IhIaZNdQLQ9lVeN5ZF3+QAUynTqkAuobaXQ4Ue+eBL0atHF0lK6Hb9yA9VdTpYD1bGh/H46JVUMXCP+PxlQw/1VSp17FUftMDhV1qwjooCAXBUxhIF09SxxFtnK2Fo4lOSPl/F7eG7YdWlurIe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002876; c=relaxed/simple;
	bh=L3DKgn1jmnsO15VtrOJaAwUF1WELYU9QQph1Ud3friA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPFrYjvcYLRW762fpur/mBZuMVp/c4W/VfYparAh91+Pp6Ma2czRUjlS1cilMtuxmifpqzwTZrrv/hw9Hb2S2xDeU5IHAOaNgl6J/pDOTkKY4F5QR4fMUyskXiG782G5hc71Qu/Vuq/AZW6KGZPVvJ7vgWwVG4Gr5e+X/icaqRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZMMWkoa6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=L3DK
	gn1jmnsO15VtrOJaAwUF1WELYU9QQph1Ud3friA=; b=ZMMWkoa604Pc6CQ2v/9p
	HNIzJ92n1tW6fxStetChBPNlJOaS4nSNrG43LRu5B5N8yrtsfHHXNHr3E7ab/Q+w
	fDqSFVYM8LBop5ElQbRXcYfeBCCujFBr64+Z9TWGA91UH8lGJcdo8u4AMv6CSmAB
	58BdA8Nsjt+l6Wh27OpZzOFfAKKn4oFNqR4iydkOeEv1zzvvRTTdScjGJBryP1Yr
	HVYRVRNk6nB1N9S/50lvk46g8CZ6lQ4Zb78zOqJU9CMUMctfqFxTvqA8lC7jYKyy
	wcl+5TIoiUKpMdAxDGweTOsQlgL2fx/V0D5gTMk4GdOdPPWBw9Yb12IAyc9Fza0c
	JQ==
Received: (qmail 4034848 invoked from network); 23 May 2025 14:21:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 14:21:03 +0200
X-UD-Smtp-Session: l3s3148p1@2fK5ocw1colehhrS
Date: Fri, 23 May 2025 14:21:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v9 06/10] serial: sh-sci: Use private port ID
Message-ID: <aDBoLr-uPxxHgzEU@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
 <20250515141828.43444-7-thierry.bultel.yh@bp.renesas.com>
 <aC2yYDpsv7ef9IVA@shikoro>
 <CAMuHMdVPn3adKZMiLqoEz9ANNyekmB9WRFyz++49+FeEOkrSSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y0ZUl/CYrsepN4Nh"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVPn3adKZMiLqoEz9ANNyekmB9WRFyz++49+FeEOkrSSA@mail.gmail.com>


--Y0ZUl/CYrsepN4Nh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Actually I asked Thierry to use bit 7, so both type and regtype can
> fit in the existing hole in struct sci_port.

Okay. I looked at older series to see if this was already an agreement
but I obviously did not find this part.

> and 128 can be changed easily when the need ever arises?

Yes, this was my motivation as well. Easy to modify if somewhen a need
might arise.


--Y0ZUl/CYrsepN4Nh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgwaCsACgkQFA3kzBSg
KbbpPQ/9GV3OjeX/HMdAJpLnQ1ODmhV4euoVExOtEv4JdQiQRskt2j0fNESb+n9o
tztTdEZ+uaCwS+uKgVeE40HH8MpE49n2vR7IOZeMbT50hF3ouFdEDvxvfQt6FfNj
iji4977MBZ9OvPVjCnP4gmYi/6pkiTeDzWDs+5HW3mZ6uyxhei3Zfknb1U6R8242
AkHRSBgR5MuJOQPmQFIL0zE8BTnFyZHE5ZWoXKwUz07p4Qni1/hNAqpxL4+sfbcw
TzRNvRL1XTUggPU6R1j2kGbq+tQdbULd/Zsv+FJBm5cZYDLFZHL35WIsAw/7xoIR
EUOv62RTCs+6OPF82coSQDGJHvpTuA3dpDKd5mR9guwYGHkdpswTkThem1Z3LaXB
O4O3b7kZRGDYfQqvCFGQiTrKvueLPTjAWNwaMjYwhEGCaMrvH2GOByTyRhFeZuQ0
2MhvboMohshUGG3MZ3C615AoSZ52POlltmGiwOu+/mkoE3rASFezCfKBQdrnjkv+
ULELPfnX5XuXzwPA+MY9QbOfBdoPyrlugn3L21HL+LaCmrCciTfeAfNWM+V0LQqd
3UITOEBbXfuelkM9B4QaQXSPQsT3UvTqe/NzNIoWWKsvVawyyx1E5hN2k5Jgt1Jl
paEmAmHmTasqYr9bzXEPt6ZXkhIb7yceM9BvBLjv9d+w1ly9wes=
=2DqP
-----END PGP SIGNATURE-----

--Y0ZUl/CYrsepN4Nh--

