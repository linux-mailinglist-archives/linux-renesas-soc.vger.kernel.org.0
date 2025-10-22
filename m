Return-Path: <linux-renesas-soc+bounces-23442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A88BFCE65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 17:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3AD8F4E1D14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 15:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8AD244679;
	Wed, 22 Oct 2025 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YmHnorag";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cTlsc+K6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87337221FBF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147073; cv=none; b=Gh2Cac0+yfmf1rlaj5y+StVNk5B/Iy9y9xb+jZ8A5ZOOzajdwIF/u5m/S35Jo0TD02RTIzmiuGG0vGVHexPnAJCiCPATsUu1tGz0aW7fB2QGBrZQKlsszAHSk1gQrZjDlq++w3b3nPDfDocKOMvMpp3Gfptw/BQ5ygz8aosVrfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147073; c=relaxed/simple;
	bh=KNUHSbQHwFH02TqqaOqwuyXOANB6Nta4nLYXj6NXGek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPVVAQP8Pd7j9pP0orrtN6p/AlcP8dtkuofuyDCOb0F/ytn6gDH+eQz3AvPzS4pfaVAhy50pxYBIdoNTTQVksb6vF6JomB+YDWw222WO9py8gtO+DlpngUrLT7TVNwe7M/Op3d7q2UGnIXbz4VKaucaQPpMk5yLaM+EnVJ70ZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YmHnorag; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cTlsc+K6; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4csCmr3MLMz9tV8;
	Wed, 22 Oct 2025 17:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761147068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiPkQKpRLn9qqzIMVh1MRyshBmTUJXqAhlHjPgEk0jA=;
	b=YmHnoragkzLHzDGdOn64ahPb4h1231HNOqpcVm0Cliwqj5AwpW3e7PIqhXQNo9Gt9g+q/u
	7OBSVTLLWbUw/diU6mxJ07h3h1usyehv9mbHbYsrBxuWXuzWijmrZU5PyH4GjqAH++Qbo3
	DZNxFGI4sOo5rS7840zIxefgZNVL7GcsCyVPLGiktcKWAdCtkCBxhe0De2crbNC7vVvbHd
	IuvgBboAzIlIkqVl7L2lJwx449/t/SklErnm4plJ0x/3vTK3LR2T/MLQsONN+qo67vmE/6
	kxuR6l+zs56a15rfh6eOe5Jnxdx7/OoOd8iIOD/t94TVSUz0VOm1q75o26vy7A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=cTlsc+K6;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <b0f1a0a3-31be-4ebe-9bbc-fe25a0dc8059@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761147066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiPkQKpRLn9qqzIMVh1MRyshBmTUJXqAhlHjPgEk0jA=;
	b=cTlsc+K6ra2nU36Io1lxrwSmIVqq5ldIZvlrSZk2e/9jYye8cZZ4rt3bT8T8aP9pPQJ5k9
	6bI49k9gb2TlIFLGcRWfovDzKF2IYjYFRAF7r7MJ27wxipE7k4Q7jJIS9udWEJG7EZ+cK2
	E5GsoVmLgORkZu7LEFgHddCcM0D3lbqVVIh3lXtt0Kwsqz8ZX3stmtpDiCCRQHPHN08nwT
	jUAgIe8AUfuO/Y9x0fVfRsIQMRMATY0OpLj0c0mpqlwQNuQg0CZVi3B+e04Bavi4ENoGrY
	lnxZHKPnjpcUlB0eKxMLPOIjmxcAm6Fj8Hq5f1a6T7jPij3GUhYWwRrQi4g5Qg==
Date: Wed, 22 Oct 2025 17:31:04 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org> <aPj2DA2FwYVSmLVc@arm.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aPj2DA2FwYVSmLVc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 04cf09bdf2be20dd59c
X-MBO-RS-META: 1nkfh5jx737ewmoei1nspqmr99y98xsi
X-Rspamd-Queue-Id: 4csCmr3MLMz9tV8

On 10/22/25 5:19 PM, Catalin Marinas wrote:

Hello Catalin,

>>>> We ensure that the AMU is available in the macro itself by checking
>>>> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
>>>> the offending sysreg access. This is similar to what we do for the
>>>> PMU.
>>>>
>>>> Does your HW advertise an AMU, but doesn't actually have one?
>>>
>>> The hardware does have AMU, but it is currently blocked in old TFA
>>> version and access to this AMU register here causes a fault. That's
>>> why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and
>>> the AMU access is made available on this hardware. But even if I do
>>> disable ARM64_HAS_AMU_EXTN=n , I get a fault.
>>
>> Well, I would tend to say that you are trying to update the wrong
>> piece of SW here. Crashing kernels should be a good incentive for the
>> board manufacturer to update their firmware pronto, specially when we
>> are talking of code that has been in the tree for over 5 years...
> 
> I agree.
> 
>>> This patch is mainly meant to prevent a surprise in case someone does
>>> set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register
>>> access.
>>
>> But that doesn't really fix anything if you have a buggy firmware,
>> because you can't tell which CPUs have been correctly configured, and
>> which have not. I also don't really get why this hack works for you,
>> because the feature will be set as soon as one CPU advertises the
>> feature.
> 
> I think Marek also disables the config option and the feature won't be
> turned on.

Correct.

-- 
Best regards,
Marek Vasut

