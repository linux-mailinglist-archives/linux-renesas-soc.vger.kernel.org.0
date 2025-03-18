Return-Path: <linux-renesas-soc+bounces-14595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B6A675EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9A563A9370
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 14:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC77120D519;
	Tue, 18 Mar 2025 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFIpv2Mq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6614A8B;
	Tue, 18 Mar 2025 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306886; cv=none; b=rcXO8/3e/nA2DQ3HPaFLusCfavbMbR6G/DPubjNFh/3ntSZ3YjXm8SS3z2D5G38CuUg1Vpx7Elivyz8r71U+/6T0G0Ce8xtAjV5ZvXro0xFkWNjh85SpnioFG7D1NqRNF/ps6fDCd/QY8pYvwNqOPJAMCpAKa/s+wrouJ9wzq1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306886; c=relaxed/simple;
	bh=ILLjAudTsqFUCQ45J2jmmZXxe4u//4VFOtoI3v3By4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoYG6S3Hf8zUAz9FyOpdhBTfJoUd/zpQLBoZWDea5T4OOUSnXS7U6BpJxxaEGhIBl3aPkZZro5fTPG8jW2XzS/dKXyom8rlwfR/oDBj/yOGfMXYtL9NE2DwQ0ro8yUFAZJMZILoGqiriVTmuWp/4NkZdvfP6m5xfaMgbMjlUxsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFIpv2Mq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E7AC4CEDD;
	Tue, 18 Mar 2025 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306886;
	bh=ILLjAudTsqFUCQ45J2jmmZXxe4u//4VFOtoI3v3By4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFIpv2MqNsFaaPZkSzKsra7MAnaPKCKXTMM5M44edCTmoIilqhWFK/qbom919phg3
	 kDqTAqC7PZuF2pHVMxCFVO4ha1TMvsEjY3RDXbLVBav2gaJyygi9fNEtxA7+mrJbm0
	 Vt/OU+fwpxjO56K1jain15iVgkkR633aie3j9olGnl83ByWHZccQYuRMem3lsB8pNI
	 5tdNO9LLr4V8YJ2kl7PgTub8WdA2Ny3zM2X5CXSUOqE7Dvo3iwMbNcRbU1pbYSxwYR
	 ehOP2GEdwIUBKfEnhfnRgjccpl7/9s2LzLGy7dCwB/xAMiUc27cV5UJTPCslLQmVS0
	 2jp2yGrW3kj5Q==
Date: Tue, 18 Mar 2025 14:07:59 +0000
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
Subject: Re: [PATCH net v2 2/5] renesas: reject PTP_STRICT_FLAGS as
 unsupported
Message-ID: <20250318140759.GW688833@kernel.org>
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
 <20250312-jk-net-fixes-supported-extts-flags-v2-2-ea930ba82459@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-jk-net-fixes-supported-extts-flags-v2-2-ea930ba82459@intel.com>

On Wed, Mar 12, 2025 at 03:15:51PM -0700, Jacob Keller wrote:
> The ravb_ptp_extts() function checks the flags coming from the
> PTP_EXTTS_REQUEST ioctl, to ensure that future flags are not accepted on
> accident.
> 
> This was updated to 'honor' the PTP_STRICT_FLAGS in commit 6138e687c7b6
> ("ptp: Introduce strict checking of external time stamp options.").
> However, the driver does not *actually* validate the flags.
> 
> I originally fixed this driver to reject future flags in commit
> 592025a03b34 ("renesas: reject unsupported external timestamp flags"). It
> is still unclear whether this hardware timestamps the rising, falling, or
> both edges of the input signal.
> 
> Accepting requests with PTP_STRICT_FLAGS is a bug, as this could lead to
> users mistakenly assuming a request with PTP_RISING_EDGE actually
> timestamps the rising edge only.
> 
> Reject requests with PTP_STRICT_FLAGS (and hence all PTP_EXTTS_REQUEST2
> requests) until someone with access to the datasheet or hardware knowledge
> can confirm the timestamping behavior and update this driver.
> 
> Fixes: 6138e687c7b6 ("ptp: Introduce strict checking of external time stamp options.")
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>


