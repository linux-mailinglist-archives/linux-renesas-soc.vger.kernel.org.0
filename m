Return-Path: <linux-renesas-soc+bounces-21515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4042B46256
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 845E7B64C7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12DF235354;
	Fri,  5 Sep 2025 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wSA1qxOQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="x0QyrUWO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC16261B91;
	Fri,  5 Sep 2025 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097334; cv=none; b=BISCdlnsAirKlcpySuqJyQUy8VbCCvIbJlK5EvzO1UMK3eeXdbUHVDXvhDpHiehnSROVYYlQ+KgebE5W2hMThOypcNTqLIi1tfmomA62BQgNmbs3jf78NYOIVlhhchFteTnvaVFnhyo+Qs1qqxy/1qBF6f1TMUkqMbgXpk9EIIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097334; c=relaxed/simple;
	bh=cjEgaCsGMSqtIGWJ0USxp0TNTFQx8VP7nst0jTanjJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mp6+dh2wFZZ+dLlD6f3nYMMxsZY7cKNsN+XkfEsyJxdKK0/RCRi9jkZlGD9nFYJAYHLhpT/rLHl8uw9AZ1NRW+sz1JzNdjya0xwc2DsI98l+Q6rFvFigHcb9kVfwEzWcrXZIJ/hUxzoG5qg7PTkNAGt6jT+zY/5ZohTtpE7+6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wSA1qxOQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=x0QyrUWO; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cJQ5G0lxkz9sq0;
	Fri,  5 Sep 2025 20:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757097330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZsROv5dMPlTRseUFed2DQIQDmI+zmlM+eHGw/139pU=;
	b=wSA1qxOQ+B5OJr41dcgkZmuhOTiychl0t9gOaUn7ogSa8gIUiH9dW6JZ8B162DXzy3ILvd
	0Xhp9WuEtlgSXYRAOytyyVYl8T2RqB4oqTqlw/vyGgIQcn/bJC1uVas7YP26Q+3tUlTdH9
	H7TBlwpONHAUlTMGOghGNumalKlSQC3DnKZMnjTFAEewldEA1LN31OAIM3cycG1fIlcTnX
	Glx8mK6rnJ7jn5VE3qGM6DiDHn23EiQxnF8WtfUA5Sl+lqKQFsz/YzwSxSbaesug68cDQh
	91Hwj1GSW3NFaC9RLkYv27W1QQVmvrpC/JI53g3bREd9lyupZ4X4Zvi/+j9vtA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=x0QyrUWO;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <273d5067-4c9d-4c8c-8633-7f2d7c708216@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757097328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZsROv5dMPlTRseUFed2DQIQDmI+zmlM+eHGw/139pU=;
	b=x0QyrUWOzMPakvYxi/Zbh5R5bygqUzCDTJYvPKP8/FqgDkYQCCzFp4EXHsOu9quW+x4/5z
	wdivkVL2ZkVk1m1mpFlfjkJOfwRqR/Qu3bfmnH6QEEol6An0CT1tskwG5X/h6VLQforpc1
	NU92T1MSc2SeEo89qi1UpFDiSERlqoedGE/RJCl1ykcw7WXnWpVgpR0uWUp/fThPlbz+jQ
	3wuTN7U3UwyA/Rlv6zmRcHpxpcDxuI/wqYwvjh8VxJhQwAJv0JpSRzSiD2VPbRbAzH6p+z
	Ly/lSrveoFofuNyYYfIm3qikjSsVGg0I2DOsRK5QXEV68eZM4Or9qrQcK5AUxA==
Date: Fri, 5 Sep 2025 20:35:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
 <aLrXzl38OUhTJgxP@shikoro>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aLrXzl38OUhTJgxP@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 16010d7b6e6bae5f7f9
X-MBO-RS-META: s9b7313iouson6bdjrfi5inu7cjzpbyt
X-Rspamd-Queue-Id: 4cJQ5G0lxkz9sq0

On 9/5/25 2:30 PM, Wolfram Sang wrote:
> Hi Marek,

Hello Wolfram,

>> + * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
>> + * /sys/class/hwmon/hwmon0/name:sensor1_thermal
>> + * /sys/class/hwmon/hwmon1/name:sensor2_thermal
>> + * /sys/class/hwmon/hwmon2/name:sensor3_thermal
>> + * /sys/class/hwmon/hwmon3/name:sensor4_thermal
>> + * /sys/class/hwmon/hwmon4/name:pwmfan
>> + *                       ^      ^^^^^^
> 
> For me, the output looks different, though:
> 
> /sys/class/hwmon/hwmon0/name:pwmfan
> /sys/class/hwmon/hwmon1/name:sensor1_thermal
> /sys/class/hwmon/hwmon2/name:sensor2_thermal
> /sys/class/hwmon/hwmon3/name:sensor3_thermal
> /sys/class/hwmon/hwmon4/name:sensor4_thermal
> /sys/class/hwmon/hwmon5/name:pwmfan
> 
> hwmon0 is the Argon, hwmon5 the (unpopulated) on board connector.
> 
> I hope the naming is stable, but in any case, the docs need to be
> reworked a little, I guess?

The hwmon devices are allocated first come first served, so the list can 
look different for you. You need to look up the fan you want to control, 
of course. Look up by name is simplest, if there are more fans, it might 
be a bit more involved to find the right one.

-- 
Best regards,
Marek Vasut

