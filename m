Return-Path: <linux-renesas-soc+bounces-24014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 211D6C2B03F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 11:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7763AB588
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 10:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F362FD679;
	Mon,  3 Nov 2025 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzQHLV6+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2817F2E62A2;
	Mon,  3 Nov 2025 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165240; cv=none; b=VK83yjbZHh2cyng0fXHrKQvWCylW6qPueYi9pBrNvCyTRcFEPGjYysKLyhfny2VA28c1OeKiqchOeh5Av/bajtzn2pp6HTaQmfFosLlblo+Zo93zxIUjP8RFNUwHw/kTvKDiqunaQQQczvReFraCXZUGvzt74K4W9gtaQFIK1nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165240; c=relaxed/simple;
	bh=ObPhYtxLEFCRJdL3TzzK7cHNAWLFBFSOqEVsLoRN/yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EATVtRPDXHpIYy8a2srG6U8pb6NJyYMHBoPg9cfvfAiRUUOAYki/oegV81cPIbJlwRxBnjLMerdQhNP8l/KkBTWgvjzT6PtwRTqWTc7deNslJIiKIbIxz2FWTJ6p6XGEAR34LivD8VR+J4dC3M/ojFwdRqkflJbt0SaeOVmgdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzQHLV6+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841F1C4CEE7;
	Mon,  3 Nov 2025 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762165239;
	bh=ObPhYtxLEFCRJdL3TzzK7cHNAWLFBFSOqEVsLoRN/yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzQHLV6+pLdtIvJtVgh5twpfjs0l51RZpkCWnRdD81586xyoC/RlpdRcoJPqxt53U
	 a2p6rVg24/uv4zKBpYDx/TuyduvNy6cvZjkoR4dxGONZfjus2ZcCy1dGLxeKnsE/m/
	 zeciFN9xV0+Snf6QXcanZxq0zrErAkDjHNDsz0F0ATz/HK4gLCkiGJvvzngt6vi9KC
	 IOcNBeWF4H+dZGxlUu21HqSoHQmqqAjY59boiENnvQT47bTMVweSh5s5fH2iftCui5
	 ZPn5829ugSE6usM+eYmksJwrlvw+LinXykKsb8Xci7Teh/4/OHC8YwIfKSpBlLCEOi
	 6m1nrQHt3v7Kg==
Date: Mon, 3 Nov 2025 11:20:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,rzg3e-xhci: Add RZ/V2H(P) and
 RZ/V2N support
Message-ID: <20251103-thankful-jackal-from-saturn-5deef9@kuoka>
References: <20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sat, Nov 01, 2025 at 04:24:40AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the USB3.2 Gen2 controller on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The USB3.2 IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
> 
> Add new compatible strings "renesas,r9a09g056-xhci" for RZ/V2N and
> "renesas,r9a09g057-xhci" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-xhci" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.

We can read patches. Don't explain that. Explain the hardware, which DT
maintainers cannot read because we do not have datasheets.

You almost never need to explain in 50% of commit msg (that's the
biggest paragraph here) WHAT you are doing in the patch. What you should
always focus is WHY you are doing and that's the feedback I already gave
you for sure.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


