Return-Path: <linux-renesas-soc+bounces-30610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJS6HRmgymmg+QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 18:08:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3235E6CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 18:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53EE7301440C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 16:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB01E387346;
	Mon, 30 Mar 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtfqK31+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C2B386576;
	Mon, 30 Mar 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886762; cv=none; b=X4d/V2t9OAdklwWxdMjf+PxyKJZPPq51iMrIGKJxYAvFp/NeUTe/W9ZegID2aOwcsXA9P5lTQdKsuWJMHxJJHKWiu0yKozT6fvnmb6ScR3EVWig8fGftx6pdczpjKNdmxluAyvoV10jh6T0mre1Isksi3T8FViJ2fC6jw/VgDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886762; c=relaxed/simple;
	bh=3KmiI1lPn7iSBaliwjqcS6nkGR19lrJfQ+T5KRXeUJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDpgPrncNr4EMcbCcPB52Iq9ssbczMXUbpomax+TYrYAau/kealFJi2LW6YX915ABA5N77yAC80Kkvi4fIB6DH5cez72HrdrpCnjKy5kDu1dZi1T/rm4uOnwno6wnCYW6C45DxwAyJboWe7ucdSu5S7ikUGXg8Rc3YiKzoG7GYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtfqK31+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EAAC4CEF7;
	Mon, 30 Mar 2026 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886762;
	bh=3KmiI1lPn7iSBaliwjqcS6nkGR19lrJfQ+T5KRXeUJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtfqK31+p3ceD6qtEJo2zlJwoNdBpD4IShTTmFnLsidWjHJucJl/TTvUjyei7I4XW
	 4I9gYj2w6asg4hjFgQlmHNGPgI8qSmdUFvGJMW+d1cag2vGP8yUu4O8VC1b3nyfie9
	 iTqMv+A9FYP7iOPbqQXWkEWG5SOlQdSqvJED32X0A2XJ3dmJy8dJoa6S7pGnksrR4+
	 ynTPH+62aOX30vuGNqj/u3zTsbwyW0IfY3d4KCCTtoQI1Sjnt9MhcdUtOk5nOHr1Wm
	 dTLnBE84FyCsEiHU43cwVunV9nnFIyfOJG/AmJu66XO34Q4QSzJsWTmI1of+6QZB3Y
	 C9NeEBwkJojTA==
Date: Mon, 30 Mar 2026 17:05:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
	ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonathan.cameron@huawei.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 2/7] cache: andes_llcache: refactor initialization and
 cache operations
Message-ID: <20260330-profane-blighted-ac25a752164e@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-3-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZBMHEz/e3KVIxzdl"
Content-Disposition: inline
In-Reply-To: <20260330102724.1012470-3-minachou@andestech.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30610-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[andestech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E3A3235E6CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ZBMHEz/e3KVIxzdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 06:27:19PM +0800, Hui Min Mina Chou wrote:
> This patch cleans up the Andes LLC cache driver:
>  - improved error handling in andes_cache_init() by using goto labels

I don't agree that this is an improvement. There's no meaningful
teardown shared.

>  - updated andes_dma_cache_inv/wback() to check for !size instead of
>    start =3D=3D end
>  - cache-line-size mismatch from an error to a warning
>  - Use ALIGN and ALIGN_DOWN helpers instead of the alignment logic in
>    andes_dma_cache_inv() and andes_dma_cache_wback().
>=20
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  drivers/cache/andes_llcache.c | 56 ++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
> index d5e382f3c801..d318b8009f7f 100644
> --- a/drivers/cache/andes_llcache.c
> +++ b/drivers/cache/andes_llcache.c
> @@ -111,21 +111,17 @@ static void andes_dma_cache_inv(phys_addr_t paddr, =
size_t size)
>  {
>  	unsigned long start =3D (unsigned long)phys_to_virt(paddr);
>  	unsigned long end =3D start + size;
> -	unsigned long line_size;
> +	unsigned long line_size =3D andes_priv.andes_cache_line_size;
>  	unsigned long flags;
> =20
> -	if (unlikely(start =3D=3D end))
> +	if (unlikely(!size))
>  		return;
> =20
> -	line_size =3D andes_priv.andes_cache_line_size;
> -
> -	start =3D start & (~(line_size - 1));
> -	end =3D ((end + line_size - 1) & (~(line_size - 1)));
> +	start =3D ALIGN_DOWN(start, line_size);
> +	end =3D ALIGN(end, line_size);
> =20
>  	local_irq_save(flags);
> -
>  	andes_cpu_dcache_inval_range(start, end);
> -
>  	local_irq_restore(flags);
>  }
> =20
> @@ -133,15 +129,15 @@ static void andes_dma_cache_wback(phys_addr_t paddr=
, size_t size)
>  {
>  	unsigned long start =3D (unsigned long)phys_to_virt(paddr);
>  	unsigned long end =3D start + size;
> -	unsigned long line_size;
> +	unsigned long line_size =3D andes_priv.andes_cache_line_size;
>  	unsigned long flags;
> =20
> -	if (unlikely(start =3D=3D end))
> +	if (unlikely(!size))
>  		return;
> =20
> -	line_size =3D andes_priv.andes_cache_line_size;
> -	start =3D start & (~(line_size - 1));
> -	end =3D ((end + line_size - 1) & (~(line_size - 1)));
> +	start =3D ALIGN_DOWN(start, line_size);
> +	end =3D ALIGN(end, line_size);
> +
>  	local_irq_save(flags);
>  	andes_cpu_dcache_wb_range(start, end);
>  	local_irq_restore(flags);
> @@ -159,14 +155,13 @@ static int andes_get_llc_line_size(struct device_no=
de *np)
> =20
>  	ret =3D of_property_read_u32(np, "cache-line-size", &andes_priv.andes_c=
ache_line_size);
>  	if (ret) {
> -		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
> +		pr_err("Cache: Failed to get cache-line-size\n");
>  		return ret;
>  	}
> =20
>  	if (andes_priv.andes_cache_line_size !=3D ANDES_CACHE_LINE_SIZE) {
> -		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
> -		       andes_priv.andes_cache_line_size);
> -		return -EINVAL;
> +		pr_warn("Cache: Expected cache-line-size to be 64 bytes (found:%u)\n",
> +			andes_priv.andes_cache_line_size);
>  	}
> =20
>  	return 0;
> @@ -186,16 +181,18 @@ static const struct of_device_id andes_cache_ids[] =
=3D {
>  static int __init andes_cache_init(void)
>  {
>  	struct resource res;
> -	int ret;
> +	int ret =3D 0;
> =20
>  	struct device_node *np __free(device_node) =3D
>  		of_find_matching_node(NULL, andes_cache_ids);
> -	if (!of_device_is_available(np))
> -		return -ENODEV;
> +	if (!of_device_is_available(np)) {
> +		ret =3D -ENODEV;
> +		goto err_ret;
> +	}
> =20
>  	ret =3D of_address_to_resource(np, 0, &res);
>  	if (ret)
> -		return ret;
> +		goto err_ret;
> =20
>  	/*
>  	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
> @@ -208,17 +205,22 @@ static int __init andes_cache_init(void)
>  		return 0;
> =20
>  	andes_priv.llc_base =3D ioremap(res.start, resource_size(&res));
> -	if (!andes_priv.llc_base)
> -		return -ENOMEM;
> +	if (!andes_priv.llc_base) {
> +		ret =3D -ENOMEM;
> +		goto err_ret;
> +	}
> =20
>  	ret =3D andes_get_llc_line_size(np);
> -	if (ret) {
> -		iounmap(andes_priv.llc_base);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_unmap;
> =20
>  	riscv_noncoherent_register_cache_ops(&andes_cmo_ops);
> =20
>  	return 0;
> +
> +err_unmap:
> +	iounmap(andes_priv.llc_base);
> +err_ret:
> +	return ret;
>  }
>  early_initcall(andes_cache_init);
> --=20
> 2.34.1
>=20

--ZBMHEz/e3KVIxzdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqfZAAKCRB4tDGHoIJi
0kz6AP4/zEmts2e0+M/fAroAyx+sLV51S7xrbbnjNktcQtOHYAEAk4e7IdDPibBJ
S85lySDSCIasXH72w3gC7DVKQ97pWwQ=
=Ys/x
-----END PGP SIGNATURE-----

--ZBMHEz/e3KVIxzdl--

