Return-Path: <linux-renesas-soc+bounces-3392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A051D86EC00
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 23:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 401EC2872CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 22:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCA65EE6A;
	Fri,  1 Mar 2024 22:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDPu608k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1410459153;
	Fri,  1 Mar 2024 22:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709332874; cv=none; b=We9IOpXHQtQxyjltnEqJ2wTEzZr6iKwSKUHKe/9lFGHvBAzNgISoE5WiKuNh12If0yo7xfohq6dgC/zJWKnaTDy48TxX96b4azxZBD10Kl5DDvSTUeoWYPTHEdmRpiui9gNWxZQpaQ9ESI4SFM9hisysRZtCvT7OvaMH9Esgc9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709332874; c=relaxed/simple;
	bh=vlOuCkGmkheWT9n61b+IziMhBGZnJ60QhUZiQ8nqpCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arUwkYmugqPHCoIkwQWEkZ88HZs19XSILymvp98xn/c19xHHxQPOqI7Ypq5Y9fNB75kDAOWRe1m2QqsqZAdw9i3yXpkT+erx9OcADkgC9Fr/ZoikQutQS8OBwj6pnxaXeBhOPG/Bgm8CjWT+faPByVQkmLS1s7NR6k9yY2UA1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDPu608k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8E6C433C7;
	Fri,  1 Mar 2024 22:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709332873;
	bh=vlOuCkGmkheWT9n61b+IziMhBGZnJ60QhUZiQ8nqpCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDPu608kl/K4Nr43O9mvKW/xvdBcnLalYB9vQAgeHpC2wjB1iRB0D6COEU9aAmIxM
	 rhQOuqzlF11ZSdozA7jnFo2+a3oya14KaliZ0DTQGuYazY4/if2aQ78kMP1/O1t04s
	 GODvljmXFZU7qv2pgVXZfXlmZElR5Q632bWwzoxfqPhtDKGdHte7aaMc1h97UzQ59t
	 EZuvRzQA/e7uZonn8pspjf1Fa9xUlPBQpJwlRHMdsbRfDttEry9gKVLEGznMPU7AVj
	 M+m+0BIghx7yhdB8U2ZxEDWpjGayA8444HzLTwVQBFKbR6Q7TeQMfI+nRB0+LvxCNJ
	 WH5cVYcb5CKTw==
Date: Fri, 1 Mar 2024 16:41:11 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] dt-bindings: clock: r9a07g043-cpg: Annotate RZ/G2UL-only
 core clocks
Message-ID: <170933287127.3191406.4855978246818214435.robh@kernel.org>
References: <ffcdcd479c76b92f67481836a33ec86e97f85634.1708944903.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffcdcd479c76b92f67481836a33ec86e97f85634.1708944903.git.geert+renesas@glider.be>


On Mon, 26 Feb 2024 11:59:45 +0100, Geert Uytterhoeven wrote:
> The M2 (CRU main clock), M3 (LCDC Video Clock), and AT (Cortex-A55 Debug
> clock) core clocks are only present on RZ/G2UL, not on RZ/Five.
> 
> Annotate this in the comments, like is already done for module clocks
> and resets.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-clk for v6.10.
> 
>  include/dt-bindings/clock/r9a07g043-cpg.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


