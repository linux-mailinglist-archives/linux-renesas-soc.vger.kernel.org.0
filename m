Return-Path: <linux-renesas-soc+bounces-11209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA19EC4A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 07:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06AE528510B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 06:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EE11BD51F;
	Wed, 11 Dec 2024 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6zlZtk3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5619C2451C0;
	Wed, 11 Dec 2024 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733897921; cv=none; b=F4wrqGP3xX/GMU+9PX3Av6N02dSRReXHp+OPH+7bDTR2JuluTcF7WQMTFsl+4UhVoeAjdyaTRqafh2o/SKZYpEqqM34eE/PrXRpJJYr9UpzYutipcypjzvOcebsvYtSA5C3X0LaYptMRjClz4+BPjgGR2T++dKsCgV7oafgtiRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733897921; c=relaxed/simple;
	bh=cur8CuoAH+H4jF33FgCR6R1uA3IllajSA0KvS9KrMQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhTYzVWWtasYvEXCQLyimPMK0A5brG3Z6GXP82ssZGx/9fYylbn04xst6GRAfhLv29ngnUkFVd4sL0nbxpH6Jw+cPoAiQYCQ+zCNTBgWgj+acD6Fhlt6jLCJKVJCCk/ajHzmdk8zN6gRAqOkdyHp30ZEbfPZiojhSYt6GCXvo70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6zlZtk3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733897920; x=1765433920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cur8CuoAH+H4jF33FgCR6R1uA3IllajSA0KvS9KrMQc=;
  b=M6zlZtk3ysMGJIE6+/kjxEOHr0+dHXTVvp6ql318iO7eP6Nw/xmJBNby
   Ls5NOVnGMBT/0JyRIxfGovTjQoFZVMZjsyS28/qSuMrs/86TzDy0bNdHW
   rmgrQaRRlu712iZFajINyF9WNOJWhQ1DoLIbo9XhUJRwesvRzbKWvTCgD
   jl28RZ88MI2yKbTMjeFo3yVj52RWx3QjGiZStBlgNyLRFuWjHKsgpEqZZ
   86G0R/bjduzMEzC/7BtlgYGH6FsRB0Q8VC4HZ0+pg1j9O0CYus7QHsM+v
   /AVy0TQ489I9WiH4+h2GOYXNAadTeziGiz4Q0ODfi7i00lQe5Lz3xI7k8
   Q==;
X-CSE-ConnectionGUID: 52NFVWRTQQ+8F2GMj6AJuw==
X-CSE-MsgGUID: LylsMFkcSZyoq4q9JJVP5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34390458"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34390458"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 22:18:39 -0800
X-CSE-ConnectionGUID: PCFnWO9wRvKGcb6vNOSpXQ==
X-CSE-MsgGUID: hJqPX/ImR/G57QTjcGJIQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118921327"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 22:18:35 -0800
Date: Wed, 11 Dec 2024 07:15:35 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net v2] net: renesas: rswitch: fix initial MPIC register
 setting
Message-ID: <Z1kuB1Ac225G8HkY@mev-dev.igk.intel.com>
References: <20241211053012.368914-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211053012.368914-1-nikita.yoush@cogentembedded.com>

On Wed, Dec 11, 2024 at 10:30:12AM +0500, Nikita Yushchenko wrote:
> MPIC.PIS must be set per phy interface type.
> MPIC.LSC must be set per speed.
> 
> Do that strictly per datasheet, instead of hardcoding MPIC.PIS to GMII.
> 
> Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
> v1: https://lore.kernel.org/netdev/20241209075951.163924-1-nikita.yoush@cogentembedded.com/
> changes: regenerate against top of net tree (commit 3dd002f20098 "net:
>          renesas: rswitch: handle stop vs interrupt race") to ensure it
>          applies cleanly
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 27 ++++++++++++++++++++------
>  drivers/net/ethernet/renesas/rswitch.h | 14 ++++++-------
>  2 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 6ec714789573..dbbbf024e7ab 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1116,25 +1116,40 @@ static int rswitch_etha_wait_link_verification(struct rswitch_etha *etha)
>  
>  static void rswitch_rmac_setting(struct rswitch_etha *etha, const u8 *mac)
>  {
> -	u32 val;
> +	u32 pis, lsc;
>  
>  	rswitch_etha_write_mac_address(etha, mac);
>  
> +	switch (etha->phy_interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		pis = MPIC_PIS_GMII;
> +		break;
> +	case PHY_INTERFACE_MODE_USXGMII:
> +	case PHY_INTERFACE_MODE_5GBASER:
> +		pis = MPIC_PIS_XGMII;
> +		break;
> +	default:
> +		pis = FIELD_GET(MPIC_PIS, ioread32(etha->addr + MPIC));
> +		break;
> +	}
> +
>  	switch (etha->speed) {
>  	case 100:
> -		val = MPIC_LSC_100M;
> +		lsc = MPIC_LSC_100M;
>  		break;
>  	case 1000:
> -		val = MPIC_LSC_1G;
> +		lsc = MPIC_LSC_1G;
>  		break;
>  	case 2500:
> -		val = MPIC_LSC_2_5G;
> +		lsc = MPIC_LSC_2_5G;
>  		break;
>  	default:
> -		return;
> +		lsc = FIELD_GET(MPIC_LSC, ioread32(etha->addr + MPIC));
> +		break;
>  	}
>  
> -	iowrite32(MPIC_PIS_GMII | val, etha->addr + MPIC);
> +	rswitch_modify(etha->addr, MPIC, MPIC_PIS | MPIC_LSC,
> +		       FIELD_PREP(MPIC_PIS, pis) | FIELD_PREP(MPIC_LSC, lsc));
>  }
>  
>  static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> index 72e3ff596d31..e020800dcc57 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -724,13 +724,13 @@ enum rswitch_etha_mode {
>  
>  #define EAVCC_VEM_SC_TAG	(0x3 << 16)
>  
> -#define MPIC_PIS_MII		0x00
> -#define MPIC_PIS_GMII		0x02
> -#define MPIC_PIS_XGMII		0x04
> -#define MPIC_LSC_SHIFT		3
> -#define MPIC_LSC_100M		(1 << MPIC_LSC_SHIFT)
> -#define MPIC_LSC_1G		(2 << MPIC_LSC_SHIFT)
> -#define MPIC_LSC_2_5G		(3 << MPIC_LSC_SHIFT)
> +#define MPIC_PIS		GENMASK(2, 0)
> +#define MPIC_PIS_GMII		2
> +#define MPIC_PIS_XGMII		4
> +#define MPIC_LSC		GENMASK(5, 3)
> +#define MPIC_LSC_100M		1
> +#define MPIC_LSC_1G		2
> +#define MPIC_LSC_2_5G		3
>  
>  #define MDIO_READ_C45		0x03
>  #define MDIO_WRITE_C45		0x01
> -- 
> 2.39.5

Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>


