Return-Path: <linux-renesas-soc+bounces-19722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45396B146A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 05:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97787188DA6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 03:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A4E21B905;
	Tue, 29 Jul 2025 03:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oInzvGYU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9555741AAC;
	Tue, 29 Jul 2025 03:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753758609; cv=none; b=LrvfXIUzQzE2vTFQVmTiECjpG7ExAvsR5YZtRxYfKRRMKK3fCGrBMx94aLEhf7cnivYeEuogGGnICTviI7DAmPcrbp+xERg8riNoCxqmnEiNZUdJ8Sal5KpBQJuGGLZUYXXxE3OuHdEOjpCgS4wmMVbFKi59LL9991fbdj7kWHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753758609; c=relaxed/simple;
	bh=YfUwWmSie+JBdFUcHXB+/SwHAIlZ/odzzp9WpwB6jIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyzZeT8T5f8l8jXXJ/cqKnrCOHcWpIZ4worVil58q4WEQre4AaQNjaph82LN3kEoZti+v7PoRbJXbFZlAfDSpujMn1cTYoGs4yshBA6hIGGGXj+ISBmKQUUlajVWqjFk2KMxXX6KV1CqdThGi2TjYUesKGf6AgtJNHly6CbHKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oInzvGYU; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4brgLt0pJRz9sr1;
	Tue, 29 Jul 2025 05:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753758598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4RbrZ/Lc50No6eFKtJbvDodwX9CC0Ieuiq0+oZ1l2hA=;
	b=oInzvGYU3UHwKxb25kLfLUckkJ0nuHV1eKsMqHugDEGSXzGBfknsXmt7FKyC0jCERiffl5
	PPPAWRB0pOH/Krk8sOx3MY0O0mmqJJn5YAqWLvyQOwl6O3P6NX37EMQl1AzDKPcW4XtujJ
	Pa+HyNyn6A/lwsGUiLewXdE/9/xNKWOwAIGGqozEl24r3X8rHsBZZQvFXrYk/ptHo5wyVh
	+xXgrvAMIMQ5gJECKkfEFFk93f/AnSS6zIS3z9L8zz8BTfffsLzWcpM8FW8zYi9vQ709/b
	2YYFcLCU0D85kQMGepiDsMmmD5UkNXtOaXFlyQE+QfhoSAzDAF/6zXQteQqEBg==
Message-ID: <b9c9ba83-6da2-4295-b058-a0520c9df806@mailbox.org>
Date: Tue, 29 Jul 2025 05:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Mathias Nyman <mathias.nyman@intel.com>, Vinod Koul <vkoul@kernel.org>,
 stable@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
 <2025072828-suspect-work-12ca@gregkh>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2025072828-suspect-work-12ca@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2895dcc8d9f35d888df
X-MBO-RS-META: z4ewuoofthbnxkithag6fcpqd37pqwgz

On 7/28/25 6:18 AM, Greg Kroah-Hartman wrote:

[...]

>> Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Mathias Nyman <mathias.nyman@intel.com>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Cc: <stable@vger.kernel.org>

[...]

> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>    older released kernel, yet you do not have a cc: stable line in the
>    signed-off-by area at all, which means that the patch will not be
>    applied to any older kernel releases.  To properly fix this, please
>    follow the documented rules in the
>    Documentation/process/stable-kernel-rules.rst file for how to resolve
>    this.

Maybe the bot should take into consideration Cc: stable below the --- 
too ? Or is that considered invalid ?

-- 
Best regards,
Marek Vasut

