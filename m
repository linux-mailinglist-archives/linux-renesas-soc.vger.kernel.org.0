Return-Path: <linux-renesas-soc+bounces-30609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJPBMuufymmg+QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 18:08:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2695A35E690
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 18:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9E5B30138BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 16:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A7B379ED8;
	Mon, 30 Mar 2026 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VC0iAUrP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0CC37997E;
	Mon, 30 Mar 2026 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886670; cv=none; b=OpBhKPUAwYH7YHt1YcHDiq3jO/qqNqbbhlryOtjg3R0B3sv2xlrJ4KUi2k0QKVo94biiFXKBhJ/WVgy8GP0/DdEvseertvPnlsVt+AGiwjOLB9rnbRDBRP1x+aXGCj0N281+PVOeeTjldG/AQv5CuipWRN5NVCwZzDm+SDzyTk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886670; c=relaxed/simple;
	bh=owNCY5NrXXCi7Gi47uvNRkPcUBD4vZPhSUHEWfE+QDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiudBfGolsl7Hm12Z38mQW3+jdKWQPcN3tUoXbfyjChgOb77y1NjkJHwpLf0klnKrR1Jrnv1HhS9KwVrDZpbe40ORdLjlR4AZWYGBQg7+xOvtpPB/PgzTB1GcvaZcCUaqz25uNVMGerBAqEFWicGnqQLWEpqMB9tAYd4l9PWPpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VC0iAUrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FB6C4CEF7;
	Mon, 30 Mar 2026 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886670;
	bh=owNCY5NrXXCi7Gi47uvNRkPcUBD4vZPhSUHEWfE+QDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VC0iAUrPFUKXwdCr0/Owz+hUIBfcN8/LHgpvAwPtrhGm3W+5mmhjwA6e/8+c6rYLE
	 A1VKcytW9oH2X/YJZUk031Y7nO27Tv/6wLqcT7MOtDw1dGHF7/J+ExVvMFY1BlEc5T
	 ZilnacoTQ8nfzxA21Mz9hgZef7TUqDN/Vi+gay7Tte31xhB9pdXTV/oh8ZSE/cv4IM
	 v/cpbHDiuWbR45bCLxqTjiaSXJmsoosNilecVPQTVKTzaJIsJJ2AL0/X271XjZkwzr
	 elsLZXbKZlJnD/mzaeKbkdcGfzQwWwgslKg42I/3nRa2nre0sC9nziGp9oChIVgx8C
	 t00S/FP9F5D5g==
Date: Mon, 30 Mar 2026 17:04:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
	ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonathan.cameron@huawei.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com,
	Leo Yu-Chi Liang <ycliang@andestech.com>
Subject: Re: [PATCH 3/7] cache: andes_llcache: improve performance of LLC
 operation
Message-ID: <20260330-snowbound-obtrusive-92ff63549bad@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-4-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A56KgNt4UDiuDCQI"
Content-Disposition: inline
In-Reply-To: <20260330102724.1012470-4-minachou@andestech.com>
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
	TAGGED_FROM(0.00)[bounces-30609-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[andestech.com:email,andestech.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2695A35E690
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--A56KgNt4UDiuDCQI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 06:27:20PM +0800, Hui Min Mina Chou wrote:
> Eliminate get_cpu() on !CONFIG_SMP and switch readl/writel to their

Where is the get_cpu() that you're talking about eliminating here?

> relaxed variants to remove unnecessary fence instructions on I/O
> memory access. The platform specification defines all I/O regions are
> on channel 0 (point-to-point strongly ordered), so explicit fences are
> not required [1][2][3]. Explicit memory barriers (mb) are added before
> and after the CCTL loop to ensure overall memory consistency.
>=20

> Also fix hart ID mapping by switching to cpuid_to_hartid_map() instead
> of using the logical CPU ID directly. In AMP setups (e.g. Linux on
> Hart 1, RTOS on Hart 0), Linux sees itself as CPU 0 but must access
> Hart 1's CCTL registers, so using the logical ID would cause accidental
> interference with other cores.

This seems like it should be a separate fix for sure.

>=20
> [1] platform spec 2.1.1: https://github.com/riscvarchive/riscv-platform-s=
pecs/blob/main/riscv-platform-spec.adoc?plain=3D1#L169
> [2] privileged spec 3.6.5: https://github.com/riscv/riscv-isa-manual/blob=
/main/src/machine.adoc?plain=3D1#L2835
> [3] riscv: asm/mmio.h: https://gitea.andestech.com/RD-SW/linux/src/branch=
/ast-v5_4_0-branch/arch/riscv/include/asm/mmio.h#L105
>=20
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  drivers/cache/andes_llcache.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
> index d318b8009f7f..57f666bc537a 100644
> --- a/drivers/cache/andes_llcache.c
> +++ b/drivers/cache/andes_llcache.c
> @@ -66,7 +66,7 @@ static struct andes_priv andes_priv;
>  /* LLC operations */
>  static inline uint32_t andes_cpu_llc_get_cctl_status(void)
>  {
> -	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
> +	return readl_relaxed(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OF=
FSET_C0);
>  }
> =20
>  static void andes_cpu_cache_operation(unsigned long start, unsigned long=
 end,
> @@ -74,16 +74,22 @@ static void andes_cpu_cache_operation(unsigned long s=
tart, unsigned long end,
>  {
>  	unsigned long line_size =3D andes_priv.andes_cache_line_size;
>  	void __iomem *base =3D andes_priv.llc_base;
> -	int mhartid =3D smp_processor_id();
>  	unsigned long pa;
> +	int mhartid =3D 0;
> =20
> +	if (IS_ENABLED(CONFIG_SMP))
> +		mhartid =3D cpuid_to_hartid_map(get_cpu());

But I dunno why this dance is required. Can't you just retain the call
to smp_processor_id() and pass the result unconditionally to
cpuid_to_hartid_map()? Or just make it a oneliner with
cpuid_to_hartid_map(smp_processor_id())?

> +	else
> +		mhartid =3D cpuid_to_hartid_map(0);
> +
> +	mb(); /* complete earlier memory accesses before the cache flush */
>  	while (end > start) {
>  		csr_write(CSR_UCCTLBEGINADDR, start);
>  		csr_write(CSR_UCCTLCOMMAND, l1_op);
> =20
>  		pa =3D virt_to_phys((void *)start);
> -		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
> -		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
> +		writel_relaxed(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mharti=
d));
> +		writel_relaxed(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mh=
artid));
>  		while ((andes_cpu_llc_get_cctl_status() &
>  			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=3D
>  			ANDES_LLC_CCTL_STATUS_IDLE)
> @@ -91,6 +97,10 @@ static void andes_cpu_cache_operation(unsigned long st=
art, unsigned long end,
> =20
>  		start +=3D line_size;
>  	}
> +	mb(); /* issue later memory accesses after the cache flush */
> +
> +	if (IS_ENABLED(CONFIG_SMP))
> +		put_cpu();
>  }
> =20
>  /* Write-back L1 and LLC entry */
> --=20
> 2.34.1
>=20

--A56KgNt4UDiuDCQI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqfCAAKCRB4tDGHoIJi
0hxrAPsFopm3rlVHdGdGWrZBgZ2VVCjgEhwQ655QHUxzHVCa2wEAg6oe7w0BdhmL
L3ERf7rF84HDlqz73WtNqaR3tMixowE=
=rsx9
-----END PGP SIGNATURE-----

--A56KgNt4UDiuDCQI--

