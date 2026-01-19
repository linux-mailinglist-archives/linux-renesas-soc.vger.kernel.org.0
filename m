Return-Path: <linux-renesas-soc+bounces-27058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB230D3B453
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 18:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41877312345B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553A5309F1F;
	Mon, 19 Jan 2026 16:57:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BF52C15A2;
	Mon, 19 Jan 2026 16:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841862; cv=none; b=ePMR2UNeWPVJDqoDpqlgsEbhw4pwhMDdRg25+aQWtJ9tEG0H54T6WdpgBEDxpEtr6dvUejl5fJBs1w4GeWfnyK1z9xO8BLst+4BmjTeOp/MZWkb78wkeKhn6IRSlzKfy4gcOdlKkHRBMj0Xlbm6+XKSQV5B/JDKlYwqeg3hvouI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841862; c=relaxed/simple;
	bh=OJZS0MMLChVqXO+mF115EJx6ihMAnxRR8CWnWNDKHno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeKTrpfsSc6SzOPrwg4aG6+iSgnkmnSrkcwZ4wpmqhvWmdwsrZZHHlwwGxCv/uLXYMeGShHsqdwE8mCIyWat1IRItMu6iO+V//aVAEsvpX2Dy+XPHeG52IzfHRRfnXyNuMeYfWOyplgONz5ycI8/7OFvbnTjeKsLZNf7MlWjvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8495F497;
	Mon, 19 Jan 2026 08:57:31 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B1C73F632;
	Mon, 19 Jan 2026 08:57:36 -0800 (PST)
Date: Mon, 19 Jan 2026 16:57:33 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <aW5ifVcxVf6uux3m@pluto>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>

On Sat, Jan 17, 2026 at 02:02:29AM +0100, Marek Vasut wrote:
> Implement new property arm,no-completion-irq, which sets all SCMI
> operation into poll mode. This is meant to work around uncooperative
> SCP implementations, which do not generate completion interrupts.
> This applies to mbox/shmem based implementations.
> 
> With this property set, such implementations which do not generate
> interrupts can be interacted with, until they are fixed to generate
> interrupts properly.
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
> V3: Rename property from arm,poll-transport to arm,no-completion-irq
> V4: No change
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
>  	const bool sync_cmds_completed_on_ret;
>  	const bool atomic_enabled;
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 3e76a3204ba4f..f167194f7cf67 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>  	cinfo->is_p2a = !tx;
>  	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
>  	cinfo->max_msg_size = info->desc->max_msg_size;
> +	cinfo->no_completion_irq = info->desc->no_completion_irq;
>  
>  	/* Create a unique name for this transport device */
>  	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> @@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>  	if (ret && ret != -EINVAL)
>  		dev_err(dev, "Malformed arm,max-msg DT property.\n");
>  
> +	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
> +							      "arm,no-completion-irq");
> +
>  	dev_info(dev,
>  		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
>  		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

