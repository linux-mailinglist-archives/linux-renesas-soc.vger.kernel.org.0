Return-Path: <linux-renesas-soc+bounces-12445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BB4A1B19A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 09:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2770C7A57F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 08:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E237218AD3;
	Fri, 24 Jan 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0n8fqY+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3505D14A0A3;
	Fri, 24 Jan 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737707024; cv=none; b=unfNOYm0L4A3Sqq6Yc+QlpT1AG6tBtvbIHs3Y+R7C9I+uAxVvNkafV9ZPAk912nZaiKQwOUCJlnuyAv4t4BgNjY2LcK4Isj4ZLrkV3jilePZmUPJPH7l+q3aapQeuMUjmBbOGNuPZicGfY1nkRBBzhPBAPb3mRhc76CkhdLmG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737707024; c=relaxed/simple;
	bh=1tbcRqhwFEG2E5LTry6DGDbyq3heUSSFyhAhh+CIYLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAtraXdGd8qh+dQftoYh8UMhN76oXNK2ru1xV2tz9tRX2RmtHfExZFEjxpg/9yBOR0dG+5t27ZeL+SifcfPwHEfySuX62W3LhjHnSOeDrmGoXB6tlr6iICyM9IMKOvn8czGbwc7aBy6JN8Ount8QOH0jojY/S+zhkoL0NXEYH0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0n8fqY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91ACC4CED2;
	Fri, 24 Jan 2025 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737707023;
	bh=1tbcRqhwFEG2E5LTry6DGDbyq3heUSSFyhAhh+CIYLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0n8fqY+/aucU7wAezK5y2R5VNnLReq/YIcZGJmjOZr5REbvmDlnTsPF7r5jpYWL5
	 SHM5xfzgUCqLDv8Brx7JtS2a3Kr1G3zd0WwqZPKT0BT/4eAMFhaATu9Y48V3X3slOI
	 dykRPWWSdG5L27nLWF1yAmuNkATDfxBSkU9NFpOwF7CccKNOaVIrTPvh7MfBeOtFBU
	 TvGe5d708ec40iM77T1nPl3c497IrDig7XMd0dlIHCDW5ENquGjHRwDAeaDGTR7eld
	 kXxyl2uNjGFoC45pgNP/+MPh5v4gAREEPGH/SPHJ6DI2oHbaN9xyIH99p8s73hLe1F
	 6sFKR0dML3fcg==
Date: Fri, 24 Jan 2025 09:23:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: renesas: Document MyIR Remi Pi
 board
Message-ID: <20250124-quick-competent-kangaroo-8d1eda@krzk-bin>
References: <20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com>
 <20250122-myir-remi-pi-v1-1-0e44e1cb8a90@collabora.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122-myir-remi-pi-v1-1-0e44e1cb8a90@collabora.com>

On Wed, Jan 22, 2025 at 01:56:05PM +0100, Julien Massot wrote:
> Document the MyIR Remi Pi" which is based on the Renesas
> RZ/G2L ("R9A07G044L2") SoC.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


