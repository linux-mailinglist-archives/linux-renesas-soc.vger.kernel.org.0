Return-Path: <linux-renesas-soc+bounces-14591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61DA675CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10CE93BE345
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 14:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6789E20D51F;
	Tue, 18 Mar 2025 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7js6Jz5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67C14B08E;
	Tue, 18 Mar 2025 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306441; cv=none; b=rc2eUDWzmJ7LoQp+v3aW6lfJWCuVp7M7X9EhaER80I9ux7432xRFZqjwGYrxIzWgjP1D6ID4Ls4GYvzLfzgJWG0dN4z6QJTcyiGHGhP7Hg2AmqH8gZ1/l/d4Tr7R2MZNcSrO7RRgmgcftWnE4OO81TLqZL42thHu6uJ6WRQ2Chw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306441; c=relaxed/simple;
	bh=OO/lUWidVZuz8C5f+/NJii1Inwb2AJcL27aTF4CLl5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNrPviWbPPfrdGf8YzMxuCdneOB9XtE33k3mysrsLckGjXUAplnToQsumJLlqOY6/9oBaeimCk/Ca1nEmL1s/F/c/B09goE25XxW//GL9F9JHt3z4G804BH8mAbWNPtEryBdpDcPGmPiB9E6+2pAnYeHZ98Hg71ACsThMLejUms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7js6Jz5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167BEC4CEDD;
	Tue, 18 Mar 2025 14:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306440;
	bh=OO/lUWidVZuz8C5f+/NJii1Inwb2AJcL27aTF4CLl5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7js6Jz5SqsHRgteyoClH62YzprnIlaSUU3COpnsn8kvFT72hrwDIQE756CIPik3x
	 OD2jn0r01mlDyYJcAU9KU1IiLNxsbnBhbAM2po61pkK/PzWW+YhVUdSCz8GZWAYTcm
	 FwlLvDST6HdKfs36NEaKninKvIGff7JK7xvHb0CSFYkQnA6WAbmdD5IfcwslLVNB+j
	 X1Lpa4DD8fDJ3JzO3oSJyFmGiSgz1vjUXUZQrgZXPKr0dVy8uYE3oY+Xyqe8SfVYUE
	 OghAx3ycl1NKQErC8Qm5oMAmrxHmk0xSPzFrodEVmz0935MBDtDmjcpvFHWHfin0jg
	 +sQhNj54HDhWw==
Date: Tue, 18 Mar 2025 14:00:34 +0000
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
Subject: Re: [PATCH net 3/5] net: lan743x: reject unsupported external
 timestamp requests
Message-ID: <20250318140034.GS688833@kernel.org>
References: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
 <20250310-jk-net-fixes-supported-extts-flags-v1-3-854ffb5f3a96@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-jk-net-fixes-supported-extts-flags-v1-3-854ffb5f3a96@intel.com>

On Mon, Mar 10, 2025 at 03:16:38PM -0700, Jacob Keller wrote:
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


