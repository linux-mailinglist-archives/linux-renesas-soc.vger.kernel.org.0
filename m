Return-Path: <linux-renesas-soc+bounces-12966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37201A2DFDD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 19:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D13ED162136
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Feb 2025 18:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F1D1E1A3F;
	Sun,  9 Feb 2025 18:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jCLsmapj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8361E1A2B;
	Sun,  9 Feb 2025 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739124654; cv=none; b=dQu1QnxVx66c6WtIpD9X9UsjyvdZ8Icx2fJ8Wfs1BS4ouOO09izXepkvXe53+wsqZdsQa8r1q+ot4cYoif5GWZvkeXwk4p7D5WMvrQH4TYQ6csbaf9oBaX6V/IiTd+k1AODfQMGxWgUK6kZTvUUlCE5AF/wf0ugjKgCbvzARgKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739124654; c=relaxed/simple;
	bh=qs23obNKKFe4op5JfkMxg4fN9JOyoeNp2uFOd+rxX5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2ErDs67oIdBntv8bUAToGK/6FuDx5guVnlyqNpN3lhZ+ZvmPHubxqePuBGUbkPdWR3itLJxQE7R6mBVw39HtD6JpFqNMgnW9O8vD0/ZyBUUzgHcDH+2Kzx2W+X9jSrwQ/BxJa4f82stUKdR8rq7pbPD1PncDNHhL2F3jl39rAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jCLsmapj; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YrbNn432bz9sT9;
	Sun,  9 Feb 2025 19:10:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1739124649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3iEJXijATj4tpFDjxXid73My73GWSrZLDbBzbHcKa+g=;
	b=jCLsmapj787kULDtCV1AItpLkjIxAaWnx3D8eX0WtbbA73+zyi4xKkU/DV8DuYRJapqVmB
	pjX0EXzo33B/LrWipxZglRMD+7EmqUlpWgFYPwwXJeqeE0pqdjmPsWfmOHHoztO3ryzPji
	pnKg87NcU9MbYCTVi2TUkT6eXeZyy3Ipfg3PI8LEbgicxu/XUYCzjtOOwUTEKrK29MIdw+
	pyOYPqVcKeAeAs33a/0JaT11RWO3BovCDBOeCZC+ah7lO+32UpyGjBuCVVS1aJIvs9wDM3
	5CHbOzHfLsSYTnxPzf5h6hBndaUVVK1lv2yvRLWEcZERP3Cxb6OFjvnwdYI0qw==
Message-ID: <e10ad19a-af26-4aff-9f49-5706946f735e@mailbox.org>
Date: Sun, 9 Feb 2025 19:10:47 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode
 quirk
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Oliver Neukum <oneukum@suse.com>, linux-renesas-soc@vger.kernel.org,
 stable@vger.kernel.org
References: <20250209145708.106914-1-marek.vasut+renesas@mailbox.org>
 <2025020939-mammary-prevalent-df29@gregkh>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2025020939-mammary-prevalent-df29@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: bc6ef790259dcfb6dc1
X-MBO-RS-META: 56a1wycbir85qm8hirdg96esbpkdx6bw

On 2/9/25 4:44 PM, Greg Kroah-Hartman wrote:
> On Sun, Feb 09, 2025 at 03:56:11PM +0100, Marek Vasut wrote:
>> Add Renesas R-Car D3 USB Download mode quirk and update comments
>> on all the other Renesas R-Car USB Download mode quirks to discern
>> them from each other. This follows R-Car Series, 3rd Generation
>> reference manual Rev.2.00 chapter 19.2.8 USB download mode .
>>
>> Fixes: 6d853c9e4104 ("usb: cdc-acm: Add DISABLE_ECHO for Renesas USB Download mode")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Chris Brandt <chris.brandt@renesas.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Oliver Neukum <oneukum@suse.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: linux-usb@vger.kernel.org
>> Cc: stable@vger.kernel.org

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[...]

> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>    older released kernel, yet you do not have a cc: stable line in the
>    signed-off-by area at all, which means that the patch will not be
>    applied to any older kernel releases.  To properly fix this, please
>    follow the documented rules in the
>    Documentation/process/stable-kernel-rules.rst file for how to resolve
>    this.

Cc: stable is right there, below --- so it wouldn't become part of the 
commit message when the patch is applied. Is that OK too ?

-- 
Best regards,
Marek Vasut

