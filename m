Return-Path: <linux-renesas-soc+bounces-12049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3CA09633
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 16:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E21716B59C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 15:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAF0212B1D;
	Fri, 10 Jan 2025 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCQa0pdg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AAC211A3E;
	Fri, 10 Jan 2025 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523903; cv=none; b=IiMSg7SPxnPRpXiDWPw/Waplq8rzXIGlZuD+RTJJLY/xI7mGDeMyFG2BzyI0jWHm0+c2m5JVrK01osnfwkTiQIrB6qo5BKKQ5KZoAZz3d7xM3Tgb2h4mKWSVGa2hTecgx3TYEDmfAHqoonAF/YXl0BgHegb/t5E85aJ4JvhLy2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523903; c=relaxed/simple;
	bh=OTGkN3XvR9yS3XjEo4HOuIC3KncL4iFmKtSsBY8wwy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rx+fN8UMor4qlSqjaMVjHPGuxCRdx2KPXWsr2oFf4VaLKPX2PDI195xu6jxb8JdYPpHMjIpz5eEg5Uelzz30dORT5kQzAemoOYt5fHsBaT6aKuEzYbWrzA1U4tgpl5SgGPO2iJbMYXYiCi9ivfd+3CMIBN9bh0sika3FnBZI4cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCQa0pdg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143C8C4CED6;
	Fri, 10 Jan 2025 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523903;
	bh=OTGkN3XvR9yS3XjEo4HOuIC3KncL4iFmKtSsBY8wwy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCQa0pdg2qxKVtHtTkJ4SGoINH4HtU7FC0jf6BspFQquH/vW75BYx+9A5FEStYCBQ
	 E9JxXVi5iN71mutTaOOXYnQOT2oRUN9f4IAA8zQnPkTUAT+IFiIsoDMc75hRAe3/mQ
	 RJ3i+SA0ugZ/4I04jr7lzzWM6IjPSfwYfS+ZvVkKMRCtfu6bMvkaK6DgBZhUH428gN
	 6+8cSmkG63Gu95c4is8beF+nx5sMV1NKT30rMOnUyX48jfAQ/wCXNVVUtdo7lb/+dH
	 FiwoRnp9ge/xuuiuc1Ihc3S8ozZWKgatnci64pA03MaKC9qvewi3Wz78cjpP6E4KfP
	 gquUU5DOldO0A==
Date: Fri, 10 Jan 2025 09:45:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tianping Fang <tianping.fang@mediatek.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-aspeed@lists.ozlabs.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-kernel@vger.kernel.org, Al Cooper <alcooperx@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Justin Chen <justin.chen@broadcom.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-tegra@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
Message-ID: <173652390194.2924780.6221015444062586872.robh@kernel.org>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>


On Tue, 07 Jan 2025 14:10:13 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
>  .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----
>  .../devicetree/bindings/usb/cypress,hx3.yaml  | 24 +++++------
>  .../devicetree/bindings/usb/dwc2.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 20 +++++-----
>  .../bindings/usb/intel,keembay-dwc3.yaml      | 30 +++++++-------
>  .../devicetree/bindings/usb/ite,it5205.yaml   | 18 ++++-----
>  .../bindings/usb/maxim,max3420-udc.yaml       | 28 ++++++-------
>  .../bindings/usb/nvidia,tegra210-xusb.yaml    |  4 +-
>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 36 ++++++++---------
>  .../bindings/usb/renesas,usb3-peri.yaml       | 24 +++++------
>  .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 38 +++++++++---------
>  .../bindings/usb/ti,tusb73x0-pci.yaml         |  6 +--
>  .../devicetree/bindings/usb/ti,usb8020b.yaml  | 20 +++++-----
>  .../devicetree/bindings/usb/ti,usb8041.yaml   | 16 ++++----
>  15 files changed, 161 insertions(+), 161 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


