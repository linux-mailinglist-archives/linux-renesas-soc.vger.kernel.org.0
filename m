Return-Path: <linux-renesas-soc+bounces-14597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92AA675F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3BC93AEB73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 14:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032BF20DD72;
	Tue, 18 Mar 2025 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4xsVuqK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04EA20DD6D;
	Tue, 18 Mar 2025 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306949; cv=none; b=gArgJ3r0GMCAHkPUEN+8QrNCVXkSLAecSLf+HHZpCgEDVkn3frQR7kqZS3Wp/CH4OZlZe3lD/3lzhIUT7sdc4g6GwJxidARl+Aq9/x5VmXAapaVwL2OTaiT0QOPDOpp9+yGmOTdMDzxw86A8S6JhTGZe73Q0l4FVzh6PC2/1Vdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306949; c=relaxed/simple;
	bh=+z7zNQWAOae/MIWTmuM4q6CM+1zonQ4WMavGq/Xskbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6e3XTkgU3h9gp6kbkIXOzSZ57pMW8NB6PqJ9oDzS/+1k+w8Ib446i4QaDFr7He0RIM2WBeSLglQRHi6JQQ4o3n2d0qLj+M2FV1nw/ZKboA4pe+IVPPfH7M/yzB+glcraBESQ4MjE7B+CZfDUqATaAUSaBKEMvcZFl81RsTiGt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4xsVuqK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A9AC4CEEA;
	Tue, 18 Mar 2025 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306949;
	bh=+z7zNQWAOae/MIWTmuM4q6CM+1zonQ4WMavGq/Xskbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4xsVuqKbLhzxz9yD90uRxM5oXiFx5I4tx2uW7hW5sHddJ+7GEqtPpIC+79zDgfQB
	 AXGu56qWgxYQJAKMipBoFHJtFmdWt2JNzf6PSEZgTNygwCatO2k3DQaswt30z5R5+j
	 QBE+S50Qcy1FpzxDzMAOJQGCUZzG5bkhd9JJ9U0s/nhhGo66FJCSeNYKjOPHswdGgB
	 Xg8kptWze5sd80M6yF9//FjGM8wsEgjPZ363qgTArfCifYfuF+vRg//CCSsYUN/bom
	 W1FvXo/gx7IywrD4aZoVaDIRb6vRcTIoZe/nAceur9lh/ncLC8PnD++xnz+vJ3qYJk
	 sjR7q667MZyUw==
Date: Tue, 18 Mar 2025 14:09:02 +0000
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
Subject: Re: [PATCH net v2 4/5] broadcom: fix supported flag check in
 periodic output function
Message-ID: <20250318140902.GY688833@kernel.org>
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
 <20250312-jk-net-fixes-supported-extts-flags-v2-4-ea930ba82459@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-jk-net-fixes-supported-extts-flags-v2-4-ea930ba82459@intel.com>

On Wed, Mar 12, 2025 at 03:15:53PM -0700, Jacob Keller wrote:
> In bcm_ptp_perout_locked, the driver rejects requests which have
> PTP_PEROUT_PHASE set. This appears to be an attempt to reject any
> unsupported flags. Unfortunately, this only checks one flag, but does not
> protect against PTP_PEROUT_ONE_SHOT, or any future flags which may be
> added.
> 
> Fix the check to ensure that no flag other than the supported
> PTP_PEROUT_DUTY_CYCLE is set.
> 
> Fixes: 7bfe91efd525 ("net: phy: Add support for 1PPS out and external timestamps")
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>


