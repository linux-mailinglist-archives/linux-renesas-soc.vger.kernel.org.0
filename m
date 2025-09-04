Return-Path: <linux-renesas-soc+bounces-21335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F57B43BE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 14:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616485A30AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 12:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEEB2F3627;
	Thu,  4 Sep 2025 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loeMV/g0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01C92773CB;
	Thu,  4 Sep 2025 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756989668; cv=none; b=PTCkYoF6YkZ0OoZjjMox6I7u3IFcO7iGR4OXqA8vIQUCyQk4x+cC75e6o8XKSDmD+dgX9XlmBw6kPME9HvDkTfsIChxHmj+r4rXqRpNnW6nUJZ3sqcc0boFmVZUsJhWD7XdX7WEpi2ykFEhjvcTfugV9BsrzfnLAByoxI8r24Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756989668; c=relaxed/simple;
	bh=9jU8zb2b/nH587dt/8dYtYF2KVZ+ED/9GdGxh52sdzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mo0rISihI4EeEZ9quWfGX59WnhThK+EaT/pAGXPfenRuaUoL75Ld96K7xY/mGcTdxojD+XkF77mb7uXcaWtRP44XbTqaP87buIlUjNS3CZnrdeaGR5/UoZfMi19PuyEFrPQCB7QEbPkp0TM7q6DAYcgZFgulv36knml06sEbc8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loeMV/g0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A547C4CEF0;
	Thu,  4 Sep 2025 12:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756989667;
	bh=9jU8zb2b/nH587dt/8dYtYF2KVZ+ED/9GdGxh52sdzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loeMV/g0UwFle6+MFa/evzbc41eWVXWP0hRZVoFMShRPO6a6M2qqqKcwE52L1NNiu
	 Y6OcWSNs+SQ7p7AibOD1THtTUnFEBuobBZU/thHdG1j9URXqLxzeJb9873r/KPX7dg
	 mczz4cEiJJuRojK8VV/NKZNpcbMwksZ8+TWqKRMT6/X1ToZeYOow5gqzTVwnFzJqpC
	 uVDWXGSz0K0YgNw/GF/jTd0XXzAvv2lQzwKm2FSYZUk7YsXbFPntO74t2bC0CgvZMk
	 Vh+ND9yiyTcC+lZ9CvVws7N/Zh6yvzpu2nk68i/i0GGuapH059chIiJ3ohwwV1PFNC
	 aF4s2DnYuEJHQ==
Date: Thu, 4 Sep 2025 13:41:01 +0100
From: Simon Horman <horms@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 0/9] Add PCS support for Renesas RZ/{T2H,N2H}
 SoCs
Message-ID: <20250904124101.GJ372207@horms.kernel.org>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, Sep 04, 2025 at 12:41:54PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This series aims to add PCS support for the Renesas RZ/T2H and RZ/N2H SoCs
> These SoCs include a MII converter (MIIC) that converts MII to RMII/RGMII
> or can be set in pass-through mode for MII similar to the RZ/N1 SoC. The
> MIIC is used in conjunction with the Ethernet switch (ETHSW) available on
> these SoCs.

Hi Lad,

This patch-set depends with the following commit, which is present in
net but not yet in net-next.

commit a7195a3d67da ("net: pcs: rzn1-miic: Correct MODCTRL register offset")

Please repost (and if necessary, rebase) once it is present in net-next so
that the CI runs.

And please ensure that 24h elapses between postings to allow for review.

Thanks!

-- 
pw-bot: changes-requested

