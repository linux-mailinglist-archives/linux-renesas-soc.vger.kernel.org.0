Return-Path: <linux-renesas-soc+bounces-22576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB3BBB3D18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 13:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7D11325BDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 11:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40A021770C;
	Thu,  2 Oct 2025 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EWGI9dqs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F4A30EF9A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759405829; cv=none; b=pBIbgBMwQGIaQ4wNzF5NRADf4Q0vyOpXx2odlkpt5dLTVmfq+YVt3Ee0jaq0ZjMc7EE8qGt4LLBnWiyfCow60KfR8FOH4X5zji5DivvkJeycA4HANg6u5tMAApAKjOxi7a9GnALU+dhMk2LalH0MDgsaBsRIXN+5LfW8rGLaOQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759405829; c=relaxed/simple;
	bh=dZA7NeQvBSG7kkrREgxUjyxVevDFNetKyY6tI/k2oPQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piVpW8zHCylyt4SlQaoriY1Z0JmX1C/5esebVQp0tc6nyc16kILIO1lFWq+Hc5X12wH/9f5x7hXIe2y54PhF9LxJiK7nukipldgqiToJ+g36rJ0SRelkO3A9ZyC/+aM4kdLB3hfFQhmw70U1vMb8hhGFBpvpR/xYiY3yY4yjBU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EWGI9dqs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Gpwh
	Jtp73JfXh+lIsscSlKA4GQ/t6oPZHhHI5SMQp20=; b=EWGI9dqskRgs3hyAtLrs
	kRNWdRGRovY1p3w+uXVDJWf1VqkvSJ0qolZCrPKL1N+ulw277HTRCVdy8mUnO6gC
	cRSG3NOc7XXTpfiDACt2twpJhMYmfnxQ9+CuAplmhbl1fc2tOm3OXyDRG/ki1JcB
	xTwEd/bA5b38OrzjGMe9H2CjWkbNzzSvROU2mTqjcGG/TYNv6j0ld2xUzO2LmSge
	FJ+QiB36P/fh82Aoznz/RNmKbnSksyGnVASvJkW37V763iA6AzdzBDhIPSArXoOC
	lwNrjK4Ljrqzw3prYYqyA6y06AHpkt2gGOI9+iKMjyHakDw7MDn864JEGCM8mDvA
	mQ==
Received: (qmail 248704 invoked from network); 2 Oct 2025 13:50:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2025 13:50:25 +0200
X-UD-Smtp-Session: l3s3148p1@GlI5lytAzNUujnuL
Date: Thu, 2 Oct 2025 13:50:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
Message-ID: <aN5nAAQ_FUDyFF1A@shikoro>
References: <20250929083449.14393-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RJKvkMBcSMMML+tF"
Content-Disposition: inline
In-Reply-To: <20250929083449.14393-1-wsa+renesas@sang-engineering.com>


--RJKvkMBcSMMML+tF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +        pmic: pmic@0 {

The label can go...


--RJKvkMBcSMMML+tF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjeZwAACgkQFA3kzBSg
Kba0ahAAsO8/t565EvtdNHYw45TLWSj8dPmqFdg6dHVoPrV3xExyqPmPgnc1le7t
c+Oelfhb+ntnwpZrZJ6xoRApPQ+8Q9aTLWGGzPmp84RKy8C4wJ4i92UDtym0ctZi
qrx2kGZe1ymW1lOxhDfigDQUtFfclYeI7zyxqtNzd1LJqv31m/vovGKLmMaPg1pF
OEdjQp2umKGuQiZ8CWaFbs13fd6f4aFbq9Ddecc1iylVJp4v+yTS35BPnUDQytFs
nHO29vGf7oAHIf4OejlyYADzws2ybPQQl65Cu70Ew1gz7uIk+YuDma/uqDWCXYRp
qTkvqhmjowSRpapDrVOGRrWnbXcs8RpfAK53OPu7O+xNv+uVnW7mCnjYbSk5dz5i
xTTyVyj/A8of8uxJ6EDHtvdidPop43daWxI+yWeqIp5gGLAAEoJRIRnV7tvd8O7O
AcdXeD8sLZHuOmGgffY/1IfqVymMScPAFxVde4FcgNtPMBCKxboSkpu7Qf9HpkH+
KcyMUzmVR77WlbQ0C5trh/lcrz4q/86pZ2fGmj5LqwTn7Lb73Mu0O9x6yPIgBTCe
Ni15okEieQa8LQTvYQ2nAV1Gn36Ta6nBeZZtt19WE/B5JoPqBArJF5UtnTnJ11np
S3Kjst2YzOv8V00/QzbBH8BHsn+wcCbYzZMbrsOhb+cbmzT6ilA=
=HJpF
-----END PGP SIGNATURE-----

--RJKvkMBcSMMML+tF--

