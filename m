Return-Path: <linux-renesas-soc+bounces-28690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBRcB1eepmlqRwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 09:39:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7669A1EAE2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 09:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E72D53010151
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 08:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F92386C21;
	Tue,  3 Mar 2026 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZDfkicP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E89437AA91;
	Tue,  3 Mar 2026 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527188; cv=none; b=T/yEI2h/vK65CjidGepTtN5dvbCV7XvRA0zGcZRErHNCUd0lx7h/vPrXxPgkehNzG/PlOhAxS2UrHCLsGF877SqtcpgpZIEaIT6qy9wlxrdo1AZ7nuCbhIAAt0pBzA+MFbXpaPi3zDfeFQe98bfdWlC+3/75R7Z8z45tsAlnXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527188; c=relaxed/simple;
	bh=wYFL/UizRE6SL9LpDWbjhEbVjqGuHZ2/AHz5HQhFD20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m25VQWceHAxaX0lHkDvEpJcYR6OY5RloGbf1R9RxDyQQoCsT6E7K1rTnOHXAC8cVkZdRPPiX+bna1ber406kwwdRC+jKXznnRx/Q8oMh5z26v9cLxBIcJVopZ6Fc0Xy2tpNIvysA2b9yzebuGI1ym5rZ7l6ioA4XNzw+lbbeCq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZDfkicP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1E6C116C6;
	Tue,  3 Mar 2026 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772527187;
	bh=wYFL/UizRE6SL9LpDWbjhEbVjqGuHZ2/AHz5HQhFD20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZDfkicP8eFmJKX33w0Yd6xx0He2+j1A7zNK8+eR7aePXEQ6GzVpHczP3BaidcIeu
	 WGx5PZDW9EjdXyHd0YMwxpvtRQzel793O35b8KSYp3Hln5Rx++Kdrwbun0G2PsbB8H
	 3/htbqtg8GTANjyxugAlETm3nl8t3A8/fuG8gDCoX0oMsj6i/8gtVwRVf5ENk8lJV9
	 GDev2IIl2wzT0SuzBftQLvUmYFvsjzA0+nj5LPGtearM7D5YSxVmGUhUj2nlPYGO4r
	 YZ11tfTi52PD8EyNTbcZP1Bz/588ssQpGesJKilpxCaA09t+lwi0UW2xpbIe/lFOl3
	 SzVzPBLU6b5+w==
Date: Tue, 3 Mar 2026 09:39:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
Message-ID: <20260303-delectable-just-clam-d25e08@houat>
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
 <20260303-uppish-finicky-mustang-cd135f@houat>
 <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="x2izyhm4hsbiouzm"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
X-Rspamd-Queue-Id: 7669A1EAE2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-28690-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,glider.be:email]
X-Rspamd-Action: no action


--x2izyhm4hsbiouzm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
MIME-Version: 1.0

On Tue, Mar 03, 2026 at 09:14:53AM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Tue, 3 Mar 2026 at 09:07, Maxime Ripard <mripard@kernel.org> wrote:
> > On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
> > > Update drm_of_get_data_lanes_count_ep() return value documentation
> > > to match the drm_of_get_data_lanes_count() return value documentation.
> > > The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> > > drm_of_get_data_lanes_count() and therefore returns the same error
> > > codes.
> > >
> > > Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and dr=
m_of_get_data_lanes_ep")
> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> > > --- a/drivers/gpu/drm/drm_of.c
> > > +++ b/drivers/gpu/drm/drm_of.c
> > > @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
> > >   *
> > >   * Return:
> > >   * * min..max - positive integer count of "data-lanes" elements
> > > - * * -EINVAL - the "data-mapping" property is unsupported
> > > - * * -ENODEV - the "data-mapping" property is missing
> > > + * * -ve - the "data-lanes" property is missing or invalid
> >
> > I have no idea what "ve" means in that context. We should rephrase or
> > pick something more obvious.
>=20
> "-ve" =3D negative, "+ve" =3D positive.

Thanks!

My point still stands though.

Maxime

--x2izyhm4hsbiouzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaaeSwAKCRAnX84Zoj2+
dnryAYD/570fpRsYtJ/kuqtzFArOc/SBUrjT6SVESmlB/LC/0P1+wmazr+MJtT22
SGs6lWgBgJqaHU8aUhmnF5wIw5v9XevoPqd4HT0iFxGp9adBMwRtVV0wxtQGtyi3
AVIEk8YnUg==
=9M4s
-----END PGP SIGNATURE-----

--x2izyhm4hsbiouzm--

