Return-Path: <linux-renesas-soc+bounces-21155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC4B3F917
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 10:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ADFB1884FC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 08:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE2B270572;
	Tue,  2 Sep 2025 08:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4dK+02d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E338432F742;
	Tue,  2 Sep 2025 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802967; cv=none; b=IGE/zXnnMRfy4KdkdRyReLk49wri1BmfvTtpLJFjCWoCBK72i7NqHmeEm3gIGS8Z+S33Wv4OiB/MxBQmGyFxUmqzc8s3OrcpbZz1DswafG+6DCjPxus+Xx4wzOIqXV6RSvYQkP/idJnPMMKJFm0f2LB2Wph/3g7jnMwhNMLtBRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802967; c=relaxed/simple;
	bh=rEEUhyesr1JfcnPJBOaeHTZak+JujvzT4iPgYVAefgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DI4f1aUiMWOZahTRoZo3dRSfea4NMbxx43snWcftJwMdkWNfy7EQkcMC3IVUokGofrLLJbq86I8cNibzZDSjPCN0mE+9J5uiY4RegMIHuNDgcXMfyG7iG6hCK9Tv9/oTnKVhBWu2iLBqxc3HrUG40DpE4/dKV05JUQfYUi0BTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4dK+02d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DE7C4CEED;
	Tue,  2 Sep 2025 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802966;
	bh=rEEUhyesr1JfcnPJBOaeHTZak+JujvzT4iPgYVAefgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4dK+02dMlR8emlHiLWqZYbLOQhyLVddyOOin8epDnyty080NGW2VX2tWBmYFo1zC
	 1fzMnTtYbdLKl4lyGu3PkXcLMCXqrRJEkzD7o6NfFYDqwJz7xvOU0vtDRfxKfELku8
	 IqAlKWY1CZaVZCkpF81r/Sx1HKQYpgm7/MnbFMgCLcds8WCOWjZi12/fSsjMWrR8g4
	 edT7akdZ4A4pNTJJ1OwT9xzJzf5BQCG50jJ3RTJo6KITr44epGr4jzAz9tUDNalccz
	 c+6SZEwjc4yqdWSNBJhWX+2F1juf2LY9raq7U8W0xe6NlyK+Nbzp8JEGAm4YUvO2C3
	 b5upV9De/LlVg==
Date: Tue, 2 Sep 2025 10:49:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: dwmac: Increase
 'maxItems' for 'interrupts' and 'interrupt-names'
Message-ID: <20250902-spirited-congenial-stingray-f8aff7@kuoka>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Sep 02, 2025 at 01:12:59AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Increase the `maxItems` value for the `interrupts` and `interrupt-names`
> properties to 19 to support additional per-channel Tx/Rx completion
> interrupts on the Renesas RZ/T2H SoC, which features the
> `snps,dwmac-5.20` IP with 8 Rx queues and 8 Tx queues.

This alone makes no sense. Why would we need more interrupts here if
there is no user of it at all? Squash patches.

You also need to constrain other devices, because now one Renesas
binding gets 19 interrupts without any explanation. Please rethink how
you split your patches...

Best regards,
Krzysztof


