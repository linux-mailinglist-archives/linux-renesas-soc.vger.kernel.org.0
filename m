Return-Path: <linux-renesas-soc+bounces-25750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A0CCBCEEF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 09:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0670301459F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 08:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603F9328263;
	Mon, 15 Dec 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="knF4U/2U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A15931AA90;
	Mon, 15 Dec 2025 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786431; cv=none; b=CA6j1YsSTSnsXP4inKFdDl94q9R8PF5a3eLVjiO+BrbfWx+IXNNkwQf/qGhP8Ni0nvTscZxg47gE96Ci9b2SlCE1DecCwQ0PeXMK5t4fVHnb607seUbsIPu6+fuInjLnjpQpi1515aCPEhYAoCUDO6Df4xnqZe57LGlTiGkDa7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786431; c=relaxed/simple;
	bh=L01juhGPCRAjIJAl/rDM2Rt2jeh0b7dQoFypbdG3HUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ozt0MiVG5qqfEFsWHljqQ/AgA9KTpqziGsNFAD/44z6avtQ/nkV8fi6BijTy2oF0JgTUSf1mA2mXW0kf1lznVCcuXjC+rjIAbQbYrxf30dE9iBXMUNRj/JZwST2aAM6QskFYhjsOxiMDBekdiTzLlc9XnaK7zBNGW9BufRKtjhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=knF4U/2U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-49-39.net.vodafone.it [5.90.49.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1071465;
	Mon, 15 Dec 2025 09:13:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765786422;
	bh=L01juhGPCRAjIJAl/rDM2Rt2jeh0b7dQoFypbdG3HUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knF4U/2U2fAKlFpuoLBDnjGh0ntyECV5Uo8uoLBY4hVt+9HFZOo8o2pjrO3accCLL
	 h1ON5erK4zJsig3HrYNiMdApUl3Gc1iW/x3neledYa5AJx2nhSvB0lwApnTM4hcIeT
	 xT8RkWSj1VtuQtSsedqzL11OFd7kZLbA8jpItSMc=
Date: Mon, 15 Dec 2025 09:13:43 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
Message-ID: <ido6swynjwlxv6xynspvltxaxuryiavjvssuuzga5ypfruerkw@56tbp4bn7mom>
References: <20251212203226.458694-1-robh@kernel.org>
 <20251213062037.GA30577@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251213062037.GA30577@pendragon.ideasonboard.com>

Hi Laurent, Rob

On Sat, Dec 13, 2025 at 03:20:37PM +0900, Laurent Pinchart wrote:
> Hi Rob,
>
> CC'ing Jacopo.
>
> On Fri, Dec 12, 2025 at 02:32:07PM -0600, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../renesas/gr-peach-audiocamerashield.dtsi   |  75 ----
>
> Jacopo, any opinion on this ? Should it be conevrted to an overlay, or
> dropped ?
>

Running Linux in the 10MB SRAM of the GR-Peach using XIP was
challenging enough and I don't have an easy access to that setup
anymore.

I think we can drop this one, and resubmit as a .dtso eventually, if
anyone ever needs it

Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j


> >  .../dts/renesas/r8a77xx-aa121td01-panel.dtsi  |  39 --
>
> I don't have access to this panel any more. I'm fine dropping this
> .dtsi, it can always be resurrected and converted to an overlay if
> someone needs it.
>
> >  arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi | 332 ------------------
>
> This would be nice to turn into an overlay, but I'm not sure anyone
> still cares.
>
> >  arch/arm64/boot/dts/renesas/r8a779m0.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m2.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m4.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m6.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m7.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m8.dtsi     |  17 -
> >  arch/arm64/boot/dts/renesas/r8a779mb.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi  |  25 --
> >  arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  18 -
> >  arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi  |  18 -
> >  arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 -
>
> I'll let Geert comment on this :-)
>
> >  14 files changed, 614 deletions(-)
> >  delete mode 100644 arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
> >  delete mode 100644 arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
>
> --
> Regards,
>
> Laurent Pinchart

