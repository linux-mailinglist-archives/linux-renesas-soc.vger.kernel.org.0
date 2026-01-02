Return-Path: <linux-renesas-soc+bounces-26254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DFCEE631
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 02 Jan 2026 12:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58DE630041AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jan 2026 11:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD412F25F1;
	Fri,  2 Jan 2026 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKN7Fhey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B32D7D42;
	Fri,  2 Jan 2026 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353955; cv=none; b=Fh87JzVdOjKPDCShUS/acjLnyfqDEsQoup74lt/0aA1RoK+p06Zdwfbku5OY/CqwRNFdsDjQQ5YkT7OAC7yn3Fsyr3HO7ksek/TzezPERYH0rb12Bk38+2hiNPnMpPJBJEfayiiOJf8S3pOgjgaylUJhZC5FUSSCIaWnKpUvIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353955; c=relaxed/simple;
	bh=D7x2+MlJTJopSk/N8pBc8Qbs3BKNVmvRcJVrdtF4XQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRWKQRoXRXJPb75RO6e9eh7kEAnSuPnh3YJ3MLFEBeI6eRmTXwOj90G/uJ2Uy1ERLkWw6TXZ7BTVpMb85xkdjGB+ajiOwF87BiUUx8LRf3MijlAap+SPAigD0gx8HkyNr5cjJfMXHsuoX6nQBR7hhfJb2QiVqUUehuUDLk6scpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKN7Fhey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C93C116B1;
	Fri,  2 Jan 2026 11:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353955;
	bh=D7x2+MlJTJopSk/N8pBc8Qbs3BKNVmvRcJVrdtF4XQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKN7FheybVdWyw/4a0Hc1ZRpGUlsTpwZKRJvZDIz93nvq9aKsjRqcgxabZOH79tBs
	 7Riixoxnfwhc1uKBMzoaaoHWE16fQYhLWjfjTfvOEnbuNEFAmawp+c4xy3uZKcwEHn
	 V1q48bt+C0So+tvD19B4SCCxViCg66c6vwdy0CiGq8mA/FBcgdHZBn6eO4tTl7uOiA
	 AIelWp1WObnZp8ehX4OxaS9+9j2hKloyjsK099UYkMYrBVDYeLSFWt+wowt64GzMP/
	 QGactYkon+csaT+7tdKFUlgRQQ/GTkbKUWd37gSeRDdodRDgw6ae4jGrBovairhqM2
	 E1aqFh9Wh5IaA==
Date: Fri, 2 Jan 2026 12:39:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20260102-masked-spirited-labrador-33eae0@quoll>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>

On Wed, Dec 31, 2025 at 10:29:18PM +0100, Marek Vasut wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> shmem based implementations.
> 
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
> 
> Note that, because the original base protocol exchange also requires some
> sort of completion mechanism, it is not possible to query SCMI itself for
> this property and it must be described in DT. While this does look a bit
> like policy, the SCMI provider is part of the hardware, hence DT.
> 
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
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index be817fd9cc34b..f4bf4173c5c7e 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -146,6 +146,13 @@ properties:
>        this platform. If set, the value should be non-zero.
>      minimum: 1
>  
> +  arm,poll-transport:
> +    type: boolean
> +    description:
> +      An optional property which unconditionally forces polling in all transports.
> +      This is mainly meant to work around uncooperative SCP, which does not generate

Also not wrapped.

Anyway, you described the desired Linux feature or behavior, not the
actual hardware. The bindings are about the latter, so instead you need
to rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.


Best regards,
Krzysztof


