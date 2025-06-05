Return-Path: <linux-renesas-soc+bounces-17876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0ACACF22E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 16:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2C71175A5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 14:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B99815A86B;
	Thu,  5 Jun 2025 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecu/x/rR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2818578F2B;
	Thu,  5 Jun 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749134363; cv=none; b=UoM/l8brsSk7LlvRtbYYmqokh3qSCzrvFjyYlcd014Ju45dXFbx4ShMe3Q/dd4SZTeTOc4zM2/BpzRGF0ZLef5mgCDE68SJ9RfAZJNxJ3fOGV9zbanDMXQfkgCwR9ljGuVKKO5cXChiYGA3kfnO/iwI+diRNnESan5ZMLStKtx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749134363; c=relaxed/simple;
	bh=Hf3Fh9gEp1P+PTJfdAgSS2nwgQSjZ7bjZZw4KUfHBuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi4dJOQIIJGMVZE5XNnbsIR+ZFiCSh5rAgAUU8jRhhYbTX22VTn7YNfS5/N4GNes578xlYLFQCvGuLUaAnWqrcT0W8FdQEqdY4YkYHSUcU4SO0kcYSzJmk2ZNcB+rm2A2kDMU9ujxmzDf9aIcksR2yFTzlffyixO2vTSrY82BzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecu/x/rR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3312CC4CEE7;
	Thu,  5 Jun 2025 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749134362;
	bh=Hf3Fh9gEp1P+PTJfdAgSS2nwgQSjZ7bjZZw4KUfHBuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecu/x/rR3vq5mel//5ty7JjZSiBVTxDdK6q9qvPzn7MmFrIcFn6MKMvTNITkUS9KU
	 hV3PUdvbWZ9a5kUT/O16aZ+rJ7QT51vtscVM+/2CfTea3aHA/TaEWQNB9Eun34kKl3
	 NMKHX1hPYJdDSDKvtw0V0Zei7T/3ikg0VvPaaFVsG+UhEJuLP8mXWK2tRWs2vTsAtR
	 bgjeUZDU53Ev7RZ5BAy0tpv+tMY4Y7q+hp4zFQkbAXbwEjVOS188sJFkIKh4tEapWH
	 ec0wJq/g0zGgOnEA5mmGMft0FUyvFJp5GsTev/JAAdw1f6jJ9usDOo+3+yptG7GYH/
	 3/iLm9tn6uYBg==
Date: Thu, 5 Jun 2025 09:39:20 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v10 01/10] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
Message-ID: <20250605143920.GA2458810-robh@kernel.org>
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
 <20250523142417.2840797-2-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523142417.2840797-2-thierry.bultel.yh@bp.renesas.com>

On Fri, May 23, 2025 at 04:24:05PM +0200, Thierry Bultel wrote:
> At boot, the default clock is the PCLKM core clock (synchronous
> clock, which is enabled by the bootloader).
> For different baudrates, the asynchronous clock input must be used.
> Clock selection is made by an internal register of RCSI.
> 
> Add the optional "sck", external clock input.
> 
> Also remove the unneeded serial0 alias from the dts example.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v9->v10:
>  - mention sck in description
>  - no maxItems on clock-names
>  - fixed the #include dependency in dts example
> Changes v8->v9:
>  - typo in description
>  - named clocks 'operational' and 'bus', and added optional 'sck' clock
>  - uses value of 2nd core clock in example to break the dependency on cpg patch
> ---
>  .../bindings/serial/renesas,rsci.yaml           | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> index ea879db5f485..1bf255407df0 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -35,10 +35,15 @@ properties:
>        - const: tei
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> -    const: fck # UART functional clock
> +    minItems: 2
> +    items:
> +      - const: operation
> +      - const: bus
> +      - const: sck # optional external clock input

You can't just change the clock names. What happens to users of 'fck'?

And you can't make additional entries required. What happens to users 
with only 1 clock defined?

Rob

