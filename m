Return-Path: <linux-renesas-soc+bounces-12554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C423A1D51B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9107C1883CA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EC71FCD05;
	Mon, 27 Jan 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZpY9oPOI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72C91D540
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737976190; cv=none; b=eLH/dL3Tv4IagTAmQdiFNwCHXaD+XFUzr8DXGaLaC+ZYwbFYLvK7ft3CKyLeQqZ2jVAQlzECH6Jwhvf73wbF9h4aDSd76yUSghcD6U6n2wIRsLQaDEDDFrmAl0c4tm9bi/I5VROaTljYXpn1BctgCbb575HRnQNh2PdXIc8ApZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737976190; c=relaxed/simple;
	bh=oV3AWrb26ltPPfsSvhWryonnU4zGUtHKF+UY/G6MyII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcXgDxQBCdeFaQDTkO7cQRq6xOwhVqeM4fD2PbYdQjT92qWMas+UnthCRH7RBVhgWDjUhHch8Ubssbgp7MgntpHovEHe779BS9z8jFgihqspusVDr5hPL1Ltdhkptb2ETnnRRoNyiq4958p31k6cGRQ641SAR7EcHSAudeZ6Vws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZpY9oPOI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oV3A
	Wrb26ltPPfsSvhWryonnU4zGUtHKF+UY/G6MyII=; b=ZpY9oPOINk6J9AX7nFTC
	vCsMSG4K8bCkZVM93gLQYzuhw/TPEeyLGG07yINMlcjyh7w/5M3Hh2Jq2znrN7zJ
	UPcR7AdKYKHWyCFkf4pPWvJWKRBw6JFDP0GhstCuLk0v0yTUX978lqHRMWGTFfJz
	+UXyzxrowDoHpw0uxtQuYa46qBreAMUxRogvRQgRLrqTtxuUwjkwdezKtoGHv/aw
	E4560+5VP6mrld0svUl+Mgm39+5YFD1smlCd7cnw3LO92kOScjWa5hy7SjYBB5Di
	OqPnh9D6xuEQVuhL4KXeb4gjYUO/JQPtXGTrNkNVKYyQD8BU4q2zMPU2Il4LvThv
	9Q==
Received: (qmail 211291 invoked from network); 27 Jan 2025 12:09:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 12:09:39 +0100
X-UD-Smtp-Session: l3s3148p1@H83NHK4s4qQujnvm
Date: Mon, 27 Jan 2025 12:09:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
Message-ID: <Z5dpcZdHrn6XVlCI@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jesu6J593TrEfwul"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com>


--jesu6J593TrEfwul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Is the plan to replace all weblinks by webarchive links as a precaution?

Dunno if there is a plan but 'git grep' showed at least a trend.

> Even websites backed by big companies may disappear[1]...

I think you are comparing apples with oranges here. The main site
(intel.com) still exists last time I checked.

> Putting the webarchive link here also impacts the funloop.org server
> statistics, downplaying its relevance, and possibly even causing an
> earlier shutdown.

Could be. But could also be the opposite: not using an alternative will
eat all the traffic and increase maintenance duty, so it will be shut
down because of too much work. Who has the better crystal ball?

> The URL can always be updated when the original site disappears.

Still, the good thing is that the site is *now* backed by the Wayback
Machine. I needed to request the backup because I wanted the link.

That all being said, I don't care much which link we use. I just wanted
to address review comments.


--jesu6J593TrEfwul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXaW4ACgkQFA3kzBSg
KbZabQ/+LH74I0ra1YSymaFuieBvsP+proArGKqwdO8TWGMoUz16xe1PcvsEkURp
DNpA9SUeIsZtITrzNj45kv7GCugcZDsFCenxf5TauHXZE6PQ+NLs7se5Mx6r0PNn
O5yx4RKElXvwqusYBUIZlshZlANkanW2w5EYBBMsRike9Srszeqa8Zyi4Jcb+fs3
tQmbTilmF7EcRXWDshnUB2m4081pDziFTfz6cOJ+JsP2NAuALky6D6awliUqUaab
+oLGsjPo2AzTok7NIaI+9Co4rGn8ahW+2M45uxE+hjubpaEn7GBzNWbPmfeKwlWC
ovxcme3+trSye8QkgYq5mgAvVWF/uj0qJ8e2ZGZg0RKKYZU0oa6o6N2jx5xBJd+1
IBagSOaX3iilEZ4qw1PcxNqX/oeD9NN70zG/66lWhl91EY8cHhm/5O7a42s1k+qL
CDQLSBLnljZ9J924pLUReHRMFTxR5Czj6BtpBzk+Aq/1VEY965N9d1AhpuzERVI6
jnnPSID0qoXlXb/0fZjmlO8DceUFg6ZSD5nKb3XRRl0Uv90GHB57a4NqkXwdqimO
0WJ/burnbyzMOf6hZMXq+xPMEwohFQj8X1pZ+a1Pip8y8kQHICwt2AVqegGq7H/I
Sg/WpobDFWV6E0HaRtO3O1UamT6DhTVzwcnswLXO2iEj1h9fjBw=
=2tBH
-----END PGP SIGNATURE-----

--jesu6J593TrEfwul--

