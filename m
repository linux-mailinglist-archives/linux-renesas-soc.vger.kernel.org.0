Return-Path: <linux-renesas-soc+bounces-14240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A534A5ADF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 00:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D15BA3AECED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 23:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734B91F0984;
	Mon, 10 Mar 2025 23:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fd/x3tMH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A231EF38C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 23:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741649725; cv=none; b=B+dXy1a8o9ZZi2ix2phEABMCKBWoP0GQEMj0gOJ8hjZ0QZq2LkKUJl/FPm5n6a/q5eUBIH84dj20KIAM2++IeGJK5eoKFgxARAwoVsnZ5pkbjXECkuEV+x4fxiY0bHLUcBt1V40CgqIsT2MMIUb7RgCCTYo3xqhfbwwOzAwuvZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741649725; c=relaxed/simple;
	bh=DPMt326uX8myQJRaJPVu3NPM9NmUtt9Gp/MOi56hFck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5Ig1C2kelw6r7ABVvqTr59Ihq9s+DqR1nkNDI/VO8OGU5cRFPUzxtjtcrdMDDLq3z/A2XNdK0ZdovPeyIygqMTFtPx4lQ5un85mEqOvIQPtYeP1LKwd550YyFpcgRHaQSLfSRx9vdjtlwaaHon+bwT0h4P0zXWblq715hWJdgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fd/x3tMH; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <7272e5c8-4205-40fd-a70a-02fa04d52fbe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741649717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UaeYQ49HJpHXYWhcLyDhDKqa5x+EHwmZ+gZJBiTCA8=;
	b=fd/x3tMHVeq4mGipakiqpqk9MtleG78tcKb6U3DERxE7ReDb6SwtVFR+vH5T3lfV8oMvsE
	okBPo8vmhseYKEwdW6jAPvFXMZz9BphO9HHtOxhzOdibRAl4jxQqi28XlYXg3gdMElpgGx
	U5mXnBlIL+gDX9WNcsCC92vzECxgKsI=
Date: Mon, 10 Mar 2025 23:35:11 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net 5/5] ptp: ocp: reject unsupported periodic output
 flags
To: Jacob Keller <jacob.e.keller@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, Ruud Bos <kernel.hbk@gmail.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Raju Lakkaraju <Raju.Lakkaraju@microchip.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Lasse Johnsen <l@ssejohnsen.me>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
 <20250310-jk-net-fixes-supported-extts-flags-v1-5-854ffb5f3a96@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250310-jk-net-fixes-supported-extts-flags-v1-5-854ffb5f3a96@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 10/03/2025 22:16, Jacob Keller wrote:
> The ptp_ocp_signal_from_perout() function supports PTP_PEROUT_DUTY_CYCLE
> and PTP_PEROUT_PHASE. It does not support PTP_PEROUT_ONE_SHOT, but does not
> reject a request with such an unsupported flag.
> 
> Add the appropriate check to ensure that unsupported requests are rejected
> both for PTP_PEROUT_ONE_SHOT as well as any future flags.
> 
> Fixes: 1aa66a3a135a ("ptp: ocp: Program the signal generators via PTP_CLK_REQ_PEROUT")
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> ---
>   drivers/ptp/ptp_ocp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index b651087f426f50a73229ca57634fc5d6912e0a87..4a87af0980d695a9ab1b23e2544f620759ccb892 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -2090,6 +2090,10 @@ ptp_ocp_signal_from_perout(struct ptp_ocp *bp, int gen,
>   {
>   	struct ptp_ocp_signal s = { };
>   
> +	if (req->flags & ~(PTP_PEROUT_DUTY_CYCLE |
> +			   PTP_PEROUT_PHASE))
> +		return -EOPNOTSUPP;
> +
>   	s.polarity = bp->signal[gen].polarity;
>   	s.period = ktime_set(req->period.sec, req->period.nsec);
>   	if (!s.period)
> 

Thanks,
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

