Return-Path: <linux-renesas-soc+bounces-7920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D499571EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3394E1F21F41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A3F181B9A;
	Mon, 19 Aug 2024 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqnYrRtE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685EE175D38;
	Mon, 19 Aug 2024 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087724; cv=none; b=HIxY2pXprQJbCsyu6PnGPhCkvSXgvDKAMD/JK2AkxI/f/eJK0ocKQTeD38cC7kJ1DuEDf2HGs4TNktufMwnFlhbBp4kov+sCvzQeqvGNYstvPHVuF9/VGZMBRKGoMm5XDYU+ykzP7bmGh9WfJFQrk7HHWqTgmtl6PX8rLeKTVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087724; c=relaxed/simple;
	bh=udTdekh4LnZq31jsqnNO6CLZAotYHxV+VVWUpWfDues=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQ3Rtyr2NMN8vbUzVGeAFuLc2vIsBsGFY6SufM7pb5ADY9EiGmzNwvgARl9wqqd9I0Z5IBmDFyKzPb+sebDy+PwVPRrtApOf0lh871dS1+pda/5khzLDuU+gEtRAg3wUS7jziyKU8ugX2VeTMKQUD5RV6JCqxWIRYgysSdGpK+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqnYrRtE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8334C32782;
	Mon, 19 Aug 2024 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087723;
	bh=udTdekh4LnZq31jsqnNO6CLZAotYHxV+VVWUpWfDues=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqnYrRtEk63eA+djUezWmBTNOwX+aI5mz8nZu1K4314tDdOIBXOO1xLFT1lbbvhzn
	 UPdnI8K0lO1ifnqnNv6CKISHq9r7jpgAbHpcdEq4KsrC96LptUMigiXeIMu6ny/gYM
	 VI6Ga9YAskgU97rTqgkQBielFDEO7X6uDJ5xqIanair71cMjEeoZyNIwn9XobAk4FI
	 8n+Ot6FcNnNsXRL4fCoBe6G8kEVeORotMPRgKNF5DVx+0bjteWzJTu5GJ5mx52nHD3
	 iy7vSbDsGiGPMlUznK/Lgij9yKq5ahVWsia2aI/HSrV61nxqfeRaWuObTM8WbCTDtx
	 FleLrJaIHgY8w==
Date: Mon, 19 Aug 2024 11:15:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, devicetree@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: mediatek,net: add
 top-level constraints
Message-ID: <172408772099.1699601.13503092199096446206.robh@kernel.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
 <20240818172905.121829-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172905.121829-2-krzysztof.kozlowski@linaro.org>


On Sun, 18 Aug 2024 19:29:03 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


