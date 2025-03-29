Return-Path: <linux-renesas-soc+bounces-15039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7528A75496
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 08:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 996A17A5253
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 07:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54101624C3;
	Sat, 29 Mar 2025 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mm/jkY21"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF9235979
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Mar 2025 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743232690; cv=none; b=eRpvlKcLvWouzKCzR8VKBQTj1ugcrGiY/1vT2Tps5fbyOdo5p/4+YVIgV8KOjPPimbxnG9jLpPAdQ1C/uEq4w7LXGtwB6oyAo8JkKTwgGZlqut5F/XoYdRDEAp1HB4zbdHM4hNoiSvdNbSv9Crcc9H7CKfuL5ef4Zpt7MYVUMbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743232690; c=relaxed/simple;
	bh=SQ5a/0c9TzMxjdnRp/lTAc9obIpAwtemiz6iMrwyYSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrCKmMIXZf2vwPY0qrMUs46t7SIFD05WiyBXYF88XFA6+3xv0PDjRZXVvief+1AbAnUltMliWDWYTcoC/1iWV4lhPqJ6ZnT3f3WTnEOFpBuP4ikw+21gEbiuEYz5mvfc+XRqrdfAcXahXCIejgD3bXzwSADvcbF8cije3o8ud5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Mm/jkY21; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SQ5a
	/0c9TzMxjdnRp/lTAc9obIpAwtemiz6iMrwyYSs=; b=Mm/jkY21u2lj51ThR03A
	qDclBr01poEU1knD48F/XYm77/drHoY2mJd9wYCWvT/IQeUrsdQ4npI6uwPm9ecY
	QZ3bIfkehg9iM5wcs70tAjpi6s9iNsCxzEmZyZPCeBCKJS/gSDJLxxbKsL2RdAHw
	1NBGhHat1pd1B9AbHQEpbNbkuPzhjmu96fhBV7cU3Q7eiULrNw69JUrsJyq14FcF
	cna/FSPFq148/1/m5NsJ8yTKYb2HXb2jI4ae05/wWSlVKHVnIZGEEfaUz2n2jWXG
	Cw1ieMez9XCGTfjkiRoAvyjrwDwSTUXJcMENtJZ+k6zvCN00nqWHOpbG85R5cpjF
	Ug==
Received: (qmail 500989 invoked from network); 29 Mar 2025 08:18:06 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Mar 2025 08:18:06 +0100
X-UD-Smtp-Session: l3s3148p1@g/4A/XUxSKUgAwD6PzqDAV8182DI+BaV
Date: Sat, 29 Mar 2025 08:18:08 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Sergey Khimich <serghox@gmail.com>,
	Shan-Chun Hung <shanchun1218@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-mmc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mmc: host: Kconfig: Fix undefined reference to
 rdev_get_drvdata()
Message-ID: <Z-eesJwwOTN5qMoj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Sergey Khimich <serghox@gmail.com>,
	Shan-Chun Hung <shanchun1218@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-mmc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
References: <20250329070329.32562-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HJrzEgu6/wmVFVtf"
Content-Disposition: inline
In-Reply-To: <20250329070329.32562-1-biju.das.jz@bp.renesas.com>


--HJrzEgu6/wmVFVtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 29, 2025 at 07:03:24AM +0000, Biju Das wrote:
> The driver no longer builds when regulator support is unavailable. Fix
> the build error undefined reference to rdev_get_drvdata() by selecting the
> REGULATOR in config MMC_SDHI.

As said in a previous mail: I'd suggest MMC_SDHI_INTERNAL_DMAC.


--HJrzEgu6/wmVFVtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfnnrAACgkQFA3kzBSg
KbZQFhAAmzsD4DOvmhNxY3zYbPLRkjhyvF7cEYYNd3g9BGhzXYrR2cy1tfKPe3oG
c42fCjME0D3X9kXHhyDMAhZ7XFfoatt0oEZe3wGcZQRlgN+/ocrClFORGkBQHBvi
bKrYeB0GxDxrd/CZCGr1dbphh6lmvNheERXgFSo8aF95Ydt6Xveat8wr0bA3zkn1
1gqTRuDYqPrSk6iijWf+dtpvIVhdhwkaoscO+deGxVapruoqFGwERmYpRgCa1aUd
FG4bsy1g9JdrRCls6+dag5AJY2bJasdFHi6xUk9C/JDQEfvgFgzQNWgpXrBUOHDE
u3Oju95r28bbS1jioETOc4IyE3hlGNT1bEcWo2al9fbt1wxSOfYjH9dkbvsfGXFS
bgdpncd5/HA30Gx0amWFnA57Nzzd2VHcJhbQWs5wPFWgi17jWr+LirHwBXPi8UrV
Dsz9oNUq54LEiNYuqCiYlOoDxdR6WSb/PnbOjXaSzsZtk1z0M4r8+xzwyTbKX47q
oIqwr0s5RQUkF7JpXTTkrHFNXa+hZCqWJAXDkhUSjksI8G55T+qMhjBXgshlrCDC
7ACBQb7hHbzYqjI/Nn4i43HoZ3xhuh4uIKAl1eybNJRuP//lWe3bsruLRX68WEVU
xiT6zR93AQ9Bto+ZCDaKq1BYcq5r0PkFZBKTdzxbAVBrC3vNx0c=
=1XhS
-----END PGP SIGNATURE-----

--HJrzEgu6/wmVFVtf--

