Return-Path: <linux-renesas-soc+bounces-15121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E37A7626B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 856AB169407
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 08:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D6F1D86C3;
	Mon, 31 Mar 2025 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="igrMAOWV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28571D7999
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409957; cv=none; b=FEf6Yj01kgeDB7admcFLR6gh6jQMEu6VqrCUU0Q1Dm+ZyCryC40D2MVUS6AZBTzFOIj6fJfvigPiNmPXtZ9Te4SiozUI1njU0L0bBE0rLT36ZG0BJo+F5l1FexwW/OwrVGgF48OkMVee7Q8Kzb/Vo+HiNZ+7QeAWIR5UmI3pWoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409957; c=relaxed/simple;
	bh=LSk+dlqox64Q4e4rKwf3ODiueaI41xX8vDf3gV7VJ+E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqzzrDMM6gg3b5j2PxkRV0JrkhbZcfMWKNC6loE9zQbHxQW5tskQYdYeJM4JZF9liEgKY3SroDXL6cYvqJHpr1psllLOGZScaWEqFlmk1FBcsNd/J9ETuCWdMI3b+P9qhl9Z0SuwhRI2v/i/jQz9aA/4xTczhju2pxraHuMccd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=igrMAOWV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LSk+
	dlqox64Q4e4rKwf3ODiueaI41xX8vDf3gV7VJ+E=; b=igrMAOWVfFekRogWtdLY
	Mm6fvTfU3n17CRWQIyT81TZQMUrrNDNZF7wjyas7Zs7BdkyTJ0xD0zGqscgoDQTJ
	CHFbfcY6/fm+8Ihf1Gd3nVswq6EgNkl9YmGSiMBE3HdqUzREpOeXr3HBiaGi+dEQ
	SiL8h0rWdfdSsrKTZecLwdCY2xB0WeFdUNDa3UFgmeC7I1/+dmJ6aP3oIFSoVTq5
	mO1c3neP32nRgAOD63bGG9sm4fctEIhKrsxZo9WZ6pJPUO/xjkUEdg7R2AqafrhM
	uItw4RlE28X2zk3JjutWAOV+LHfF/AUaXuueqeX2HLx0DVw4JDlPJpPOFtxnJ4nn
	ow==
Received: (qmail 1158313 invoked from network); 31 Mar 2025 10:32:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 10:32:33 +0200
X-UD-Smtp-Session: l3s3148p1@WBT8Qp8xdsNQ8qei
Date: Mon, 31 Mar 2025 10:32:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] mmc: core: Add support for graceful host removal for
 eMMC/SD
Message-ID: <Z-pTIYmFXxOBe2xs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <Z9w5SZmytn5g9SA9@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H2SuczBNSEJZj+2v"
Content-Disposition: inline
In-Reply-To: <Z9w5SZmytn5g9SA9@shikoro>


--H2SuczBNSEJZj+2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Awesome! Thank you. Will surely check it out. Not before next week I am
> afraid. But already looking forward to testing it!

So, I tested this with a Renesas Spider board (R-Car S4). The three
cases (shutdown, suspend, unbind) all lead to proper flagging if notify
can't be used or not. Only the question from patch 2 is left open.

But thank you, this has come a long way :)


--H2SuczBNSEJZj+2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqUyEACgkQFA3kzBSg
KbaLmA//UldyM/hVAW4YYDj93tKxOktK8T9DX8DyCxGiVaTBbv+6onVXpJ2S3qp5
OjwfIQ8MdtG2AvoSRJsACiqgFNDxcv3Tq28JnsOtAwvWcGqeHvWJ9JEUodEdG5/K
xobw+cYJyVCRgtKpppnN6fGXKTptZ+8q0XEfWeZWvTYoSRekvZbTIEDj8Se5AHJ9
HiPDTrrz+BkNcXR5a19joItbDZRwEHjwTptSBzvgVLqgTWcYvoPYU5RQfCkGJYVy
mxpb2KeqMxtJq0Mkzi3qPA5up2jbsx5djWuxrUruxSvsJoBKOiJ5OOkPMKUdHawD
lT+0folQYVQZElF5DZwC18iP9qXhksXw0/PeAQv6DDDfH0QOWYgk2do/VWkRhJf1
F/+Hiy3cyREelkMmUBW3sXbl325zyv83TYm3dem809angOqRVCf8faXrqGaP/YXM
bNUK2t0vJPSIVfqmYCs8dFWs29MjtM5kGUtTaaKo6fFWfwQvwhkPNZsGZ983nKLP
s2vScJCyd8ohSGyz2q0WxqRarCjgE/tERYx9qMxOuweyhTnVC+d0VMtSHxX/eQyD
AK/jr6jLkXHsO7+fGI320wgyKBtpR8dbvx35t/wD3kGpmnnzBchLJrcKtpU92jaR
ZAl9kko5RauxK9/A1aByl7HXeYn/bwxoODRufSwu+2Px0DysERU=
=3780
-----END PGP SIGNATURE-----

--H2SuczBNSEJZj+2v--

