Return-Path: <linux-renesas-soc+bounces-30608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HVsLjSeymmg+QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 18:00:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E435E4C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 18:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B14E30078E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57C236E476;
	Mon, 30 Mar 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJRMdZFj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18842EB874;
	Mon, 30 Mar 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886077; cv=none; b=EHmD9V9Zfnm7yci65MuuxUAZ69fjwgm2bvbruLqO3zOi2PuEz6IfH8PudLtdvvN8MwAXEmgm53v17+BQigF6t0Jg9mHbYVE0lsdFahs1G8dkqgvkBSkZpOiCvPaqD08+R7AYxQlLSNonVfnQKejWQJ2s7z7Bb3P7KtssokMiBAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886077; c=relaxed/simple;
	bh=qrTfuWZ+583KaSwx8BZIdlJbjas15he7Gz19iTjBA94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuF32s/X0hr6+ZzVUljeYam3yvE6+w4d2Srzias+Xb7xUtGGU8ReRpJ/u/oJAgCIGVT3kfMRyNGHmmGynyVuwGfDukbRL1qc76FNJMY0rr9Waskv1rHBfDjPK6uxCzeu02KGBkTcVDY3jdOfPtcM9qtBawN8mXYGdu9yw9fJq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJRMdZFj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9138BC4CEF7;
	Mon, 30 Mar 2026 15:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886077;
	bh=qrTfuWZ+583KaSwx8BZIdlJbjas15he7Gz19iTjBA94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJRMdZFjxwAef16oJhvHZ2m5arDmntXBBKLVPXCn+GU8SZbZvOcQDIzeZsWW9Fuka
	 Ya9o6SHX1sQuVhWEHTQKjVZoh164ZIyr0nCAaHRs+AV4/Tpos73xmQzzkH6WfH0zeq
	 JeQRvzjQxL2J3Aou3XH8/mQjxTQOCpX0TIw9SolTbE9Qw7vKYR+zTc430Y5KiMNIib
	 MsOJJJMiQbdP3H7wmE9GBZPp+5B0GEwOq9wCX0renWLlgngH1ex2XiErRVmtJPghqh
	 qkNysfsLNf30ABkN/CCQMcuB/HDJpAxj2sGNgcrq8nHA/xFtJultwI9GJWKuHpQLt6
	 HltFGBeh8ihkw==
Date: Mon, 30 Mar 2026 16:54:31 +0100
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
	charles <dminus@andestech.com>
Subject: Re: [PATCH 1/7] cache: ax45mp_cache: refactor cache driver for
 generic Andes platform support
Message-ID: <20260330-oxford-chevy-5f5a6f0a5be4@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-2-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="osqTrhxoim6dqtHQ"
Content-Disposition: inline
In-Reply-To: <20260330102724.1012470-2-minachou@andestech.com>
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
	TAGGED_FROM(0.00)[bounces-30608-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A8E435E4C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--osqTrhxoim6dqtHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 06:27:18PM +0800, Hui Min Mina Chou wrote:
> Andes cache driver is not only usable with the AX45MP CPU but can also be
> applied to other CPU within Andes platform (such as A27L2).
> To improve maintainability and support future SoCs, this patch performs a
> comprehensive refactoring to move away from model-specific naming.
>=20
> key changes include:
>  - replaced AX45MP-specific Kconfig and function names with generic "ANDE=
S"
>    prefixes to support multiple CPU types
>  - updated all L2-related identifiers, structs, and prefixes to "LLC"
>    to accurately reflect its role as the system's last-level cache
>  - moved UCCTL* CSR definitions to <linux/soc/andes/csr.h>

Why? There's no user outside of the driver.

>  - standardized L1D and LLC macro prefixes (ANDES_L1D_* and ANDES_LLC_*)
>    for better clarity
>  - renamed compatible strings from ax45mp-cache to generic llcache
>  - rename ax45mp_cache.c to andes_llcache.c

This patch is, quite frankly, unreviewable. There's various additions
and changes hidden in here alongside renames. Every bullet point here
should be a patch, and then maybe I see some of them as trivial and
squash them, but what's here is just too annoying to spot what is a
rename and what is a snuck-in change.

>=20
> This is a structural refactoring; no functional behavior is changed.

You broke all users by removing a compatible, so this is clearly false.

>=20
> Signed-off-by: charles <dminus@andestech.com>
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>

All patches in this series that have more than one signoff have a
problem. You're the last signoff and the author, what did any of these
other people do? Were they the real authors and authorship is screwed
up? Or should these people have Co-developed-by tags?

Thanks,
Conor.

> ---
>  arch/riscv/Kconfig.errata     |   2 +-
>  drivers/cache/Kconfig         |   6 +-
>  drivers/cache/Makefile        |   2 +-
>  drivers/cache/andes_llcache.c | 224 ++++++++++++++++++++++++++++++++++
>  drivers/cache/ax45mp_cache.c  | 217 --------------------------------
>  drivers/soc/renesas/Kconfig   |   2 +-
>  include/linux/soc/andes//Rcsr.h |  12 ++
>  7 files changed, 242 insertions(+), 223 deletions(-)
>  create mode 100644 drivers/cache/andes_llcache.c
>  delete mode 100644 drivers/cache/ax45mp_cache.c
>  create mode 100644 include/linux/soc/andes/csr.h
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 3c945d086c7d..e32f1563ce3a 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -1,7 +1,7 @@
>  menu "CPU errata selection"
> =20
>  config ERRATA_ANDES
> -	bool "Andes AX45MP errata"
> +	bool "Andes errata"
>  	depends on RISCV_ALTERNATIVE && RISCV_SBI
>  	help
>  	  All Andes errata Kconfig depend on this Kconfig. Disabling
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 1518449d47b5..78142189f45c 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -10,11 +10,11 @@ menuconfig CACHEMAINT_FOR_DMA
> =20
>  if CACHEMAINT_FOR_DMA
> =20
> -config AX45MP_L2_CACHE
> -	bool "Andes Technology AX45MP L2 Cache controller"
> +config ANDES_CACHE
> +	bool "Andes platform CPUs Cache controller"
>  	select RISCV_NONSTANDARD_CACHE_OPS
>  	help
> -	  Support for the L2 cache controller on Andes Technology AX45MP platfo=
rms.
> +	  Support for the L1 and LLC (last level cache) controller on Andes pla=
tform CPUs.
> =20
>  config SIFIVE_CCACHE
>  	bool "Sifive Composable Cache controller"
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index b3362b15d6c1..4a218ad6cec0 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> -obj-$(CONFIG_AX45MP_L2_CACHE)		+=3D ax45mp_cache.o
> +obj-$(CONFIG_ANDES_CACHE)		+=3D andes_llcache.o
>  obj-$(CONFIG_SIFIVE_CCACHE)		+=3D sifive_ccache.o
>  obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+=3D starfive_starlink_cache.o
> =20
> diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
> new file mode 100644
> index 000000000000..d5e382f3c801
> --- /dev/null
> +++ b/drivers/cache/andes_llcache.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * non-coherent cache operations for Andes Platform CPUs.
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +
> +#include <linux/cacheflush.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/dma-direction.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/soc/andes/csr.h>
> +
> +#include <asm/dma-noncoherent.h>
> +
> +/* L1 D-cache operation encoding */
> +#define ANDES_L1D_CCTL_VA_INVAL			0x0	/* Invalidate an L1D cacheline */
> +#define ANDES_L1D_CCTL_VA_WB			0x1	/* Write-back an L1D cacheline */
> +#define ANDES_L1D_CCTL_VA_WBINVAL		0x2	/* Flush an L1D cacheline */
> +#define ANDES_L1D_CCTL_WBINVAL_ALL		0x6	/* Flush the entire L1D cache */
> +
> +/* LLC registers */
> +#define ANDES_LLC_REG_CFG_OFFSET		0x0
> +#define ANDES_LLC_REG_CTRL_OFFSET		0x8
> +#define ANDES_LLC_REG_ASYNC_ERR_OFFSET		0x30
> +#define ANDES_LLC_REG_ERR_OFFSET		0x38
> +#define ANDES_LLC_REG_CCTL_CMD_OFFSET_C0	0x40
> +#define ANDES_LLC_REG_CCTL_ACC_OFFSET_C0	0x48
> +#define ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0	0x80
> +
> +/* LLC CCTL status encoding */
> +#define ANDES_LLC_CCTL_STATUS_IDLE		0x0
> +#define ANDES_LLC_CCTL_STATUS_RUNNING		0x1
> +#define ANDES_LLC_CCTL_STATUS_ILLEGAL		0x2
> +
> +/* LLC CCTL status core 0 mask */
> +#define ANDES_LLC_CCTL_STATUS_MASK_C0		GENMASK(3, 0)
> +
> +/* LLC operation encoding */
> +#define ANDES_LLC_CCTL_PA_INVAL			0x8	/* Invalidate an LLC cacheline */
> +#define ANDES_LLC_CCTL_PA_WB			0x9	/* Write-back an LLC cacheline */
> +#define ANDES_LLC_CCTL_PA_WBINVAL		0xa	/* Flush an LLC cacheline */
> +#define ANDES_LLC_CCTL_WBINVAL_ALL		0x12	/* Flush the entire LLC cache */
> +
> +/* LLC CCTL registers and fields by core */
> +#define ANDES_LLC_REG_PER_CORE_OFFSET		0x10
> +#define ANDES_CCTL_LLC_STATUS_PER_CORE_OFFSET	0x4
> +
> +#define ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(n)	\
> +	(ANDES_LLC_REG_CCTL_CMD_OFFSET_C0 + ((n) * ANDES_LLC_REG_PER_CORE_OFFSE=
T))
> +#define ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(n)	\
> +	(ANDES_LLC_REG_CCTL_ACC_OFFSET_C0 + ((n) * ANDES_LLC_REG_PER_CORE_OFFSE=
T))
> +#define ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(n)	\
> +	(ANDES_LLC_CCTL_STATUS_MASK_C0 << ((n) * ANDES_CCTL_LLC_STATUS_PER_CORE=
_OFFSET))
> +
> +#define ANDES_CACHE_LINE_SIZE			64
> +
> +struct andes_priv {
> +	void __iomem *llc_base;
> +	u32 andes_cache_line_size;
> +};
> +
> +static struct andes_priv andes_priv;
> +
> +/* LLC operations */
> +static inline uint32_t andes_cpu_llc_get_cctl_status(void)
> +{
> +	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
> +}
> +
> +static void andes_cpu_cache_operation(unsigned long start, unsigned long=
 end,
> +				       unsigned int l1_op, unsigned int llc_op)
> +{
> +	unsigned long line_size =3D andes_priv.andes_cache_line_size;
> +	void __iomem *base =3D andes_priv.llc_base;
> +	int mhartid =3D smp_processor_id();
> +	unsigned long pa;
> +
> +	while (end > start) {
> +		csr_write(CSR_UCCTLBEGINADDR, start);
> +		csr_write(CSR_UCCTLCOMMAND, l1_op);
> +
> +		pa =3D virt_to_phys((void *)start);
> +		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
> +		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
> +		while ((andes_cpu_llc_get_cctl_status() &
> +			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=3D
> +			ANDES_LLC_CCTL_STATUS_IDLE)
> +			;
> +
> +		start +=3D line_size;
> +	}
> +}
> +
> +/* Write-back L1 and LLC entry */
> +static inline void andes_cpu_dcache_wb_range(unsigned long start, unsign=
ed long end)
> +{
> +	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_WB,
> +				   ANDES_LLC_CCTL_PA_WB);
> +}
> +
> +/* Invalidate the L1 and LLC entry */
> +static inline void andes_cpu_dcache_inval_range(unsigned long start, uns=
igned long end)
> +{
> +	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_INVAL,
> +				   ANDES_LLC_CCTL_PA_INVAL);
> +}
> +
> +static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +	unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> +	unsigned long end =3D start + size;
> +	unsigned long line_size;
> +	unsigned long flags;
> +
> +	if (unlikely(start =3D=3D end))
> +		return;
> +
> +	line_size =3D andes_priv.andes_cache_line_size;
> +
> +	start =3D start & (~(line_size - 1));
> +	end =3D ((end + line_size - 1) & (~(line_size - 1)));
> +
> +	local_irq_save(flags);
> +
> +	andes_cpu_dcache_inval_range(start, end);
> +
> +	local_irq_restore(flags);
> +}
> +
> +static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
> +{
> +	unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> +	unsigned long end =3D start + size;
> +	unsigned long line_size;
> +	unsigned long flags;
> +
> +	if (unlikely(start =3D=3D end))
> +		return;
> +
> +	line_size =3D andes_priv.andes_cache_line_size;
> +	start =3D start & (~(line_size - 1));
> +	end =3D ((end + line_size - 1) & (~(line_size - 1)));
> +	local_irq_save(flags);
> +	andes_cpu_dcache_wb_range(start, end);
> +	local_irq_restore(flags);
> +}
> +
> +static void andes_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
> +{
> +	andes_dma_cache_wback(paddr, size);
> +	andes_dma_cache_inv(paddr, size);
> +}
> +
> +static int andes_get_llc_line_size(struct device_node *np)
> +{
> +	int ret;
> +
> +	ret =3D of_property_read_u32(np, "cache-line-size", &andes_priv.andes_c=
ache_line_size);
> +	if (ret) {
> +		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
> +		return ret;
> +	}
> +
> +	if (andes_priv.andes_cache_line_size !=3D ANDES_CACHE_LINE_SIZE) {
> +		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
> +		       andes_priv.andes_cache_line_size);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct riscv_nonstd_cache_ops andes_cmo_ops __initconst =3D=
 {
> +	.wback =3D &andes_dma_cache_wback,
> +	.inv =3D &andes_dma_cache_inv,
> +	.wback_inv =3D &andes_dma_cache_wback_inv,
> +};
> +
> +static const struct of_device_id andes_cache_ids[] =3D {
> +	{ .compatible =3D "andestech,llcache" },
> +	{ /* sentinel */ }
> +};
> +
> +static int __init andes_cache_init(void)
> +{
> +	struct resource res;
> +	int ret;
> +
> +	struct device_node *np __free(device_node) =3D
> +		of_find_matching_node(NULL, andes_cache_ids);
> +	if (!of_device_is_available(np))
> +		return -ENODEV;
> +
> +	ret =3D of_address_to_resource(np, 0, &res);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
> +	 * will be 0 for sure, so we can definitely rely on it. If
> +	 * riscv_cbom_block_size =3D 0 we don't need to handle CMO using SW any
> +	 * more so we just return success here and only if its being set we
> +	 * continue further in the probe path.
> +	 */
> +	if (!riscv_cbom_block_size)
> +		return 0;
> +
> +	andes_priv.llc_base =3D ioremap(res.start, resource_size(&res));
> +	if (!andes_priv.llc_base)
> +		return -ENOMEM;
> +
> +	ret =3D andes_get_llc_line_size(np);
> +	if (ret) {
> +		iounmap(andes_priv.llc_base);
> +		return ret;
> +	}
> +
> +	riscv_noncoherent_register_cache_ops(&andes_cmo_ops);
> +
> +	return 0;
> +}
> +early_initcall(andes_cache_init);
> diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
> deleted file mode 100644
> index 934c5087ec2b..000000000000
> --- a/drivers/cache/ax45mp_cache.c
> +++ /dev/null
> @@ -1,217 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * non-coherent cache functions for Andes AX45MP
> - *
> - * Copyright (C) 2023 Renesas Electronics Corp.
> - */
> -
> -#include <linux/cacheflush.h>
> -#include <linux/cacheinfo.h>
> -#include <linux/dma-direction.h>
> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>
> -
> -#include <asm/dma-noncoherent.h>
> -
> -/* L2 cache registers */
> -#define AX45MP_L2C_REG_CTL_OFFSET		0x8
> -
> -#define AX45MP_L2C_REG_C0_CMD_OFFSET		0x40
> -#define AX45MP_L2C_REG_C0_ACC_OFFSET		0x48
> -#define AX45MP_L2C_REG_STATUS_OFFSET		0x80
> -
> -/* D-cache operation */
> -#define AX45MP_CCTL_L1D_VA_INVAL		0 /* Invalidate an L1 cache entry */
> -#define AX45MP_CCTL_L1D_VA_WB			1 /* Write-back an L1 cache entry */
> -
> -/* L2 CCTL status */
> -#define AX45MP_CCTL_L2_STATUS_IDLE		0
> -
> -/* L2 CCTL status cores mask */
> -#define AX45MP_CCTL_L2_STATUS_C0_MASK		0xf
> -
> -/* L2 cache operation */
> -#define AX45MP_CCTL_L2_PA_INVAL			0x8 /* Invalidate an L2 cache entry */
> -#define AX45MP_CCTL_L2_PA_WB			0x9 /* Write-back an L2 cache entry */
> -
> -#define AX45MP_L2C_REG_PER_CORE_OFFSET		0x10
> -#define AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET	4
> -
> -#define AX45MP_L2C_REG_CN_CMD_OFFSET(n)	\
> -	(AX45MP_L2C_REG_C0_CMD_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
> -#define AX45MP_L2C_REG_CN_ACC_OFFSET(n)	\
> -	(AX45MP_L2C_REG_C0_ACC_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
> -#define AX45MP_CCTL_L2_STATUS_CN_MASK(n)	\
> -	(AX45MP_CCTL_L2_STATUS_C0_MASK << ((n) * AX45MP_CCTL_L2_STATUS_PER_CORE=
_OFFSET))
> -
> -#define AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
> -#define AX45MP_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
> -
> -#define AX45MP_CACHE_LINE_SIZE			64
> -
> -struct ax45mp_priv {
> -	void __iomem *l2c_base;
> -	u32 ax45mp_cache_line_size;
> -};
> -
> -static struct ax45mp_priv ax45mp_priv;
> -
> -/* L2 Cache operations */
> -static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
> -{
> -	return readl(ax45mp_priv.l2c_base + AX45MP_L2C_REG_STATUS_OFFSET);
> -}
> -
> -static void ax45mp_cpu_cache_operation(unsigned long start, unsigned lon=
g end,
> -				       unsigned int l1_op, unsigned int l2_op)
> -{
> -	unsigned long line_size =3D ax45mp_priv.ax45mp_cache_line_size;
> -	void __iomem *base =3D ax45mp_priv.l2c_base;
> -	int mhartid =3D smp_processor_id();
> -	unsigned long pa;
> -
> -	while (end > start) {
> -		csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
> -		csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
> -
> -		pa =3D virt_to_phys((void *)start);
> -		writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
> -		writel(l2_op, base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
> -		while ((ax45mp_cpu_l2c_get_cctl_status() &
> -			AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=3D
> -			AX45MP_CCTL_L2_STATUS_IDLE)
> -			;
> -
> -		start +=3D line_size;
> -	}
> -}
> -
> -/* Write-back L1 and L2 cache entry */
> -static inline void ax45mp_cpu_dcache_wb_range(unsigned long start, unsig=
ned long end)
> -{
> -	ax45mp_cpu_cache_operation(start, end, AX45MP_CCTL_L1D_VA_WB,
> -				   AX45MP_CCTL_L2_PA_WB);
> -}
> -
> -/* Invalidate the L1 and L2 cache entry */
> -static inline void ax45mp_cpu_dcache_inval_range(unsigned long start, un=
signed long end)
> -{
> -	ax45mp_cpu_cache_operation(start, end, AX45MP_CCTL_L1D_VA_INVAL,
> -				   AX45MP_CCTL_L2_PA_INVAL);
> -}
> -
> -static void ax45mp_dma_cache_inv(phys_addr_t paddr, size_t size)
> -{
> -	unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> -	unsigned long end =3D start + size;
> -	unsigned long line_size;
> -	unsigned long flags;
> -
> -	if (unlikely(start =3D=3D end))
> -		return;
> -
> -	line_size =3D ax45mp_priv.ax45mp_cache_line_size;
> -
> -	start =3D start & (~(line_size - 1));
> -	end =3D ((end + line_size - 1) & (~(line_size - 1)));
> -
> -	local_irq_save(flags);
> -
> -	ax45mp_cpu_dcache_inval_range(start, end);
> -
> -	local_irq_restore(flags);
> -}
> -
> -static void ax45mp_dma_cache_wback(phys_addr_t paddr, size_t size)
> -{
> -	unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> -	unsigned long end =3D start + size;
> -	unsigned long line_size;
> -	unsigned long flags;
> -
> -	if (unlikely(start =3D=3D end))
> -		return;
> -
> -	line_size =3D ax45mp_priv.ax45mp_cache_line_size;
> -	start =3D start & (~(line_size - 1));
> -	end =3D ((end + line_size - 1) & (~(line_size - 1)));
> -	local_irq_save(flags);
> -	ax45mp_cpu_dcache_wb_range(start, end);
> -	local_irq_restore(flags);
> -}
> -
> -static void ax45mp_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
> -{
> -	ax45mp_dma_cache_wback(paddr, size);
> -	ax45mp_dma_cache_inv(paddr, size);
> -}
> -
> -static int ax45mp_get_l2_line_size(struct device_node *np)
> -{
> -	int ret;
> -
> -	ret =3D of_property_read_u32(np, "cache-line-size", &ax45mp_priv.ax45mp=
_cache_line_size);
> -	if (ret) {
> -		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
> -		return ret;
> -	}
> -
> -	if (ax45mp_priv.ax45mp_cache_line_size !=3D AX45MP_CACHE_LINE_SIZE) {
> -		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
> -		       ax45mp_priv.ax45mp_cache_line_size);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct riscv_nonstd_cache_ops ax45mp_cmo_ops __initdata =3D=
 {
> -	.wback =3D &ax45mp_dma_cache_wback,
> -	.inv =3D &ax45mp_dma_cache_inv,
> -	.wback_inv =3D &ax45mp_dma_cache_wback_inv,
> -};
> -
> -static const struct of_device_id ax45mp_cache_ids[] =3D {
> -	{ .compatible =3D "andestech,ax45mp-cache" },
> -	{ /* sentinel */ }
> -};
> -
> -static int __init ax45mp_cache_init(void)
> -{
> -	struct resource res;
> -	int ret;
> -
> -	struct device_node *np __free(device_node) =3D
> -		of_find_matching_node(NULL, ax45mp_cache_ids);
> -	if (!of_device_is_available(np))
> -		return -ENODEV;
> -
> -	ret =3D of_address_to_resource(np, 0, &res);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
> -	 * will be 0 for sure, so we can definitely rely on it. If
> -	 * riscv_cbom_block_size =3D 0 we don't need to handle CMO using SW any
> -	 * more so we just return success here and only if its being set we
> -	 * continue further in the probe path.
> -	 */
> -	if (!riscv_cbom_block_size)
> -		return 0;
> -
> -	ax45mp_priv.l2c_base =3D ioremap(res.start, resource_size(&res));
> -	if (!ax45mp_priv.l2c_base)
> -		return -ENOMEM;
> -
> -	ret =3D ax45mp_get_l2_line_size(np);
> -	if (ret) {
> -		iounmap(ax45mp_priv.l2c_base);
> -		return ret;
> -	}
> -
> -	riscv_noncoherent_register_cache_ops(&ax45mp_cmo_ops);
> -
> -	return 0;
> -}
> -early_initcall(ax45mp_cache_init);
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 1e50dc7c31cd..e0319c8236ee 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -447,7 +447,7 @@ config ARCH_R9A07G043
>  	depends on !RISCV_ISA_ZICBOM
>  	depends on RISCV_SBI
>  	select ARCH_RZG2L
> -	select AX45MP_L2_CACHE
> +	select ANDES_CACHE
>  	select CACHEMAINT_FOR_DMA
>  	select DMA_GLOBAL_POOL
>  	select ERRATA_ANDES
> diff --git a/include/linux/soc/andes/csr.h b/include/linux/soc/andes/csr.h
> new file mode 100644
> index 000000000000..3214b4b08a46
> --- /dev/null
> +++ b/include/linux/soc/andes/csr.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2026 Andes Technology Corporation.
> + */
> +#ifndef __LINUX_SOC_ANDES_CSR_H
> +#define __LINUX_SOC_ANDES_CSR_H
> +
> +/* User mode control registers */
> +#define CSR_UCCTLBEGINADDR		0x80b
> +#define CSR_UCCTLCOMMAND		0x80c
> +
> +#endif /* !__LINUX_SOC_ANDES_CSR_H */
> --=20
> 2.34.1
>=20

--osqTrhxoim6dqtHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqctwAKCRB4tDGHoIJi
0jK+AQDEJoJcGfPtyNLX4dff7WLg01r05Af+KzfErTAJYThi2gD+MimPKkH15ET9
vNGV13P5WYZtO4GgbkmYP5WF/jqj9ws=
=pAAF
-----END PGP SIGNATURE-----

--osqTrhxoim6dqtHQ--

