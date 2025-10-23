Return-Path: <linux-renesas-soc+bounces-23502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BBC01379
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE2DD3A66E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B5E2FF14A;
	Thu, 23 Oct 2025 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aT+B9CnA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19752EB856
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761223887; cv=none; b=LfFMzr8c1wvHkdp9c37PIWmaJJ+Rq8K0uVGg9goLC8s9CpWbFzloxXsK2OWTcpMnl849+aHc6pn3iKKS1fdZTEW6ggWG0YYHkkkjC57tjBTue0a58Eb8BqAkmyFJzEw63YfBirfF+JLo++8vWluK06+pCvp8DTiQnwj4F31P/wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761223887; c=relaxed/simple;
	bh=cq0krbDlv3LzkZ/tQuEhUkclvy6jim6mG0RsMCTIbkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnOnrIA2qfbEodkUtcI75incQtdThbaxZvs2ZuSGnGdus57hV6j2dWkdYcrNPoM0jbOnmHRuCL50QdzV6RrNwYla+duF1/9qOmZuMzzeEYenucZa+wr69FgyYMpmovDNF+QmzWMl23VSFyCZemERZ+ofzhZ2b311NRYtb/M1bhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aT+B9CnA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cq0k
	rbDlv3LzkZ/tQuEhUkclvy6jim6mG0RsMCTIbkE=; b=aT+B9CnAHWO/SkM1W4LR
	n2+A5nezSkw2O6XcMWFZUP3sl+Suz0eJuR37DsCCWV2M2bYLd8nzWLndfgQZuHOv
	+WSDgshxlwB/9rY2+avVRtRR0mix12HBujWCL7eLv4HyaQKNxVsXITwdDdSun3PU
	puFljBfzj9x9biWPm5W/ZjYGFvvz892orZzwy2+1EYEvYasP41Z3vrhmvrBhdbOT
	3OlEqFXQUpn2Q7GFI+ETGRInpxebi9cG5lvBNRxvsP0wTHE2hX6A1/ICVEeUJfq0
	DDAsDnJdoNuF1wS052hUiy0qLqgQLv7AKZ6+m3MPiKNZ9aZnzoNR474q1kmM7qrE
	Qg==
Received: (qmail 2208820 invoked from network); 23 Oct 2025 14:51:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2025 14:51:20 +0200
X-UD-Smtp-Session: l3s3148p1@XwTD49JBnVRtKPCw
Date: Thu, 23 Oct 2025 14:51:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
Message-ID: <aPokx5l93OQNyuEy@shikoro>
References: <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
 <aPIfF-3SgzW5V_gs@shikoro>
 <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
 <aPInv9NELU7N9QDn@shikoro>
 <CAMRc=MdWS2OSeJAkTRnAFMtXcVukwQ=JAWwJ3OHxogmgZnan6g@mail.gmail.com>
 <5c9761d5a6a14d4c250df6cc4201bca72d963133.camel@pengutronix.de>
 <aPnz6U-fcodRoobU@shikoro>
 <CAMRc=MejA6DsnOW3hS+aFtecXn38UypJU2TUrAWPoo9Ly341uw@mail.gmail.com>
 <aPoPGauSQCoaonl8@shikoro>
 <CAMRc=MeOsUOJTx1-UVdQQzxk=KWyOoO7NwfAhrNDJmUv7kOScw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TYeVbvLUVCvdSV6M"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeOsUOJTx1-UVdQQzxk=KWyOoO7NwfAhrNDJmUv7kOScw@mail.gmail.com>


--TYeVbvLUVCvdSV6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Cool! Then you bring back my argument, that it should be always compiled
> > in because it is a core feature ;)
> >
>=20
> No, I still think it should be a module by default with an option to
> build it in if the platform demands it. Just like 95% of the drivers
> out there.

I know how you think, that's why I put the smiley there.


--TYeVbvLUVCvdSV6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj6JMQACgkQFA3kzBSg
KbY5RRAAl/q3ePCuyfkDK/ePep9L8m/zkJp20L2AIXDSvGHCR6Y1VH5NGF91Rrgv
TbGOx1siPdLsxHqHYgSFwl5WCb+UBYH3gHddsGds6HY9h+yonALBzDHhA3nBanZp
z9C+tR1tDBPhQj0cB5OTdPn4Qx+EkXDpV3xTQIIjo8yMNp+3dizcGKOQDUETvtZf
KkdnAMQrTqYRDQC0YXI7TeIWL9k0nLzQ3RCd/yoFKwVm4cA27UeoWQF3qCGtewlO
xpqQVLqbac91KlVSFN9a2bOCxyl5oKQWd+0mjo30oJzKM03fYz08OqZcS1tUOFOz
wrBplKQZ5dnJetUm13FkzdaGFlA+GDYvmUgEwWWGzMw1MRCiW70lTuU3FrbWQov5
2B93mcfQw2kfoQJ9+cJuB4fV4n31zFfuCIbH8nGGKI+ci2o0ZQ2tmNlPjvQcLk3V
YmSAC6P0o9nbq17pOA0T77kNv+yI85fGitDOvVfgaEgTmG0mfYq7Dzm8rjX8KtRM
s9Zt0riKaIUlLGyYwqUVHX9AKrq/3U5cxKWZvLDbxaTZZVKnx/ayH+bBA2DhgD+x
IFWl7Or48cane9O7iCDeQYxu+XZSycu+8QmutXSLrx1BSLb05rfxajZWh5WnXeGx
Sw8dyrh/Ptr7SmXh1oquGQq07VJ/0EaY7BnvlZgq+DnL6abv5uc=
=FnzD
-----END PGP SIGNATURE-----

--TYeVbvLUVCvdSV6M--

