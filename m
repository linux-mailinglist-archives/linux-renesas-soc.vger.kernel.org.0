Return-Path: <linux-renesas-soc+bounces-11627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA979F8FF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD94161628
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6021BEF8D;
	Fri, 20 Dec 2024 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CFzmckcv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ACB1BEF63
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689578; cv=none; b=BCMkKmNVSNBdzZ5+S7E7UZHLrtHWr1SjIDru9OEwqtlPnT2mGiztny9GoEpJRSXo5d2nUfAUqq4bRnK6u+N/NgXZhfwKx5AvDbLdbGNYFVZHku38cIeMxDy1jxQIXtdiNTJGWLHI2NDznHlhlHdzfSzxA2CNQhyagUPn4xbbjNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689578; c=relaxed/simple;
	bh=ZO1sk3Gh2qu+Y9yWyFOGxbYsrP7SPHpDfjqU8s0JPXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWqbqICMK4T7hG7mxt4Spw6Hlm69K08dl9kifB79l4ZM6f0l9+IFpexwhtrwH7ibJ728sfHb13smFVHM/rcQLvUHcbPc76x3/TRmTFK2f11oJOjWUrjH0KU9pFmpGalLrnyZyJyGqnv7rofKlv+TwInyZ/xytstY8G7cBGI7YSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CFzmckcv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZO1s
	k3Gh2qu+Y9yWyFOGxbYsrP7SPHpDfjqU8s0JPXc=; b=CFzmckcvk41qoiFooEf4
	60C+bEWgRCjoJh7HM3G3Pru0V77fl7auIkXfWqGXcBPfm+/9CzkfSHWWCxhmgAKA
	7fhq8xU8ZOdXrquLl/TuRkBhy9qtOoli1tncgMA6eAok4i+nN9ZqsyIkuKpHxvrU
	na6ql579JZ4TnECMjkY9S21LUea3SyCF1TSiC0w9ZyHTm7/+ioyMmBaD8SYzbt4+
	gwuZkl6vFw004PjBQ5MOqbLYVCIHpu2ptlG5R6VPsQ7AZNNqG3hnqMjF7zs8lKv0
	IczttLIMz6nMQizkUfgyGYDm/zXrfziKpPzdVgLN6kiHJ99GvoqvtqZu3E/8A/6j
	oQ==
Received: (qmail 967411 invoked from network); 20 Dec 2024 11:12:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 11:12:52 +0100
X-UD-Smtp-Session: l3s3148p1@+1LG47ApCsIujnsY
Date: Fri, 20 Dec 2024 11:12:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH v2] hwmon: (lm75) add I3C support for P3T1755
Message-ID: <Z2VDJDdQaqEQzoKS@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVTxLhhnD8zL6FjaMy+YV6NzZ_TCQtnM8PHzrfjejj5Dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u+yu5u4/GxFy1n8u"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVTxLhhnD8zL6FjaMy+YV6NzZ_TCQtnM8PHzrfjejj5Dg@mail.gmail.com>


--u+yu5u4/GxFy1n8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> That is why we have {ge,pu}t_unaligned_[bl]e*()...

Aha! I knew I was missing something. Thanks, Geert!


--u+yu5u4/GxFy1n8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdlQyAACgkQFA3kzBSg
KbaIKA//Q87mFSLkHF2VCYQIttAb9NCY7fxjIPQGNoy/kj2cmZldkbkl6mpbEq2c
u9mP5bbus7qNcvaptHSORAXYD/V3FVx98G873z9a4wa/rBRRB/+k0hOXWnT4rcAk
HQ2uLb7IhHA2J3x/opwMISP955QU81TxYngYERmo8HHcfaF91vKHPsjG0qTMwAQP
+Sts9IJROEL7sy4zaradMuLhNOVx5CoAulr48NLw5gvcWpqGXoMDxOkOVQ8KqOMy
UdvljBXIojyw8d0L8o2W94GLiEsZFG+y6daQgk3mmR2oA9qrnOVdg7L/pdzVNlEK
fiJQLRc+yYV9vlEEWrQ6l9wUUQFpR9j6WGwkJizdKPHLIirHq27SQltLVnfl7mPe
1nzlzhxNsv3WRhgNbD/zWBtBUKTtOLZGb+YSquySwH0KiKPsnNztnO+Bx6aMt7Mg
H5V7dRRB1wG5vTvpcwXRCJneaf/KlBR7kwi391f8pgTDZWkefsIWyzvtIebuerk1
/aSgsgkTMejblQ9EJ4NgGgQs6LrewvG4Rma3g8q7HFva2a3hy92mi/rWuVkNPi2M
MG7GDubd/TH16w2fZ6NwW8UitnRirl+TaYcIEAM9aEv8rIcbrJGJjhtuYsOTo9Gs
4R03wV8zNfotcDDpqEVRsEemCpFHmENItXQ2apl6v73Sv3NYw2g=
=OA7t
-----END PGP SIGNATURE-----

--u+yu5u4/GxFy1n8u--

