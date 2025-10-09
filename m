Return-Path: <linux-renesas-soc+bounces-22849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C21EBCA93F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 20:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C5494807E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 18:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A87228CA9;
	Thu,  9 Oct 2025 18:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gApvXa4e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2411BFE00
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760034873; cv=none; b=FE3koto2AsSjl/ziOZFcFIp5sHvWYjle5Rxp/lYq3ohBfMo0iFCHiUASbkGUTASI11ES5Zao4IQUVbRkCy1eQxVB6dCpvskltZHP6NEy5GV3g9+mnsRgrKDteVCWPjaKYrOtSZz5FemWSceCOMAZBzTcrMOeRF0FSi7cTglxX5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760034873; c=relaxed/simple;
	bh=2e3U6W7iPB3pTewkPtvK53K2QyKQm7Wnhh/BqC5stto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1+lgbmtpyvLMzW1uzOLkI7wRTnvHXwrzjzSpX4F9U6/7NOlQJ1kEjPsZxDp8brkQWiNZ1wqUPqjb93DqSdZJQgEtkRc7YKxtp5+0idSBOXhIxuYTBv7FXZDJZROvIiT4ElVjqC89EB1/RtYILg3vIpFF62q10G4Ry02Ppm8ufs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gApvXa4e; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lFWL
	bxWGdyjU8KeGihPbGhlWpYGSXsK/hNeq1N3k8Cs=; b=gApvXa4e791EJCmFddjC
	36UUT/TbDN0l03qUj4DhLRrkBeQEi6fk0YTOKATAE/OEvvNGGG8bTvBYFd+zRzHC
	sQctIn8q/L2crmjmqGTtPiirlhDdZIm6dFJTEpc6RNQN+NHz0J4As7GWC+lVLUYq
	8UWQvnR3+MJF2MTNGpFa3yDJJr/oj0owRu0vPdLInZmdyL3C/BDjhrQsUNGDWH5Y
	IAsxi8E2b/gGHb+Z/D7eoSAQGYGyw3gBiA1V2LVzVnJ/lPAXbhGAwi3dM+PjOCMQ
	0RscZ13NziuMdFnc3QWwFTpt7gSWqcKC39W54saYDWNscIoKu+e6ltvH9HeSr0OE
	ig==
Received: (qmail 1185082 invoked from network); 9 Oct 2025 20:34:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 20:34:29 +0200
X-UD-Smtp-Session: l3s3148p1@ZbcvDb5AUrEujnv2
Date: Thu, 9 Oct 2025 20:34:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: bus: renesas-bsc: allow additional
 properties
Message-ID: <aOgANZnOtkKTy4sO@shikoro>
References: <20251009071033.5378-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kluzIIetBO3+lrWW"
Content-Disposition: inline
In-Reply-To: <20251009071033.5378-2-wsa+renesas@sang-engineering.com>


--kluzIIetBO3+lrWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +patternProperties:
> +  # All other properties should be child nodes with unit-address and 'reg'
> +  "^.*@[0-9a-f]+$":

Per Rob's comment in another thread, '^.*' can go.


--kluzIIetBO3+lrWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjoADEACgkQFA3kzBSg
Kbbvmg//S5zqsepcIVTEYvXNK2HejJxM3tt+Id5GNuCxjueJhmSksS5rPM33qbb3
3GhBGioB4sXIRVWiyle48Pk+GuvWLVby7IkwjpHe21lohe5DDUxIABcQk/1EK9un
q7NPY3QS4IdJu/98vnJQOMmGdbVdp2Aof3VTAc+H3Hn96W8Gr3gQp9Wb/Qo0w/xJ
4t5Rtcqt1t73Ssmpgblg3j/vJ9U+A45ney1hiu4NAjZ0rBnuAkh018HfeeRBtgob
xJr8pGlsIjQO6bcRuqaXtgeP4qVaJftUjNyM0gAaJptfkMw88K5UKOxFimXK+P+K
lRt9ZJ1jrVhS+N44X+qciiiu01f0qor6s8Px1Vm69yyIgBnA6lkgdxYusXMJm5ge
aqWfmnfZGvSJK8y4u5sugRD72HyW/1UJnQ8j8f+mzvQxRHwzXRmtJJVvg+TYbS8a
TuluOc+Ljb0BZ3+kj+pn9LSfzJkoX/epMA2dvUM74mTScSWz0PNY+2GLcKOkY9LK
K66geLcO9aiNKTtr/3QQqbreHK+lMFYHjxyps0YfX6yWtKmgkFLoUeGB45ivlAbk
4EDM1Hd7/VYue5Xt4EfgQTvnjLK4JmoXbiqINYLJoeVeA+iHL3TY0+5kh2DdLUfg
+Wb2G8OpgXDFyjoyCReHZK1n/8ury21wQSjaMFseR4yr26paErk=
=t6oN
-----END PGP SIGNATURE-----

--kluzIIetBO3+lrWW--

