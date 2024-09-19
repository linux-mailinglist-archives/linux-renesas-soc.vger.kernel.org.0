Return-Path: <linux-renesas-soc+bounces-9000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123797C4D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2024 09:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1598281F44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2024 07:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39535193418;
	Thu, 19 Sep 2024 07:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIB56Q0B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECBE19007D;
	Thu, 19 Sep 2024 07:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726730796; cv=none; b=VunZiY7MhGhjPF8mAGpwTguZkXdkwviHnKQviXvJho9/XcBE95dbj1ksPfe440KlFyvHGbLPY3yNCYGVVazezIuDWsNkF3cl3+OX7XG/rCusz6wrBCspKUoAr10TH7JTMWmAZeUtEwSd52QbXrz8KmvmR1IV93ms4gigImyV0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726730796; c=relaxed/simple;
	bh=V21h8ErhgIyZ+3DZeFKp38C5/7/mog8Po+sKP9DvGkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mckpu2Xpl8ceB7rwKCzwdMP6oZAi2FBy16DNnK7BcBOLtHGB4iGCfVq1h7nlUJok15KBrIIzFYWbNHjdGhZdV/tXfYW14WDGWwKdWnEIQqHMS5AM6fnCaGV+ncZpYSYBizod0ND6Y7wj+vXy4tmztXRUqCJo1nijKb6HtiLE+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIB56Q0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA17C4CEC5;
	Thu, 19 Sep 2024 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726730795;
	bh=V21h8ErhgIyZ+3DZeFKp38C5/7/mog8Po+sKP9DvGkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIB56Q0BX3y0y3t//Q/NxeiIG6ZGhhd79Z0f+2MXKimPM+47I04XSJFBh/jTTeI7/
	 FS6QLapsQ/ra970FTCk/I6FV663gOtXRcmARNuz/rYqkCdJQukP8e+/ymcbuyivvim
	 VjLMQOMfYFly+LOchQXNqP1z53ASYQUwsKZUI+TAtJcpp8t5rcDpF9l87+nCCDkBQV
	 BCQobSQVCwc1/63c7RgHTGo/StGK05wONBu1Erdzq0WI0GBLz4D75W46OqOyvVOOxO
	 0NqtuNWfY6oK2sntxtHh+YsFVp0agClB8oWUkHBJ1SBDD+Rhe9Fja9jgupVpDaAqGe
	 SSLvc7y9uZ+9g==
Date: Thu, 19 Sep 2024 08:24:55 +0100
From: Simon Horman <horms@kernel.org>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>, Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net PATCH v3 1/2] net: ravb: Fix maximum TX frame size for
 GbEth devices
Message-ID: <20240919072455.GC1044577@kernel.org>
References: <20240918081839.259-1-paul.barker.ct@bp.renesas.com>
 <20240918081839.259-2-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918081839.259-2-paul.barker.ct@bp.renesas.com>

On Wed, Sep 18, 2024 at 09:18:38AM +0100, Paul Barker wrote:
> The datasheets for all SoCs using the GbEth IP specify a maximum
> transmission frame size of 1.5 kByte. I've confirmed through internal
> discussions that support for 1522 byte frames has been validated, which
> allows us to support the default MTU of 1500 bytes after reserving space
> for the Ethernet header, frame checksums and an optional VLAN tag.
> 
> Fixes: 2e95e08ac009 ("ravb: Add rx_max_buf_size to struct ravb_hw_info")
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Reviewed-by: Simon Horman <horms@kernel.org>


