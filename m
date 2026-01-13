Return-Path: <linux-renesas-soc+bounces-26652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A24F2D17385
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 09:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB922303199B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 08:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A17F3793AD;
	Tue, 13 Jan 2026 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmE3/pIY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256423793A9;
	Tue, 13 Jan 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291738; cv=none; b=mf6T29UWFRO/6Pfwd6vLn8dEs5s5P94sK+UpVKjOqT4D8zp+cxskM/7cxDvreaVoAZWy/F2hwB7vtX48ItrzpQzrBUFxdVbC8JsuGt93rjNlFplAY/3dBo9mXhCjhYY0o240PWtOvn3SX1IhiSfy6Y6bMj/M1UvVYl+/UmMs+QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291738; c=relaxed/simple;
	bh=nEkrc/Oh+3NzIyLSk2QgA+bYBseCe2JUpKmxyygTlN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpQxWp0LVfvtSk1M51bRl3H9i73IHbHVQIQ1LOLBCODzfiGC55eQsml58MfC3brS19EUNk69MVTj2JwLGsNfxgAKmcF31hm0e1iYsdYAABcMdC81yHTeOQotYCnsE4nWNfvzU7NqTl4HJ2DVC93LvGJMnqGCK4jg7IjL4lKyDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmE3/pIY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D3FC116C6;
	Tue, 13 Jan 2026 08:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768291737;
	bh=nEkrc/Oh+3NzIyLSk2QgA+bYBseCe2JUpKmxyygTlN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmE3/pIYfU+TK5k2ZGmULC/Fyzu71VBQYHos9zhKooJtn4+FADDVsyN/D1q+dbr7F
	 mxqAlZd29Dk644UWZgoieMaWZw/YvecGgNUKRe06S2ukA+2+ZSIOBEQ5Btpyv3tBJs
	 tPpHzrgjj5ODKWOqfO3h9LdTLqNjwKzGa5wNYj64FcsIG2ZSLC2L5uGOl0+6zsj9om
	 dWWRl1z0g4aRFA953uXWlv1cG7eNuEuoRtIllyBP7ZFq2nVsuuAM2EZAommdC8YTNA
	 Q/wmoi3dHDsoVBM8kpU1nlN53mMaBlayrXVo/NEXESeb+BVZNTrAaNXadIgBQTGkJA
	 fI8om3OHCXf9w==
Date: Tue, 13 Jan 2026 09:08:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: serial: sh-sci: Fold single-entry
 compatibles into enum
Message-ID: <20260113-jolly-pug-of-serendipity-d3538f@quoll>
References: <20260112095722.25556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112095722.25556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Jan 12, 2026 at 09:57:22AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Group single compatibles into enum.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Dropped "- items:" to reduce indentation level.
> - Added Reviewed-by tag. 
> ---
>  .../devicetree/bindings/serial/renesas,scif.yaml  | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


