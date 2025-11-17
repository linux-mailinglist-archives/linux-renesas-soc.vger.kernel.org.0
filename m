Return-Path: <linux-renesas-soc+bounces-24702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DD0C65855
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 18:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 739F34E7B1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 17:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51F82C08B6;
	Mon, 17 Nov 2025 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPH3yPqB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4FE231A23;
	Mon, 17 Nov 2025 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400457; cv=none; b=QQWsVYoq4dou7BPuun6c1xl2uatKp79n2yoV8g9Xoiu8E8ID0zyzMqyOQw0XBXMqIa3MFprdEqVwsvHoa3DOPrmif0ldHQ8DTpd7j+TQfd5eYXCj/KRoV9C0E2k/xVzAUK4KPSY6m9x1mWGyRVXIQM2jVllW7vL2XKW9cW7Xy7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400457; c=relaxed/simple;
	bh=iCm9xytzmhMo1N6RgIryyvnjLZcDw4seYMUdhKpnvBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfWcq30DeiUjPh/zKK9UPJ+UXsPrIcWj/8Zvk4MoL7ODf3La5Y3aO7g6DTJFtJdu5A61r0ZG1X3tm8Juvkbaw2LYyAoKjravF5/hDYGgH1kUfEgVYx0SjCYQdO5BDloJOOtVAPwvAGV34P0qXpEhjKaAAPI2LxOyR90BWs12dLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPH3yPqB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9936EC19421;
	Mon, 17 Nov 2025 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763400457;
	bh=iCm9xytzmhMo1N6RgIryyvnjLZcDw4seYMUdhKpnvBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPH3yPqBCFFrJj+DxeIyAcIuKYr7xs6Hhxj/DdNZl2OmCfcOqariBP1zUaBRw3dsA
	 Fj3JccpYehugqYXSMXwbTh0yK14vwWbf3cEJFVyWOmA97VQ+OIHrL8vnoHj+Vh40yh
	 D4wi3bPsL53YblXCOoZ2g6OKctk4BTqtYB629lgu+1z0j6IzSSpei3EedPtFwGJgOZ
	 DoWMHpEeN6Cuq87ouZx1TldUP0yWC8JmEkviCDZdbUYC+7vik8e6PEYRFvu9Ku2cZ8
	 uQw6dSXYwWsyVKCpCQQr+GKQEA3JTygjMTW4DiAcWfhoVS1MqkW6NYaeUIR0N+StrK
	 Z0fUygPce7HtQ==
Date: Mon, 17 Nov 2025 11:27:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>,
	linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <176340045355.193991.3890050582277813670.robh@kernel.org>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>


On Fri, 14 Nov 2025 11:47:54 +0100, Geert Uytterhoeven wrote:
> The Devicetree Specification states:
> 
>     The root of the interrupt tree is determined when traversal of the
>     interrupt tree reaches an interrupt controller node without an
>     interrupts property and thus no explicit interrupt parent.
> 
> However, of_irq_init() gratuitously assumes that a node without
> interrupts has an actual interrupt parent if it finds an
> interrupt-parent property higher up in the device tree.  Hence when such
> a property is present (e.g. in the root node), the root interrupt
> controller may not be detected as such, causing a panic:
> 
>     OF: of_irq_init: children remain, but no parents
>     Kernel panic - not syncing: No interrupt controller found.
> 
> Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> parent") already fixed a first part, by checking for the presence of an
> interrupts-extended property.  Fix the second part by only calling
> of_irq_find_parent() when an interrupts property is present.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
>     controller handling"[1] to relax dependencies,
>   - Drop RFC.
> 
> [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
> ---
>  drivers/of/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


