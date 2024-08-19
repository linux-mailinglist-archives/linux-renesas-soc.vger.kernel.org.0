Return-Path: <linux-renesas-soc+bounces-7921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE609571ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A8A71C2321B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C00188CDA;
	Mon, 19 Aug 2024 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/pWKgzm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451E175D38;
	Mon, 19 Aug 2024 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087739; cv=none; b=adYiV+8wZGMU+V5rCfqZRII9fKaP24SFF8rYDxETe9SApVcVYDhTsIDai++pLWVDPWmD7PiagR0WWB+0JRYIyhRAJFo1nR2yLm/KjDWGf1uCxlefYKrZvB9fZO8Kf3jrB3hV5/OxUGi2b6jGZUlBDpG3t+6JGS0m3gbiCqgREKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087739; c=relaxed/simple;
	bh=61Y0JjUridhLs7Vgbb05RwyRB6WTgz2K5OLWGX6IuHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoZXX5JrnOBr6JGwx8UCXuX7lqGwJbkBKvZV5FCki+KF2kObesqG3CUdODZuxiu7qpSydr522zIQ6ZGV2Vysy6XzR9B+IMmba8bRVCabLQ8vZrFEq5WQNUvr7vvbLgdjjIjXMU1IH2yekrZGGMrzT2hp528TkgHhYCcB3TaFz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/pWKgzm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D107C32782;
	Mon, 19 Aug 2024 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087739;
	bh=61Y0JjUridhLs7Vgbb05RwyRB6WTgz2K5OLWGX6IuHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/pWKgzmPUvBqH6DEtRkj1w1uytDvL2lfIHTUcKfoyg+iyjxrUe8pGYuqUtJT0h5Z
	 Ld3SBO/ViehEbNaPZS1I5bmn91vxQk/BHCB2KKY213plRi28BO2j1WHJ5jSp5lx2gD
	 02AZA+okholOShsiZoyy7yf1HFASsGRmrQ9BrRb1DXJqqMUxxoKqkiESrZ7u8EraZs
	 WuHM2kV4KeV5tix/aNCRdHb4xUUTuRgInFIjoH1hw9fT9Sj7QAmBzhQSOSEjZZrgfw
	 YFaq1RYHaz4wQfLPENhRi1SsoRl+wRi61jydSC3iSTyYmZGw8lsFqgDDTIA3ZeJ+Da
	 DwkLj0Smfi9/w==
Date: Mon, 19 Aug 2024 11:15:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next 3/4] dt-bindings: net: renesas,etheravb: add
 top-level constraints
Message-ID: <172408773694.1700045.800574322458120654.robh@kernel.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
 <20240818172905.121829-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172905.121829-3-krzysztof.kozlowski@linaro.org>


On Sun, 18 Aug 2024 19:29:04 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for reg, clocks, clock-names, interrupts and interrupt-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/renesas,etheravb.yaml        | 29 ++++++++++++-------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


