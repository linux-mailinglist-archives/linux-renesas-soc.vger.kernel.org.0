Return-Path: <linux-renesas-soc+bounces-23504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8ABC014F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 66D4A35A7DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D7B314D14;
	Thu, 23 Oct 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="E9V3DDoU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C92314D11
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225398; cv=none; b=d/5l39SnJNoUHuAS88lirMBQ8dY/kRvJNqQcestdx7vTtkN04nQAntcJStGtdWFkzc9MWt9rjtS+0bno4gSmw4P5X2yQ2WQ76nhL7oGxJdJmUQ7hsuFOPwmtf4MI+VwpTjG9JW4P3I7VYy1R3L4sFXajPi55Lyxa9ikjcPXDvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225398; c=relaxed/simple;
	bh=qvBMS8bg69d5eHOUXQwEsxEbPD9sTtfrO3mvpqHTcGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWyOxP2pLF6m13d2Tu+BijwJ6so7cW98T6p6Tf+vgSJXfCpfda3c9ODKKr85lBhfomZjLnEWj1aYQrGOmnm5KhLeED0sPV+TZuWW26KLdMBtMprdf+0kWZrqmMFarz+AcA0SfqM8ws34jwszvec+mY/XkqvGdQv3O/AtRmzD9Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=E9V3DDoU; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4csml444B3z9t5M;
	Thu, 23 Oct 2025 15:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761225392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMer0xijIl2lTL04iKtshfq8Fg2YOiTXFJyKnSPzMUc=;
	b=E9V3DDoUbx5FyYIvx8G0YsATqH4+QGhWhoITs6hxMCrVxpIePSXEWX1IAeEtscxZ8/o3Vu
	qc6QJLHcNQTyx1KcX9vWm28ws92IlFu5xHDlSYR74CvwqQdix6gemneKwmbVIcqAKFZs3A
	/+LRBjFg1CqnH7UAZqWUOHhqDLtjcgRkqPR9WzZhWWr1VU9qCoFDUGW2aEy+NbJzZGaXEH
	wfAuNoKpgAKNzWx0EMAihlpV905pbEkJOT9ZWh57WkF3wryBneMBz/cjktegXHncIwwCuw
	E5Mf7T7VWp1d+6RNQbY2Rh495/kVz14Nek+o7SGWTdvlj/lxsQtO7u7CKCQOPA==
Message-ID: <31e56a8b-bfc2-4516-9c3c-2377a8e316ce@mailbox.org>
Date: Thu, 23 Oct 2025 15:16:28 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Yicong Yang <yangyccccc@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <632d6afe-40d3-4632-99c7-b098967bd649@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <632d6afe-40d3-4632-99c7-b098967bd649@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a1aa58c112299b2b393
X-MBO-RS-META: gynmh6oujheewxi6h5cfeo7xnzz34ci7

On 10/23/25 2:01 PM, Yicong Yang wrote:

Hello Yicong,

>> This patch is mainly meant to prevent a surprise in case someone does set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register access.
>>
> 
> then I think it's more proper to guard it with CONFIG_ARM64_AMU_EXTN (I think you mean this above?)
> rathter than the cpu cap. then with the patch kernel won't touch the AMU registers here if the kconfig is
> disabled on you AMU supported hardware and AMU unsupported firmware.
> 
> move the guard into reset_amuserenr_el0 macro will be neater here (personally I think).

I can update the patch this way, sure.

If this is also OK with ARM people, I can send a V2 like that ?

-- 
Best regards,
Marek Vasut

