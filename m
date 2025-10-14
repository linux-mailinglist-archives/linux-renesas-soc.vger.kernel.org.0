Return-Path: <linux-renesas-soc+bounces-22993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08306BD8262
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 10:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7392E3E8504
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 08:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3341130F811;
	Tue, 14 Oct 2025 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pAMv2LyH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32CC19E992;
	Tue, 14 Oct 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430194; cv=none; b=UJo/kEu+6muVwT1K2Mb2K7BvQdndE2/on9BLPIEFuaS0DY5FujEiazx6jnt2ki+GX9TLbnxiQAovYYVYsuDp0Lyy+Jopv86E69MCYGdfSJermFkbpV15+WcbT1OAGxUGmkkOm4kiBIw9mFFZDdvGjnGX/o2C9Qvo2lUZ46EWEYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430194; c=relaxed/simple;
	bh=HI9MYPKRah6TCdEBS0xaMpDlHqOl0YmD4F6YufB4zNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrD9zQS8oxBp08O1YomAsn3UtwSOjlCAsA14X3WtRUxr9JmEeE3TIvnp1nzQjUyGqF6H0iTE1emLoItBBbVWylperHE7RgySFr6/79BZI0MMRoxFGA/ZpM5SYAO1uvd0W8Wg2YPV27jbv3592ZVRTkhhUINK0ZPlky6u1aq66no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pAMv2LyH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A0CEC73;
	Tue, 14 Oct 2025 10:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760430092;
	bh=HI9MYPKRah6TCdEBS0xaMpDlHqOl0YmD4F6YufB4zNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pAMv2LyHLQSCiGClKzQLIdpgy5Rkfu/LQSsadd3DnmwkhbsnnLk2jG7oiPxRQCQSB
	 QlXMAJwwVlfVOY6a3hS5XzESS3XC2uJ9VTpSwj4P7yeZeVYmxJvHK72c2wTXLg1//G
	 wCRSriLpk3r7HpMwCcAwTlfkPSLdII9jJHlrl6TU=
Message-ID: <14341b21-dbf6-43a4-87a2-1bd602034ff8@ideasonboard.com>
Date: Tue, 14 Oct 2025 09:23:07 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for ISP
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, fabrizio.castro.jz@renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com
References: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
 <CAMuHMdXYsHFi3LSLLPtTZ8xrZsLsXUMG693C3KE=wShhObnkCQ@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAMuHMdXYsHFi3LSLLPtTZ8xrZsLsXUMG693C3KE=wShhObnkCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Geert

On 13/10/2025 16:23, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Fri, 10 Oct 2025 at 11:43, Daniel Scally <dan.scally@ideasonboard.com> wrote:
>> Add entries detailing the clocks and resets for the ISP in the
>> RZ/V2H(P) SoC.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v2:
>> - Dropped the dt-bindings patches since the macros weren't needed
>> - Squashed the separate patches adding clock and reset definitions
>>    into a single patch
>> - Link to v1: https://lore.kernel.org/r/20250506121252.557170-1-dan.scally@ideasonboard.com
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.19, with the below fixed...
> 
>> --- a/drivers/clk/renesas/r9a09g057-cpg.c
>> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>> @@ -64,6 +64,7 @@ enum clk_ids {
>>          CLK_SMUX2_GBE1_TXCLK,
>>          CLK_SMUX2_GBE1_RXCLK,
>>          CLK_PLLGPU_GEAR,
>> +       CLK_PLLVDO_ISP,
> 
> ... moving up, with the other CLK_PLLVDO_* entries...

Ah - sorry about missing the ordering there!

Thanks
Dan

> 
>>
>>          /* Module Clocks */
>>          MOD_CLK_BASE,
>> @@ -170,6 +171,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>>          DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
>>
>>          DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
>> +       DEF_DDIV(".pllvdo_isp", CLK_PLLVDO_ISP, CLK_PLLVDO, CDDIV2_DIVCTL3, dtable_2_64),
> 
> ... moving up, with the other CLK_PLLVDO_* entries.
> 
>>
>>          /* Core Clocks */
>>          DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


