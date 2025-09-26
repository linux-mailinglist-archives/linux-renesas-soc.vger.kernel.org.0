Return-Path: <linux-renesas-soc+bounces-22404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D75BA3154
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE28A1B2713E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E82327C842;
	Fri, 26 Sep 2025 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Te1UUwiI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208A129B8CF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758877897; cv=none; b=UejWvSv67/pJ/572D9fXmS6ZUeKoQ6R03Zv+q6umqqLr1w1c4xvQL/eSovHCEMJY+s5AlPJm5mLwii7e5YhROaqJy/F5YuBe/Qvzt153LlchpfPFEm/OaqU7wmqgE4l6WcfEuzYr/mV6UCJdvJu7hVYaC4jyD/ZKIMIYkanV56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758877897; c=relaxed/simple;
	bh=QWAcuT5wuxevGnJTil8lhGfm8elOLAITbM9ZDL503bA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXMJ4BsQMBZX+SOpzaipATe5yMPzLNK8Sx3wjrMkEn7b2FvZPXX0b/AzFqLL73x2RvGULZGiI2oAOMbzwzPhEEwFIgZx5lqQwbA+Zp6inoOepNbtKZkaXOZJznWF2BlZmHE1+MUYZoRhi+X6YL2tuRyidalRuzo0i9DYYDCmTUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Te1UUwiI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:mime-version:content-type; s=k1; bh=/Tu7wS4ILQxdsrh9SIveZSFxaKr
	wgS0qGY5FGC1yMY8=; b=Te1UUwiI/Wb1TwuXdkTgThy7wMlKAIiJPzlBFI5JMTM
	oEV+4Cfwp0EjzjExv4u5fmUhSoICq9N2r+moD6ui/N7c+ZQL+sJZQpn/iL13XkVW
	rmoqluqOe6Rs0XiKjRxm89DJoiCN02MZyjwrpi1K5uFVY5NJ+1P2jgbA9PSL2eW2
	Xt9khzLwgPVaTsQYdRWg8RllbtcV2lmds4QbI6hjrctYJc2AvB9KbF36/ODVRkM6
	qwdxXWjgHrx9LuH+RocuiFd1Y2/VDJ18DMCQ7v7pysrMxtRH5+Kr1qBh8Z7W6Trj
	kQWc2oKw9g7KkaSX22L4xaxvfw0ig3Brq6We8f3UZaA==
Received: (qmail 2197187 invoked from network); 26 Sep 2025 11:11:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 11:11:31 +0200
X-UD-Smtp-Session: l3s3148p1@KkTuq7A/MucgAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 11:11:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: dtbs_check warning for RZ/V2N
Message-ID: <aNZYw1yyeckqEvDT@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MAvOxNSgh+F3Kt56"
Content-Disposition: inline


--MAvOxNSgh+F3Kt56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

'make dtbs_check' with linux-next gives me the following warning:

arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#

Is this a known issue and being worked on?

Happy hacking,

   Wolfram


--MAvOxNSgh+F3Kt56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjWWL8ACgkQFA3kzBSg
KbaqKg/5ATSW+bRfOhyzLJOoIxBQ7HNJ3Qp9jO6rMfysGkkNhO+CJ4IvaipeK7r+
b4rrpGWAQSrLV0ehpMaVPv6Ne3BQFVdt0aN+pK1GDdjdnmrbU+6C8/h8jU3HI9vX
+f3ON09PDf19c2sZtNp6Ihc/HFxEGqrHXiA2KlnvD1rA7f+L9ej7fv4WC/DardcA
OW+oZ+/PxpJPKOy8phcRXf73Oi419yLNRqFKTeJSYT9uX1jefWRgrY/q2UL8m4kW
gh8aHIQ/Zpt7n8s8H/tbSTq938YmyEGBBEQHmgesbu4PVKwRUVsY0myfHWhwDMUl
zOsEzZfwE67LsXfv/WZZNFm+Mpra9Wl7osWBnBX3mOxCND3kInPRHPmo2EvTvEwf
9UIx1yHnYUn7c/nB4xwpWFbplyyDvANppmU+zY1w0YgK2KqKveBXS0sHYGSqLw5L
NqANZyZfvcKc2uB7IA4rCmye2oISo6zmnzWJYWuoBuNowGAsZ0WarHTsDtXq+vjl
8qpTpqznE/c6dMLtWIU/0yZ4UIrbNw6GzEhmQOMgisR65un1tkN+9vMcbJ5Q4sVr
sdV9mz+kf5diLj6mHPsJPdQlWc4saBxocJHJjjTOOBJz8oUHOsvqjS3N+2sk+XfY
8Yt3TKvDdDB8ojIopLIxDG0JCG4+PABqReBG+lOyeL+mV94TCdo=
=wTAg
-----END PGP SIGNATURE-----

--MAvOxNSgh+F3Kt56--

