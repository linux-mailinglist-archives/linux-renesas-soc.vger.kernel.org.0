Return-Path: <linux-renesas-soc+bounces-22676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8E9BBCE1B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 01:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 511994E2BE5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 23:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6851F428C;
	Sun,  5 Oct 2025 23:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NFlmAVk5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB769136E37;
	Sun,  5 Oct 2025 23:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759707665; cv=none; b=XxKev321LdU4/TKU6m+0qqZCF9bNcNDCkl2DSRRv1Lq9+wDynw6IQyOAU5aojwgV+op3x9sdP7aKIOiJ+y+DZTrGFig1fcGkS7x4wYrP52XOA5sg469nC3V4ZJPC3fRptrQI2EWEPIWR8tKjH+r8BjTlm0FypMd865iEi5PiM1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759707665; c=relaxed/simple;
	bh=N7cD2gGAAxziXJcNrC3N7KOux6zuQjjgQQs+TIsAG+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=naGGq65gbYAUHGBQjLlm378NspdrTxpc4Uq7EEFVccjhJGs7ZRmt97rDmP4h7cBTEQIes557gieijnSjQJy+gu6H3/TqmTP+oRXVSmxSKwPOQ9m5ubdFaIcTWMQmojNZZS55dqYJbjXqe+SKpeEHHVe7wAE3iMmTRKsy14q0seQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NFlmAVk5; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cfzRt6yhNz9ttQ;
	Mon,  6 Oct 2025 01:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759707659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zzWqlghmi182mWfac2TRN7BuLDfbmJWxZqJcJW6srk=;
	b=NFlmAVk5BsHdxuvYSrRfRQwdKAyycYHdZu44m2HSVzZyWSGV3RYsuvEjOdjPm/S1VNNAO/
	hDQwhcr0zAYWMQOudUwSh8MAkzwBPRyLWN6R20TYoxL+5AfodprdzsVukzvtl+H9Wem83I
	+2MrinqPY6rd1EuVnioLeMmW+3Dz4nIOsfGdPzDKECnDlINRXjsSd6MbXq6bl6EZ0TwuN+
	W4+hX1W74ItDya8L6MwZTx06uaAsTh6l8VR3M5phGj3PXve2wSd57z5bXH/hNZX6/029h0
	0L/nIbF34VRfSQ7Eb4tobQf50xrIWk2Vy8Z0qBMrubifR6OHuZauFZQtXfOWdw==
Message-ID: <01fa4d9b-2ef2-4410-a690-35a28591ccda@mailbox.org>
Date: Mon, 6 Oct 2025 01:40:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se>
 <a59212ef-3555-4003-9c71-4ac80eac5cc8@mailbox.org>
 <20251005071219.GD399701@ragnatech.se>
 <d3d7a87c-889a-4e63-8a38-8cbea7383ee0@mailbox.org>
 <20251005134220.GA1015803@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251005134220.GA1015803@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tdhhndt7omimix685npi7xdb4b77spgq
X-MBO-RS-ID: c6bc1524fe072a4b18f

On 10/5/25 3:42 PM, Niklas Söderlund wrote:

Hello Niklas,

>> I do wonder, would it be better if risp used reset_assert()/reset_deassert()
>> when performing reset in atomic context ? Also, why is it even performing
>> reset in atomic context ?
> 
> The ISP driver needs to serialize a set of buffer queues when it want to
> consume from them. This happens at two locations, start and interrupt
> context.
> 
> As this was not an issue before a spinlock have been used to marshal
> this. However at start time, as the spinlock is taken anyhow, it have
> also been used to protect against multiple starts that would call reset.
Now that I actually looked at that driver, I understand, thank you for 
pointing me to it.

