Return-Path: <linux-renesas-soc+bounces-14531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6FA65751
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 17:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C223B6323
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 15:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A751714AC;
	Mon, 17 Mar 2025 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hIW1HKqD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57A186295
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742226947; cv=none; b=P4gA/26CMjv3cHpse1NOfhD5CvJf3ce8gZZMps50SAwT4S1E8OVyjsKqv7zLCAR4P5h8EohlyTfiKlcpHUhXgtvMK7E4NXUv4RtGandR3cHgCXH6gndMXu/3mxYZN7e1k3OhBMIcMLBC4v/02Uwx8RzhENgAMHTPX4bw6H85qrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742226947; c=relaxed/simple;
	bh=Z7ysF6S5KXW8XWkkW5d8Lagsv0FjEmOs1Y7sol16u5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSVH8Y9CoPU693rHS0xHDwdCMgyqa5dwpC/rVE1k9Srxe/tDCoIYI4ZNcvXFCXcAHzxm2XInFBQ1E7TRiVWhDl2NfzpC+fVJ+YfR2Q/ac6zU4zlb/bxNFMo/GTLfmZqkVSXIqyKAvNmHjZBTazSspFSC9waCzv79/GmNpJ/afvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hIW1HKqD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Z7ys
	F6S5KXW8XWkkW5d8Lagsv0FjEmOs1Y7sol16u5A=; b=hIW1HKqDR59ZAH5SKB29
	L6E1UpYNu5UF8tXqmiNZolBTHhJaZ59Zv4/A67+kwgtMqbG3LnlHbaksjuz9eSjl
	XUCuaF4ofJHeRKq+58SCARi+RP8YhlGmulgFGyuCBn31tJ08IDkEGh9cAfn7jS3N
	i/BC3Y0RkKJ4NKzHl9NVaikTOZ/GF3oLPBOAf+PJQT7b1LFsXAM5bxbXHRoaK/a/
	JX3+niUO+rUUrGPgKRNBQA7XaKS5EI64Rv0FGn4l9h8a2LxR1/Gm1Eoj3HccChqt
	WapGn5tPu5IeVjFPfpog+WQtgGp6IXy7vD8BsXtX3D8Z7YfXkMowpFJJQR0+xpRv
	ZQ==
Received: (qmail 3243644 invoked from network); 17 Mar 2025 16:55:39 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2025 16:55:39 +0100
X-UD-Smtp-Session: l3s3148p1@oZvX0YswaqAujnuL
Date: Mon, 17 Mar 2025 16:55:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
Message-ID: <Z9hF-x91DMK8CyOy@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Doug Anderson <dianders@chromium.org>,
	linux-renesas-soc@vger.kernel.org,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
References: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
 <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
 <Z9VBtTzNgDh_QsxX@ninjato>
 <CAD=FV=U_rYXZtN7Jw_E4UCjsnNcgtYC=EJ1+BLWiAwVEyo1M7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wXQQzUSsR/l35gkf"
Content-Disposition: inline
In-Reply-To: <CAD=FV=U_rYXZtN7Jw_E4UCjsnNcgtYC=EJ1+BLWiAwVEyo1M7w@mail.gmail.com>


--wXQQzUSsR/l35gkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> where leaving the dangling devices isn't really a problem. For
> instance: if somehow you fail to link up to a MIPI source then it
> feels OK that the GPIO / PWM and DP-AUX bus parts of the bridge
> continue to dangle. You can still use them, right?

Ok, convinced. Thanks for the input. Will send another version.


--wXQQzUSsR/l35gkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfYRfcACgkQFA3kzBSg
KbY6OQ/8C6kKQ8ZMv2KNRujKu5AkOWHGUoveNYv7CZEkZgrPFJTYub2zGj10G0ki
3QClhwTlnpc+/yN55kMSQ1hdJSX0/QQyhifZOrqN8urfyFv9lrvYh96sGpWpKeUz
uv05/dbugyjBg5FW8echeSBACLaEnDs/EeL7pk08d4gqwvSdgZkcfCrJaPO2XRKc
W5QTF5sG8cSeMM8twHMrmTSZumL5s2iuGNjYKE+p2RN2itrtCAfZ0hIsEfBdvT6Z
QCaIGyCfFPqkYeqKs+/eMvaPhPGc+hII3D4OhMm6wLGKxB+nYf2Wvh6VZfji4mrC
PKbeiyppIfw3hXr+GvtNsoQbZpXxE8VQW7QmFFMgLkmwpAoeat2vOgzf01BFUh/L
h4oM65Nscgpq/gXPVd7n+AGms938PMk3IVv5wbWfJYusjULM9UrRWdKRsS2N6tJP
nhud3qvIbkBQ3ct757tnjZGclbmGp6F0OOTbyfNaeNzxJmrvnaOrt0aLbEBQKzwS
1Oc32WCuHajc2t/EN2OX3MQ3rX/a0XdtMoyhBliloCrCzDWXfIsbGucoGDAsxRv7
FK3w7MUbrhBfnZ9fENhaGo5acj2NSfv79Laim5QKCQ/L4Tg6b7BZTFuVFQUgS+hf
GS72KI+OQNmemrWB/W4J1ZQlsSO1vwNKJzA2bacMsX1RpOy2qWQ=
=UfvN
-----END PGP SIGNATURE-----

--wXQQzUSsR/l35gkf--

