Return-Path: <linux-renesas-soc+bounces-26173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 442E5CE8835
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 03:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF32B300E3FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 02:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F9A749C;
	Tue, 30 Dec 2025 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Q76Np9mT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C414F70
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 02:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767060024; cv=none; b=Qt3ijYp9oXwLCFj/S73SmMmSIb4+Dqe7JhQrsZ+1WbNKWdPE3awedvgLj7GR64XSf/OOwEo2LvRnYMlBB2e9W3+jB2z4o/BsMEqdQwzY3pkxezOALR7RzrKA1RlrX0vJEWVqsCGOnyCYpl8YfGYcqtRHb1MPAwjZTGU49EOaLkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767060024; c=relaxed/simple;
	bh=BYLWvyNnIarpoaCeZZf5uVn6YACqaAbN9QKB3OkxBG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEE8q6PRwx/Fgsh7Zu24kYow2SI3f4iFaB4+EzLOtU7QzWtS9ccbYRCpQfhixXAJUTLBkxoSGJ3a4LTs3Nd+jveyvy2OVkKLPa9kp/EqfGJWY+rbiy/4czs/5fOr03Gs3DCRbFoqBm+vQ4A6SktUuP5Kl4reUqJql1eutl21FvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Q76Np9mT; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dgGWK287Xz9tJ1;
	Tue, 30 Dec 2025 03:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767060013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69uecwgRKtnI113SYEYBMNlRr9aR/4PXli3pplj4ltA=;
	b=Q76Np9mTD1wuhv22NaAnTH9trBh9GZExepWTALh2F104dz39G5CV4urZkP39CyOKtSsJJa
	FVUuJIF1scEwoUDnESRbLVEanIQ90KT9lHTEKsxm/s1JrXPvf29sIg4sjRXBVqPtgGNwQN
	/zYI8kmQ+Pjqbk42iWS/oJnfr0UslFuOE8ube/teX/HGp8Ic1OGUnN8bNw8Sn9JeUr1omg
	07BEVjENGPG5fm5VvL6aK9n75bA71ofQ9aVieUrGRcBMTCl7A8NBLrPUyxt0m9cYqdFCUn
	OQ7tjttfikt2fFbrpy0XN3ErqT9rEXHJEJ2YbQ30efUjJDWwq8ziS7Hq7HJojw==
Message-ID: <b0e0afff-2693-4bee-9fb2-afee5565d4aa@mailbox.org>
Date: Tue, 30 Dec 2025 03:00:02 +0100
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
 <adefdb3e-7a10-42a2-b2fc-8c1490762454@mailbox.org>
 <87sef83azt.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87sef83azt.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: baf2eae30d738fb5f02
X-MBO-RS-META: 93cbnmj9ho4cm7w1drqxb9xo93s1wjgd

On 10/24/25 11:27 AM, Marc Zyngier wrote:

Hello again,

>> Similar to what Linux already does on the various speculative
>> execution bugs on x86, something like this?
>>
>> "
>> MDS CPU bug present and SMT on, data leak possible. See
>> https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html
>> for more details.
>> "
> 
> You're completely off base. The problem at hand has nothing to do with
> speculation, and everything to do with access permission to counter
> registers.
> 
> I also wouldn't be surprised if you could take your whole machine down
> from userspace just by ticking some of the AM*_EL0 registers (the
> pseudocode clearly shows that there is a route to EL3 in this case).
> 
> Honestly, I think you should stop trying to papering over this issue
> behind the user's back. If you want this addressed, do it so that the
> user knows their machine is fsck'd, and that they are OK with that. Do
> it by implementing an ID register override that requires a kernel
> command-line argument.
> 
> Do I sound like a stuck record? Probably. But that's IMO the only
> acceptable solution for what you have. I'm looking forward to
> reviewing a patch implementing that suggestion, but I'll stop even
> thinking of how to paper over this in the way you suggest.
Just to wrap this one up. TFA master shortly after 2.14 release now 
contains X5H support with fixed AMU enablement, so this AMU access issue 
is gone. I think this thread can be closed.

