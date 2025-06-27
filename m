Return-Path: <linux-renesas-soc+bounces-18858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62171AEC0EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B51064680D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEF621FF54;
	Fri, 27 Jun 2025 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5JLU9Yk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DE21CFFA;
	Fri, 27 Jun 2025 20:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056027; cv=none; b=LZlCd+514zpe64cVuw9mpDSP+X3yay1aZucHssnHz99FYjuRn3QikE8jYvwHBEDcCS9cCOUeyfUPum9DB0+wsHP0RdHHiTydQksOGqrGohMHlBPO+QWH0s6LmjKB6dU+P+h/oAbjQGpJPFJRp7dJQ1N3qS02EdE40JqAvF/fgic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056027; c=relaxed/simple;
	bh=qNK7dEzaOLJvdesOTwk2VkOCP9fphOf7o6LF1BKG/7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l690JTEOk0Mpf8hq76bSuYFUlQhJuKJUr+0zJDraUuoxT5b2VGMUlZXrzQpw+lI9UqHKlBPFS6hnPNPtFyCsOD8SZKY3dBoZjXJTV/GE812eoRvOxYbFYbne6GHGTED5r/unPD+JrtLBZEZnabhm4FcMGZT8tTM9RwLoTNAKV2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5JLU9Yk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444ACC4CEE3;
	Fri, 27 Jun 2025 20:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056026;
	bh=qNK7dEzaOLJvdesOTwk2VkOCP9fphOf7o6LF1BKG/7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5JLU9Yk6eFPEMyC4qi89NEH7glV4esQO+Mz0b9VH3llwUdMe5GGI7Kj3YttFYy0/
	 CTeDp1FCYG9GdeXBfsywrvq/Zqvm7GtThajWvVZ2a6QCgEP0y95W7W1VPRfdDpHNny
	 c+656w7btHu3MkhFqy4RxtysCUKrmiZIePoW8z0DIOJG2UffJut8YM/wCsTn3onP4y
	 6FVfOU8FJxY51D5GFhSJY17hNmkiCLHTN2iWeKzwsmkC1wlI87tRuzSQazaRWnmN+m
	 D6mpn3v6W17lpgHVQz7jQibrVWeduAqm9Qany/cP8/BXtOAl6lYzPNAgiif6nqHvC7
	 LreOYvSGFzFkw==
Date: Fri, 27 Jun 2025 15:27:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: memory: renesas,rzg3e-xspi: Document
 RZ/V2H(P) and RZ/V2N support
Message-ID: <175105600974.27885.5771735601508516833.robh@kernel.org>
References: <20250624171605.469724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624171605.469724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Tue, 24 Jun 2025 18:16:05 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document support for the Expanded Serial Peripheral Interface (xSPI)
> controller found on the Renesas RZ/V2H(P) (R9A09G057) and RZ/V2N
> (R9A09G056) SoCs.
> 
> The xSPI hardware block on these SoCs is functionally identical to the
> one on the RZ/G3E (R9A09G047) SoC. Therefore, the existing driver can be
> reused without modification by using `renesas,r9a09g047-xspi` as a
> fallback compatible.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/memory-controllers/renesas,rzg3e-xspi.yaml  | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


