Return-Path: <linux-renesas-soc+bounces-25584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E68CA5708
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 22:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B95693058FBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 21:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4D929B8E8;
	Thu,  4 Dec 2025 21:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riz4+2y7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D074027FD75;
	Thu,  4 Dec 2025 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764883210; cv=none; b=ncoWfF3Q0sTWYAUetBrLCVIO6KbYHCrypyFgOSQF/NVGyKtisYHJ47OyROhLw2HcPb+FEvhBqEtNPi68UWSe0v728PgW5G0VYo1vmTaY9WEFKowsY8c4c926eEIQ0cLxhDPUX+vBRmkpQ+9TnEq+pb5FF5GK/OmFXFOXZOKTMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764883210; c=relaxed/simple;
	bh=oTNN03FeypdN3e0UDxq8gEL+TcuIFPhL/RVAyMycBNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoBeCpSB706wB7pYbI55s9qy9tMBhpi8UVHWnlkXDRmLghdVQRIj8oaXUnUhpHOYiwbvSy0i4cdzKXO9ST3cO4uQ7iC/8OlshYFWv20gZIx1CLvY6jEpMUjn339/jyQGMFr21ksuW/86hy+SyOyY51jYUOaGLKwwvNA5UDTm2tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riz4+2y7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10308C4CEFB;
	Thu,  4 Dec 2025 21:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764883208;
	bh=oTNN03FeypdN3e0UDxq8gEL+TcuIFPhL/RVAyMycBNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riz4+2y78l9s2wmlwrXG6Y8wkkDXGBlyG4/64laGbsyD2awR/5SVCsqKLsFYbzAUs
	 b2sEDQHyz0VFppzz5oTVvHG/5wJmPx+r7qqJUZJhKp0Aaj0rLA41N270qri3A5SvbU
	 +oJ/opz00jtX/XPRq8US98fZOeH39f4u8yqKPOGV3mrC27RUeQdi+UaRPlZNa9DQFN
	 m691BTJ2tMXaz5Q3gc16t/69cQwH4gS495lJSAbfW2upEto1dK/McR151iv1GLYcAq
	 YIhtSk13+/SlzxWo+OC4twhk5+mXTBpTlEMmBHGReepWHwnr5HqJFA1krbs2kyOs/s
	 YW3xGUJc4lATA==
Date: Thu, 4 Dec 2025 15:20:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: interrupt-controller: document
 RZ/{T2H,N2H} ICU
Message-ID: <176488320473.2186706.13039539989688506035.robh@kernel.org>
References: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251201112933.488801-2-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201112933.488801-2-cosmin-gabriel.tanislav.xa@renesas.com>


On Mon, 01 Dec 2025 13:29:30 +0200, Cosmin Tanislav wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> an Interrupt Controller (ICU) block that routes external interrupts to
> the GIC's SPIs, with the ability of level-translation, and can also
> produce software interrupts and aggregate error interrupts.
> 
> It has 16 software triggered interrupts (INTCPUn), 16 external pin
> interrupts (IRQn), a System error interrupt (SEI), two Cortex-A55 error
> interrupts (CA55_ERRn), two Cortex-R52 error interrupts for each of the
> two cores (CR52x_ERRn), two Peripheral error interrupts (PERI_ERRn),
> two DSMIF error interrupts (DSMIF_ERRn), and two ENCIF error interrupts
> (ENCIF_ERRn).
> 
> The IRQn and SEI interrupts are exposed externally, while the others
> are software triggered.
> 
> INTCPU0 to INTCPU13, IRQ 0 to IRQ13 are non-safety interrupts, while
> INTCPU14, INTCPU15, IRQ14, IRQ15 and SEI are safety interrupts, and are
> exposed via a separate register space.
> 
> Document them, and use RZ/T2H as a fallback for RZ/N2H as the ICU is
> entirely compatible.
> 
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
> 
> V2:
>  * move reg property after compatible
> 
>  .../renesas,r9a09g077-icu.yaml                | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


