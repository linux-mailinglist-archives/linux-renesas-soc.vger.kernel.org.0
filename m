Return-Path: <linux-renesas-soc+bounces-15278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD8A7886E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 08:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 506FD16EFC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 06:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69AA233141;
	Wed,  2 Apr 2025 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCzygV5L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C1D1EFFB8;
	Wed,  2 Apr 2025 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577080; cv=none; b=PNxv9Cc+e6YtWbnLAz6vH7PX7rej/ttdqlC5NZbuD2WmfU5tkURh3O4hkJslvIDB/TYF18/9oEQnjRGXBjGut8opLm7BrJLjMDePfTMo18MP6qfJBvaTAQlKBZsDqc8lNEhexMAqH9lEUQOjTF4aXygV4ogd1LOryqMtekvcW6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577080; c=relaxed/simple;
	bh=/ReR74AqW+2ovWUhx/D/V435Fe49QxlP4iDfaeTDCak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpIZFwaO7vBqjvfUckH8L6IGruZdUPgLut5FaTSlYkaAjI9lXoE0Kr+wX523n3j37AQnQ1KzLUL+mrrnhpuQLYI4U3qhi80ZlpKOlroc5eBkhjgKHdpT/6KSXzot0xDu8RIyuyEfVTte1GaTjHjc1KjGD4euofLBx3iOf0VTOoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCzygV5L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430F5C4CEDD;
	Wed,  2 Apr 2025 06:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577080;
	bh=/ReR74AqW+2ovWUhx/D/V435Fe49QxlP4iDfaeTDCak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCzygV5Ld/VQmDeRSQ2gQcH8MRCnVAzJM9G8SFaNmPTycpg4OwkRx1Jyx3hjLS/mi
	 u6simDXRfJh3ZtcH0nLqF2+4fuHN4nGUh9Dvx5qN70KpP5xp5flnm0VLackiV3xlBC
	 4eiAf5GFd+cOsYqVR3ZE+xoEBGjBR/Yu3PvPWFinhmHm74NpfYk4RyyX7uLFKmi1D9
	 SzFYj8FuG5ZtOA9iMWwtOqcafii4Ij5bDjOkZkdnC8EVruKGgXsXEPx3HJPH6YrPuu
	 hopum6WCRCDBOQQGVt3MU1o5/RGuuEV6A6RpggNsCGf1X+L03i2aed0Ee69v2WS3kl
	 25o/Nr0hXH0MQ==
Date: Wed, 2 Apr 2025 08:57:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 reset driver
Message-ID: <20250402-beneficial-dark-mosquito-6c3641@krzk-bin>
References: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250401171432.101504-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401171432.101504-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Apr 01, 2025 at 06:14:30PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a device tree binding document for the Renesas RZ/V2H(P) USB2PHY reset
> driver. This driver controls the reset and power-down of the USB2.0 PHY,
> which is used for both host and function modes.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../reset/renesas,rzv2h-usb2phy-reset.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


