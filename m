Return-Path: <linux-renesas-soc+bounces-21605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CEBB4A422
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 09:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B9121881E25
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 07:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9AB23956E;
	Tue,  9 Sep 2025 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adpJOIun"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690E22172D;
	Tue,  9 Sep 2025 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404090; cv=none; b=kqWNidlnt/TWZeFF5MsFfaHz0UIOt+PpLPZNkXqXY/QWl1csv3b1SFoGaY1WfGCJCU18rCQu/yFlaiXU1nmnUR9HVah2iSCyndyIuhC00bNACDl7XfyGGaZSWG3HmlNo2fI8WdhKsDZXdXDQIDT03Z2T571los+sGcTW8HWEOzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404090; c=relaxed/simple;
	bh=zyjIU5ehiXutrMnqPmc3saBZKPWLkUOacu6S4S83g5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaqrHq14qbCfHiUGlp4a8CFQQoh3pGqM+Qqoz2wQi57ukOmp4M/595IiYcoTnb0TM8LozA0kpkYBVwKhKxEdIIkuB0p/KvkJ67vZ6tdWwNnvJVBTfi8/xTRBUolFJIyIu+8i4NGA+C7WUl0SgWdgQZ+meE8Mm7AXU27efilO0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adpJOIun; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06E4C4CEF5;
	Tue,  9 Sep 2025 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757404090;
	bh=zyjIU5ehiXutrMnqPmc3saBZKPWLkUOacu6S4S83g5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adpJOIunBmny9dax3l/4mNN4DIeHD7Ro9v757IJkExOaeg1HczCaLzbaojtxKv1HP
	 OdXQIedEb2BPYV9iIJytzOIilua7wu6Fd5CeL1QVzvBzlU2PgOFNPVGr5vWGCAW+WM
	 GBD3pwrvP93DxlJw24CYgVws8MZK+9bml0paD2KML0eCzYOvDYH3AumTs682oc1PaA
	 q/2yfs0Oqj49IXwGsV/lV2eKve4JOeBKuvXz26pbS5ypsad3xX84x4SYaBcPclJUAU
	 BdWPU3yp4HTG40TcNMNvvWmE4SAWAl0VnG8vF4BPIs7btoyafPUQAo/SeJ5Gnc62E5
	 2GBhNs4hF8stg==
Date: Tue, 9 Sep 2025 09:48:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: renesas: Document R-Car X5H
 Ironhide
Message-ID: <20250909-terrestrial-archetypal-slug-33cbfa@kuoka>
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
 <87segw9z6z.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87segw9z6z.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Sep 09, 2025 at 01:44:53AM +0000, Kuninori Morimoto wrote:
> Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC,
> as used on the Renesas Ironhide board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


