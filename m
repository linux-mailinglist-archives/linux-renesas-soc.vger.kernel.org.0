Return-Path: <linux-renesas-soc+bounces-30327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN/II6sMxWkI6AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 11:38:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89D3338EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 11:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 990FA30315C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DF635BDD5;
	Thu, 26 Mar 2026 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4AbEJO6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10676749C;
	Thu, 26 Mar 2026 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520191; cv=none; b=pH595BJE+xK9xYwKQEP/6oQW1SL4Ofm/4/n+tNF8c52ntJ7SvqB3QAGpEO7Z7YHhwFcoBathW188QfI+1/xM45UJyG1FHQMW02mVbNBHiPIHW3d6n/50j+0vls7cHJPZzb4B8NlRIDJ+hm/HEnsER5N54tBBNG6PQVSXaUwtw20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520191; c=relaxed/simple;
	bh=8pidv6tLBMKGrGGnxMSzOA+pQiMt1DosRVV6l9JsVPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEhm/Lo4IC1sZi3S7xJoCrH9CtZG8Mdp7prEnlV/J2A52MJ2s0Ht2IsOp2SOhX3tFNZzr/9qvYdSoD3nwG/kvEcJiMVNYp3hM7lImNYtXdsd2LdFM10k9xD7JmwbTqhaIkjE0Wo//EsJ7JL8ZvaCV2r8lIXcs4PBGImRshs7l2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4AbEJO6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ED3C116C6;
	Thu, 26 Mar 2026 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520190;
	bh=8pidv6tLBMKGrGGnxMSzOA+pQiMt1DosRVV6l9JsVPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4AbEJO60R4MTJV/FlIwybC66N9IoNBKSDUhU43IaUyGF6f9Td0oOqz1XoWE/KAX1
	 Vip3LJHiPhP0tzyGVYmxMfHjZaSETl4I5sp2gsQw26TIIXSwUfsQO8Lxy4R/D/8hDp
	 uhWnXGs8kP7ZsC385DV04eAEQUVJnCUozXMXZ4TgLvHHmDiIxP9Msyo/FptVHHiXOG
	 xCCSVlVq07S2Q7zXMOtCtdGlAX3fEab3GEpKT+FmbKJq0g6Bjaudo893xEXMUq3s8g
	 7r8FZwz1tBUnAEc/OibVHqwa2K7OxkdFzSaqgTnMIyx3CmPGRnq7y9w72P8KLKgUcp
	 4iFlx9ISuHVnw==
Date: Thu, 26 Mar 2026 10:16:25 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <20260326-amiable-potoo-of-health-ed5c9a@sudeepholla>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30327-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[samsung.com,arm.com,kernel.org,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC89D3338EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 09:55:18AM +0100, Alexander Stein wrote:
> Hi,
> 
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

Not exactly answer to the above question, but more discussion here:

https://lore.kernel.org/all/20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com

-- 
Regards,
Sudeep

