Return-Path: <linux-renesas-soc+bounces-9098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA7498796B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 20:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31AB1288FBB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 18:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDAC183CBF;
	Thu, 26 Sep 2024 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVhA+hwL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246D17799F;
	Thu, 26 Sep 2024 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727376534; cv=none; b=EnLypgshq6jEqEfnz6tmf316fGd4vEMjetIQTaL3V6MeYpbVgJy0YCOyoHD2qbAHyHQY01zxly3FEhjf7rEwzRXoFjg7B/jhseiOxVsWIdg7fMhDqOKVrjw5DlxrNBr9a78cgLFbY/jyWHWU6JScSRpUWfMbuQO6FqdFYaoPOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727376534; c=relaxed/simple;
	bh=ywMciHu/EK+As/Li4Pz6cvZ9f1iep63ZzlHuS5WN3rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRFM+UcSj0jXppYrSqJeJfJENZPKFtuu36Bk+G19Rdnyapwr8bzeV8i4pKPFbc1fRIjXC3R15P9uYsQplL/7kVSPYmFnoXPeDMYANMJESV5+PEjTOMeDJCCmfsJT0Xh5C6NK01E0UCYNkRBoM6Ns7ccRpeSBxHu2jTfzh1kjtAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVhA+hwL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEFCC4CEC5;
	Thu, 26 Sep 2024 18:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727376534;
	bh=ywMciHu/EK+As/Li4Pz6cvZ9f1iep63ZzlHuS5WN3rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVhA+hwLlEsa34jj1uESQK0ZSK6LqK+b+RQpryv72cRAQ2U283tz5cQYZVKXEMWk+
	 gPmUqOgpRhS+lPjAXjGlxyRUrLIbY8JXVGH7vkZfREQHU8hp+iJcuXaMt3f4VsHf98
	 HpUpg9G7wtjOLZhXdYMtUe2Znqw+f16TyazB7FtmMi1HFDa+M9DpnoRLq+h2aaiwBW
	 pELxMkeJs/9PhlEuTiVP4EvWCLd6NNjY4maj6sievi+s1/MRjpT/0+EnBpYRmnI7H0
	 aRP8WDW9d8vIe663XSP/h9/6uHw0wG7gvJaD++9xW5+iwwCd0EAtLkjQ/7fM9k+fYa
	 AIAK86O7sILZA==
Date: Thu, 26 Sep 2024 13:48:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rsnd: correct reg-names for
 R-Car Gen1
Message-ID: <172737653167.2739244.5608601664573969856.robh@kernel.org>
References: <20240926113241.24060-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926113241.24060-2-wsa+renesas@sang-engineering.com>


On Thu, 26 Sep 2024 13:32:41 +0200, Wolfram Sang wrote:
> The device at 0xffd90000 is named SRU, both in the datasheet and SoC
> DTSI. Fix the typo in the bindings to avoid the false positive report:
> 
>   sound@ffd90000: reg-names:0: 'sru' is not one of ['scu', 'ssi', 'adg']
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


