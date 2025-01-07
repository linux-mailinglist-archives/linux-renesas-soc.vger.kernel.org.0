Return-Path: <linux-renesas-soc+bounces-11929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 121BCA0419B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 15:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C3B1888213
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 14:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2547C1F37A8;
	Tue,  7 Jan 2025 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dYWH7FbD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="okB4KPHS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755F1F1937
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258479; cv=none; b=gH8+G0lKRkOUPBlniVoKK9QABmceVbANZd7lyNibXMuzdy8hgZ7CGiwRGnzW5grXExxdjoHGrIjVXZ4wa6SD0ajUNSQ82fZgz8oDWZtgi2NtsUlBMJpnNd7L5RTWksTy6V5Y8FaOvB8DyqrI4Ju3Q82fMX/Qltm0/M7EsDhqq+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258479; c=relaxed/simple;
	bh=xOlO8bNSqDBchWHqPzb4w6oTH5/L2xlM7PZTeYP6avI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRjMRRwiVL9gcMptwg53FOU12PC1H2UdCdT7S617EhAkBmyF6d5SBZjYecJSJ66WaXLVy6A1L8zC26ECYMScPjL2pXILce+0NvpCKUFRBe8wtn07dAKknwccObqDVtEZlS5WF4wbFFQbA9cdtk3ySRm1sQJy47balJMpJyxQd/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dYWH7FbD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=okB4KPHS; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 3D55F13802BF;
	Tue,  7 Jan 2025 09:01:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 07 Jan 2025 09:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736258473;
	 x=1736344873; bh=PONbj5QCzOjK109Tn5NW3nu/38X2dLM5U7DJFVkleg8=; b=
	dYWH7FbD5s7A9l1qktPAuv0Z4UckSJ4PmUzpCxn8OlSRmlOt0y+lYChnvE0TtdX6
	YajNqgxuZDJmQbJk/Spe7jr6NbQjk/IHuEEgGRqpw0rapjzxxKQfN7P8jcsqnf6O
	rA4IGag/BmjYwmdpavjrXKINO+94jr0n0yFSHwi8U1bdejKoCDznIQoAfdoyeHMx
	fdl/o75/uW/Ax6RMAhF4hGWGVV/Ih6y5Ac1YPggRg7+tXgxh4K2ZunjAIcEmjQlF
	QqZqVQT4OUGm4CjsN635LZGAIgGJ3kWv5yjwAZPeum3N/BgrInzBtD744kDF1zrh
	BS/ZvU67kMrooDjas2W4dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736258473; x=
	1736344873; bh=PONbj5QCzOjK109Tn5NW3nu/38X2dLM5U7DJFVkleg8=; b=o
	kB4KPHSDyjLMHHxpMKtKn0JTYbTDI63MACgCrLS4VOIkBw45eAonITjKKcS1eCUm
	YhuMMEzNtnhcj0AoOIa/cn3r6KRRaiCAOpKvPT4IRxAkC1DPwb8AJaxdSb7hiUEg
	VtBsUUVIYjVqpF4ZRFqnuHZL+YbpYMOvdrZVRztYmnu1SZ7KqerMsEknSCFwgq+/
	gRwnzgxPMCOsis6LoG5hi9cbSowps6N8gi7kZDoW0IqAIEt7N45RbABW3Mkz071C
	2+T5WBhss73I1GWEh2w4O6QMRii8idegscsHXRKu5Bt+ucc1KITC9Oh4DvOJtpgw
	9mSLuPXeeg5CVbL3PoOkw==
X-ME-Sender: <xms:qDN9Z8GWZIrUYy_yDLajXRQFOmgIaFI8Za_FYJmUnQqmgtoHth6yPA>
    <xme:qDN9Z1WyJ-yDvKeM5GHiu6Pq_NPLT5rr58KDwGptEnPXhUD-DQF55xIoeIPeK0YHv
    cCpnV0Mm35kTvOqmN4>
X-ME-Received: <xmr:qDN9Z2Kk20qvfsSSfbbj5hHNwunLp74Y5uEqG7K0w0MTus1yXd9dTeRLfypKZ89t7ze8LssGE-oEOVRMH7KBTATnuofLJccHKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegvddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhi
    uggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:qTN9Z-F1cAAVeLBL88JNJDbpQGpY2bJdi-v-8UA3j23he2Bs6_k8HA>
    <xmx:qTN9ZyUbej9g-k5IBIU8tYPangPWRrfj7VA0Df0UsV3QdEA3FRJS7A>
    <xmx:qTN9ZxNpY1jiG-GNtEsU8GyYQ22aazrrab4R7E7Uq1moIqq8YkBn1w>
    <xmx:qTN9Z51g3LwoRnMVSq8aIs4iLouH0GTO78VvkVyVKb24nBWAVEqHMw>
    <xmx:qTN9ZwyGDAdpKdld9kcCeqdm-oJPZ32q4OSQFHZ--a5QkD8GePIi0t7x>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 09:01:12 -0500 (EST)
Date: Tue, 7 Jan 2025 15:01:11 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC] ARM: shmobile: rcar-gen2: Remove CMA reservation code
Message-ID: <20250107140111.GJ2766897@ragnatech.se>
References: <3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2025-01-07 12:26:55 +0100, Geert Uytterhoeven wrote:
> If CONFIG_HIGHMEM=y, two reserved blocks are allocated on R-Car Gen2:
> 
>     cma: Reserved 256 MiB at 0x70000000 on node -1
>     cma: Reserved 64 MiB at 0x6c000000 on node -1
> 
> The first block is reserved by the family-specific rcar_gen2_reserve(),
> the second by the common arm_memblock_init() (shmobile_defconfig sets
> CONFIG_CMA_SIZE_MBYTES=64).  As both blocks are reserved (eventually)
> using dma_contiguous_reserve_area(), they both have the same name
> ("reserved").  Hence if CONFIG_CMA_SYSFS=y:
> 
>   sysfs: cannot create duplicate filename '/kernel/mm/cma/reserved'
>    ...
>    cma_sysfs_init from do_one_initcall+0x84/0x178
>    ...
>   kobject: kobject_add_internal failed for reserved with -EEXIST, don't try to register things with the same name in the same directory.
> 
> This causes cma_sysfs_init() to fail completely, and not to create
> /sys/kernel/mm/cma/ at all.
> 
> Fix this by dropping the R-Car Gen2-specific reservation.  Compared to
> when it was introduced, now there exist more flexible mechanisms to
> control the size of memory reserved for CMA.  Users can reserve more
> memory by increasing CONFIG_CMA_SIZE_MBYTES, passing the cma=<N> kernel
> command line parameter, or adding a reserved-memory/linux,cma node to
> DT.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Note that increasing CONFIG_CMA_SIZE_MBYTES in shmobile_defconfig is not
> a good idea, as it can also be used on other Renesas platforms that are
> more memory-constrained than R-Car Gen2.
> 
> Should we add reserved-memory/linux,cma nodes to DT on all affected
> boards?

For what it's worth I always set CONFIG_CMA_SIZE_MBYTES=128 to allow my 
capture tests enough CMA memory to operate correctly. I would not be 
against adding this to the upstream DTS files.

> ---
>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 76 ------------------------
>  1 file changed, 76 deletions(-)
> 
> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> index c38367a10c794162..3cd34a42e39bb1d7 100644
> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> @@ -8,19 +8,15 @@
>   */
>  
>  #include <linux/clocksource.h>
> -#include <linux/device.h>
> -#include <linux/dma-map-ops.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/memblock.h>
>  #include <linux/of.h>
>  #include <linux/of_clk.h>
> -#include <linux/of_fdt.h>
>  #include <linux/psci.h>
>  #include <asm/mach/arch.h>
>  #include <asm/secure_cntvoff.h>
>  #include "common.h"
> -#include "rcar-gen2.h"
>  
>  static const struct of_device_id cpg_matches[] __initconst = {
>  	{ .compatible = "renesas,r8a7742-cpg-mssr", .data = "extal" },
> @@ -122,76 +118,6 @@ static void __init rcar_gen2_timer_init(void)
>  	timer_probe();
>  }
>  
> -struct memory_reserve_config {
> -	u64 reserved;
> -	u64 base, size;
> -};
> -
> -static int __init rcar_gen2_scan_mem(unsigned long node, const char *uname,
> -				     int depth, void *data)
> -{
> -	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
> -	const __be32 *reg, *endp;
> -	int l;
> -	struct memory_reserve_config *mrc = data;
> -	u64 lpae_start = 1ULL << 32;
> -
> -	/* We are scanning "memory" nodes only */
> -	if (type == NULL || strcmp(type, "memory"))
> -		return 0;
> -
> -	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
> -	if (reg == NULL)
> -		reg = of_get_flat_dt_prop(node, "reg", &l);
> -	if (reg == NULL)
> -		return 0;
> -
> -	endp = reg + (l / sizeof(__be32));
> -	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
> -		u64 base, size;
> -
> -		base = dt_mem_next_cell(dt_root_addr_cells, &reg);
> -		size = dt_mem_next_cell(dt_root_size_cells, &reg);
> -
> -		if (base >= lpae_start)
> -			continue;
> -
> -		if ((base + size) >= lpae_start)
> -			size = lpae_start - base;
> -
> -		if (size < mrc->reserved)
> -			continue;
> -
> -		if (base < mrc->base)
> -			continue;
> -
> -		/* keep the area at top near the 32-bit legacy limit */
> -		mrc->base = base + size - mrc->reserved;
> -		mrc->size = mrc->reserved;
> -	}
> -
> -	return 0;
> -}
> -
> -static void __init rcar_gen2_reserve(void)
> -{
> -	struct memory_reserve_config mrc;
> -
> -	/* reserve 256 MiB at the top of the physical legacy 32-bit space */
> -	memset(&mrc, 0, sizeof(mrc));
> -	mrc.reserved = SZ_256M;
> -
> -	of_scan_flat_dt(rcar_gen2_scan_mem, &mrc);
> -#ifdef CONFIG_DMA_CMA
> -	if (mrc.size && memblock_is_region_memory(mrc.base, mrc.size)) {
> -		static struct cma *rcar_gen2_dma_contiguous;
> -
> -		dma_contiguous_reserve_area(mrc.size, mrc.base, 0,
> -					    &rcar_gen2_dma_contiguous, true);
> -	}
> -#endif
> -}
> -
>  static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
>  	"renesas,r8a7790",
>  	"renesas,r8a7791",
> @@ -204,7 +130,6 @@ static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
>  DT_MACHINE_START(RCAR_GEN2_DT, "Generic R-Car Gen2 (Flattened Device Tree)")
>  	.init_late	= shmobile_init_late,
>  	.init_time	= rcar_gen2_timer_init,
> -	.reserve	= rcar_gen2_reserve,
>  	.dt_compat	= rcar_gen2_boards_compat_dt,
>  MACHINE_END
>  
> @@ -220,6 +145,5 @@ static const char * const rz_g1_boards_compat_dt[] __initconst = {
>  DT_MACHINE_START(RZ_G1_DT, "Generic RZ/G1 (Flattened Device Tree)")
>  	.init_late	= shmobile_init_late,
>  	.init_time	= rcar_gen2_timer_init,
> -	.reserve	= rcar_gen2_reserve,
>  	.dt_compat	= rz_g1_boards_compat_dt,
>  MACHINE_END
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

