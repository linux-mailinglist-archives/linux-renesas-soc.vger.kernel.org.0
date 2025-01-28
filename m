Return-Path: <linux-renesas-soc+bounces-12621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D193BA20835
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9416E1883D60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683C1199FC1;
	Tue, 28 Jan 2025 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bWKkh4H9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0B0156669
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058753; cv=none; b=UChdQ5ofwJ1p744zWeBum1FAAEdu7mokcr5r4uQzeUbcBOXBTNfrdFZthnsARJIZYK6wqqJ9EaNd0YOhoZUFtJXrrifAif+nKWQpocor5bjkS72ZFOHjodkYzWpIOhoXmJ0EUFuVvEj68JaPOWteeM0yylA48py4cDvhrOdvKHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058753; c=relaxed/simple;
	bh=54Hwx4F7dv7mERL+XZYNjv6uxbIJeq5a9iquKBZ2Od8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLDI1TMXVpEaKp/h8lyu5/WjN+D2cLWeTcB+fSEb726PhH2zuQY4nKgegOLy554DQTB5oh/ma4AwSyr30jw0gXvoO1sZnIqi+QAXI80CWYDTM4pzUBGE79IYeBdrJE4LlyI2DZH+YPpnVECFMEpV2qirJnh3GnLaBaxO5Rqw2Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bWKkh4H9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=54Hw
	x4F7dv7mERL+XZYNjv6uxbIJeq5a9iquKBZ2Od8=; b=bWKkh4H9PuBatev4vOEM
	J8dYdbmNR5A/gtahbuKF3u4WBy2qpwa0KPzjXPDuQQTNJYJ+e3J3LhXSbcoS+SB5
	iKXXYOGukISQFcjJe/drGSJqbAXLx6ylfpB4IgoUq6T66FAGyjliiddady31rfcY
	Ywg3oncTZ+U5paarmctC9RVk7QIpYlYnd+eAsM0HtebO7lSdBakvTrmHOXSiBV7C
	2js/FCWu2kgFGAEhwLeeQor81iAF1N+V9BEeZzOeccHJrDlCi/KfGo0h28kH1H/B
	7kLHLfYKNIxvoJisgV7ihYMNwvV0CxNRWQurYQ5/IbezBIZsRjR6XYhOl/3rjHT/
	3w==
Received: (qmail 542337 invoked from network); 28 Jan 2025 11:05:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2025 11:05:48 +0100
X-UD-Smtp-Session: l3s3148p1@sQxFVsEszoAujnvm
Date: Tue, 28 Jan 2025 11:05:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFT 2/2] drm/bridge: ti-sn65dsi86: Use per-client debugfs
 entry
Message-ID: <Z5ir-7cIM6YOlzgE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <20250125125320.37285-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnWtWXTwZeCpN6DR"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>


--vnWtWXTwZeCpN6DR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I gave it a try on Gray Hawk Single.

Oh, we have such a board? Nice! That would help a lot.


--vnWtWXTwZeCpN6DR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeYq/sACgkQFA3kzBSg
Kbb07RAAhQO6k42CFWdfX3lreQAwzfCrGUefYAf4vdJIZs8sYOYrxHlagOIDD4j0
KA/BSvCEpl5DKzP3GAgaLt60sMjW6nxOrv/CpsJ9v5cqWTAaVoPFjO51ARCwc/lE
alxY4AQafbmciyKTS5K/WlBmfAmTec0H+FPVLPoDBawM/SpzApY+nfvZUDCbkLFx
rypAqxmRDRIvG1SE8ioyLRJ1YFGrqtU0A2k7WF0dexD/Df6mOcIsFriyBDeelLbk
jh/y4b4jt5uth0rTYPr3EAQt5bL7jkqipkxbdHigTIh4dO9vwG8Hu0UB5JqWLjSg
rqDHOkd9rZSC6Aclvbv8l1tMUrLg3Ftiihx+t5HIU5WXLHsjb7let2ZMQ6RwBJr2
PokoKy3pDRkQCcQjFB6BfW2bxQBPj1tTob1YF2W4ep1rbz3uJZmGLxriqNQnceAO
+wf9zM/sv772DSdNNmma1AZ+OUiD21MKUlG4qSbjjISZ1wDFbdulwBxNYDGpbTfm
iI1KVeJgw8pWNtCBQtmTSXhfZfJkvKFV9UPO+12ZOZvL0t2fXxs94SScX9+asdDJ
JXXOEYgTAmZzlpPtr+jNL/A7upQTUPqIb3CaxHVjZXpHM/M1/bPHMAW70gLe4TJF
sgvmrDhdTT1ZtUM1V66rF/qSAc4q/cdWGgLcrpGHUt251zN0v7E=
=Rrjd
-----END PGP SIGNATURE-----

--vnWtWXTwZeCpN6DR--

