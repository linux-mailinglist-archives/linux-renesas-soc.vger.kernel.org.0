Return-Path: <linux-renesas-soc+bounces-21002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE9B3951F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 09:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4358F3B49D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 07:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7561A21CC61;
	Thu, 28 Aug 2025 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="si8sV6//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A530CDA9;
	Thu, 28 Aug 2025 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756366043; cv=none; b=uMXA6uXXIAYfdwcKPi7ESoO3IAcfRS0eh/yfxy9iE14x+9X+NngtATh5Myzf2vj+QcfDBBEgvF6UQyXZHYuMjTFPtI9x2NEwfFDOSlSdk1AYeB+YtsZHucRSCHtCRXkL0LaImOD7xycjGjAL5slRZQxbsSISd/BcUYjplm7LqVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756366043; c=relaxed/simple;
	bh=xa14BhdchDFjYxmd2h7TTTS2JN4IdK7yK+ggkciPNes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ox0zPUNRoDLghVz0Kd/TcOpdhmQsH9guv2SRQnHArFThkyIsNVKxElybK9x93P7m27wqsztNMW/tUJ3DNRKUsziFY8G4R9OYCyxNI2hst8L8/rlsGpIEIIwljcasCVG7PZovBn/bQySoRCI/pghd9W710rix9tq2aLZ5ctXEb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=si8sV6//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C844C4CEEB;
	Thu, 28 Aug 2025 07:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756366041;
	bh=xa14BhdchDFjYxmd2h7TTTS2JN4IdK7yK+ggkciPNes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=si8sV6//UAwICGyYnYyZShPh3pKI2nIbP7ulu1tJ3espIjD68zScXxD9ZshaBdEVf
	 tqPO6XdzyVFCnvNPLxYMHoip9Ls0HBMyCIs+rWRz4Bb+w+/wCwJiYI36b251KmF3Ne
	 YJB4uYQdAgKSekZ2t3jPRXLOt/sL9mr3TekSa3U8Xuo2iCYW70ISpXcSmu/BEzNqM8
	 QOH8rxDvaEmYAtZf5aOjKv9gmWjrKFxFFox6+qyI9oCIwvLgREmyfSXPw47hnJS85c
	 9jJ587fqvCYc+Mxv30f36LlvIc0ujwSt0DYvSMM1R0iuiJHKrAH8UJNk/DSJDyD+zW
	 alElQNYFKbaDg==
Date: Thu, 28 Aug 2025 09:27:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: renesas: Document R-Car X5H
Message-ID: <20250828-esoteric-vivid-raccoon-a86c9a@kuoka>
References: <87ldn4uyof.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ldn4uyof.wl-kuninori.morimoto.gx@renesas.com>

On Wed, Aug 27, 2025 at 11:34:09PM +0000, Kuninori Morimoto wrote:
> Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- add empty enum to avoid allowing invalid use.

I don't understand why do you need this. Where is any user of it? There
is no such in this patchset, so this must be explicitly explained in the
commit msg.

> 
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index 5f9d541d177a..e2fec2afbc6d 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -473,6 +473,12 @@ properties:
>            - const: renesas,r8a779mb
>            - const: renesas,r8a7795
>  
> +      - description: R-Car X5H (R8A78000)
> +        items:
> +          - enum:
> +              - {}               # avoid allowing invalid use. will be replaced to actual board name

We don't allow such cases because it is pointless.

Otherwise explain in the commit msg why this is needed, why exception is
justified.

You have entire commit msg to explain anything unusual and if you look
at source code you will not notice such syntax for boards, so clearly
this is unusual.

Best regards,
Krzysztof


