Return-Path: <linux-renesas-soc+bounces-21306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF5B42DAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 01:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F489567C16
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 23:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADD32FC01C;
	Wed,  3 Sep 2025 23:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlrlTNZK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C07D2F39A7;
	Wed,  3 Sep 2025 23:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756943443; cv=none; b=iXrAarz96B5h9mMS+bYog+Rig/EWqvT9niW8/VvauZWs1yZzX5yr2STazIkUorhWEujjPbL5+eKT25y0kOWu8Zi4mC22YKhdvifKSHwCOO54Rv9SepUNeFPZykfNXhpm1lu22e6nrrSVZo1kdehQvPssdlS4x+vJfgIqEGC9FUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756943443; c=relaxed/simple;
	bh=l3vVpriO0KOnTZZdfYxactIQ65YTIxLHE42+6lRCFqw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pLJRTI15TQYKf+HCi+Q4RiVsAloOSN/TMUxcnr8tJZlTP2h/inUVBMSpKMBUwFWfodF9g/DTryRh3nwFOdOVdZMVGy75nIcw1mIfc4x9BclKTkxrCeP28/T6ycS4IDmkPzb2q/b1mWNJBTD5BCE+gDub2hdhpa1AN0wmerCz7IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlrlTNZK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89784C4CEE7;
	Wed,  3 Sep 2025 23:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756943443;
	bh=l3vVpriO0KOnTZZdfYxactIQ65YTIxLHE42+6lRCFqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RlrlTNZKWqRIczf7xQLkONedV6OnqAVP99+wuonDfArxvxxtk/G97wthshEi7qoWP
	 OSYXerhHkDY1ZyRUp/KVT3HCpgONRUNRd7QLYd/RWLah5jjsZ8zMjR9im/Z+fg2PPD
	 k3SrA0HGjQJsIjXvV46HFuiv4aaT/TW5zahcVbBo3YBoxiAek17wCRTF8+4j857I49
	 JXOZDXT2bhFyf+NHSEV1Q4Q92aTusvYZMf6YR5CJbLWdW215aEyBXSjadZzlFAwf3F
	 x0+pgLJFvok0pNXzMxDErdxD2cmv9X+4Q/tLzW/oOO6vw9FSsi1qf3/Zz7l7+IL2ij
	 QWm9sNBb/tKQA==
Date: Wed, 3 Sep 2025 16:50:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>, Paul Barker
 <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>, Andrew Lunn <andrew@lunn.ch>,
 Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>
Subject: Re: [net-next PATCH v5 0/4] net: renesas: rswitch: R-Car S4 add HW
 offloading for layer 2 switching
Message-ID: <20250903165041.20b3c05e@kernel.org>
In-Reply-To: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
References: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 01 Sep 2025 06:58:04 +0200 Michael Dege wrote:
> The current R-Car S4 rswitch driver only supports port based fowarding.
> This patch set adds HW offloading for L2 switching/bridgeing. The driver
> hooks into switchdev.
> 
> 1. Rename the base driver file to keep the driver name (rswitch.ko)
> 
> 2. Add setting of default MAC ageing time in hardware.
> 
> 3. Add the L2 driver extension in a separate file. The HW offloading
> is automatically configured when a port is added to the bridge device.
> 
> Usage example:
> ip link add name br0 type bridge
> ip link set dev tsn0 master br0
> ip link set dev tsn1 master br0
> ip link set dev br0 up
> ip link set dev tsn0 up
> ip link set dev tsn1 up
> 
> Layer 2 traffic is now fowarded by HW from port TSN0 to port TSN1.
> 
> 4. Provides the functionality to set the MAC table ageing time in the
> Rswitch.

Is anyone with bride offload expertise willing to provide a review here?


Jiri, Ivan, the switchdev MAINTAINERS entry only covers "core" switchdev
which is rather fallow. Is it okay to extend it to driver review?

