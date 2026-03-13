Return-Path: <linux-renesas-soc+bounces-29382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HPkE/JJtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:31:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFC28820B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E306730C4AF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852A23CB2E0;
	Fri, 13 Mar 2026 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBGbP60i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050B73CC9F0;
	Fri, 13 Mar 2026 17:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422988; cv=none; b=COqBW23cLWJEvpSYdSrm1/yg3N8ce0U3Yz91T+pAlVWjp5aWioZeTeXfl49OgHfle41OFKfThk7hrq3rBNvgdSSK3/PDpkwyEB3xjwbFACHfTxfFIEmB5E+u9FVI3k/KuLIdexbhYAen7U5XvTy72spLhQfs4vnZ1a9NmpiBGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422988; c=relaxed/simple;
	bh=V2zFASjbB+Pyj9SxXSo0+JuloNHlxG50M1RDzp0cfSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sx8y+RpBQsz9RNgzTrm9aFGfmSdPIbpsS+2HX7KYQxY3WloZc898lBmfxHggBvUBfDdozyOF6WTVOjJcc0GfseBlZHOd4HzaDXvw17RrgTi4VNuLx3ohGbUqSDmt89x/kadGWIckVM2oS8p271VeuNwWnVMiHJtPM4tH+IGOa/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBGbP60i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71142C19421;
	Fri, 13 Mar 2026 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422987;
	bh=V2zFASjbB+Pyj9SxXSo0+JuloNHlxG50M1RDzp0cfSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBGbP60ijfMz6c+iv1avP0LuUD4ApDB2ySueVPzJakwpSqekP2RpZWXrL96nr7jLS
	 fjMyFNurWwM+S+SNgZzB+bft+p1hr4PAqcIsnH3ZD1xsJMDJfkx/3qcyDhuam3Lxqz
	 F8gW92DxJm3nC1ZYaaI7+8loe80lCLcfmwftGxbKhYV2cfPSwPC42/efi0yJawWrpW
	 o2YbHMUnTltCnawISMlDCuphjvXxHv+h2mb/v3f6z+v0ko+A0vVZUp4dAlEHqLrb7V
	 bvH1M0O9if1rK5VEdu4JOrpc3NsOjS//Cn8guNRE6b8vLrsnlH3FkPe4UsfA3/tjmz
	 otzfJuMX7EYIA==
Date: Fri, 13 Mar 2026 17:29:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: touchscreen: trivial-touch: Move allOf:
 after required:
Message-ID: <20260313-bonanza-sheet-870a6130ba1b@spud>
References: <20260312224925.186077-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JgNcW7mGQdVI9mEr"
Content-Disposition: inline
In-Reply-To: <20260312224925.186077-1-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-29382-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,nxp.com,noorman.info];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,mailbox.org:email]
X-Rspamd-Queue-Id: E3BFC28820B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--JgNcW7mGQdVI9mEr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 11:49:01PM +0100, Marek Vasut wrote:
> Majority of schemas place allOf: after required: . Documentation
> Documentation/devicetree/bindings/writing-schema.rst also hints at
> this ordering. Trivially update this schema. No functional change.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: This comes from https://lore.kernel.org/all/20260117-grinning-heavy=
-crab-11f245@quoll/
>       where krzk comments "allOf: should be placed after required: block."

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Certainly not expecting a new version for the "nits" provided by Frank.

--JgNcW7mGQdVI9mEr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRJhwAKCRB4tDGHoIJi
0pEtAPsH+hua0l+y7IIet9ENiBov+0BZIMsTRWV7aHyj28rEJAD/dZDLr76pJzGI
zCjfSD+lxX1gssd2TH6k5qLt+OAMrA4=
=gt51
-----END PGP SIGNATURE-----

--JgNcW7mGQdVI9mEr--

