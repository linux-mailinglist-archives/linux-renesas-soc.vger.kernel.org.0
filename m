Return-Path: <linux-renesas-soc+bounces-30854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KZCEo/Gz2lH0QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:54:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA314394BA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0681F30B02AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 13:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15604313E3F;
	Fri,  3 Apr 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYPZ2IKC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF4428F949;
	Fri,  3 Apr 2026 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224219; cv=none; b=MJ3EW+YTqR+q1MRubdNAEAIGRNH3A5+l0SgArFsj7noaT9rsoSxwr1DQPKV5l0ISxq/mPEuZtvtl9QlKx0/7ZvHsivFTZtEVnNZzHpk1htodv8xbjkLBI/VcyvAhNMbIDXMVeKQb0tKQxbIF4YovIZV3qpOjm2wKJVD/0hl0t40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224219; c=relaxed/simple;
	bh=CYkkYO85Ns28AYjKNXsU60Tqoxr/je7w1ZHAwj8xE/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKzDnfyJvPPvfYnI2a4vJrbF7WdblxK6AkOvJ5mIezv7c4iLYCuI7AURLJKcgeqIehEfmIH7Er5O5+3fzy4W/jFXLlH/Vjm33RPmnqXfKE3ilVazATaG0d29mgEco61F0UWEXWVpqzDHefT9gT4xs/B/O5oozAMbgXfErCRMbv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYPZ2IKC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409D7C4CEF7;
	Fri,  3 Apr 2026 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775224219;
	bh=CYkkYO85Ns28AYjKNXsU60Tqoxr/je7w1ZHAwj8xE/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYPZ2IKCT5D8AD65LjRXEomzPWsjXI4kRhjWypSImUii/TgWKz60SnbKBhwPd+XF+
	 ksTmS82DomcU5hhXuYWZ4DLUlPuRJoxy1IyDyhjxuIZ48TSIO6gWjSMeMbyXsBaO02
	 OD8cULmWoFNz3z124ZsfU5swjEmf8z7XuHzNQzYWmAtU8/lJYaVT5gWufs4O53yRkO
	 3ac5FgdbQhw9kePTqACP0uX7OIJVIsPI1K3W5Uzmmc/ldbQrMReckx9PbihFsoc9BT
	 aKTs/C2oLimSAfl6qoMurVmbIQYmvW17EGXJDy07wSYZXC6h1XpkOnG5wkgeJfAVas
	 wcs79WcEtZzTQ==
Date: Fri, 3 Apr 2026 14:50:13 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: sound: renesas,fsi: Add support for
 multiple clocks
Message-ID: <787df828-0ad6-4aca-86c9-c2bf3fd9bf87@sirena.org.uk>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="klzR/PAWubZ5Uuy4"
Content-Disposition: inline
In-Reply-To: <20260403112655.167593-2-phucduc.bui@gmail.com>
X-Cookie: The Korean War must have been fun.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30854-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_TWELVE(0.00)[14];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA314394BA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--klzR/PAWubZ5Uuy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2026 at 06:26:53PM +0700, phucduc.bui@gmail.com wrote:

>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 8
> +
> +  clock-names:
> +    description: List of necessary clock names.

This should list the valid names.  Ideally there'd be some specification
of which clocks are required where, but that might be more trouble than
it's worth.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--klzR/PAWubZ5Uuy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPxZQACgkQJNaLcl1U
h9A3WAf/QnVym/Imyukn8OOIO6exBHXZQbWYba05LxUJwMF2uynLUXl3E1Sag6wk
tKib1A+3jDukoYALiDtRxw41Bwh4/L0bcqwTjwjOzzgDUvCOAvOSeGcYnaNPXALg
5nD43zYxvN7VrceB7d2GTEzqSipiHjrnX82VI1HqFCfQSFafA4yHfRd17UgqFAbL
IuhxWUo6aUfIWs902X9k0j0sCSUT4kHBodzFt88uYQpIjhlfi3wp3jpFDRRO79Vr
MRT1wIFmVhqAf0Z1v7g/pSvxL4BajieTBe/ZHakZjmAjLc1+0duqcPLCtZlXHNyR
CF8GNgmczS1UEEB2Lfq80WMYa2Umng==
=juN3
-----END PGP SIGNATURE-----

--klzR/PAWubZ5Uuy4--

