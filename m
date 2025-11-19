Return-Path: <linux-renesas-soc+bounces-24763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 13633C6D41B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 08:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C84092D50D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 07:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168E331D366;
	Wed, 19 Nov 2025 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNLo8YZ9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA92EA480;
	Wed, 19 Nov 2025 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538727; cv=none; b=WyU4oBF1YRH7UPg4sWE/fOFLm79VSqB1mHqVc/cr3+BuOd+3STIXkVF65nDDCMjBsebebqLKPpstlJ7efvhHB3nhsvPHU1W/Bp5eJ7Sg9W2Tj2BjbASP3c/5KO8tUd7SZGLOA55sbOdlIX803mrlEvdcz5JdeZCCXaJWS9BRj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538727; c=relaxed/simple;
	bh=Aw6GuoBmIoOOfi/HNJCDnLrjZoQLsB7SutRhWhTrfE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+o+gu4yEHFlEAa93nJ5MWoMZAm7N90TFedbkpLFtUGZhJOJlIhVwnnX8yG3hrTl6uDev7L+7EIfSeTDIvaAkzyrtKaqFLMkpVMv9CfefFtVV9BYzyqCb710L2gVlaMB9xqNC7IFG1AfxsdWSymiNY97pVdEBiYEj107MWg9Ze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNLo8YZ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B96AC19425;
	Wed, 19 Nov 2025 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763538724;
	bh=Aw6GuoBmIoOOfi/HNJCDnLrjZoQLsB7SutRhWhTrfE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UNLo8YZ9V8kgiNZaqDJx+RexWzgCTk/eKpXbU3Iw9oy65IQRwlCxkRswDj0WH9zod
	 +oxiHTqRtvM2AddQN/pYPuJ97wcy6UDbDNY6l0UU+pJT9C84b87+W3Td4EaD7pVTQT
	 GE9yXdl0KQ7XBfIgtZa03AKhuRH63tVxwMfcFt4olJDCq500QVGiW1LYqT3qooSSua
	 z98i+9XvWjki47moPp6RhHp9hfwqSKqWw242k3DpNvbpbmbQVl7zvxZRVGLop6PCRL
	 UkzbBTGHpXR99f5KXKfBApoGprkneROwMCFMIhB7dMrKbTAJevpthH9izySDOJeW7m
	 xSp0mNuPJLPEQ==
Date: Wed, 19 Nov 2025 08:52:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas,rzg3e-usb3-phy: Add RZ/V2H(P)
 and RZ/V2N support
Message-ID: <20251119-calculating-vague-crane-feed81@kuoka>
References: <20251118180712.4191384-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118180712.4191384-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Nov 18, 2025 at 06:07:12PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add compatibles for the USB3.0 PHY used in the RZ/V2H(P) and RZ/V2N SoCs.
> These SoCs integrate the same USB3 PHY IP block as the RZ/G3E, so the
> RZ/G3E compatible is used as a fallback for both.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml  | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


