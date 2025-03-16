Return-Path: <linux-renesas-soc+bounces-14434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9565A63519
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 11:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DFF188F348
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 10:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90077178CF8;
	Sun, 16 Mar 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BoT5ngFc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1B1863E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742122040; cv=none; b=JQUFUPL8WJywe41O8jr5R5axKg6ZfS75vpi8e3mQO07SXPuWF50XuVrcsHoQFo0RP7pFlVsPrItytnLkYaxJ+LsbckYzRCmtTf7sz3TKW7PLtg/Kzw2PiNKiPjn39ij+mcIuTldwBYyztkqS/8fH2D2vxmpYlANXBW+6WWz3KLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742122040; c=relaxed/simple;
	bh=hXyLp3/t4fJFFU8lybKRdTO/SUlAWwMutkfxcLi3+xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOJgC/S0mvjX9Aou0Fe3j6zqYZR11+lV9/hXGiyWVtyJ178yiscb2czBJI9MzB4sRiN7gIQ2RIMl/TTZxXahKvtVyfV1eQmEeWeqeiff1xOePPjocBIZbqFcjGyUon76WvZQmldHvNhXqS0LRuEgbG0LDT+YsrS+Gln12kvxDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BoT5ngFc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hXyL
	p3/t4fJFFU8lybKRdTO/SUlAWwMutkfxcLi3+xM=; b=BoT5ngFciF61OB6tuJe/
	zQCFLrXTdXkeU3KsipSm5TVBldzDH2DTKbvToTqBIHl355jY4LY5ap7S5Fr5DLH4
	b5AZAh2zBUH2LPjH+INXbCS0TZX8wzrSGoy0OW183iWCSX2XW+UZhQClYObEhzL+
	LRWQfz2QC2PHli2ak8i3Fr6S8rFwXCMM+lBljAXr/svoDaboHyCEjc0a+EIXQCs/
	8uHJYBp2hfS91Fx830w1hHt1my2bpSuBDsNAhu/iBS5cMyJqfFgwXjgywnDoXcUV
	FIqAdhBWxsaPeW869IA/V5XdiuxcaQ0hcuSXW4S8lotEJIm+RaW0qHN9dAqkXeRC
	Xw==
Received: (qmail 2664548 invoked from network); 16 Mar 2025 11:47:05 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2025 11:47:05 +0100
X-UD-Smtp-Session: l3s3148p1@a/p2ZHMw2M0ujnuL
Date: Sun, 16 Mar 2025 11:47:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <Z9asKLWKyrDXDwjh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
 <Z9ZuMzPS8dmQWe8D@shikoro>
 <Z9Z5S7ES8d7mjTsJ@shikoro>
 <20250316094042.GB29719@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uCOmUinykMQcIgmN"
Content-Disposition: inline
In-Reply-To: <20250316094042.GB29719@pendragon.ideasonboard.com>


--uCOmUinykMQcIgmN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Just to make sure: there can only be one bridge, right? Because the
> > suggested name is not unique.
>=20
> Bridges can be chained. It's highly unlikely that a chain would contain
> multiple bridges of the same model, as that would be quite pointless,
> but in theory it could happen.

Thanks for the input, Laurent. I suggest to keep the unique name then.


--uCOmUinykMQcIgmN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfWrCUACgkQFA3kzBSg
KbbkpA/+PiDYP8ftwHVQ3yphrpYxq9ssEIVfn75gZixWL+Ji2kdbRypF2zcPDxAu
nglnA+ucHEyuJ9vWvvnT//MPN3rDrzojgNyEYsrUtFB3CZpGd2QFhNaZzaNzfA82
dBTjOLwg37TjmPtXhOHetks6IvWsaE044+1chfZzOBbedIL9Lq8JFtgGp5d9LHSK
P+dm1BS0dXONGC9HsBrzfLEFf21fGbcxJzUliXfDz8d9HXcsnyjAgaKgel6CB0IM
gqtQjC1HHsyCdwUEc8pkhHcRKN0yfLEZUh97OQgxTdUDS9WDTPHqAK5YFJ1re/aV
3LY6XPXSEku07Ow82v+UGp/ssWXGulfdG8D/Sv+u8aql2BzeT+41kAQObdrYqpuP
1fl+pUJwdjpBe9VXbAA3qYoG58g7Czb6VWZkSmAFMlTY5fnCxuHUpIHiHgaATr9p
b/H1qdQLgcvSPcEq7yMiz+czrzIaImTsLOqXxxV2FrNfgMxFlnisb7cTF28Saft1
abeuCj6I3Banmz7KzJalbzyca12tD2yCDZjy5V4VWmvD/wCNh2fcug21AqB96xQ2
5hHaDK2JvnGixCg1unrdK3AfUPj9D5xzCb3NWKK15i+t2zfqq3F6ZQvJsZd/Bf6h
+1LrOSno40j8RZt2Ur6GH57u3j0u9lcvKVSJCSBaLK8qxe39X8Y=
=nnSk
-----END PGP SIGNATURE-----

--uCOmUinykMQcIgmN--

