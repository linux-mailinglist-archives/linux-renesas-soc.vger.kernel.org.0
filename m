Return-Path: <linux-renesas-soc+bounces-23531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC19C0245B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 17:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 734B419A19B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54462561D4;
	Thu, 23 Oct 2025 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="W5GrnDcb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4B24C669
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761235138; cv=none; b=CKOzbKbz5pXlsjoJSb3uaSrcicVawy/Hp0uW8Fz3pvuzzw32yTeLdaxv8QDu1fJkhLjiXP18COat/qkBXYrIFq6cNzSGesWtaqnWRY7EzxdZefvnsvMiXjrLIkPGaWeO5EKJvf8E1AibRIeZJNRa6L6OAIIdElAL9stlFkm6T3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761235138; c=relaxed/simple;
	bh=NIGLzWGhgBLdawfYFaGFmpGQAY7Krd2udIiYsKPNXx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgF7gj0U+IhkfZzhr2Q2OVWwgIaQIPZK7EvBHOBmmoNuKQh8DT8GKc681qjscRX3wKXc2/1V+U7rmcV/JO/Xot4sa80WhkRY8C71G86ch3kKAQVa+CADHuCEIjV2C7yRk4GSRaguf8YZWDP+3Yu0OBlLleRWcweQiozhWOP7FkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=W5GrnDcb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4csrLP0GnTz9smP;
	Thu, 23 Oct 2025 17:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761235133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DFJOfVdkWJHRulD8HfD61vkF8//SbVsJWE5Pa+v76dg=;
	b=W5GrnDcbXg1dREAbAcjJ1Wt7/WmhgXyx+Hj+HHYDdcOpfiiiJhLIVMbe/C/sOR0XOHrqLl
	0Z7TJG/FLOmH7PiW8JAY/9aqiuoAoXASwb2B/dMdU2V24HNZdUz37K5u3IhMegIpkZdIKB
	YodUfnbAmanb0GDHUwMD+wmyJGQC3duu8ZQkLmgA6esRvo33HcgTIzXipi2aJDzXE1RDBP
	LOKQ/bCaBy8GBEWdfvq2XVY/YHmiDXYwvGxx4Sw4naKwybeazhiFh6DO5i4oNPM4cH86si
	xObNgqj9JWbvHUCYskpUz3YhafKn/90VTJyjEaS9PdMbjstDPOuOmTY5U3WuIQ==
Message-ID: <adefdb3e-7a10-42a2-b2fc-8c1490762454@mailbox.org>
Date: Thu, 23 Oct 2025 17:58:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org>
 <24c8da41-37db-4e69-b9aa-e33b2154acb0@mailbox.org>
 <87y0p13dlh.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87y0p13dlh.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: c7wrdi8qspfi44q66t5f7171c9wa659k
X-MBO-RS-ID: e2587fe32a5827e83b1

On 10/23/25 4:19 PM, Marc Zyngier wrote:

Hello Marc,

>> Except right now, I still trigger the AMU faults even with
>> ARM64_HAS_AMU_EXTN=n , which I think should not happen ?
> 
> ARM64_HAS_AMU_EXTN is a *capability*, not a configuration.
> CONFIG_ARM64_AMU_EXTN is the configuration. I have the feeling you're
> mixing the two.
> 
> Irrespective of the configuration, we access the AMU registers
> depending on the what is advertised, because we *must* make these
> registers inaccessible from EL0, no matter what.

Ahhh, I was missing this part, thank you for clarifying.

>> I would much rather be able to disable ARM64_HAS_AMU_EXTN in kernel
>> config for the old devices with old firmware, without triggering the
>> faults ... and say that everything which is going to be upstream will
>> always use new firmware that has proper working AMU support.
> 
> No, that's the wrong approach. If you leave the AMU accessible to EL0,
> you're leaking data to userspace, and that's pretty wrong, no matter
> how you look at it.
> 
> I also think your hack works by pure luck, because at the point where
> your CPUs are booting, the alternatives are yet not in place (the
> kernel patching happens much later). In short, this breaks
> *everything*.
> 
> As I indicated before, you have two options:
> 
> - either you update your firmware and leave the kernel alone
> 
> - or you implement the workaround as ID register override so that you
>    *must* pass something on the kernel command line to boot, and by
>    then accept that you will leak critical timing information to
>    userspace.
> 
> Any other option, including guarding the macro with a config option is
> *not* acceptable.

Since I am getting an exception when I access the AMU register, would it 
be possible to trap that exception, and report something to the user 
instead of outright crashing with no output ?

Similar to what Linux already does on the various speculative execution 
bugs on x86, something like this?

"
MDS CPU bug present and SMT on, data leak possible. See 
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for 
more details.
"

-- 
Best regards,
Marek Vasut

