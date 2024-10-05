Return-Path: <linux-renesas-soc+bounces-9494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA9991909
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 19:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0791C210CD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 17:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E87158D96;
	Sat,  5 Oct 2024 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ci6/48ZI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA6158851;
	Sat,  5 Oct 2024 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728150760; cv=none; b=AFouZ76qxOkUZQGlJa2xCVKkTX318A5CykZC0CFBuIMftIEsbcME1lFcTjOf+7ATdOrxRlj6hsmA4604mpyyMnth0YJJtDqv8CTW2c1Ys9ODNBPT+szQqjr57Lnbem6BfaRPukuqG2hnqS0KdGGAnn8gOVDcyTDjIAnveAGwoOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728150760; c=relaxed/simple;
	bh=NRH8Ou1I4pXNYd/XvsLjH7QogNBos/PfhsW1jQJokGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPXeAR+24qVnIXewc60mQoddMQK+Wn9AaFZHzwv5wN0OeLk9UtuiGd30TvSIAuhhr7TflJPMoD8+dQpoyVC4kbOFx5+DQzMsEb8UgM9iEHQPVCDQ1sUlzBvQVitWCOkw5Ki78Ff+Ckz0OQo28nwCJsiWGIBOqQc4r2JoxJi0j28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ci6/48ZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15879C4CEC7;
	Sat,  5 Oct 2024 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728150760;
	bh=NRH8Ou1I4pXNYd/XvsLjH7QogNBos/PfhsW1jQJokGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ci6/48ZINkwNrzvXZUVpG2h6fl2XWyIAhjvOXzPy/gxDndcJa7xit9adjPpb/wdpe
	 hOQKfXKOe21FcoPbMYUKMrtOEX9b82ES4QNB8/CeCGOziQwmlaraDLhcrudZHqDYoV
	 ABuEBzMLZWCpeNkRhvhVSbtoJphhFfIbBKN6v+t/JAROhR0qqvBK4X7iTJ/KBUWbGn
	 K8xKao6kcK8ch5M7DjfHN/ar6lFsVQtnh2mptSsCEcfppZeU5CvTfsxnilmN/LRspj
	 JC9py23io0s6cCUIsM/0nhRkl5jj2/BOBBIaXRu0CzgY1eF9kgI5sASnveEJBBImyv
	 Or4lTFgHYmaCQ==
Date: Sat, 5 Oct 2024 12:52:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 resend 1/7] dt-bindings: fuse: Move
 renesas,rcar-{efuse,otp} to nvmem
Message-ID: <172815075836.447282.5004726072565136518.robh@kernel.org>
References: <cover.1727963347.git.geert+renesas@glider.be>
 <425648901d724b3db81329f98988d0532257eb89.1727963347.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <425648901d724b3db81329f98988d0532257eb89.1727963347.git.geert+renesas@glider.be>


On Thu, 03 Oct 2024 16:04:25 +0200, Geert Uytterhoeven wrote:
> The R-Car E-FUSE blocks can be modelled better using the nvmem
> framework.
> 
> Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to show
> the definition of nvmem cells.  While at it, drop unneeded labels from
> the examples, and fix indentation.
> 
> Add an entry to the MAINTAINERS file.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  .../{fuse => nvmem}/renesas,rcar-efuse.yaml   | 35 +++++++++++++------
>  .../{fuse => nvmem}/renesas,rcar-otp.yaml     | 17 +++++----
>  MAINTAINERS                                   |  1 +
>  3 files changed, 36 insertions(+), 17 deletions(-)
>  rename Documentation/devicetree/bindings/{fuse => nvmem}/renesas,rcar-efuse.yaml (54%)
>  rename Documentation/devicetree/bindings/{fuse => nvmem}/renesas,rcar-otp.yaml (60%)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


