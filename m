Return-Path: <linux-renesas-soc+bounces-19392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDB5AFD00F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 18:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C236C165074
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 16:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E6E2E424F;
	Tue,  8 Jul 2025 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egs4zIuY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9582E3B03;
	Tue,  8 Jul 2025 16:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990783; cv=none; b=c4C1ARosV9m62j4Zu0L/Rm/wvXgQ/JFGHgxNB42tyEPDxkt4Cbs1WOyOIoo+3AwD1NkotUVwHA45VEbzSpdKAKqRR9NfNymzd16Z3PWl7Bjv4T0rwOghqM+7DFaHHWwug41maekWnbQf8+AumsLTf44skCBjH3xwLJC1XUGxtEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990783; c=relaxed/simple;
	bh=bwDss3LX8Ypcqtq7jxcfxHWBD9WVWZPQFO01VPVX6RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nI+FgjfJL4YR4XOcayLeXGKoHaSDuGQqTLDQP8rl0/Ic6FQ2VLu+S8h+SyVqQk9B9iho8mteeGAaUCuJ2On2gS7ASGUKYhBVOAI8+MV0tMMpqBnqxLRgbvJdiZjUVf0xsz0ikEdYFb7RvJh8FDyzMRTi9fJo1x5ZLwcBNyrFOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egs4zIuY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE59C4CEEF;
	Tue,  8 Jul 2025 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751990783;
	bh=bwDss3LX8Ypcqtq7jxcfxHWBD9WVWZPQFO01VPVX6RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egs4zIuYkMC5P5GewiEg8xuIRDlWKYVAMIn0dxV2XlcDy7sBLKvL/iEWG0qSUaDZU
	 2w2vRUdyouzEw8U6fz3Bn3CCVsZ0yUh6g0gLsoWll1vtw0LOPPjte3MfSsSf68/hmU
	 OWa+kqdoe6bWlc30n9Jf2jBjYpI1xGkjc/2JN1rWoYxbr5JsD0ZfbU5FEQCmjtnsTq
	 LsOkJdW5PJLyczNWrNa2NMEYTYv9/pDzrK571ympsffTXuFzGDyPMa7truRTNd8n5Z
	 ZV74NiupoEleMaHvPWmERKWBwk7u3ZzBEBx0/LOrco9xZOyaSjF3wsW+Z+lWopY6jU
	 2Rnbgu00/pusA==
Date: Tue, 8 Jul 2025 11:06:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v14 1/5] dt-bindings: serial: renesas,rsci: Add optional
 secondary clock input
Message-ID: <175199078171.503919.4967406677293355458.robh@kernel.org>
References: <20250630202323.279809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250630202323.279809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630202323.279809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Mon, 30 Jun 2025 21:23:19 +0100, Prabhakar wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> 
> Update the RSCI binding to support an optional secondary clock input on
> the RZ/T2H SoC. At boot, the RSCI operates using the default synchronous
> clock (PCLKM core clock), which is enabled by the bootloader. However, to
> support a wider range of baud rates, the hardware also requires an
> asynchronous external clock input. Clock selection is controlled
> internally by the CCR3 register in the RSCI block.
> 
> Due to an incomplete understanding of the hardware, the original binding
> defined only a single clock ("fck"), which is insufficient to describe the
> full capabilities of the RSCI on RZ/T2H. This update corrects the binding
> by allowing up to three clocks and defining the `clock-names` as
> "operation", "bus", and optionally "sck" for the asynchronous clock input.
> 
> This is an ABI change, as it modifies the expected number and names of
> clocks. However, since there are no in-kernel consumers of this binding
> yet, the change is considered safe and non-disruptive.
> 
> Also remove the unneeded `serial0` alias from the DTS example and use
> the R9A09G077_CLK_PCLKM macro for core clock.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v13->v14:
> - Dropped using `R9A09G077_CLK_PCLKM` macro in binding.
> 
> v12->v13:
> - Rebased on latest linux-next.
> - Updated commit message to clarify the ABI change.
> - Used `R9A09G077_CLK_PCLKM` macro for core clock
> ---
>  .../bindings/serial/renesas,rsci.yaml           | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


