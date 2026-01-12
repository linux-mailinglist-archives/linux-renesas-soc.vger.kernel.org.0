Return-Path: <linux-renesas-soc+bounces-26597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A1D12757
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 13:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 685CA300B2AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 12:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153033570CA;
	Mon, 12 Jan 2026 12:06:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A645B1DF248;
	Mon, 12 Jan 2026 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219577; cv=none; b=R4WOCy2yBIOmEz6oMeOgCOqHm1cs7DAZoaAJmvy1Gh89dURdRr75X6ekmTBzlbQT6qQdLasTnimmzS/pJCDY3ECFxGGADpgFMhymjhpAbVNWP4mcZPvPTIh9VRh3QCrw44fIkRj7f8+Yjj9O7Cx0l1XArHToUp9gYAHPaQLbkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219577; c=relaxed/simple;
	bh=scteEPzEnWETQCcKNd153kVvYd1wwBaIZ7VznAaCZRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG/+DReb6WuRe9CCVw6jkdXVDlS7sMSi2cgDp23frB8FEWZgCSTrUYqEnWNA3zSmVG7RtXl7WNUoFCFIhnprOgDZol/DERep0twuqjgJyjSZvak2Cg89omGF9C+sEt5ClmaU0JfBVlxXHCASfaSOa7kWB231f4GbqEiHjvk6ShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B163497;
	Mon, 12 Jan 2026 04:06:08 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCB333F59E;
	Mon, 12 Jan 2026 04:06:13 -0800 (PST)
Date: Mon, 12 Jan 2026 12:06:11 +0000
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
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: Implement arm,poll-transport
 property
Message-ID: <aWTjs1Y9yoz1k4Ry@bogus>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
 <20251231213016.185575-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231213016.185575-2-marek.vasut+renesas@mailbox.org>

On Wed, Dec 31, 2025 at 10:29:19PM +0100, Marek Vasut wrote:
> Implement new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies to mbox/shmem based
> implementations.
> 
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
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
> V2: Drop no IRQ handling from SMC transport and update commit message
> ---
>  drivers/firmware/arm_scmi/common.h | 4 ++++
>  drivers/firmware/arm_scmi/driver.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 7c35c95fddbaf..7c9617d080a02 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -235,6 +235,9 @@ struct scmi_transport_ops {
>   *		      to have an execution latency lesser-equal to the threshold
>   *		      should be considered for atomic mode operation: such
>   *		      decision is finally left up to the SCMI drivers.
> + * @no_completion_irq: Flag to indicate that this transport has no completion
> + *		       interrupt and has to be polled. This is similar to the
> + *		       force_polling below, except this is set via DT property.
>   * @force_polling: Flag to force this whole transport to use SCMI core polling
>   *		   mechanism instead of completion interrupts even if available.
>   * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
> @@ -254,6 +257,7 @@ struct scmi_desc {
>  	int max_msg;
>  	int max_msg_size;
>  	unsigned int atomic_threshold;
> +	bool no_completion_irq;
>  	const bool force_polling;

My preference would be to reuse `force_polling` for this. We need to drop
const but that should be OK. Anyways I would like to know if Cristian thinks
otherwise for any reasons I might be missing to see.

-- 
Regards,
Sudeep

