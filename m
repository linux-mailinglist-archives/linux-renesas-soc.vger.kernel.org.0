Return-Path: <linux-renesas-soc+bounces-15737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055BA84057
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 12:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87BBF9E2289
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 10:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5627426A1D0;
	Thu, 10 Apr 2025 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IoRHfRzw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3678426F47E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279647; cv=none; b=LtEmKJgCh6zZj6I/Uyatk4XAdq0gNalu11t56aLZZ+Mcphj6cl+dapyWHodev/OBbJRS4i00MwlyDIPyZQoDTjhIylvmnDPzsqrA0mtQMubsgVo4S3suL6iZ5Dc+iyqr/jS5ETnx+tgdU7WyQk/vT4uZpvRFocMlGrXYD7Gv644=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279647; c=relaxed/simple;
	bh=mJ9mgnz35xplAMqQgZX2OUtTggk0i/lvDwINJmbhB30=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HbLBcH4TBgmEKaXd0iCaU3Ifwc1m5fHlB8lYJd4xwyGZrpjCba3SV4U9xSNIhK/+fBaePVdTbhh13KINbVFBrUSBXBib9QUVwPXw7C54oSrjjnaMRN5YWvod0LNlCP3oDyXlOPx6iPumGMskmuF+0ohGeQ5DkZJ0r/ApS/8h0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IoRHfRzw; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <454072e0-9fd8-4deb-a97e-b454d5e3fd5f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744279641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kq87Xuc97EJxv+6e/++Vx+LXIntDeg9NNkpI4Ptxm3I=;
	b=IoRHfRzweTtYP3S55dHcfGkJ1Ca23meplZC7fbQQJI2FZDOtE5CRJDTBj7nPx8URg38nLE
	RiqBB3YGRw5J9gKBzHxRjqSlVdUbRstAFHpy27g3ejSijmOO35flXDgaos5ODl0/aWTaeX
	UBX+b6BZq2EwY6h1vXAJ8ryXo5070dY=
Date: Thu, 10 Apr 2025 11:07:16 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH net-next 0/2] net: ptp: driver opt-in for supported PTP
 ioctl flags
To: Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Horatiu Vultur <horatiu.vultur@microchip.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Richard Cochran <richardcochran@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Andrei Botila <andrei.botila@oss.nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250408-jk-supported-perout-flags-v1-0-d2f8e3df64f3@intel.com>
Content-Language: en-US
In-Reply-To: <20250408-jk-supported-perout-flags-v1-0-d2f8e3df64f3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 08/04/2025 21:55, Jacob Keller wrote:
> Both the PTP_EXTTS_REQUEST(2) and PTP_PEROUT_REQUEST(2) ioctls take flags
> from userspace to modify their behavior. Drivers are supposed to check
> these flags, rejecting requests for flags they do not support.
> 
> Many drivers today do not check these flags, despite many attempts to
> squash individual drivers as these mistakes are discovered. Additionally,
> any new flags added can require updating every driver if their validation
> checks are poorly implemented.
> 
> It is clear that driver authors will not reliably check for unsupported
> flags. The root of the issue is that drivers must essentially opt out of
> every flag, rather than opt in to the ones they support.
> 
> Instead, lets introduce .supported_perout_flags and .supported_extts_flags
> to the ptp_clock_info structure. This is a pattern taken from several
> ethtool ioctls which enabled validation to move out of the drivers and into
> the shared ioctl handlers. This pattern has worked quite well and makes it
> much more difficult for drivers to accidentally accept flags they do not
> support.
> 
> With this approach, drivers which do not set the supported fields will have
> the core automatically reject any request which has flags. Drivers must opt
> in to each flag they support by adding it to the list, with the sole
> exception being the PTP_ENABLE_FEATURE flag of the PTP_EXTTS_REQUEST ioctl
> since it is entirely handled by the ptp_chardev.c file.
> 
> This change will ensure that all current and future drivers are safe for
> extension when we need to extend these ioctls.
> 
> I opted to keep all the driver changes into one patch per ioctl type. The
> changes are relatively small and straight forward. Splitting it per-driver
> would make the series large, and also break flags between the introduction
> of the supported field and setting it in each driver.
> 
> The non-Intel drivers are compile-tested only, and I would appreciate
> confirmation and testing from their respective maintainers. (It is also
> likely that I missed some of the driver authors especially for drivers
> which didn't make any checks at all and do not set either of the supported
> flags yet)
> 
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

For the series:
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>


