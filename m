Return-Path: <linux-renesas-soc+bounces-7925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A648595727A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CE0F1F23870
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3227E188CB6;
	Mon, 19 Aug 2024 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trpWJTcC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D7188CA6;
	Mon, 19 Aug 2024 17:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090048; cv=none; b=S8Ql5O1qxXabWdqE+1boNK/hRnL6/3v8abz526Ucgo6Ig6/QriL8nu2PGp1kgUjpNv18zrbedMUInvmqbEynvsuTMeHBtw2WH6cxxpWW4FAausXVZKYFQqWP3+/clc5w/lBHe6P3PDqMtUfNmm/CMxtyHiTfHnfDqseGqFSNTZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090048; c=relaxed/simple;
	bh=8odx4X5D2SFdjugxFVJo6SjM2zgE6t7oK75eXwrN3Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lerSZQ6nrnGmCdKP28sgnNDs3diPLKcbDrprf6h+3jrDI5SrKanfofE7sW1zdkH0ZJpTU91hTPJXCnLrQbvN3uDITb/6b67m7BhOhp/XDDbO0nNu6/XRtmc5pXZ+rzBNrPYP5Dfknp96K6fmUSvtyoY6kTCFQpR1x/GykXsvtJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trpWJTcC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD72C32782;
	Mon, 19 Aug 2024 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724090047;
	bh=8odx4X5D2SFdjugxFVJo6SjM2zgE6t7oK75eXwrN3Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trpWJTcCf51eZAs5Gv8M5fNbjgmFW3YxIv4QetdEPp0QUH9wyUQBQtwGrMQF+6i6Z
	 zjwNoKt72Oy4SOofDgz9f7xr13DqE0HpU8hRB20Q6ENkXoF1+ZaKa+uxGekAWDXTQ8
	 DMyiSOhKzH9RHAbwnLX5xFG/7FKsyyhZlrZLjVULMMdNL9kgjM21Tik267CCMMpxJQ
	 nUnz8/gOJz+mL7khv7NopOSUw8/XjLf8UCBMUdrNaxBp77HfT+lsriYP6BSXdgniiI
	 B/HdAWvakOtCSFYAzFaE1fgY6fVQbujwz2drWesYp5hhT/2XJJ1QYcxjNRPQvLupoZ
	 24ediDPapvdTg==
Date: Mon, 19 Aug 2024 11:54:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: add top-level constraints
Message-ID: <172409004503.1749989.12220375558549016614.robh@kernel.org>
References: <20240818172923.121867-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172923.121867-1-krzysztof.kozlowski@linaro.org>


On Sun, 18 Aug 2024 19:29:23 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


