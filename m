Return-Path: <linux-renesas-soc+bounces-11080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2359E8C29
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 08:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B33818817B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 07:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEF5215054;
	Mon,  9 Dec 2024 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WR7lHDoP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5921481E;
	Mon,  9 Dec 2024 07:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733729297; cv=none; b=IbaXXmTPxPHk/kCwg+h3ZXH77WgkMoKEsyOUMqozoDa/zj7d4wNhv98KnrOTs6ngfCdNM3TmPJGjSL4tO7IUbkhrwAhzLCzdQfbmhOAiEaRDPoYEd6RQ66r9nzYOzJ0iHKBUVxOsWACKaYNZriuACDsln093ahDh8RBsEC+gCP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733729297; c=relaxed/simple;
	bh=prcaXDT+z5dqkQpWq6cORrkF5QNJffwsfXcM0q0PUlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaHfjfcTGa+QGlg1hdELrYQ7iUTXuuBccauzXSUZ1PnOK+V/pu7c/10QcwfSDL9SXsQbmOrqcLQbrfVGT0H07D/RVhykEpevnLS5yETtiXyU3aLmPY01gTcyHLINZ0k0qm95dR1bT5LqCwJUn6wWQOREmYjH0nCL3BGkpT86/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WR7lHDoP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733729295; x=1765265295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=prcaXDT+z5dqkQpWq6cORrkF5QNJffwsfXcM0q0PUlM=;
  b=WR7lHDoP8sWbDOdp+3wgjt9sSSsCsvTGZRXo9FucZNHSkDz5ZUva0g79
   z85XuGPEQVbXlDMd3pQnO8C3B5QNmpCOUf8YEQhAe7Zm5BOt5Jyzb1mJj
   oMIgc3pMWaOdAw510S0MQ5axNlYx93xzU1NMAziAKsFlnAxjHOcjspCvH
   DRC73thfgBJH07yArqiWNg2r0f+ulAYPRDgccydsuKguBC09VXj2ZnBIA
   7IQjLvHGKb2z+Kj6w7+EY8Nce8zAo+h2heBUVlWhTZf7OkpFZmEOacewQ
   tXbmDnwx8E0mUX6JFtqqQPupnapqLESu+QxRfjMDqKqYu465Xxir2w5pV
   A==;
X-CSE-ConnectionGUID: dM2nwamdTSqPIvzauc3efQ==
X-CSE-MsgGUID: TLq3nHWwSnCwqyyge3wJkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34159118"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34159118"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 23:28:15 -0800
X-CSE-ConnectionGUID: MDLohgWuTfefHLPXNB1pEg==
X-CSE-MsgGUID: bqXj/5B8QBuXCYPT26AAcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94860246"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 23:28:12 -0800
Date: Mon, 9 Dec 2024 08:25:12 +0100
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
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: do not deinit
 disabled ports
Message-ID: <Z1abWKCVKbaLFfcr@mev-dev.igk.intel.com>
References: <20241206192140.1714-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206192140.1714-1-nikita.yoush@cogentembedded.com>

On Sat, Dec 07, 2024 at 12:21:39AM +0500, Nikita Yushchenko wrote:
> In rswitch_ether_port_init_all(), only enabled ports are initialized.
> Then, rswitch_ether_port_deinit_all() shall also only deinitialize
> enabled ports.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 3b57abada200..cba80ccc3ce2 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1527,7 +1527,7 @@ static void rswitch_ether_port_deinit_all(struct rswitch_private *priv)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
> +	rswitch_for_each_enabled_port(priv, i) {
>  		phy_exit(priv->rdev[i]->serdes);
>  		rswitch_ether_port_deinit_one(priv->rdev[i]);
>  	}

Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

> -- 
> 2.39.5

