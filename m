Return-Path: <linux-renesas-soc+bounces-20547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EFB2730E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 01:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0C03B8B52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 23:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE0A283153;
	Thu, 14 Aug 2025 23:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cVhC8Yal"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5245286D45;
	Thu, 14 Aug 2025 23:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755214610; cv=none; b=fQ8zRb/jYKqdmM9knHKNaGhHUq5mvYB9FjV/l11VBmth2/7P+AqevpliZcq7F49hKVSZN+ZV43BJ6MCYSeOC1OpaMWNCJ1AhqZnnqhy/ueARuwR9SF5QTuZ8bQQSb123tAwLyaTQ4+i5NEk/Yc+LtNEGgoOSFK0GNng5A01QmWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755214610; c=relaxed/simple;
	bh=AE60F+cqx7RSGivCpaV+28XBgSFW4rmOhJnupVM3mWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsWacio7sqFZ8x/qxaVtNhyz0zs4dDlwwhnru9ceY+cEdegOYpUN4tcSmWFnJizJG55C2cL4OaWlFziaT9FjRwn0XoH6iaXf+rpGocWHKmROkRojWpPLZUVfvxKEuo8ZQ5kdg9kHSQUuzcbK9lgqAi+CWiiMKNFERM4FNXLEd7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cVhC8Yal; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c31pv3G1Yz9sbr;
	Fri, 15 Aug 2025 01:36:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755214599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLcUtChQNeqX91cxE0uXaI6akDBGlKrYhcY7GuHkEws=;
	b=cVhC8YaliGKAVGyuYSo1b+nwL9uQNr3SVnT81Pc9vV68X0tpfUJdFukIZmmLk8PVXOzTfz
	9rwhFOV7QkutUOEZyUEJmz57A2Bing+cRvpgnfmreDmxfiLCr00UJb914kJVsv1sfihO6p
	HbsgtE6DAKg/UGVs9dQ//0gnzJ8kAxBp0ZPzukq+WZ/n6Gm79mcbCB23e+1daBLzpeCYVl
	PNk+ceAfA9ZVJX4CbMWcCXlG4W8ZSBfe+90DAfm0U7tnArq7+oTTnZ5EBrQJ37c6nFRQhX
	ME7TOd7nN93daqIjAE/uDkc1Uo32IU17jgSMYqyTewhfU/vhC97dHnnlPzBmpA==
Message-ID: <154ea688-8e06-40c6-944c-084fb9d5ce26@mailbox.org>
Date: Fri, 15 Aug 2025 01:36:37 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
 <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org>
 <CAMuHMdX6naFbq-5LyuC4n+JRPTXGSSohKDTf95=MS_SMyHqfng@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdX6naFbq-5LyuC4n+JRPTXGSSohKDTf95=MS_SMyHqfng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8d1a3baf1c9c4ecf455
X-MBO-RS-META: qdwhxenzai6ikruzbe44w87c83rtfmo3

On 8/14/25 5:50 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Wed, 6 Aug 2025 at 17:23, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 8/6/25 11:35 AM, Geert Uytterhoeven wrote:
>>>> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
>>>> +&sensor_thermal_ca76 {
>>>> +       critical-action = "shutdown";
>>>> +
>>>> +       cooling-maps {
>>>> +               /*
>>>> +                * The cooling-device minimum and maximum parameters inversely
>>>> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
>>>> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
>>>> +                * This is because they refer to cooling levels, where maximum
>>>> +                * cooling level happens at 500 MHz OPP, when the CPU core is
>>>> +                * running slowly and therefore generates least heat.
>>>
>>> That applies to cooling-device = <&a76_[0-3] ...>...
>>
>> Do you want me to add this line into the comment ?
> 
> I don't think that is really needed (see below)
> 
>>>> +                */
>>>> +               map0 {
>>>> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
>>>> +                       trip = <&sensor3_passive_low>;
>>>> +                       cooling-device = <&a76_0 2 4>;
>>>> +                       contribution = <128>;
>>>> +               };
>>>> +
>>>> +               map1 {
>>>> +                       /* At 72C, inhibit 1.5 GHz mode */
>>>> +                       trip = <&sensor3_passive_mid>;
>>>> +                       cooling-device = <&a76_0 3 4>;
>>>> +                       contribution = <256>;
>>>> +               };
>>>> +
>>>> +               map2 {
>>>> +                       /* At 76C, start injecting idle states */
>>>> +                       trip = <&sensor3_passive_hi>;
>>>> +                       cooling-device = <&a76_0_thermal_idle 0 80>,
>>>> +                                        <&a76_1_thermal_idle 0 80>,
>>>> +                                        <&a76_2_thermal_idle 0 80>,
>>>> +                                        <&a76_3_thermal_idle 0 80>;
>>>
>>> ... but what do "0 80" refer to? I couldn't find in the thermal-idle
>>> bindings what exactly are the minimum and maximum cooling states here.
>>
>> The comments in drivers/thermal/cpuidle_cooling.c clarify that, it is
>> the idle injection rate in percent, in this case the cooling can inject
>> idle states up to 80% of time.
> 
> OK, so I will add "(0-80%)" to the idle states comment, and sort
> the nodes while queuing in renesas-devel for v6.18.
I sent a V3 to make this more official. I hope that helps.

