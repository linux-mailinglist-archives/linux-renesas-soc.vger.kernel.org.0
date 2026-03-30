Return-Path: <linux-renesas-soc+bounces-30557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKvoFhMRymmS4wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 07:58:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B2355C8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 07:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D6DA3039EC8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 05:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CCC385512;
	Mon, 30 Mar 2026 05:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YJ7lOtVL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C772382F01;
	Mon, 30 Mar 2026 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774850076; cv=none; b=VrXlcg2vQY9EyEL+h+5H5y5C09Hf5r2FncuyeNwmZv7sFRNsQzbcOpOQpXAuOsa0gIEtwcDcQu7hP5pcv45+9dWI8iWCiWXLjCsMuyAFuSlnlS6OfjhLuuiS3Yd8ucMY4lXzMVPRUMJQE/pXU9f9xYHGDE7kXk/SMdwyQyRHdDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774850076; c=relaxed/simple;
	bh=dFIflD8J6Bfuj9Sl1pB2+4e1A5GxZPMlNoQIe6/wxQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyk0vE0bYPv755rGWIL1EhM3eNK7Bm+Ozl+c40BPo40TxOAiYeP7HbE4xHHvA3ZSxNqa7pVuW4Wlg/DcC2kUTvccH42/W+8byC8TKgMCUGucuF/4RHarUxJEhUl5pV8tkYXU5UeoKZgagv5odFkx5ABCRsorvzG73OzUJnaU/pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YJ7lOtVL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 703491C2B;
	Sun, 29 Mar 2026 22:54:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0B83F641;
	Sun, 29 Mar 2026 22:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774850072; bh=dFIflD8J6Bfuj9Sl1pB2+4e1A5GxZPMlNoQIe6/wxQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJ7lOtVLOzX2QjKKKD1sjBjhxzV7JBGJOFdMdt7bvVHTOfSMo8+krSsKQYjTce3eO
	 WsZ8LM3Cd0DIMleAXAFayUS4EZlr58dAA/kNnKbuoi0i/fH+sJr9ZzdK2OU3aKOdlo
	 jl2v09wVfkWXczr3J0T/FZED7o3pSNep7NXgikGE=
Date: Mon, 30 Mar 2026 06:54:21 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <acoQDQ_Ytezv8KPC@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com>
 <acPUxJ3N0QptmtlJ@pluto>
 <5980695.DvuYhMxLoT@steina-w>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5980695.DvuYhMxLoT@steina-w>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[samsung.com,arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-30557-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D22B2355C8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 09:55:18AM +0100, Alexander Stein wrote:
> Hi,
> 

Hi,

> Am Mittwoch, 25. März 2026, 13:27:48 CET schrieb Cristian Marussi:
> > On Wed, Mar 25, 2026 at 12:02:41PM +0100, Marek Szyprowski wrote:
> > > On 10.03.2026 19:40, Cristian Marussi wrote:
> > > > Add proper error handling on failure to enumerate clocks features or
> > > > rates.
> > > >
> > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > 
> > 
> > Hi Marek,
> > 
> > > This patch landed yesterday in linux-next as commit 0d8b0c8068a8 
> > > ("firmware: arm_scmi: Harden clock protocol initialization"). In my 
> > > tests I found that it causes a regression on RK3568 Odroid-M1 board 
> > > (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts), cpufreq and GPU 
> > > device are not probed properly:
> > > 
> > > # dmesg | grep scmi
> > > scmi_core: SCMI protocol bus registered
> > > arm-scmi arm-scmi.0.auto: Using scmi_smc_transport
> > > arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size: 
> > > 104bytes / max-msg: 20
> > > scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
> > > arm-scmi arm-scmi.0.auto: SCMI Notifications - Core Enabled.
> > > arm-scmi arm-scmi.0.auto: Malformed reply - real_sz:8 calc_sz:4  
> > > (loop_num_ret:1)
> > > arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'rockchip:' Firmware 
> > > version 0x0
> > > arm-scmi arm-scmi.0.auto: Enabling SCMI Quirk 
> > > [quirk_clock_rates_triplet_out_of_spec]
> > > scmi-clocks scmi_dev.3: probe with driver scmi-clocks failed with error -22
> > > 
> > 
> > Yes there are multiple reports of issues on this hardening, the series
> > is on hold and wont go into v7.1 as of now...it needs some basic fixes
> > and various quirks probably to address non-compliant firmwares...
> > 
> > It will be pushed to next again with a few more fixes in the coming
> > days and then we'll need to figure out how many quirks will be needed on
> > top of that and if it is acceptable at all...
> 
> Just for the records: imx95 (maybe imx94 as well) is also affected by this.
> My board doesn't boot at all, because all the clocks are provided by SCMI.
> 

Sorry for the late reply, thanks for the report...

> With this diff I can see it's the 'ext' clock
> -->8---
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -1253,8 +1253,11 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>                 cinfo->clkds[clkid].id = clkid;
>                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -               if (ret)
> +               if (ret) {
> +                       dev_warn(ph->dev, "scmi_clock_attributes_get failed for '%s': %d\n",
> +                                cinfo->clkds->info.name, ret);
>                         return ret;
> +               }
>  
>                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
>                 if (ret)
> -->8---
> > arm-scmi arm-scmi.0.auto: scmi_clock_attributes_get failed for 'ext': -2
> > scmi-clocks scmi_dev.6: probe with driver scmi-clocks failed with error -2
> 
> What's the idea of how to proceeed as apparently several platforms are
> affected?
> 

The series is on hold of course due to some residual bugs and all of
these reports of misbehaving firmwares...as I was saying elsewhere we
dont want of course to break existing boards in the wild that will most
probably never get a FW fix, BUT at the same time we do NOT want to
legalise/normalize this out of spec behaviour by leaving the kernel
code as it is...I mean at least we'd like to try to discourage this
mis-implementations in the future FWs ...

At the end, this could mean some quirks applied to multiple platforms
and vendors and maybe some relaxation in the checks, certainly some noisy
annoying logs on the side :P

Thanks,
Cristian

