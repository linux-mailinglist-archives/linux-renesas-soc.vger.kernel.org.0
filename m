Return-Path: <linux-renesas-soc+bounces-14596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52733A6761D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D51ED1886F9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7546E20DD5C;
	Tue, 18 Mar 2025 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osX268sM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF920C006;
	Tue, 18 Mar 2025 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306932; cv=none; b=UAGOllrdfT6pBnL1hHvlFRMqPBfLaton2A+chis76tg06EWhqycZ229VvKYjsB9oLHpD6eeeAWouYj4Q0uLacoE8qgYEavVCvcpqKCEmCyR4saugJSJ89PrQ1ITL1+aFoGyqW9r/ny/wnGsMY3xe4Yv+iwfu+/57H0s/F9zO7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306932; c=relaxed/simple;
	bh=zwEgifMobld4uUocUPMZBeRolUHzD/YMncdDMRuLpC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dW8RTCODebQ+EEpfCPhK7MN+fH2giSSNkDUhOisUdLAJeEpnDxdFbNU83w1crG8DWcUCWQKpfIxfNTVj/UgGlG5Tx5xfH0ZqRfMWnt5eZIK6ZPBHsqjd6/MMa5tNml6mIGVaydYW73xBhSJ6rU42Zdvyju5qjTm0OmqxQxXSb8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osX268sM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDADC4CEDD;
	Tue, 18 Mar 2025 14:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306931;
	bh=zwEgifMobld4uUocUPMZBeRolUHzD/YMncdDMRuLpC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=osX268sMbEfFNm+edoVczlAYnHxXzFwrBFGHGiH++bobaKSWhEM5NxDKNNOlLTDbd
	 1geugkMov15jvkOhrRO5ScFFmBwwkk7eGfhvsU+dedlI8VWDHw0Fu8PioDyIgOXqzz
	 +uAm5u4gx+oMEKkdRpMLb3KX7JW+ikb6aoVUb7P/lzNQ5vVfq+GD3/CDjWzHHdNz15
	 9gaWRszIaSajQSkl4jNRALSaWG2EVADV8W3wIfmFSYsjtH4vGASNi/0wa4IfbBDlCD
	 ZbtDFJndS6CUwNWyFq2VeLVwFFoxQngFFuCi8/aG6TtapzZkSBtN0A22zL240moNOP
	 FbPOQURQFHUeA==
Date: Tue, 18 Mar 2025 14:08:45 +0000
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
Subject: Re: [PATCH net v2 3/5] net: lan743x: reject unsupported external
 timestamp requests
Message-ID: <20250318140845.GX688833@kernel.org>
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
 <20250312-jk-net-fixes-supported-extts-flags-v2-3-ea930ba82459@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-jk-net-fixes-supported-extts-flags-v2-3-ea930ba82459@intel.com>

On Wed, Mar 12, 2025 at 03:15:52PM -0700, Jacob Keller wrote:
> The lan743x_ptp_io_event_cap_en() function checks that the given request
> sets only one of PTP_RISING_EDGE or PTP_FALLING_EDGE, but not both.
> 
> However, this driver does not check whether other flags (such as
> PTP_EXT_OFF) are set, nor whether any future unrecognized flags are set.
> 
> Fix this by adding the appropriate check to the lan743x_ptp_io_extts()
> function.
> 
> Fixes: 60942c397af6 ("net: lan743x: Add support for PTP-IO Event Input External Timestamp (extts)")
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>


