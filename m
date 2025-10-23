Return-Path: <linux-renesas-soc+bounces-23505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18894C014F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AED11A03CBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C81314B9D;
	Thu, 23 Oct 2025 13:16:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD47314D25;
	Thu, 23 Oct 2025 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225407; cv=none; b=KE/lmHpFZ4BmZmEbJrH2N0pVl/xyVgu0mrYOtIjrot+yccQ8unT2wd0PaZ+63wVsLIQybXQh1tzvNtGBJnMk42XBpRVOrv+1mije8aeandQfQ1coLgKF2C/MAlfpUCpp7eK6ij8Lq8p9NR7YkFz6ZDO5X+q2941i/lpOlM3zK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225407; c=relaxed/simple;
	bh=tDdnpRe5Vq/u0lp23dS08SYJsjLD1GQpIfr9QR5sovg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTVSJ3GuTVFE5DeHoSOav/3QtTqpwn6USfdpASoly8rU5z0oW/gKnGs6C6p/8wfEwSRgEFeZ050jqA8Yiaiaa4lRkZShhlaeExu782yVF8Ivqg1SSNnzBXR3VLZhwPznvC55fgpFqKPhyVyujhMD8m4BN99GL3bFyHMKNYbODM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 489C71516;
	Thu, 23 Oct 2025 06:16:36 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DB983F63F;
	Thu, 23 Oct 2025 06:16:42 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:16:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>

On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> based implementations, but does also cover SMC and VirtIO ones.
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
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index be817fd9cc34b..b53754a318ea1 100644
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
> +      This is mainly mean to work around uncooperative SCP, which does not generate
> +      completion interrupts.
> +

Could you please clarify which platform and transport this change pertains to?

Introducing a property that enforces unconditional polling across all
platforms is not ideal - particularly if this is intended as a workaround
for a platform- or firmware- specific issue. Such implementations often get
replicated across platforms without addressing the root cause, leading to
wider inconsistencies.

It would be preferable to scope this behavior using the platform’s compatible
string. This approach ensures the workaround is applied only to the affected
platform and prevents it from being inadvertently enabled elsewhere, unless
another platform intentionally uses the same compatible string (which seems
unlikely).

-- 
Regards,
Sudeep

