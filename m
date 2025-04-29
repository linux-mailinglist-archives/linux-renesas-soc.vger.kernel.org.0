Return-Path: <linux-renesas-soc+bounces-16465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB79AA0F76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 16:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6130B1A842EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 14:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82189213E67;
	Tue, 29 Apr 2025 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="hyHYGP6P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2773D17588;
	Tue, 29 Apr 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938132; cv=none; b=PoOT9fG9wrVoDc4wTIu6SYxbLjSd1flOr/CkmP3HmXa1qEmBx8cVtVz7cAnUkdpOBHfHn8QxtkaWRU1GIK/cXrc0cO1WyPppvE/hPFZ+tdNxrQ2F/z5BAFAhDu2XQZ2yO3GRo/1fJF9t1+lYd5F3L3dS4F8N0P29dTFEjj8JuwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938132; c=relaxed/simple;
	bh=oRNnnrKfvMB4H1OFL2yJMG5d6+mfssjvCvQkeRgaUD0=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=jLLXFATkOa3E/lK8JSA7nwfgugcWAgMZYix6JX5X+aXEKvElhDiqxhjNGBxFhx2MLNtj8MrbrRVD6hVzJUSxQKf06xfAUnK9QCQUR2HHbYquI62otG82Gd5lrRoLqwaAiLfClEqTIwzE6A/JtgoFqeQ/T10qT1+6ET55L+iR8Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=hyHYGP6P; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=eHqUkt7UJKIIILzl5IsZ8pSRFP8K0RvUiP7Kb3bGmWM=; b=hyHYGP6PdBOx/kyS79n0aakn/5
	M1gPdPU8xqoR/Q2VGFhLc+fj61VjGuIiQH4W3jIik9IPXJ/+W2TVDGZ9nVEPAWTLTUE8uAhX3aA5O
	rpaJ2Qq+xuHdHpAsDUC38bMzz70bp/KuREdHqe3ftAx0rxH/zsF81STIE7V9x69TLBXE=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:57924 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1u9mGG-0001yT-85; Tue, 29 Apr 2025 10:48:40 -0400
Date: Tue, 29 Apr 2025 10:48:38 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
 geert@linux-m68k.org, paul.barker.ct@bp.renesas.com, Geert Uytterhoeven
 <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Message-Id: <20250429104838.a8da03da8f30ede5adc38765@hugovil.com>
In-Reply-To: <20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com>
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
	<20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -3.1 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v8 01/11] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Thierry,

On Tue, 29 Apr 2025 10:19:43 +0200
Thierry Bultel <thierry.bultel.yh@bp.renesas.com> wrote:

> At boot, the default clock is the PCLKM core lock (synchronous

lock -> clock?

> clock, which is enabled by the bootloader).
> For different baudrates, the asynchronous clock input must be used.
> Clock selection is made by an internal register of RCSI.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  .../bindings/serial/renesas,rsci.yaml          | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> index ea879db5f485..aa2428837a2f 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -35,10 +35,14 @@ properties:
>        - const: tei
>  
>    clocks:
> -    maxItems: 1
> +    items:
> +      - description: serial functional clock
> +      - description: default core clock
>  
>    clock-names:
> -    const: fck # UART functional clock
> +    items:
> +      - const: async
> +      - const: bus
>  
>    power-domains:
>      maxItems: 1
> @@ -58,11 +62,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> -
> -    aliases {
> -        serial0 = &sci0;
> -    };
> +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
>  
>      sci0: serial@80005000 {
>          compatible = "renesas,r9a09g077-rsci";
> @@ -72,7 +72,7 @@ examples:
>                       <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
>                       <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-names = "eri", "rxi", "txi", "tei";
> -        clocks = <&cpg CPG_MOD 108>;
> -        clock-names = "fck";
> +        clocks = <&cpg CPG_MOD 108>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
> +        clock-names = "async", "bus";
>          power-domains = <&cpg>;
>      };
> -- 
> 2.43.0
> 
> 


-- 
Hugo Villeneuve

