Return-Path: <linux-renesas-soc+bounces-19946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32607B1905B
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Aug 2025 00:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBBD91888EAA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Aug 2025 22:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE739202F71;
	Sat,  2 Aug 2025 22:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eP6YUORl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E65273FD;
	Sat,  2 Aug 2025 22:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754175268; cv=none; b=LA/rF6WbME9u3gbPxpIoeFavP9cnQhJmbrQXFJO2qdA4uKRSYfrMMb617/T15LW0K7LlU0dAoDBH3c4YeUBRaxsnE+IqVDKPjIOxpGLKZU/P36KaLmDUr57NBlfv2YpimnsFF6TPgjJnZZkzzWql7dzqS5983FvuriLA26gpUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754175268; c=relaxed/simple;
	bh=dHfMxNwLvZKqHxWBvPHdiBmrt2rwCzmOZXJHQC2eGX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfaUfXS+Wjp42+YUQ2VGcdw4Vnsib52XSiiICJRQJPecQmuqJw+KpzfkDxMjifQufNzcn23JVx02P4ij7uBz3g/oowf+Ia7XrN8w1vEXQ4k8kumC789jV/UUjsTHmWOiB1D180OtlR/jt5k/qRaLztFy2upwiv/YW1mhPdhiXp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eP6YUORl; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bvdRY4Pl1z9sRt;
	Sun,  3 Aug 2025 00:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754175257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2jfsrY3vSUyFVNB0L9HWQ/g+F1LANmBj/Nfa0lnUfCM=;
	b=eP6YUORlr7my7eP61pFw5TgHhq8QjzHFKUz7Xa3+WK8KV9RQ5mwfpwFlu31DLRxlZMOiBj
	nHN3GuUcVt6b5wOMhMiXjWtz4TyCLT/YsDpC2Va8PQM+OYCKied4gh2FgMFstlW+Owj2o9
	sRISssml04qlJKzarFCTF/5WNaxnrWYzDC2ciLEB3bM1bXkRfcs4BqFce7i+lzhtLT+VHc
	tSqUGxdU2Q+iHeL+wSXhFt0+JIjYaPoQYIZSE0EziBTWJdH+vYN/3Mzh5QLaJcqa+m74a5
	O7PE3d0KXMdYxTjCyXZzJQTYpA+htOn8eXEAv/TGd2XA+HcVTOfb8ISfPrWmMg==
Message-ID: <7890ba1f-890e-45e5-b0cd-c96a84e3e6f2@mailbox.org>
Date: Sun, 3 Aug 2025 00:54:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Vinod Koul <vkoul@kernel.org>,
 stable@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
 <c47814bf-85f0-4bd1-bc33-63f06b44d9c9@linux.intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c47814bf-85f0-4bd1-bc33-63f06b44d9c9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: e5rtgfbkrtnchtf5dj464tqny4dfi3aw
X-MBO-RS-ID: 90fa7e317ce012994e2

On 7/29/25 5:20 PM, Mathias Nyman wrote:

Hi,

>> diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/ 
>> xhci-pci-renesas.c
>> index 620f8f0febb8..86df80399c9f 100644
>> --- a/drivers/usb/host/xhci-pci-renesas.c
>> +++ b/drivers/usb/host/xhci-pci-renesas.c
>> @@ -47,8 +47,9 @@
>>   #define RENESAS_ROM_ERASE_MAGIC                0x5A65726F
>>   #define RENESAS_ROM_WRITE_MAGIC                0x53524F4D
>> -#define RENESAS_RETRY    10000
>> -#define RENESAS_DELAY    10
>> +#define RENESAS_RETRY            50000    /* 50000 * RENESAS_DELAY ~= 
>> 500ms */
>> +#define RENESAS_CHIP_ERASE_RETRY    500000    /* 500000 * 
>> RENESAS_DELAY ~= 5s */
>> +#define RENESAS_DELAY            10
> 
> No objection, just making sure author is aware that RENESAS_RETRY is 
> used in
> _seven_ for loops, and this change will increase the timeout five-fold for
> all of them.

Yes, I am aware this increases the timeout for all SPI EEPROM status 
polling loops in this driver.

The longer retry count would only have an impact in case something bad 
happened during SPI EEPROM programming. On user system, that should 
happen never -- user hardware should ship with already programmed SPI 
EEPROM, so this programming code is skipped. In factory, this might 
happen, but then it is likely a hardware defect and that hardware never 
reaches users.

-- 
Best regards,
Marek Vasut

