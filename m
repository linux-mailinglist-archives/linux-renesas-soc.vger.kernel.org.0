Return-Path: <linux-renesas-soc+bounces-34740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v29ZC75zS2q/RgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 11:22:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B32B70E8C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 11:22:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RLOO8DoQ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4328632B0CB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 09:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460A344D00A;
	Mon,  6 Jul 2026 08:52:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4F406820;
	Mon,  6 Jul 2026 08:52:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327965; cv=none; b=UoCAez10FlTdoioA7wN05gd89Hnb88i0tND+oJArzrUuoWkuBwSi8FefFNXzWsxiNVyzDJsA0fZC+neGQuohHo0SqRJvOVEm4QuUWPpJ6VShyCEfT+CiPmcSvvTOSk/RvSJK94zpxnTgAgHS5CfHvL+Fm23slGrAU8Pxy3A8BO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327965; c=relaxed/simple;
	bh=wIgTYuQ7l0g07yaHqfXyOdwj4xENzmwI7JEobCJI7VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYAM3wQ3UJNIEv04dSDgSsdbkOdt2bQcrXwPB/t8wlQh/8QbfWLA1xnuz7c8Ywr963q3ntQBPB236pxuWNATYHnJi3P+XOj3mer0UlYCdAcYtUylmAc753O6dH9dM2hjTXvbUX/0dhuu0ego4z96OpCGdFk4JRFJJdFpC8b6/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLOO8DoQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412BA1F000E9;
	Mon,  6 Jul 2026 08:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783327956;
	bh=wIgTYuQ7l0g07yaHqfXyOdwj4xENzmwI7JEobCJI7VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RLOO8DoQdzaIda/SCOUZkb7TZDmZU8+VEb2miT3ha6NG/chlSw9oPS5iFZs+3FN+H
	 ss1CRc7OnMp9UOKGS1o9kuNv8H+1WnAXgfMZL1xmi1//PS62mRhyUFxFEYFJL+D/1o
	 xiYwfpJZZ+NfzcyQ7+yCE7NEbf16+AkAWuqVa/gUXNnPiqb/davqw58D/0MpB6YD/0
	 CHy4FCrsaWs1rBgkqGiUqyGyo9FDZsOA8tjdAzLb1LyGVP9El/x+zSrRRkPx1xFibX
	 fCA0bNZfLZn3cl19Fz14Q9+v2TA+kMfm8TTDKAVHZzs6mB9OCeZO3REbsT1q+LPdHr
	 1UWcRfCM06mdg==
Date: Mon, 6 Jul 2026 10:52:32 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
Message-ID: <20260706-capable-beaver-of-excellence-a3cf10@houat>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jpva27qzwjiuqi3k"
Content-Disposition: inline
In-Reply-To: <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:thuan.nguyen-hong@banvien.com.vn,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34740-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,banvien.com.vn,linux.intel.com,suse.de,kernel.org,glider.be,gmail.com,intel.com,linaro.org,kwiboo.se,bootlin.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,houat:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B32B70E8C6


--jpva27qzwjiuqi3k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
MIME-Version: 1.0

Hi,

On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> data over an I2C bus. The bus is also used to detect the presence of a
> connected monitor by trying to read the EDID data.
>=20
> Some devices where the VGA display is integrated in the device and
> always connected do not connect the DDC pins. Some development boards,
> such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
>=20
> To support those, add the ability to provide hardcoded EDID data in the
> device tree. This is mutually exclusive with specifying a DDC bus, and
> can only be done when the VGA display is guaranteed to be always
> connected.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

This feels redundant with the EDID firmware loading mechanism we have in
KMS already. It should at least be mentioned why we would need to set it
in the device tree at all.

Maxime

--jpva27qzwjiuqi3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaktsxAAKCRAnX84Zoj2+
duZWAX43C0adUSkYo2BCyUyrRlzje+lQ2rlOLgawSEEJ4RdYIn1llvkxQUUxz95n
cjgoCQcBgKZkLYlZB8XX1RTuVKcL/FZXQVybRx4SAV+4U5ftuAUjRItDGm9NzAfO
rM0iCuQS6A==
=EqG+
-----END PGP SIGNATURE-----

--jpva27qzwjiuqi3k--

