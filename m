Return-Path: <linux-renesas-soc+bounces-22898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32093BCE4C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 20:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A2C5407304
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 18:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC5E2FB62A;
	Fri, 10 Oct 2025 18:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIQGNbCx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6522620A5DD;
	Fri, 10 Oct 2025 18:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122280; cv=none; b=lxsqfqC27VCg9ZvzOeTgu4G9GLNqySjmYRxz2REJPpApyJ7Wjjfw3P9GS6B4cW+lpzDtQxI6v4undF7AzclHKkznYGOlyAx49BlvcknD9D6mioH2eO/1NBxZpwBPy8wkrLwlqG/gkPVMCMA6Lcw5VKM+1Jm5ynBEX9pZ+TDnM7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122280; c=relaxed/simple;
	bh=RlcjMZ3VmHH4RMawLNJUGxUZjR33UrE1qzxFtUSZDdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC18LWlwt8cl2FgHUZgbq+6QjPIaZMLFA77nGQNzIcx1J8mtKIDeRTP0Jyb8jmtQcxGXE4klwl9r4lFTY45g+x/l/0/OnZ1moIo2tJhFvEhe7BzZtRnvBxkA2hSFIx/2YjsR0mQn0i4zislEFjknPsUW0Mq76Dw7Es/OoaH9ZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIQGNbCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A637C4CEFE;
	Fri, 10 Oct 2025 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760122280;
	bh=RlcjMZ3VmHH4RMawLNJUGxUZjR33UrE1qzxFtUSZDdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIQGNbCx5DQPVYNCQ6vp03KRhopixn3/01Nspp+IRCLyCNjXO0R2zUJjbkzYDuiEm
	 vvmPpghle7ECaPjL+HG+zJ+cMHbHJsM4x1Ct20xw4V5q0HvHU7qGfMWmDABQ7ss51q
	 J1Zt/3LgVgGkwUhBMMO0q705XWivbuflj4qfesgA21SCw5eKFCND0u+DCioxJf95Zu
	 h1f7yXCg6nYHb/4yaefYbO0AQvKJ2A6TnHPakQXBtcJSDp0o0zRySxR9OW9PSwcAGR
	 6wklolVm3ihtPnMA0pNVIFPoiamNWFmYg9ua/iM7IXMkCupsyIWzh/8+7NAC4r7IS/
	 9f8zbF9z5+6aQ==
Date: Fri, 10 Oct 2025 13:51:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: bus: renesas-bsc: allow additional
 properties
Message-ID: <176012227577.709483.4239787634293287864.robh@kernel.org>
References: <20251009183630.5451-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009183630.5451-2-wsa+renesas@sang-engineering.com>


On Thu, 09 Oct 2025 20:34:53 +0200, Wolfram Sang wrote:
> Allow additional properties to enable devices attached to the bus.
> Fixes warnings like these:
> 
> arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: bus@fec10000 (renesas,bsc-sh73a0): Unevaluated properties are not allowed ('ethernet@10000000' was unexpected)
> arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dtb: bus@fec10000 (renesas,bsc-r8a73a4): Unevaluated properties are not allowed ('ethernet@8000000', 'flash@0' were unexpected)
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> * added tag from Geert, thanks!
> * dropped superfluous '^.*' from the regex
> 
>  .../devicetree/bindings/bus/renesas,bsc.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Applied, thanks!


