Return-Path: <linux-renesas-soc+bounces-2776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4CD854B11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 15:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 908491C203BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454C754F89;
	Wed, 14 Feb 2024 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1pF6TsY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF521CA80;
	Wed, 14 Feb 2024 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707919572; cv=none; b=ueGjzQkkBGnxW1ImqN3Uk3nZwdLUEJXEa0xWMDz8Jq+lXMMB2QmjbiZF8yWZtn67/o42rvQRhvGhZpcmPF+EQ2zuD71BmFvYeM3DspY5zziPLNDjXXnC4UQZjnnz/1mC8GEkekZy2Ad49kq+bpX/jAVslvxQHfAOWWRo5ZScqzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707919572; c=relaxed/simple;
	bh=vibIGAOCLxJkzKlhbdGg9LgCu9Z3CgLQPhEANFECeGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaUBsVviIA1VLKXRaDzu9oYAnr1k9Fq9DVv9C4zg140PDOxg8WenoND0PrvKqDWpsi6vfiPryGkwblXPsH77GoNBDrFq5MCE1LvRzPthtBJAKUl0eIf9h91IJRB1UcZ3flfXo5MOzlyejktGHdeKel0TmDg5yNpxnzjkmV3ldMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1pF6TsY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52554C43390;
	Wed, 14 Feb 2024 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707919571;
	bh=vibIGAOCLxJkzKlhbdGg9LgCu9Z3CgLQPhEANFECeGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1pF6TsY8mkzOBP7XrXgLNNL5aNNSsO9yXgEVH89SGgW9jH6jtoSc7azd28mzbo5Q
	 SXpuLl3ehcUkJj0Zgos2GWZjoPgzzja57laqSnxDCuGlMNoRKKqU9mG3RO/IlJNZuH
	 AW99Bg3dFrOv7Ohw6b9O94m/Ony0ZohRz8Jgx8MV+G7cOpL7HWDhTFbqCVAu9hbqA3
	 B8XQ0n7U+GDqjsW9uzJs3dE9b8yUsEyHUAr3Lt3YamKo9B0Xn7cHCDw83yxZ0JLoKu
	 bXv2+uKmY/JPK+OPfEaXFlq8ewXFrgGXC8o0BC04Jt3ZCnTP2Vk0Uo+1WRb69VsjNy
	 4wXGUaT2DZp2Q==
Date: Wed, 14 Feb 2024 08:06:09 -0600
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4] dt-bindings: renesas: Document preferred compatible
 naming
Message-ID: <170791956473.736090.3699151649445345714.robh@kernel.org>
References: <20240213224259.2967533-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213224259.2967533-1-niklas.soderlund+renesas@ragnatech.se>


On Tue, 13 Feb 2024 23:42:59 +0100, Niklas Söderlund wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v3
> - Add missing minItems.
> 
> * Changes since v2
> - Improve the select so it matches on any compatible containing a
>   component specific Renesas value.
> - Make the regexps more compact.
> - Define MaxItems to allow the increased selection to work.
> - Add rmobile and shmobile prefixes.
> - I did not take Rob's ack from v2 as the schema changed a lot after
>   Geerts review.
> 
> * Changes since v1
> - Split the "SoC agnostic compatibles" section into two to make it's
>   intent clearer.
> - Improved the documentation for each group of compatibles.
> - Reduced the number of regexp to create a larger target area. As
>   suggested by Krzysztof the goal is not to validate each SoC name but
>   check for the correct order of SoC-IP.
> 
> * Changes since RFC
> - Moved to Documentation/devicetree/bindings/soc/renesas.
> - Changed the pattern in the initial select to match on .*-.*.
> - Added a lot of missing compatible values.
> ---
>  .../bindings/soc/renesas/renesas-soc.yaml     | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


