Return-Path: <linux-renesas-soc+bounces-34761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bSNzKxDUS2oGbAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 18:13:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AE1713127
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 18:13:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ooaw4qqN;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5068A303778B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 15:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7D53B27DA;
	Mon,  6 Jul 2026 15:40:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FA3264EF;
	Mon,  6 Jul 2026 15:40:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352434; cv=none; b=jurNINUZKpysxvjgW+aYcN/TVGyxNGYKMIdMeaUwbv6bAbHCEGHZnNqBGAlM1AoutkAy/YdHt/tARnBfHvShynCLYA+PMSqcKvJeD7SUrvCChSWLhGaRqUqcRO6Sn/FQWHxpeDoV2xWRQj/56Q2ZSz7XWShvUNvELGeYZItcCqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352434; c=relaxed/simple;
	bh=sq9myvMBUQkbRyNRLO5CYLPkeIVl5NyZugHb9gwmj6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rc7l8MwKrpZbPyU7g8KT1ST9IpNhq8VeOqTN6USuthlp+B4dQbNoSCHPPUzDJlw5CKH8l0k79dXa+wqvpUXuwh6wcsHD/zMXRxNvEKbYIpnD6exM+PLPcZUKaLijsnaY78e4QQBtX69+4mfyoa2MkC3syMt/n9eknjY8/VZxK0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooaw4qqN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832591F000E9;
	Mon,  6 Jul 2026 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783352433;
	bh=sq9myvMBUQkbRyNRLO5CYLPkeIVl5NyZugHb9gwmj6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ooaw4qqNCGvTrWxYIfRFfWAtkuCsiDDA2I+tbf1K2FpTUWL22L5TkByhLoJg1RoUm
	 b1HTCBb97IDpTsU7/+fGGbtaKnKJlnthSTw1FpLpDwYiLdvIrOrS+FuSSHkXfUFG0h
	 OCjCwyvYsvBobG3vZO84nxDvDhgffPjt8ZmA3C9qlHEnexvMqSTSc4DUZjeHP4gUAV
	 IVOUw9aM7IpdRGCp4ISVjHSyJiBaLUwJqtaG0ES88xEePxpt7CIltlWbcjcQBXiOmD
	 g0foH6m+kPb0R8Q9fauNTg/hJhf1JXziofKiOAs5f0gShmioW8g1gxMFTWqsvh5Pfz
	 hQ5dSRQnEH6Rw==
Date: Mon, 6 Jul 2026 17:40:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20260706-fancy-perch-of-satiation-0c220e@houat>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <20260706-capable-beaver-of-excellence-a3cf10@houat>
 <20260706094522.GA42740@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tpzfirttked2lrai"
Content-Disposition: inline
In-Reply-To: <20260706094522.GA42740@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:thuan.nguyen-hong@banvien.com.vn,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34761-lists,linux-renesas-soc=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,bootlin.com:url,houat:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39AE1713127


--tpzfirttked2lrai
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 12:45:22PM +0300, Laurent Pinchart wrote:
> On Mon, Jul 06, 2026 at 10:52:32AM +0200, Maxime Ripard wrote:
> > On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> > > Since DDC version 2, introduced in 1996, VGA monitors have exposed ED=
ID
> > > data over an I2C bus. The bus is also used to detect the presence of a
> > > connected monitor by trying to read the EDID data.
> > >=20
> > > Some devices where the VGA display is integrated in the device and
> > > always connected do not connect the DDC pins. Some development boards,
> > > such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
> > >=20
> > > To support those, add the ability to provide hardcoded EDID data in t=
he
> > > device tree. This is mutually exclusive with specifying a DDC bus, and
> > > can only be done when the VGA display is guaranteed to be always
> > > connected.
> > >=20
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboar=
d.com>
> >=20
> > This feels redundant with the EDID firmware loading mechanism we have in
> > KMS already. It should at least be mentioned why we would need to set it
> > in the device tree at all.
>=20
> Very good question.
>=20
> I assume you're talking about CONFIG_DRM_LOAD_EDID_FIRMWARE, as the
> debugfs override_edid feature isn't meant for production. If there are
> other relevant mechanisms I'm not aware of, please let me know.

No, that's indeed what I meant.

> In the use case at hand, the VGA display is an integral part of the
> device, the same way an LVDS or DSI panel would be. Using
> CONFIG_DRM_LOAD_EDID_FIRMWARE, the manufacturer would need to set the
> drm.edid_firmware command line parameter, and provide EDID as a file in
> /lib/firmware/ (possibly in an initramfs). Beside the complexity, and
> the fact it won't be very friendly to people who run a different
> userspace on the device, I think EDID counts in this case as system
> description, the same way we support specifying panel timings in device
> tree.

It's *some* hardware description, but you have no idea whether it's
actually the hardware you're running from. What would be in that EDID
anyway?

There's another alternative we've used several times already, in
simple-bridge for example: just register any VESA mode up to a given
resolution:
https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/bridge/simpl=
e-bridge.c#L66

I guess it's what you would do with that EDID anyway?

Maxime

--tpzfirttked2lrai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCakvMbgAKCRAnX84Zoj2+
dgK7AYCeOYF3c0NZpI970cu+5GFGs5suqhHnO75/KQE5k7Q0HURhHfAGGF1k1ASy
Kzh7Xn8BgPSqaEpt7A9lKOPDUcZdmfuuSQQSFJ2uzQAj557UJ7Fj3xU6BczlxWJB
0kIM/EaNow==
=7U19
-----END PGP SIGNATURE-----

--tpzfirttked2lrai--

