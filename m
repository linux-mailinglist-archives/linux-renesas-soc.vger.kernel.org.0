Return-Path: <linux-renesas-soc+bounces-10791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC49E1483
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3334280E23
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 07:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0629192D7B;
	Tue,  3 Dec 2024 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtxX53S3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740417BB25;
	Tue,  3 Dec 2024 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211830; cv=none; b=eZhE6e8uYTMt2C93254y98kw2eYoixUzJEwv/NCijXh/P0KMBPu7VCTs7/sN+cK9+vCW3H5MMGC7zkIVT9QxD7SsqTvKqUuypJ7e4HeN0Ri/PYYzvLPLQlhZFSH3qV9mVpIN80JWe6jZUVy6VVk8JougM1nBCi6VTwl1HL82VBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211830; c=relaxed/simple;
	bh=NLJFoTMl+PMuvhemePqgps/gm+iFwkpLmsMRB5c8y7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L10Dq6m2IYHsqGiuXdxXGgUKxA12Ypa4pSDfIRlHwW02ujVx5cRwHWCl5oPk+XaGiGdy3UECIdqz51ClEEif7EHZGepysHFKbkkwKcTzK6HwyUL/s38MPiauN2iCIPyeOLI0cOCSCbiHhzMvgZGmuJp24EKxP8Tyxc9HOy/B2H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtxX53S3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F77C4CECF;
	Tue,  3 Dec 2024 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733211830;
	bh=NLJFoTMl+PMuvhemePqgps/gm+iFwkpLmsMRB5c8y7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtxX53S3rIBlOPBSOKc4Jeg7IRXlUMF5Dy6/OfQ4rO3AFFH118cM0oGCg1FiM+T2X
	 ylYZmqnpyCX4BTzqXN6K25MJJBBVnkw1wGxhzEmp6vLt7E6HsHyENLD+yPzzSvb3uR
	 zqQ6K2iVZqBLuoHGjs6zMQia6xOT64TVJu36WnWSEA8WgRuiWLRPu8WDbVKwLUTsoW
	 rdUMmEI3Ji5pN0JbelWrEbC7/WeV486yH80DyUNB7OY7jqDk0/PmbV2J15v5oWKJH4
	 o/+A5u5Z9fnufOSKgx0yf8Fo0spSGer7Krubk+kjabJp24szAgDfsbPGpkp2/0rmzF
	 fVERHW2RyUw1Q==
Date: Tue, 3 Dec 2024 08:43:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: soc: renesas: Document R8A779G3 White
 Hawk Single
Message-ID: <u7xrrqfnt5wbl5itftm4ibo63jbjcek2nzz33csmidkc4vynuq@ep2thd5dnkok>
References: <cover.1733156661.git.geert+renesas@glider.be>
 <1d2d2a6cbf31c817f574f6eed310a960e6175afe.1733156661.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d2d2a6cbf31c817f574f6eed310a960e6175afe.1733156661.git.geert+renesas@glider.be>

On Mon, Dec 02, 2024 at 05:30:08PM +0100, Geert Uytterhoeven wrote:
> Document the compatible value for the Renesas R-Car V4H ES3.0
> (R8A779G3) SoC, as used on the Renesas White Hawk Single board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml          | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


