Return-Path: <linux-renesas-soc+bounces-25548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651DCA2BE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 09:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A6D9300501D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 08:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6711308F05;
	Thu,  4 Dec 2025 08:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHpA9+2S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9850F2FD699;
	Thu,  4 Dec 2025 08:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764835481; cv=none; b=FG5JW/SdnX3hbZ8siwJDnbiNP9MLPO8NwuUczekDL5VcU6ulwbhTFwWYakiyWqbWZQajrtPiJHUsrTp+GIaIA6tG8Z/k2FNRuaqtSs8YdqxAf0rZqgkNfdu6HKi+HTsFkTccEsIvLfPg8pbKH3ZwQZNGqIdN3b4Okny9VYf/hqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764835481; c=relaxed/simple;
	bh=mLvO41dr3CiI3nT3Iyp+BWmbfaVV4v/BWSOqWplPvP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw9Xs/QnGeu8N/PgCa++3D13W0iL+OFIeUn9ud06taVOKQN6tWLNLxUS2zLY4UKanik9nKktrVsqy1UedHDXcTPvop4R8PG7NYTnBAGbBWmuaMk0XnWFVf8xGpjk08aGddMrNa7ybmQ/ZV48ehADrXfbK6tUl+ppT/HeUT3a8/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHpA9+2S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED78C4CEFB;
	Thu,  4 Dec 2025 08:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835481;
	bh=mLvO41dr3CiI3nT3Iyp+BWmbfaVV4v/BWSOqWplPvP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHpA9+2SrqBFVA215IUE67TsjeGUZpqV6d1ncZM3DVzlEr8MAsuYvSY9lVZ2dv2Nv
	 NCZDRSjPmR+nlqCb55QBp+jlrGHnVS6dfBQ2MfhmgZno25wHacm2cfA0xeRkzS13RM
	 Wm2QZDINeK1pKdcoYiobKCmp2+U7TZAgO9ALcfwm5lt4+syCE7AYz//OJ0G/iHMe0l
	 z4KfiIhn5f45FgbEMU40HFBtKVm7YUfiFZHQqQFdLk3TmFauPgVe5rYmi6fs9Glwb2
	 zXUqkt7NZvj1D247rvG/LXgb+jutQambDY1UmZ12dXKjx0NRxM/wtcLu26WnlcFBZw
	 uxPZPrzqCyAZg==
Date: Thu, 4 Dec 2025 09:04:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Georgi Djakov <djakov@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 05/22] dt-bindings: reset: renesas,rzv2h-usb2phy: Add
 '#mux-state-cells' property
Message-ID: <20251204-great-perch-from-avalon-7e940a@quoll>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <9848482be3655a9351a13cdbf815db6b556201d0.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9848482be3655a9351a13cdbf815db6b556201d0.1764241212.git.tommaso.merciai.xr@bp.renesas.com>

On Thu, Nov 27, 2025 at 12:48:32PM +0100, Tommaso Merciai wrote:
> Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
> multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.
> 
> The mux-controller cannot be integrated into the parent USB2PHY node
> because the VBUS source selector is part of a separate hardware block,
> not the USB2PHY block itself.
> 
> This is required to properly configure USB PHY power selection on
> RZ/V2H(P) and RZ/G3E SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


