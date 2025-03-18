Return-Path: <linux-renesas-soc+bounces-14594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63FA6760F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70C6E189158B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164F920D515;
	Tue, 18 Mar 2025 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKHM9POv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213E14A8B;
	Tue, 18 Mar 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306825; cv=none; b=BsBJHA7k/5Y2eSIRIMatnM/WJOkFHdt8MWDqIVImU2X7zlDc4MTDROHxF2t9fNEW/EKNn0POERadXkJ6ihDHsIoywIsYQQvAZBx8ZzVBaKSoyv9POv+BDmCuCn+NyOSTWJprY+8fdGmHDcWKsKbMGTaX/rEyHC0xQd2LFINmANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306825; c=relaxed/simple;
	bh=x+ln5AfDExf7TBvKk6FVfaJvANPiM17BmFZInPNzSpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1Jh9f0sMpzc0ejrnOFr2/UcyWqF3dmfnVn3zCaOZMrMSyZdHnJ6f3nJJ0Y2J3MNHHAqngMecgWNqwu6sbu7QHjdFIRWHvcYeFilILWZdL4QXvHNCEV5IML3ddN2AodNMDuQYZ5sU89SH70cDxYqiQpxivC5bqKfaH6RI9ma4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKHM9POv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B519EC4AF09;
	Tue, 18 Mar 2025 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306824;
	bh=x+ln5AfDExf7TBvKk6FVfaJvANPiM17BmFZInPNzSpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKHM9POv4Gf+HtL0UXHmuYb/RxiVCglZ02a6atCv6JB2Q+j0tBiztjw90Sp5vxiMH
	 bwt2waGkGiqMbEHLpToBOejy6Hd6JK2sIywntO6H6yKqrF2vtAwQyF2inFd42BX8Pd
	 CPAbH0a43AOuHLVimgnBW8xxk/YPvP/JrXl/h3KtZs4ZTW5rerYGbpEUzxbEYfml5F
	 a1WJfVdimDvGl4RgsRlLvhTS8UsQCV7UwLoWzTYIiTtwoeVayiqFokEcqnd+eEsGBl
	 IuMec359zCbBG3KHPIC8sKyY4fp9fvHIVlKM8nDZgVO8LDlDdfn3X6o0/FWPgmhNt6
	 MFmGxpDYPILsA==
Date: Tue, 18 Mar 2025 14:06:57 +0000
From: Simon Horman <horms@kernel.org>
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
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Lasse Johnsen <l@ssejohnsen.me>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net v2 1/5] igb: reject invalid external timestamp
 requests for 82580-based HW
Message-ID: <20250318140657.GV688833@kernel.org>
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
 <20250312-jk-net-fixes-supported-extts-flags-v2-1-ea930ba82459@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-jk-net-fixes-supported-extts-flags-v2-1-ea930ba82459@intel.com>

On Wed, Mar 12, 2025 at 03:15:50PM -0700, Jacob Keller wrote:
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
> Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>


