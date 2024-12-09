Return-Path: <linux-renesas-soc+bounces-11079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA68C9E8C1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 08:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76AF418853BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 07:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A829F214A88;
	Mon,  9 Dec 2024 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCpweCvP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01E022C6E8;
	Mon,  9 Dec 2024 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733729227; cv=none; b=bbVzawOuYnvQfk0O/2HzLKRG4SNBjeE0GafmApXBceggNFzaDGGq0Ygn0zxFdDZTOLnXxoOdiBH2uUbOW5QtSyOLrbkpG/QYjQl8jGc4BifXemRTdNSAwjVXHBRMO1W2pJ/bOKHiaRZHP6sX7IEUvidTISG5pHJ55UmpRlKo5QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733729227; c=relaxed/simple;
	bh=HJXOBmJpYjRXhLGDO9WfYYCVemR6LyLzJwAVkCoK3cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOfvY4C+fLovmdYsdyWgpaUbA69MktW3JUNK7xFvow9lCPTi8h/7Rug0yOl4RVUI6nC5TA7+ZiXkHzMrvYt0oUPqhFP5L3FcYBhVW+5MUcTgC7B3D/72onfHU+f11lBhcYmQZgumuvQPQvbHKQpB2LiXE/0eDNUWD3Ksfb6Ht4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCpweCvP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733729226; x=1765265226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HJXOBmJpYjRXhLGDO9WfYYCVemR6LyLzJwAVkCoK3cc=;
  b=bCpweCvPizgNeDy4C688UDHxAjYBggcjDrpmQC6h+7tu22iMjo0SiiM1
   efvFETJGZ4GTI9H4O5UqEHku69fqh5BiXTWNyVrFH7glcLBr7KOTQ0dbx
   v89ZHLyKbDgPwEr87yO44x8Xxn78KQBHDKPq7+0yoQA2PWZzYJru9jyPx
   Y6uKOK31h5g0ZAvZqVilbu7LM74aVVSOorX3CWVJNgroyWoFDix5kwjMh
   6bALS5jl2A5nPtYCoCvFVBsKwIGyVmWAYiDZfP0d4a//UsUCEZZplHzTu
   Qegvj8INvii1JAmWcWB+OenFScB3iXB9l9vJTbyktMKTbMNJtAkBy0uK8
   A==;
X-CSE-ConnectionGUID: hhllxUF2R4uHD+xFPVkOfQ==
X-CSE-MsgGUID: UwOcqX50RVaTBkvk/py/EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="44482337"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="44482337"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 23:27:05 -0800
X-CSE-ConnectionGUID: P8GgEotcQpKSv7qQ8sXr6w==
X-CSE-MsgGUID: BeWFzG4nTse9SpuTYA3kbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="118231248"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 23:27:02 -0800
Date: Mon, 9 Dec 2024 08:24:02 +0100
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
Subject: Re: [PATCH net-next 2/2] net: renesas: rswitch: remove speed from
 gwca structure
Message-ID: <Z1abEqA5Jngxkxr6@mev-dev.igk.intel.com>
References: <20241206192140.1714-1-nikita.yoush@cogentembedded.com>
 <20241206192140.1714-2-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206192140.1714-2-nikita.yoush@cogentembedded.com>

On Sat, Dec 07, 2024 at 12:21:40AM +0500, Nikita Yushchenko wrote:
> This field is set but never used.
> 
> GWCA is rswitch CPU interface module which connects rswitch to the
> host over AXI bus. Speed of the switch ports is not anyhow related to
> GWCA operation.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 3 ---
>  drivers/net/ethernet/renesas/rswitch.h | 1 -
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index cba80ccc3ce2..8ac6ef532c6a 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1902,9 +1902,6 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
>  	if (err < 0)
>  		goto out_get_params;
>  
> -	if (rdev->priv->gwca.speed < rdev->etha->speed)
> -		rdev->priv->gwca.speed = rdev->etha->speed;
> -
>  	err = rswitch_rxdmac_alloc(ndev);
>  	if (err < 0)
>  		goto out_rxdmac;
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> index 72e3ff596d31..303883369b94 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -993,7 +993,6 @@ struct rswitch_gwca {
>  	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
>  	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
>  	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
> -	int speed;
>  };
>  

Nice cleanup
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

>  #define NUM_QUEUES_PER_NDEV	2
> -- 
> 2.39.5

