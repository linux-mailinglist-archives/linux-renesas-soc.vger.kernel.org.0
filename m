Return-Path: <linux-renesas-soc+bounces-28687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMIXNxaYpmltRgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 09:13:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4091A1EAA19
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 09:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8355730B2126
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFF938759C;
	Tue,  3 Mar 2026 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTW6PRxu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19792388E7D;
	Tue,  3 Mar 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525265; cv=none; b=Tdq1UZc7LkxClIx813e/iehg/8v9SJXI9wrJb03itDz3argKlaehTeHumoS8uwHTxwNtkzXuZ/cuM0/SaDJxyFxwcm7iP+nyT6s0JeUUUqM67p0zQIS5OVX0i1ydXRKvjQhoZrq9iw/ehthq5/mV/RNlOh4rXOtjEYwhj70wrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525265; c=relaxed/simple;
	bh=A2rar4aIPgN7f9toMeZT4D4vcutUGwyjyXabghrOPtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pc3kxXffytP0h5XjAaTl9yD/ZvPB86/C1LuFNtyRfbaodbmK9aFO3SwXg5+eVR2ezdd1U4vaP3ubNtBT/11Ih/dS2OxZ2u+1TH2Wdq+peKhbkzEfBTil+/wg3ze/MX3gllu5mBef2HfJUzb8F4ID1o9V9AH5yz+ieVi4NZloIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTW6PRxu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5367AC2BCB2;
	Tue,  3 Mar 2026 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772525264;
	bh=A2rar4aIPgN7f9toMeZT4D4vcutUGwyjyXabghrOPtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTW6PRxueVc4ZW2V5/TJSaUb4/NIX6HO+3RWLyLpdODfUDy++5OrIUOEupx1/kFiz
	 vU43QxNKVWQvScdW/e65I3QwKM/C69hBQOiZD09kizyacfAjp5a363w6QXeX5bwgK5
	 djAPnfzH0GBY4eu6goJqOGvM426uR+ktNDN7p1fDtlxKjkVZbfLAzToZFyOyCWXgWK
	 LoLHJbyNde2bbU/20KAiXf0Hx3TqGK+rC44Lten+Yp5TDsKFw0xsnS8DnuQZgD+56j
	 5xFzDQSeD8OEGf9oDg7XECc6vNpz/alrLqr+rhd1I3Ib+b/2Yc42inOwvDAKtpJlaR
	 0FXYSRBHBNngA==
Date: Tue, 3 Mar 2026 09:07:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
Message-ID: <20260303-uppish-finicky-mustang-cd135f@houat>
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lxcfrgkphgxhtprr"
Content-Disposition: inline
In-Reply-To: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Queue-Id: 4091A1EAA19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-28687-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,glider.be,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,suse.de:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email,intel.com:email,ffwll.ch:email,lists.freedesktop.org:email]
X-Rspamd-Action: no action


--lxcfrgkphgxhtprr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
MIME-Version: 1.0

On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
> Update drm_of_get_data_lanes_count_ep() return value documentation
> to match the drm_of_get_data_lanes_count() return value documentation.
> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> drm_of_get_data_lanes_count() and therefore returns the same error
> codes.
>=20
> Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of=
_get_data_lanes_ep")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/drm_of.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 4f65ce729a473..cfd0518174de8 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
>   *
>   * Return:
>   * * min..max - positive integer count of "data-lanes" elements
> - * * -EINVAL - the "data-mapping" property is unsupported
> - * * -ENODEV - the "data-mapping" property is missing
> + * * -ve - the "data-lanes" property is missing or invalid

I have no idea what "ve" means in that context. We should rephrase or
pick something more obvious.

Maxime

--lxcfrgkphgxhtprr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaaWzQAKCRAnX84Zoj2+
dt/xAYD6GWXQE4+/Sp+/YXwgIbV5GKXTqHLrEaiAJgJ9462FWjALGV4u7mv0UBt8
IySvPjEBgM1Ki+A2Oe6YIp3f5P4vhvrITxR68Y38vCOvugCNSvVf0Z5aNyO6s0uZ
vQwkikizEg==
=D5d+
-----END PGP SIGNATURE-----

--lxcfrgkphgxhtprr--

