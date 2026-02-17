Return-Path: <linux-renesas-soc+bounces-28286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Lh8GMe9lGnHHQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 20:13:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B971014F890
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 20:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41ADA3018AE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 19:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FD514A62B;
	Tue, 17 Feb 2026 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmjmmS0Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF513DDAA;
	Tue, 17 Feb 2026 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771355587; cv=none; b=uo9kwOtv1wam32yRUj/8WyGjN0NX7hlPq4GeC9mzq39emAezK/DbtQXJmNo8qjuupjRDiz0xeXm7+n8SP5ZHGIIw8UVHEcjNtgwZvpxmYoVptj24ElX+/ONwHw6oH1JP0L/O3w2VBPu4Tx+iI4WCejSA1RWjxy4mBxpt8Q0xHSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771355587; c=relaxed/simple;
	bh=6gkR/8mmL5ODed7UXbZkKKkGCA6Xth+MsYcOlHyWUCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGuZx93k6WaleYFO0C/ZJ6lv/mAvfnHHP6WM19/iNgHfQBp20DnQl+tbvev7iDNLYf1/5xXSHJhMSeYrka5OvJGRcqzznR3T8NXrg2r4N79a6TOsKEVPr5S5l3K8A/fBkfHCkbn2+73q+lQKHFGKuFCdGkMvb2DB4ku4hbvW4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmjmmS0Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC869C4CEF7;
	Tue, 17 Feb 2026 19:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771355587;
	bh=6gkR/8mmL5ODed7UXbZkKKkGCA6Xth+MsYcOlHyWUCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmjmmS0YS58mNWwNthHJzm2WF51L4T1ZDiCfTBhgsFynir1a1LKb3bNv6/ZpN2v5j
	 6ZcLNvE803eQS713HX2ctXZC+Rtp8hsgzDdx9Oa9mhmAFwoqmK388GuArZwI6ZupmG
	 /RFQrFUvwL/BngawWGjcmJ+p3fDfZUM7efTYRZToLnl2343K1rob63rmFOhjvXGjCS
	 ww3qnsrWyEemaUQBkJi4662iwVngb/2uiCSAfLOtrSodAMVC1Yy64qisL72t/3ir5f
	 6L2nlon9hqUttj+k8qB7dchrQh+Ntk24klAJelo6yphio6WSwAdW6OBVcqixs+dL7h
	 iTjQVfi8dESJg==
Date: Tue, 17 Feb 2026 19:13:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] spi: dt-bindings: renesas,rzv2h-rspi: Document dmas
 property
Message-ID: <101b81ea-a24a-47b7-9067-6bec513d9015@sirena.org.uk>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
 <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3FL+LVhofxFAjtpG"
Content-Disposition: inline
In-Reply-To: <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Cookie: I'm into SOFTWARE!
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28286-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,baylibre.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B971014F890
X-Rspamd-Action: no action


--3FL+LVhofxFAjtpG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2026 at 05:23:46PM +0100, Tommaso Merciai wrote:

>  - This patch depend up on [0]
>  - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--3FL+LVhofxFAjtpG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUvbwACgkQJNaLcl1U
h9Aj4gf+IxZvFOSmxTb7NRTWuM/XXxF352c9febObhl/Ayg91y+oNidXvkBtf9Ou
QWvuGKcdFtOneeA5/U8UPNF8uAuRfEX0rGiMYPpWZ3PrG/SvXAKK0rBUmhYmF8kE
4qi60JYIcaIn/dwtjgoiGvT1N9/OvOPWQgmk5M+6dYADJWvqBrudtEAI4scQ+Fob
uUqXzVC6Cd4bjYjlir6lPx5slWBtmwfA3fRPTb21jQc7PrXFRbQ53vqvjvla6izZ
L9EYRGytCOX6ymTIpOHTj8pxPhD8latGpPjgUXzfJR+ndM8upeNiVU7APIFWUgG4
D1JHop4TJ7soYIVEaRpgdVlf8y9BlQ==
=ZSyK
-----END PGP SIGNATURE-----

--3FL+LVhofxFAjtpG--

