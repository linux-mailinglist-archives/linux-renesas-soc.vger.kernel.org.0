Return-Path: <linux-renesas-soc+bounces-14592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD067A675E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052ED19A6080
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 14:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC80720DD57;
	Tue, 18 Mar 2025 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKFTE1pA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444D2BAF8;
	Tue, 18 Mar 2025 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306478; cv=none; b=u9gu8SXfQH7n+8oJAerGDVikAS48I2gfVR5zwwZHjICb3AXVhnZPB6VDrRyn20fCpNfg9wgc7U5l4OujlALhnYJy+fqIFRdlmuw+xsQ2oK4SUmr/wzO06f3HG8/jArfpKW1ufHkacaV9V++ftXkVcFn2vS6dtMhrEulQdh1/UIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306478; c=relaxed/simple;
	bh=qN5FZGZkV8hY7P/iLN+6qzh/l08Z8WtzT3kITbpr4z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSzHVW7Z9r39xNwmCm7tKVDxOFAW8iSJS6eerfMObneEEXP02v4r4UTqpc+ZhcGQQ6Nip54sQjByYNJDhynd6tSlso0xzcco3mTiUnbHxgwNJuNWksGI6PTp9IcmY3QqQ9z1mffQ2236UNBwYae0cxm51iLgH8ku6XGFr9Z8w58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKFTE1pA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D5EC4CEEE;
	Tue, 18 Mar 2025 14:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306477;
	bh=qN5FZGZkV8hY7P/iLN+6qzh/l08Z8WtzT3kITbpr4z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKFTE1pAeiLLSYZqt9CPYNr83U0Y4/SFw3mBdgF3bXkql4dvOnh/Xgg/TT7hBGZgv
	 qmuWtwBNzzj/1t1TzLwToFr7Yl0P+QyU7Df9m5WnaYCmPfpcmR7fk6EcrqdbCGodj5
	 B+WJ11UMOaQRNnBMK1pmTf0stPUYqdMOihVc7azHsmtBoaWkyUokwWhLt/t6e1XCno
	 XHKHpq5qFBStufAOpnVx0CocgcdFpGxHGbWKBWJHbP9aG/8KvFy1laMGqnzUM5ZHNQ
	 CgzT8xzJSVlgTIoYHgrBDPV3hO+FkotlpguVkI9Hoq2czJJUl/1PzQh3auXoo+6/cG
	 GnOOwLLY1JFEw==
Date: Tue, 18 Mar 2025 14:01:10 +0000
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
Subject: Re: [PATCH net 4/5] broadcom: fix supported flag check in periodic
 output function
Message-ID: <20250318140110.GT688833@kernel.org>
References: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
 <20250310-jk-net-fixes-supported-extts-flags-v1-4-854ffb5f3a96@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-jk-net-fixes-supported-extts-flags-v1-4-854ffb5f3a96@intel.com>

On Mon, Mar 10, 2025 at 03:16:39PM -0700, Jacob Keller wrote:
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


