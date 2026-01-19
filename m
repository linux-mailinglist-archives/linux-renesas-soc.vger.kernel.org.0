Return-Path: <linux-renesas-soc+bounces-27057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7318FD3B323
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 18:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C658315232E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3AF28B4E2;
	Mon, 19 Jan 2026 16:53:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1C3205E26;
	Mon, 19 Jan 2026 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841631; cv=none; b=TJe1lxrCmcmY+UWf7xrk/1Lll0oLb+wS/v0I0ggqc6bc4Wm8GiFlZrh0zBDU2llTzU68y3XgcInSTfKVTcbOvKd6GPltZAb0f/lDjcD5XoFeI4KP12LZow333qVuQ38E9yAt4H902F8z3bZ4tnNY2UdSBcwl1bhXJL0ut3x4O7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841631; c=relaxed/simple;
	bh=Lx7nU541fg63Tqa5seH1+HCh9qVu9ysDQ7vKMlMIwgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTfcJ2Ugu1LEr8a8XpOU8+w4TupyFARUSVb2BG/juqZrXfulcT2wLUuKV1R7dv7x+8nkMfxCzAWtpv8JpCFlebJRjBZYHtcf36o/T6N4XrAewwvtF9WcT+a4fgu6RcDcYn4P1oSeXbi0ivyrjTF//ZMMG4YBonGJwOJtVHZeC1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE1F497;
	Mon, 19 Jan 2026 08:53:42 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC76C3F632;
	Mon, 19 Jan 2026 08:53:47 -0800 (PST)
Date: Mon, 19 Jan 2026 16:53:45 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, "Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <aW5hmb9tyw1Gv388@pluto>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>

On Sat, Jan 17, 2026 at 02:02:28AM +0100, Marek Vasut wrote:
> Document new property arm,no-completion-irq . This optional property
> is intended for hardware that does not generate completion interrupts
> and can be used to unconditionally enable forced polling mode of
> operation.
> 
> With this property set, such implementations which do not generate
> interrupts can be interacted with, until they are fixed to generate
> interrupts properly.
> 
> Note that, because the original base protocol exchange also requires
> some sort of completion mechanism, it is not possible to query SCMI
> itself for this property and it must be described in DT. While this
> does look a bit like policy, the SCMI provider is part of the
> hardware, hence DT.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: arm-scmi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: s@mean@&t and limit poll transport to mailbox/shmem only
> V3: - Reformat the commit message, expand property description to
>       explicitly spell out this is hardware description.
>     - Rename property from arm,poll-transport to arm,no-completion-irq
> V4: - Update first paragraph of commit message and property description
>     - Add RB from Rob
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index be817fd9cc34b..d06cca9273c48 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -146,6 +146,13 @@ properties:
>        this platform. If set, the value should be non-zero.
>      minimum: 1
>  
> +  arm,no-completion-irq:
> +    type: boolean
> +    description:

Shouldn't these two points have to be swapped as per Sudeep and Rob
suggestions ?

    description:
	....
    type: boolean

> +      This optional property is intended for hardware that does not generate
> +      completion interrupts and can be used to unconditionally enable forced
> +      polling mode of operation.
> +
>    arm,smc-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -379,6 +386,9 @@ then:
>      - shmem
>  
>  else:
> +  properties:
> +    arm,no-completion-irq: false
> +
>    if:
>      properties:

With the above corrected, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

