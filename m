Return-Path: <linux-renesas-soc+bounces-25734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF3CBA609
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Dec 2025 07:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46F743059AE4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Dec 2025 06:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362F321E091;
	Sat, 13 Dec 2025 06:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sUPqX1vJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2268F2B2D7;
	Sat, 13 Dec 2025 06:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765606865; cv=none; b=abuwx33ON+hPVvvP+5Xlj0Q4zUK6jGrSW45xC7+VoN+vIYDaIcy5E8PRb5SK0RsI2B5lArmVtQQY7uzwYzvQ/8ZtpLxSdsb6I8JTvO0OlIHxzxt+70QEsI4VJTIsRxhD/499tJQ36BGVSdR2oKNLr3Cl5Yoa7AIDNgyWBDk3GpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765606865; c=relaxed/simple;
	bh=uttsfDXzkSPflsc6CgwrCyfKrhPtjVxoryl3XbLNISI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwn+4xeRzGoGe3BC1vCV5PnWFI6hA0Kcwh9Ox7dHDCVVILA8xvCkeK8gHCj00JMUAzGR4lSr529Z6VbVLWUjwjMDbbOHVsy9RcDx9E1O28u4uaDShc/rH222Gu9hK0SSCoBJF6itUBNqwXrRIo7eqIZHAOgoP25CUIqKGfriDFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sUPqX1vJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (fs96f9c361.tkyc007.ap.nuro.jp [150.249.195.97])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DAACF465;
	Sat, 13 Dec 2025 07:20:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765606852;
	bh=uttsfDXzkSPflsc6CgwrCyfKrhPtjVxoryl3XbLNISI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUPqX1vJJzGC3kGjVK0G9qoGiCPvXZ0NfX16d12PVVpkve4fmAICcf8sG7Zw1P3Ig
	 IgZRxVPqqI5I3AhszYOG2Aqrrr9V7BI3SphLZAr+n3WG1YqhG87E2JTTl14bJQcUBN
	 0V8RcJrEBW97g/KErojKE3RPxcZcztoWqnXJrA7M=
Date: Sat, 13 Dec 2025 15:20:37 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
Message-ID: <20251213062037.GA30577@pendragon.ideasonboard.com>
References: <20251212203226.458694-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212203226.458694-1-robh@kernel.org>

Hi Rob,

CC'ing Jacopo.

On Fri, Dec 12, 2025 at 02:32:07PM -0600, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../renesas/gr-peach-audiocamerashield.dtsi   |  75 ----

Jacopo, any opinion on this ? Should it be conevrted to an overlay, or
dropped ?

>  .../dts/renesas/r8a77xx-aa121td01-panel.dtsi  |  39 --

I don't have access to this panel any more. I'm fine dropping this
.dtsi, it can always be resurrected and converted to an overlay if
someone needs it.

>  arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi | 332 ------------------

This would be nice to turn into an overlay, but I'm not sure anyone
still cares.

>  arch/arm64/boot/dts/renesas/r8a779m0.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m2.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m4.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m6.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m7.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r8a779m8.dtsi     |  17 -
>  arch/arm64/boot/dts/renesas/r8a779mb.dtsi     |  12 -
>  arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi  |  25 --
>  arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  18 -
>  arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi  |  18 -
>  arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 -

I'll let Geert comment on this :-)

>  14 files changed, 614 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
>  delete mode 100644 arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
>  delete mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi

-- 
Regards,

Laurent Pinchart

