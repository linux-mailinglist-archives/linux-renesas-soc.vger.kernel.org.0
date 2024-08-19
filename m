Return-Path: <linux-renesas-soc+bounces-7923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27265957235
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C332B2DBFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E88518B48F;
	Mon, 19 Aug 2024 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdwbf33i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6AE18B47F;
	Mon, 19 Aug 2024 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087749; cv=none; b=HIJC2+mxc3cmnhp4vEFZljTIxHa3ptjuXaY6ms31Ftva16ezRZiokhZmCbic4PlOwFnsPzQ9kPEJVpBNEBRUjzW/VrTYIH8PQtbRz2kHlM2Z/Fd7XSLEE2bBT4wCtzbHouG34CBu8g5ES325xxykWquuqTsRh8Zl2jFa2lHJZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087749; c=relaxed/simple;
	bh=iAc4Go6gGj1yfEzYX9FwCyQdx12hEgORikYJg534+cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsK+7N0023LKB1oefiu3eutQe+tCKXPQN0Kxt3WuRAvWwG7ivHA6GzW8RsAGQDZOlfzqDNYz3IMVCwvwRKHInghjDT4MlDoHutATNwxYxwbb2/PJeCwY+2J6UJ6uhzefFzduoHaJAr/NevPLlKBk2aZrPHvdlfTOghNdtQ94Yas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdwbf33i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC76C4AF0E;
	Mon, 19 Aug 2024 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087748;
	bh=iAc4Go6gGj1yfEzYX9FwCyQdx12hEgORikYJg534+cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qdwbf33iX7zKKXHhm22kZjyl1OCaCkbh3dR2JQvdmTvUB0mhkeyRet2tWG4BHMV0x
	 oafJsUe0jN7oKCgXhWT2w2yggZPMB1kt68svcSVNjOQLeHVlUL6jkNlY3fHgyua85R
	 45JzgoTzwTQJ2DQQiL5jSqemwc8QDdqO+I/JcYd7yKDY66+Lyd/mYMs/bFSR5AwzM0
	 ylZwyFQEufK+2dG7BoCy7lbUKJnV5iW1UHMRG8q5DKsQcNKMgZWiLWb58fPfhHdtrZ
	 M4sukG+s1tqrG9hVgKgLFaqg1Alszu05ykKq91SWVyRzItSw1ogbqRL5n/hRE+TtN4
	 1xAQhdE0y7i9g==
Date: Mon, 19 Aug 2024 11:15:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 4/4] dt-bindings: net: socionext,uniphier-ave4:
 add top-level constraints
Message-ID: <172408774631.1700340.17970674186244279627.robh@kernel.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
 <20240818172905.121829-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172905.121829-4-krzysztof.kozlowski@linaro.org>


On Sun, 18 Aug 2024 19:29:05 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clock-names and reset-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/socionext,uniphier-ave4.yaml  | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


