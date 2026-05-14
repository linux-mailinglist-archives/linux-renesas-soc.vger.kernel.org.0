Return-Path: <linux-renesas-soc+bounces-32611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP1yM34bBWpuSgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 02:46:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA353C6FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 02:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CC193037423
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7366B29A309;
	Thu, 14 May 2026 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COi+f4Q1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD222083;
	Thu, 14 May 2026 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719611; cv=none; b=SkYxiRLm81hwIKHQY507lYqNmXcYSlp1BEpztNHHja3RJz3ywg50CfT3vnRQRQ/3nlLSIN4ZPEHWIMcD+tDM3Pcp4+lCA42DG4RPyzLXWV7cUJPeB3pGs04AkwLXo5obx29TYOKJBnCRvHN5kP8XzL9iDmZJ2YE7AeLubWU2xDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719611; c=relaxed/simple;
	bh=oNInECs0EKBchm0jjTqBxa60qryHf6iLVq5jQKgOLcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSmpShYxwrhqiEeP0uGTGxFuv45TjnsYcWibHZhoK92q7qvdDgLCVj6znnvInsGubo57pFuGbqni1ieg/CPN7+441GuCyFEvDmPfn1jHmfSyJS4y7fPeLUrTQTCZkVvLVbL/VwKK/TCKYt45O3M0KaTHdb7ztNrtHFylW+vRVsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COi+f4Q1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C84C19425;
	Thu, 14 May 2026 00:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778719611;
	bh=oNInECs0EKBchm0jjTqBxa60qryHf6iLVq5jQKgOLcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COi+f4Q1JSsvv5hYKYXs8A1qy0A15Y7Jpz4SIr0bQPqVas9jycWl+JuyUFhZZ4dbj
	 guoG5ntBmpeilwJ9xgLQXn0hVgJ89yOv2YbAryO0rkJ6N1bUpwiVf9BI3gKQCajJFz
	 KnpA+bAqaG6JSKLQlk0JjqMGdJOHH+GFXU8zFumQEfSabwYVbp4e5TaS1a0tqtP/C0
	 x3weTCgkt5Akv3eSeZbqIk2RD9NCpehCz4ZSkcpCmEH3HRUAa5DExyfxvNMK8QJmPQ
	 IUziNNPmgBVchItZ6FSNOTB3xivehgicFHBL8EzcP+S9L0Q4XjOlg1ih5evOM68aR9
	 U2K40cOzumWKQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 89C401AC58CB; Thu, 14 May 2026 01:46:47 +0100 (BST)
Date: Thu, 14 May 2026 09:46:47 +0900
From: Mark Brown <broonie@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 16/16] ASoC: rsnd: Add system suspend/resume support
Message-ID: <agUbd0ImOGmGiyad@sirena.co.uk>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
 <20260512182631.3842065-17-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tDUwGqDnoTOXEEzk"
Content-Disposition: inline
In-Reply-To: <20260512182631.3842065-17-john.madieu.xa@bp.renesas.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: 17FA353C6FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32611-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,kernel.org,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--tDUwGqDnoTOXEEzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 06:26:31PM +0000, John Madieu wrote:
> Add system suspend/resume support for the ASoC rsnd driver, required
> for RZ/G3E platforms. Distribute the per-module suspend/resume work
> across the relevant files (adg.c, ssi.c, ssiu.c, src.c, ctu.c, mix.c,
> dvc.c, dma.c) rather than centralising it in core.c.

Does this need handling of scu_supply?

--tDUwGqDnoTOXEEzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFG3YACgkQJNaLcl1U
h9DKZAf/S1yDzzNzSiaI+ukwnfgpL1EEv6xmzoYWSDF9f4F0Ta/3qJxTbMy/ZlKF
zvX8WZFrK8s4Fi3WNlmjuejvOVOem183gCDAUUhVhubVE6FKQmAAx4CWscCiMwrm
GkGWMDn4Q163/00otnI1K/bLr6y0FQzQWIkFCyLfzL+dNRr2p8qzOa6Zpz3mVX7c
mLacp0Z/GFqT9xR2NIlg08SHXfbv5UxFA/EAM8X0N8TvctzEIoK6WMK6nZp+8YwO
sM2hJUNRwEUHkpcjKxQeT3Xe3OSQOKis30yxnYyMt0d9MEGrL2mB20JVKlHNy37i
wUs5Viv7tYANUFLKzaEQjyYRgPsAPw==
=m2mz
-----END PGP SIGNATURE-----

--tDUwGqDnoTOXEEzk--

