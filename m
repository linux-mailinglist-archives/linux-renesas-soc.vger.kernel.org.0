Return-Path: <linux-renesas-soc+bounces-23438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB09BFCA3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 16:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC46A6E1BA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1883B34845C;
	Wed, 22 Oct 2025 14:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="saBzREJL";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="r4VMeBRi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584633F8DC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143634; cv=none; b=KzN0ILCyxRKTFy7AkNZOpjjn16NZis3Opu3ZNRNXqKwrjnfqnqeZ4V7CgM18GduAlmLz248x2tQSY3o9Fghq9iH4lnRs3hDm77/iOc6J8ExCt3dkG1Ky5kq1RdgjXo3oH10GX/KKWWyzJqTi56fQAi1+7yx1pjZ4PZYIjMvjA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143634; c=relaxed/simple;
	bh=2c66yf9t+7gJnq7nrdhnBLaXibSpS6japcjLZ/OR7do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOb6N1Voidr3kR9qJepzdWlIpn5PFhedvArzpCgPExk3OpFrxHlhjnOfb5XcJhuuNE1w5HBeqiTaQtySLlYbyU2+92cTsSBptuY8E2Jr/m8yn+jeOSLXvAbNEuiV6WRzpCprianmtu9xpNwXy4IOV3KXBQrKkeqjoAorl/bCoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=saBzREJL; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=r4VMeBRi; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4csBVb60xNz9slv;
	Wed, 22 Oct 2025 16:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761143623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ7q/4zySaM4MOZEvp5XgJfMQC2PsHs4Sv4JNvspi/g=;
	b=saBzREJLydm0tA2LYr2BcmhoAY+acV8mtBdecGgVwtS5lAD7t7wErTCFt5F0w/c0GiUF2i
	WDrvvwugbxLNoe+ZsurdYiiwWveLQl1EIzx7jDgtuErJXLAjROsilTamuao/whxy2lJ1qW
	iHp24gK+G+gVTZKIYMtH1eLBw5V7UOfWRaNh4pGeYFMmC2HWLSV7YyHGdkUoI4KwnExaJQ
	VxdfBAwafcPvzjMzN6eH21M/KmZ/W6xoQ5h8LWxrIYrusjsU4B+M1Ag1yVBJo+SXTSrWtn
	1jn+vtnFk9w+BpMk48s9cwSw4sf9J4jSlhvQATbNyMNLBhMo84vxzjZv0uvfuw==
Message-ID: <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761143622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ7q/4zySaM4MOZEvp5XgJfMQC2PsHs4Sv4JNvspi/g=;
	b=r4VMeBRi3apHe8m5FEEmVn6aErJV/mNboAPeRwAlhvbJwqmIu7ZAVBGmuPsUtG2lE+ghyN
	XGrxPJrtFpspdNAZQxwsh5lsiwHCar6A0ARJqxPgBefbPpBujTdL9ZaQjPEzzCCG1UUXR6
	O8djyPLNAaV1hD29wHC1tduFzGwCZtDbCZqx8BzFPEen5JZGQxNJuVE6v2PTBovh0xPBv/
	zkWO/QUutbLLd0LuxRQ6mEbtMlM24JbKxr6QlOslEbSsVCVrGJfjj16iUyo4+eFlb4ItGw
	CX2DX2axJ2MzCIkRCiu0v1hV2ysjFbd9IwhTUSXBxB/wS1S6/scdRO1UtdSXpw==
Date: Wed, 22 Oct 2025 16:33:38 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <86347bvx0f.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: cj3tsrj4fhfswqme59bzu1bbbxce1pa8
X-MBO-RS-ID: 39483152c3182c61913

On 10/22/25 4:20 PM, Marc Zyngier wrote:
> On Wed, 22 Oct 2025 14:35:28 +0100,
> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
>>
>> The AMU configuration register access may fault and prevent successful
>> kernel boot. This can occur for example in case the firmware does not
>> allow AMU counter access from EL1. Guard the AMU configuration register
>> access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
>> Kconfig option is explicitly disabled. Other interaction with the AMU is
>> already guarded by similar ifdeffery.
>>
>> Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   arch/arm64/mm/proc.S | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>> index 86818511962b6..123538ffeda6b 100644
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
>>   	ubfx	x11, x11, #1, #1
>>   	msr	oslar_el1, x11
>>   	reset_pmuserenr_el0 x0			// Disable PMU access from EL0
>> +alternative_if ARM64_HAS_AMU_EXTN
>>   	reset_amuserenr_el0 x0			// Disable AMU access from EL0
>> +alternative_else_nop_endif
> 
> Why?
> 
> We ensure that the AMU is available in the macro itself by checking
> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
> the offending sysreg access. This is similar to what we do for the
> PMU.
> 
> Does your HW advertise an AMU, but doesn't actually have one?
The hardware does have AMU, but it is currently blocked in old TFA 
version and access to this AMU register here causes a fault. That's why 
I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and the 
AMU access is made available on this hardware. But even if I do disable 
ARM64_HAS_AMU_EXTN=n , I get a fault.

This patch is mainly meant to prevent a surprise in case someone does 
set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register 
access.

