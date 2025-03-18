Return-Path: <linux-renesas-soc+bounces-14593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E24A675E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723FF17F562
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 14:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE7520DD65;
	Tue, 18 Mar 2025 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSO51hNt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991220CCF5;
	Tue, 18 Mar 2025 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306606; cv=none; b=LV+AIAhvY03aAE4EJdgYlt7GixSb4KiFSgbz9E22gDLaPUMlHmjufD/1S/Z4BSj6s4CaQmy1nIiteBymnKHda2JWo6GNieDVuXSxezZi5akyDAOQCbi0/Ojw3uIHgoJ8tvVyBuQDf+oGasefo7/4ccblgR86vYVJpjgei5qSSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306606; c=relaxed/simple;
	bh=wLSyUj0wy1pDaO3/fQf6a6v78mYwzwxwtySQH15C9X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rm1ma46TDTMor8FxMEKRnuoXMHQTccDFi70fk060qLFd1aI6pnGl1fsIOIOpR3epqn49V1vF/OlgAGdSLccN2+PgxQ7eNS+EQH5tcEz0+7FzHu0zyBlI2ork0f3mptqBZnWgItdk8glwjL4/gNQEb+MScAseGGkgItlhkLufjHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSO51hNt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DC8C4CEEA;
	Tue, 18 Mar 2025 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306606;
	bh=wLSyUj0wy1pDaO3/fQf6a6v78mYwzwxwtySQH15C9X8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSO51hNtifkd+iANWTT0FvTSTlYPVAGia7nCNdbyCI2pobyHQqBfNS6e0jYjKJkw8
	 S1D5WMQ9B8NnJJnrtANHvWapqOxv95Pya0CSDbyfV5UyjNpuMCgg1w3tCA8aeqOCQx
	 AHj8tTlmtjZCOlCcj/lUpOVl3D9LgBxv4vXr4Ib4XjjJGlHIx4QtONafg5qW4o5sOT
	 MkQWAYruRr8meu1KV2GLuAHFRpd2xTO6vYu5VteK3R7N8WJtl0z4tJrFQWvwu8aWLU
	 hLKvGZWk9h0rqu2JiL4l686V2CdiKDXbOILgSVLlM0XzX1l0/BYREmMeK9Sn2gXLDl
	 ZAdxWJRdR4YMw==
Date: Tue, 18 Mar 2025 14:03:19 +0000
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
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH net 2/5] renesas: reject PTP_STRICT_FLAGS as unsupported
Message-ID: <20250318140319.GU688833@kernel.org>
References: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
 <20250310-jk-net-fixes-supported-extts-flags-v1-2-854ffb5f3a96@intel.com>
 <20250318135947.GR688833@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318135947.GR688833@kernel.org>

On Tue, Mar 18, 2025 at 01:59:47PM +0000, Simon Horman wrote:
> + Shimoda-san
> 
> On Mon, Mar 10, 2025 at 03:16:37PM -0700, Jacob Keller wrote:
> > The ravb_ptp_extts() function checks the flags coming from the
> > PTP_EXTTS_REQUEST ioctl, to ensure that future flags are not accepted on
> > accident.
> > 
> > This was updated to 'honor' the PTP_STRICT_FLAGS in commit 6138e687c7b6
> > ("ptp: Introduce strict checking of external time stamp options.").
> > However, the driver does not *actually* validate the flags.
> > 
> > I originally fixed this driver to reject future flags in commit
> > 592025a03b34 ("renesas: reject unsupported external timestamp flags"). It
> > is still unclear whether this hardware timestamps the rising, falling, or
> > both edges of the input signal.
> > 
> > Accepting requests with PTP_STRICT_FLAGS is a bug, as this could lead to
> > users mistakenly assuming a request with PTP_RISING_EDGE actually
> > timestamps the rising edge only.
> > 
> > Reject requests with PTP_STRICT_FLAGS (and hence all PTP_EXTTS_REQUEST2
> > requests) until someone with access to the datasheet or hardware knowledge
> > can confirm the timestamping behavior and update this driver.
> > 
> > Fixes: 6138e687c7b6 ("ptp: Introduce strict checking of external time stamp options.")
> > Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> 
> Adding Shimoda-san who may be able to help coordinate a review if
> Niklas and Paul are unavailable for some reason.

Sorry for the noise. I now see that Niklas has reviewed v2.

