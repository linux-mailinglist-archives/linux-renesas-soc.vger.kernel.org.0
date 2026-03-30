Return-Path: <linux-renesas-soc+bounces-30606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Lb/HmeZymmg+QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:40:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E060735E0C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC4433002D56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378F0334C05;
	Mon, 30 Mar 2026 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PT3duwo5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141D9EEBB;
	Mon, 30 Mar 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884580; cv=none; b=Cdjey/8SZy+/vuAhFTzfPbzXL8VJ8k+Foyvpti31HfmR61a39GUVOgqOIK41ukok+AypHKN/DlhHDJum2uufigW6si1TrIW6qM3W+0t/eIBZvMlVx541hwlZ3L0UcwaeH716111hYBgDaatX7YiuTmI1XxUiAr8/0848LMRr1F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884580; c=relaxed/simple;
	bh=6dfQAUKIM8F7o7mnUf4+CGKbpDfb/UQQymAgEWEcxl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tubaMcrN7fnH4CSsS4pN02MUggMxrGWOlgSv8L2lDY78mNOSj42dCEmrQeBh8+1o0m8ytIBAJyaCNdqvJq8MDZ6Q+iLC+Jdo3X8TfpN7u7FfyDdvA7AVvLk+9LrmnViVtCbJJhw8Y6Jp1n68LpJG4pNkKoYGr2HY13JJ/3/s/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT3duwo5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C3CC4CEF7;
	Mon, 30 Mar 2026 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884579;
	bh=6dfQAUKIM8F7o7mnUf4+CGKbpDfb/UQQymAgEWEcxl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PT3duwo5jXXuoPpCSMUultAdalkddLoOVTldNJnKcMLLMHE9rqGTcIWxR9FkHTycX
	 zLuVn6D5TLUVWfw3HPA/Bu79OxOoMeBfsThbDfwQnz0mp7+QqtrADXvzKlTTsvBCGm
	 2QnV5HwQ0L4CKqed4r4kER0vLs7/pV8XLORP3WfPeIGJYy82lWttREIbVVKjKRSg9Q
	 LdinJXRDwkXwi7laQJAVPLCuJsgLaeyvyQYrItNPqfidHzOgyJFB8r6UGyMW4tS/EM
	 Ru1nQB1oTPZaAdQUUqfl85pt5HV7O6AauCTOoH8GULG83D9MXx7ukRg08MhfVSsTto
	 cIBDwqK2JdUGA==
Date: Mon, 30 Mar 2026 16:29:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hui Min Mina Chou <minachou@andestech.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com,
	magnus.damm@gmail.com, ben717@andestech.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	jonathan.cameron@huawei.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, tim609@andestech.com,
	alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 5/7] dt-bindings: cache: ax45mp-cache: rename
 ax45mp-cache to llcache
Message-ID: <20260330-snagged-whiff-e56fc19963ee@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-6-minachou@andestech.com>
 <c2a135eb-c8fa-47d6-b774-430ccc4fbda4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C4nrD42o+BcHPWfr"
Content-Disposition: inline
In-Reply-To: <c2a135eb-c8fa-47d6-b774-430ccc4fbda4@kernel.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30606-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[andestech.com,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E060735E0C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--C4nrD42o+BcHPWfr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 03:00:41PM +0200, Krzysztof Kozlowski wrote:
> On 30/03/2026 12:27, Hui Min Mina Chou wrote:
> > The AX45MP-specific cache binding is renamed to a generic Last Level
> > Cache (LLC) schema, as the driver now supports more Andes CPU cores
> > beyond just AX45MP.
> >=20
> > Updated compatible strings:
> >   andestech,qilai-ax45mp-cache    -> andestech,qilai-llcache
> >   renesas,r9a07g043f-ax45mp-cache -> renesas,r9a07g043f-llcache
> >   andestech,ax45mp-cache          -> andestech,llcache
>=20
> Why? No explanations and that is clear ABI break.

Ye, I am not going to accept any compatible string renames for this
hardware. The break is too significant, since the devices *need* this to
function.

--C4nrD42o+BcHPWfr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqW3QAKCRB4tDGHoIJi
0nJcAQCBaidceSPvNq6RwE1uXobJN7NUKpxWp7YgJzv7IemPWAEA50Am6tp03/9t
37fYoMlE/XFQhJyB3OAJcST9nTm/EA8=
=FDn9
-----END PGP SIGNATURE-----

--C4nrD42o+BcHPWfr--

