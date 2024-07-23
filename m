Return-Path: <linux-renesas-soc+bounces-7473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C988993A8B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 23:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DD002832A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 21:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49071448CD;
	Tue, 23 Jul 2024 21:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnnPE+gH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB36713DDDB;
	Tue, 23 Jul 2024 21:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721770140; cv=none; b=qd7SZWLajaiUL49MwgXgyMmXMjKOBIXHtkULQ++HYTHA+z2l4y33iH8rNaME7aKpi1Xeyz+E3jsPtgkUJthBrgiYLTFIZafdn+YfXBCMA69mECG8O4C/LFbIOS8iGghCmJUjZHvMwW2i8Hp7E/wiKIUQYO2AFncuYkdJXtNEuPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721770140; c=relaxed/simple;
	bh=0CpV5ndkRLwsc+P9ABxR766u5Hm1039ioyN1Eu4Q95g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rG1Q5ofYfuayWk46AEpJY7AaM14m03ZMHlCUYTi2QLkbtboRCVqocYewnJdEg4LCGmswTfrc5PXEaG/EAYaEl1MNJGtZ0j+4XT2BofKzhQ+j81cgaSmJ9wpwal9c3It9w/X/8VcbwHD3P82rmZT9AMGxW/S4heZQ2vmXHObuqd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnnPE+gH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E64C4AF09;
	Tue, 23 Jul 2024 21:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721770140;
	bh=0CpV5ndkRLwsc+P9ABxR766u5Hm1039ioyN1Eu4Q95g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnnPE+gHkCeSMPIZGBDcg3+TWweJD5RjQ65FcwfJYv9y146abvjuq8mHcNw8QLiWF
	 DKUm3zyvKKjgAH3m4BVAKne1+TR74l91TZZSJ2UURhkJH1s4o4/4LwfJkYsO6t6Eau
	 o7ylNdYA82cIQNLSb8+cc0HyYsEfx4MVXhXXFDVnkJ+j8bRgLA1lqBUE3dWLRL+jre
	 Cpa6nwEbO+Bd6Hair/CHtIJ58BGqj4c9fQrPDBYw1DPwWFghm/pGsK1L8PoLPvt/E4
	 hcjx9ReTy/GPGL+cc6h3fRXLo3sdgZgAt9YGSXNPmufqolgcPE2mZjfcgN9sQYOz+b
	 UqDrWGsbb7QmA==
Date: Tue, 23 Jul 2024 16:28:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Magnus Damm <magnus.damm@gmail.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V1 resend 2/6] dt-bindings: power: renesas: Document
 RZ/G2M v3.0 (r8a774a3) SYSC binding
Message-ID: <172177013867.1133552.16474828491883826831.robh@kernel.org>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
 <20240723110733.10988-3-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723110733.10988-3-oliver.rhodes.aj@renesas.com>


On Tue, 23 Jul 2024 12:07:29 +0100, Oliver Rhodes wrote:
> Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SYSC block.
> 
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v1->v1 resend:
> * No change.
> ---
>  Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


