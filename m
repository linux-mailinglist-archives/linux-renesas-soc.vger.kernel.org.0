Return-Path: <linux-renesas-soc+bounces-27050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2892D3AE26
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 263BE30028BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77002364E86;
	Mon, 19 Jan 2026 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aofN5Y1g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BB0361644;
	Mon, 19 Jan 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835027; cv=none; b=WQiCXAUAy+FZHaI2xOempKCl7tVOVQstaIWeaBg5j7E9Nzwo9C+vD1jSwiStLKS2HSiS3gLa+MU8t/GdeafNGaLb4JcVM7T1RHKXGIm5wtHmILyS9zYO9pZq5q7muIQ+ztiYYfAWDnJcncE1tWBR3S3Xnw5QNRxOjO72+qJRFe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835027; c=relaxed/simple;
	bh=ikF8c8MyMN7D3wgjAcZ4aJ2nbXuXypQteKPbJ/ofgCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSF8LEU0IZl6TiSVZJNDeDLwjvsMvTriJ2/HSt48cAovt+R6oBqRHHSvcapOlggXfdv9sgq6/vUSl5iwyj3Bcb2JAC4VL/an/O5p/f9uAc+yt5NXx/QS0KbBW0hPr4q+gdi2EwpVQ+ztCTnKPDGYw9aiStMsYGIRN6Q1ItSSMk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aofN5Y1g; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dvtxz0cB0z9tZT;
	Mon, 19 Jan 2026 16:03:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768835015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Id+i+LQWFIhUmjzvjjC4QidOomx5hC+Mgndny8XvS8=;
	b=aofN5Y1ghPXxxm7PZQMXkWpQGqhnPrg4d1t5cIyVoxlG48GhVxUn+TwVcRswVMPa60Hv/M
	SDVr5y4sbe+6NRMb87hoeevuDXPylLiIq1iQDr1xRnUyoQ26QqF3XApXp5yJrmNE80kEuu
	Kyr4IySvrrvb072Y1U2XX6P7o75CLp5idmwx0cBFeW5FsoJ8BkfC2mzQPn8Lwlwba3SUwQ
	Vkyxe4qxpTxu/FrgC5cd0EEphY+SevteOgyEW/Rfbm2rolCXcCrfO5k9sfQXiZBQEhAplz
	hxBOkETGc17EtR+Lvh/8afzugEMTmaeJDzwql+W+mCsgW462c6laLi59Jy90Ag==
Message-ID: <d67b03aa-5f9f-4cc5-adc4-549cc2e71688@mailbox.org>
Date: Mon, 19 Jan 2026 16:03:32 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260118025756.96377-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVkYUwYHOCtFb==YJ=1TK9+Tz1X=teaoyoooxe42eBYFw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVkYUwYHOCtFb==YJ=1TK9+Tz1X=teaoyoooxe42eBYFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ddieokya95e9x34z8i8ixj3ofqgg9eii
X-MBO-RS-ID: 3778be16ea10f389e0c

On 1/19/26 2:55 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sun, 18 Jan 2026 at 03:58, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
>> there are 8 slots for those newly registered clk_hw pointers, else
>> there is going to be out of bounds write when pointers 4..7 are set
>> into struct rs9_driver_data .clk_dif[4..7] field.
>>
>> Since there are other structure members past this struct clk_hw
>> pointer array, writing to .clk_dif[4..7] fields only corrupts the
>> struct rs9_driver_data content, without crashing the kernel. However,
> 
> I am not sure that is true. As the last 3 fields are just bytes, up to 3
> pointers may be written outside the structure, which is 32 or 64 bytes large.
> So any buffer overflow may corrupt another object from the 32-byte or
> 64-byte slab.
Indeed, updated in V2, thanks.

