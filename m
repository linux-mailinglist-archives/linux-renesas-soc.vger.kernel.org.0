Return-Path: <linux-renesas-soc+bounces-18906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB357AED1A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 00:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11BBC7A833D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 22:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3624F205AA8;
	Sun, 29 Jun 2025 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X9YEudhN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="O2wvv5vp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2417A30F;
	Sun, 29 Jun 2025 22:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751236383; cv=none; b=BNq7kwm2bJ5FQkgwcWAapWSzTfu354c7y2FpRlcHzFelh834pCKxGxbobOMUw2nSfIIRFu4vcWLfkr3MISyjmWvARRjHXWfo9dumf0XEeg46Nk66j9MXgXbCWCUTSn0oL1WAEabybU1vIHs0N9onBtmjmVGyfeGKpDILvX1euQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751236383; c=relaxed/simple;
	bh=N2uaiSdDiLRULBaf+pEbYnJyw3e0faVelMWJccN0GWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSUZESovkWlhY09Bf876b5Xjoszx7IZgoWWsziWsCVtITeMi8oLXJf8tFZpb6hEy68HqDOTc2F3q+2olDShvaTemtvnr0kfiPzWOYfS8ADls0+F54cke/R/S302sG+5aW+yBjcXFmNCNP/FdRRsY0J3r/8UmKPPRbT3x+FmdYX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X9YEudhN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=O2wvv5vp; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bVkZg1fVXz9st4;
	Mon, 30 Jun 2025 00:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751236379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDdpl3By3X9ovNNxMrYzM8BcEB9nscefW9jEfoZxips=;
	b=X9YEudhNYyyQKsMiNjcgzjtDOADX/Hv10Qk0k+HuNEQ8ykiwfc28TT9U8GUlfUXUNR0LyG
	tPZGlv6/ocb9qYSs+yKRIDaIMGsYGvIZu5XGUk9zkUvyKcFXK9X/8JCrvzvNyvnSQWkHpP
	X15jC3gY41r2waV/GFDtmlFzq+yB1i7mkjaztuRktFQ8wXL+ejstgQSuIZvdAttnAglB7S
	PKg4lFKpSfvQ3W0XZ+zPO0QVzv7ouMyZZUwViaYeIfcJ0roYIt+hbBATAMy7mMquuq34Yy
	x3yQaF/4OgzhdXw84EE5UgpziQl45GpKh8fn2QJR3MMvcVGJzwCI4jXQCdZFTw==
Message-ID: <c0ec7600-158f-431e-8f99-a462d68b808e@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751236377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDdpl3By3X9ovNNxMrYzM8BcEB9nscefW9jEfoZxips=;
	b=O2wvv5vpGSPgJRfrdRylP+6fnD36JGHlQkMm2PCf5GW+bch6SGCD5OP1xGtws1aJ9LNag5
	doFfqUIyia9SICS+oUC/wCe6lhItsjTxjG3wF/0LZif3tq1kiQYmpZBys1bUXPXvKi4W5L
	0bkcas8UYWVc2z5oF5FNU26mgUiZeZx8DX8TGaFUwLVIUZAkX+J82fxcPyig9zJ0OCZPe2
	s48NSlxFd+0sPGJBeqJXRj4hElophW1N2GRofKiD44IZsR8qDccQNmST6VIJHiu5GpLd8K
	w58gqgTgkEUmwogqnd/VMzDmyrh7rBvs1nmFAbZIC7c70wO4B4VDM779bHA2dw==
Date: Mon, 30 Jun 2025 00:32:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <20250626214152.GA1817595@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250626214152.GA1817595@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2484d965c38b68daec3
X-MBO-RS-META: 5jta8u7daqtyj6ngn4tdp1n53siur7bj

On 6/26/25 11:41 PM, Niklas Söderlund wrote:

Hello Niklas,

>> +&a76_3 {
>> +	a76_3_thermal_idle: thermal-idle {
>> +		#cooling-cells = <2>;
>> +		duration-us = <10000>;
>> +		exit-latency-us = <500>;
>> +	};
>> +};
> 
> I did not know you could do this and use it as a cooling device, thanks
> for teaching me something new!

You could, although the cooling effect may vary. Some cores enter e.g. 
clock stop during idle and then they really cool down, some do not.

>> +/* THS sensors in SoC, critical temperature trip point is 100C */
>> +&sensor1_crit {
>> +	temperature = <100000>;
>> +};
>> +
>> +&sensor2_crit {
>> +	temperature = <100000>;
>> +};
>> +
>> +&sensor3_crit {
>> +	temperature = <100000>;
>> +};
>> +
>> +&sensor4_crit {
>> +	temperature = <100000>;
>> +};
>> +
>> +&sensor_thermal_cr52 {
>> +	critical-action = "shutdown";
>> +};
>> +
>> +&sensor_thermal_cnn {
>> +	critical-action = "shutdown";
>> +};
> 
> Is this not the default action for critical trip points? In my testing
> in the past R-Car systems have always shutdown when the critical trip is
> reached.

It isn't quite that clear cut.

drivers/thermal/thermal_of.c thermal_of_zone_register() contains this 
piece of code:

"
407         ret = of_property_read_string(np, "critical-action", &action);
408         if (!ret && !of_ops.critical) {
409                 if (!strcasecmp(action, "reboot"))
410                         of_ops.critical = 
thermal_zone_device_critical_reboot;
411                 else if (!strcasecmp(action, "shutdown"))
412                         of_ops.critical = 
thermal_zone_device_critical_shutdown;
413         }
"

If "critical-action" DT property is not set, then of_ops.critical are 
not modified.

drivers/thermal/thermal_core.c thermal_zone_device_register_with_trips() 
contains this piece of code:

1571         if (!tz->ops.critical)
1572                 tz->ops.critical = thermal_zone_device_critical;

If (in case of OF) of_ops.critical is not set, use 
thermal_zone_device_critical() handler.

There is a slight difference:
- If critical-action = "shutdown" is set in DT, then handler
   thermal_zone_device_critical_shutdown() is called, which is a wrapper
   around thermal_zone_device_halt(tz, HWPROT_ACT_SHUTDOWN);
- If critical-action = "shutdown" is NOT set in DT, then handler
   thermal_zone_device_critical() is called, which is a wrapper
   around thermal_zone_device_halt(tz, HWPROT_ACT_DEFAULT);

thermal_zone_device_halt() itself is a wrapper around 
__hw_protection_trigger(msg, poweroff_delay_ms, action); , where action 
is either HWPROT_ACT_SHUTDOWN or HWPROT_ACT_DEFAULT , which is handled 
in kernel/reboot.c __hw_protection_trigger() implementation :

1028 void __hw_protection_trigger(const char *reason, int ms_until_forced,
1029                              enum hw_protection_action action)
1030 {
1031         static atomic_t allow_proceed = ATOMIC_INIT(1);
1032
1033         if (action == HWPROT_ACT_DEFAULT)
1034                 action = hw_protection_action;

In case of HWPROT_ACT_DEFAULT , the 'hw_protection_action' which is 
assigned into 'action' can be overridden, either via sysfs write, or 
hw_protection_ kernel command line parameter . In case of 
HWPROT_ACT_SHUTDOWN , the action cannot be overridden .

In case this hardware starts to melt, we surely want HWPROT_ACT_SHUTDOWN 
with no override options ...

> If it's not I think we should move these to r8a779g0.dtsi. And
> likely add them for all other SoCs too?

... the other hardware has non-optional heatsink, where override-able 
HWPROT_ACT_DEFAULT is the right option I think .

