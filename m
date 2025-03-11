Return-Path: <linux-renesas-soc+bounces-14245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23663A5B902
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 07:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC8333A8E29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 06:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A221E1A05;
	Tue, 11 Mar 2025 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOEFys4u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241BF1DEFE1;
	Tue, 11 Mar 2025 06:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741673264; cv=none; b=TCqQUPWTsPfiTumX/hN0Dems6Nwd8a6hys+3YqjKidhVQrdJI8anFEvk8Pt+Wo+V1qj5e3523nUR990nl//+fi9aojW9Sdhd5SXDiftVyF4O2Vn3nCruZt4kvlAzdUKYmcOvGtFW2ibN7M2INLvLpDdI1vwFcG42n0sTIouzxA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741673264; c=relaxed/simple;
	bh=yRWn1iovWNrsqhtod6iHzgPsTsCfgH/d+xaja/frc2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIRHoseFijucNeYXR+aeq3nEw+UtV1AfIQ4WdV+eiKF/U0teBpD7t1oqe++oDMbzvOTmf9WHzENvGnpS50yEUzsWLx6qez1dkjbfw3K0YoiM8CBx4E8lLvtIqpkZGpRMmxX9tumH/4ZlB1Fajuu1pOdCYvQxN6j4WCEPEIsukHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOEFys4u; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741673263; x=1773209263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yRWn1iovWNrsqhtod6iHzgPsTsCfgH/d+xaja/frc2k=;
  b=iOEFys4uqOB9TQDgZMqNXS3CPPAv+wPJpgkqlWRXt0bjXYuF35CiQWIv
   lCIbA+36lHWbuVBHKB87ABy1Hog4FHYz32CW1gfyz/CKlArXPAOjCJDFb
   3yvWMwX2zccI3gQfkEcD5518GhN23khwbFZJlkSRk5q2E40awgbSIChpY
   JtHoqfshrRnjn96SVPfHQaQZ1OP8zotCtvt6m+BHhY0tEpYiYFeL4u4ig
   RNYgyCFgf/n1mi4M0sZK2j/d9bJZin/FjDhce/Y0vGs6Z2kJ7uOeQAvWw
   OlHHNwW3hGhbSc5ad+TKCV266crsyRydq4yWFlp8rsJaHL/nRrewVfDaY
   Q==;
X-CSE-ConnectionGUID: hlrzdoE0RcO9wH6yMZbSKw==
X-CSE-MsgGUID: x39jv4sJT2Wox62Y49WGnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42911528"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42911528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 23:07:42 -0700
X-CSE-ConnectionGUID: EwCur8gjQcyW+W0/DVtgRg==
X-CSE-MsgGUID: nkwfcOvITySxVkOXKzp2aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120919332"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 23:07:37 -0700
Date: Tue, 11 Mar 2025 07:03:45 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Ruud Bos <kernel.hbk@gmail.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Raju Lakkaraju <Raju.Lakkaraju@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Lasse Johnsen <l@ssejohnsen.me>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net 1/5] igb: reject invalid external timestamp requests
 for 82580-based HW
Message-ID: <Z8/SQRskrrvSofW7@mev-dev.igk.intel.com>
References: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
 <20250310-jk-net-fixes-supported-extts-flags-v1-1-854ffb5f3a96@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-jk-net-fixes-supported-extts-flags-v1-1-854ffb5f3a96@intel.com>

On Mon, Mar 10, 2025 at 03:16:36PM -0700, Jacob Keller wrote:
> The igb_ptp_feature_enable_82580 function correctly checks that unknown
> flags are not passed to the function. However, it does not actually check
> PTP_RISING_EDGE or PTP_FALLING_EDGE when configuring the external timestamp
> function.
> 
> The data sheet for the 82580 product says:
> 
>   Upon a change in the input level of one of the SDP pins that was
>   configured to detect Time stamp events using the TSSDP register, a time
>   stamp of the system time is captured into one of the two auxiliary time
>   stamp registers (AUXSTMPL/H0 or AUXSTMPL/H1).
> 
>   For example to define timestamping of events in the AUXSTMPL0 and
>   AUXSTMPH0 registers, Software should:
> 
>   1. Set the TSSDP.AUX0_SDP_SEL field to select the SDP pin that detects
>      the level change and set the TSSDP.AUX0_TS_SDP_EN bit to 1.
> 
>   2. Set the TSAUXC.EN_TS0 bit to 1 to enable timestamping
> 
> The same paragraph is in the i350 and i354 data sheets.
> 
> The wording implies that the time stamps are captured at any level change.
> There does not appear to be any way to only timestamp one edge of the
> signal.
> 
> Reject requests which do not set both PTP_RISING_EDGE and PTP_FALLING_EDGE
> when operating under PTP_STRICT_FLAGS mode via PTP_EXTTS_REQUEST2.
> 
> Fixes: 38970eac41db ("igb: support EXTTS on 82580/i354/i350")
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> ---
>  drivers/net/ethernet/intel/igb/igb_ptp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/intel/igb/igb_ptp.c b/drivers/net/ethernet/intel/igb/igb_ptp.c
> index f9457055612004c10f74379122063e8136fe7d76..b89ef4538a18d7ca11325ddc15944a878f4d807e 100644
> --- a/drivers/net/ethernet/intel/igb/igb_ptp.c
> +++ b/drivers/net/ethernet/intel/igb/igb_ptp.c
> @@ -509,6 +509,11 @@ static int igb_ptp_feature_enable_82580(struct ptp_clock_info *ptp,
>  					PTP_STRICT_FLAGS))
>  			return -EOPNOTSUPP;
>  
> +		/* Both the rising and falling edge are timstamped */
> +		if (rq->extts.flags & PTP_STRICT_FLAGS &&
> +		    (rq->extts.flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
> +			return -EOPNOTSUPP;
> +
>  		if (on) {
>  			pin = ptp_find_pin(igb->ptp_clock, PTP_PF_EXTTS,
>  					   rq->extts.index);

Thanks for fixing
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

In igb_ptp_feature_enable_i210() there is the same check for both edges
but also PTP_ENABLE_FEATURE is tested. There is no need for it here, or
it is redundant even in i210?

> 
> -- 
> 2.48.1.397.gec9d649cc640

