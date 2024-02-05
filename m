Return-Path: <linux-renesas-soc+bounces-2334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E58CE849FBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 17:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 873A9B22DC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 16:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C2633CF6;
	Mon,  5 Feb 2024 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOkmhRrM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6193FE44;
	Mon,  5 Feb 2024 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707151557; cv=none; b=Pj/HvFZW2KFroYeFwgCqOrM/EU1GSUX9dkq3fLSxTLgyjhjI8kzq8esh2iycRwG3Jwx1KPsjeFl3vNDruRCPwNzXHyumz1Q8xqZTqzjtdhnG0fhREzbIoCicAw92+8dD6upWbOzdElL7wkrmrnEAXO2PxW6HNq3zPb8ycXws3wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707151557; c=relaxed/simple;
	bh=MKEh3DqLjTGpbNuXngSnug0+6IpX1IkeGiJnwv8YNt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQ5u/udnVl4iWvxtc6EmYdh/5S2XcUjAB95SX38TEnVqKEBRSsROOh2sxIHGK7mUN9imfVgvoFk7Np5hcqq2/a1coLAEOL+ZKZb0sc7Rbw9yW8q00u0Xe1m6tw8mxWlk6m3jMfVvIk2SjJXdalRofC+2PX7dCoKtQgrfdrXPRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOkmhRrM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DAEC43394;
	Mon,  5 Feb 2024 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707151556;
	bh=MKEh3DqLjTGpbNuXngSnug0+6IpX1IkeGiJnwv8YNt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOkmhRrM6zubuygwMP3g3x7pY8yCZEZWT2IGSmTV8O60ygu+sK5RCgCat76wkUYBy
	 b1NcfgobwNx+pvsANhMSzIWFNZIfKYf7c13KdbNhLvQcFad3cV4MkgXxGctVY1e0R4
	 T7YTDyNvVcwSwKY16aApvUCVgzbFAijb3oYgfbrGHavU3fR2tr/UYCtqp4jMGwIKt0
	 nTl9ZCME7IpCL6cnP3g1VDYSePdUVKJanKts1ie3bQUi3l5oJYNaQNC3kANAyFRgYT
	 h9MeYjdlPMxixc+QicqwdpDtmbFW+tsyQrfXrWiXWxvfpMXl+vbrK6VBG+MhocWVgS
	 huTI41rSL2/tQ==
Date: Mon, 5 Feb 2024 16:45:53 +0000
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: renesas: Document preferred compatible
 naming
Message-ID: <170715155261.3486259.14351069741076274739.robh@kernel.org>
References: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>


On Sat, 27 Jan 2024 13:19:37 +0100, Niklas Söderlund wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
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
>  .../bindings/soc/renesas/renesas-soc.yaml     | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>


