Return-Path: <linux-renesas-soc+bounces-30683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJrKNHLnzGk/XwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:37:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57569377C81
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94CFD3044174
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 09:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2523AE196;
	Wed,  1 Apr 2026 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQlXkrQj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E83A9D82;
	Wed,  1 Apr 2026 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035521; cv=none; b=RiTh02KETQvdbZ5nmZvmd4OEXPyJpbLCRikLtT9YOQ2GytLP0y5bIeqPT2ibYpGD4zGrlW4TFBRjDW05JJvioce8n7fBCme8Ro0kgzm4xf5Gs0KGhdL/qsHwnZonee1xgCKj3EvfQZ/A8S9pnOarXrIyvQtm5u0i/BB7BOQHctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035521; c=relaxed/simple;
	bh=Z6txjY6hf1yR8CgQITKxdy5tMrTpvR6xPb8mxk3Zkyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ0Fc7o67wiQUfVdA/E3CVqKp8MH3WEBneyG8YLbPH5h8pcljSEFw55fltBKM7zeVquj3Q5bnBpwC17ScNZXqm5Zcv9sNsMxjXjGljt+13o3SlSPO1zCxe1VGQ4wcuz7DHR8NbnUro4c9VTJDVdCAPgqSa534XZ7uZf91JXwRjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQlXkrQj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E31C4CEF7;
	Wed,  1 Apr 2026 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775035520;
	bh=Z6txjY6hf1yR8CgQITKxdy5tMrTpvR6xPb8mxk3Zkyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQlXkrQjTZE7TXWPULCInfcgxjuvt7HuQ/K5AqX5u1qnTXBU770lRQYKwUFzkVaBV
	 2V0fY5gAop2ShTiiLFKVRyBihQT1RHB/vct4sqjW3UlC4wUhaP/gmQlETTpPqCPkcK
	 +Hg5FdK+oD5Jt4aK1MBqWv8Hjy6E2OhXLjXe77aozp8dM4Y5fNyOsdhWPSCF4uOTzv
	 WFnIWiCYydZhjPF8I8OwrGwZbmKJjzJfEXYqovwaEVcMFhK6Y4PnFV0d08ptB/VR77
	 QsDnFY7sZ+BpdxHZ55sT2Ism3O1B+KVKfPC1XIQ8qdEeWeZypHcgRYc2q0U7cCWMC7
	 ejlH6XMNumx1g==
Date: Wed, 1 Apr 2026 10:25:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
	ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonathan.cameron@huawei.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 1/7] cache: ax45mp_cache: refactor cache driver for
 generic Andes platform support
Message-ID: <20260401-hulk-retract-2d4bd7f42f14@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-2-minachou@andestech.com>
 <20260330-oxford-chevy-5f5a6f0a5be4@spud>
 <acyDUU3FdAAPWfnS@atcsi01.andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sbo2IIo6dvwkqyP3"
Content-Disposition: inline
In-Reply-To: <acyDUU3FdAAPWfnS@atcsi01.andestech.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30683-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57569377C81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--sbo2IIo6dvwkqyP3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 10:30:41AM +0800, Mina Chou wrote:
> Thank you both, Krzysztof and Conor, for the detailed review.
> I appreciate the feedback and admit this series needed more work
> before sending. I will address all the issues in the next version.

People making mistakes is whatever, as long as they don't keep making
them!

> A bit of background on the motivation: the main goal of this series
> was to prepare the Andes cache driver for a SoC Allwinner Avaotaf1 V821,
> which uses the Andes A27L2 CPU. We wanted to share a single cache driver
> across different Andes CPU variants, which is why we tried to move toward

I don't mind the kernel-side renaming all that much, the compatible
rename is what's problematic.

> more generic naming in both the driver and the compatible strings.
> =20
> We have two questions we'd appreciate guidance on:
>   a) On compatible string naming: We'll drop patch [5/7][6/7] and won't
>      rename any existing compatible strings. But we'd like to confirm
>      the preferred approach for A27L2: would it be acceptable to add
>      a generic compatible (andestech,andes-llcache) as an addition?

>      If so, would a CPU-specific compatible (andestech,a27l2-cache)
>      still be required alongside it?

Yes. I think that this cpu-specific compatible is what actually has
value, and adding something generic to all andes CPUs is a "nice to
have" convenience. Also, "andestech,andes-llcache" is a bit of a weak
name, repeating "andes" has no value. There's no code-name or something
for the IP that we could use instead of the second "andes" here?

>   b) On Avaotaf1 V821 support: We are not in a position to submit the
>      DTS on behalf of Allwinner. However, we would like to add the
>      corresponding compatible strings to the existing binding
>      documents (andestech,andes-llcache.yaml, sifive,plic-1.0.0.yaml,
>      and riscv/cpus.yaml) in advance, so that the bindings are ready
>      when Allwinner eventually submits their DTS.

>      Would it be acceptable to upstream binding-only changes without
>      an accompanying DTS at this stage?

Yes, of course. You're not willing to submit the dts, which is
understandable, but for the cache and plic bindings, you are able to add
the soc-specific compatibles for this device, right?

> For the next version, we're thinking of keeping only the changes
> needed to generalize the cache driver, and dropping the improvements
> for now to keep things focused. If you have any suggestion on how
> to approach this, we'd love to hear it.

Whatever you want. The improvements (or at least the things I think
are improvements) seem worth having. The problem was just patches doing
multiple things at once. If you decide to only do the generalisation,
that's fine, just make sure it is broken down so that each of your
bullet points in the commit messages.

Cheers,
Conor.

--sbo2IIo6dvwkqyP3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaczkegAKCRB4tDGHoIJi
0p/3AP9MhWxlPEw8n3QW6A/6cTZLy+yRXFhEp8X0UZlTyXt6iQEAk7Hd6y35epTY
ItppUELACW21zZee02p2FyHaoiH0pws=
=hc9k
-----END PGP SIGNATURE-----

--sbo2IIo6dvwkqyP3--

