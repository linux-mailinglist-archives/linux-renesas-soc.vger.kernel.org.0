Return-Path: <linux-renesas-soc+bounces-14598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA8A67607
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 15:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 190DE3AB5DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 14:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B012320E026;
	Tue, 18 Mar 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VO5wTwW4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888A20E021;
	Tue, 18 Mar 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742307014; cv=none; b=sLsYP2+aXJZqrv1UQJtGNge2I8Xu13OUFN8of9ylVpwzIZSARG1MSGCaEqqOtrIRVDw/dI8JeuCDsrFeVrrkMd569GHfOhJ9s3fvJ64X0wpdaIkqLHYEYIxf86KHnTqP46ADFugXHWNQ32DxfkPF37Loa1cWUnWA0zoSmGVYQgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742307014; c=relaxed/simple;
	bh=q5doRqVam6s64ULpfBirzLVtZzdBmnrPWU3KtXCaEFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCmcuwpmQYH3vj3auZ1uqr89UXPekHoiLGpxoCHA6hphqOZjUZJy0cgzbdpJnaZ4+Zf5l/dpRuvzW/WI/3bnBjiTo3eSz5SNGO0wmFjsSlo1iVcLjMTl1hje3OCGz7fEFuY2y09cB+xlxa0ffZRXtnV6l4DGLcqRYQdz5kRth84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VO5wTwW4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D42C4CEDD;
	Tue, 18 Mar 2025 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742307014;
	bh=q5doRqVam6s64ULpfBirzLVtZzdBmnrPWU3KtXCaEFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VO5wTwW4FKWFMGm8TLIOOBFOUXU+nrVANM2qDIIedoNkR2NsWznIgxsmYloV3vnGG
	 LSqXchU0sWFIQwjsr38lz9eLc7r+uRPKdl/iPwv5D0KzDKhR5fF+PhxqfxlJuOKZQ6
	 4yWeS4r/HCX3EHsCkAAGRZO0rPNVOsnIqPTFi+xRYEpVbDCA4+DiH7fgTTqDb5Fzf7
	 t6JkBU7Homnc+IILhZfi+PLblKw7B6quuHdfiKV8jXGrccazOTaFm7ryxD5jiIiKKN
	 NG+go5DJtea+vmHdzrgxOxmlHEUBZ6uO085ZucYpTVTggQS1OTgyKfvmz3EuzJP4+S
	 xILUsGc3WX40A==
Date: Tue, 18 Mar 2025 14:10:07 +0000
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
Subject: Re: [PATCH net v2 5/5] ptp: ocp: reject unsupported periodic output
 flags
Message-ID: <20250318141007.GZ688833@kernel.org>
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
 <20250312-jk-net-fixes-supported-extts-flags-v2-5-ea930ba82459@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-jk-net-fixes-supported-extts-flags-v2-5-ea930ba82459@intel.com>

On Wed, Mar 12, 2025 at 03:15:54PM -0700, Jacob Keller wrote:
> The ptp_ocp_signal_from_perout() function supports PTP_PEROUT_DUTY_CYCLE
> and PTP_PEROUT_PHASE. It does not support PTP_PEROUT_ONE_SHOT, but does not
> reject a request with such an unsupported flag.
> 
> Add the appropriate check to ensure that unsupported requests are rejected
> both for PTP_PEROUT_ONE_SHOT as well as any future flags.
> 
> Fixes: 1aa66a3a135a ("ptp: ocp: Program the signal generators via PTP_CLK_REQ_PEROUT")
> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>


