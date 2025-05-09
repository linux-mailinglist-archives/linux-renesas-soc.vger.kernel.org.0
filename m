Return-Path: <linux-renesas-soc+bounces-16909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C2CAB1CCD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 20:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37B563AAABA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 18:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B635D241136;
	Fri,  9 May 2025 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVhH2BHI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825252163BD;
	Fri,  9 May 2025 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746817140; cv=none; b=u2JLdl9BNW5B/bbsXfiR/d2erbGLlecfYxR9Vr00pm3NdRTMD8Q5AaT7Ncuyqfr6Whcdc4z6CIlUCnRIp9fn4g94fKlcvtTtv2lg/CN4OgucnOkQjR9eLYO67aMd+Y6wmh8BnbV+a2G5b50A/jozY/LkbzRqysnqRd6dWPxmAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746817140; c=relaxed/simple;
	bh=2uB/UBFl793LBBu1ZjcvTxD2vU/Siid954qLuejgKi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPYdkqcICk5isGLmlsqkFDfvHqckhJSb8qyXdg46kPid5KV/g5L/LvbjHXYR6lRkJw4umZxOOshg1CopIKyz4phXIIoUpDVDn6p+F/xn8/sV9dMAao74FyKW3jP/73dh0URg9s3tWddflRO/AQVdun77wdWbxpHsN6AvtnlM6/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVhH2BHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC39C4CEE4;
	Fri,  9 May 2025 18:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746817139;
	bh=2uB/UBFl793LBBu1ZjcvTxD2vU/Siid954qLuejgKi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SVhH2BHI4tpEYlrAAjKW5lF4U+VKFye9Zo6vkmk3O/RPuv95MPzH0VVgxPfpWYdXA
	 /Koe4qjNW+YgVlSGjyMqWft+N7o8XzTY9NQBXvZe39yUCFpRkHNU/Ax9ScTLUFeiZa
	 SvwWKp9oS/sBi4gq8xIMlbTGPH4FHTfwYKkfvhpRySwopHFvspsGiht893wYvD/dFU
	 2xKMQ1chxsNbDZqkRgihROhho1fAFyNAC5E2BbdGrZ4anu9M7sPmBCbs7LX37IVz69
	 uZdkTNZ+uzXOc70LV+8ZPaBBzKXJIcm+fN/SrLQnULtZ33mUxWy+7HTFBgbHr02BoE
	 Kx0xNudMuWTeA==
Date: Fri, 9 May 2025 13:58:58 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 01/11] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
Message-ID: <20250509185858.GA3933854-robh@kernel.org>
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
 <20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com>

On Tue, Apr 29, 2025 at 10:19:43AM +0200, Thierry Bultel wrote:
> At boot, the default clock is the PCLKM core lock (synchronous
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

This is an ABI change. You can't just drop 'fck' without good reasons.

Rob

