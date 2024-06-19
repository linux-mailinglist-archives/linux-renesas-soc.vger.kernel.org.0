Return-Path: <linux-renesas-soc+bounces-6514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F5C90F6D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 21:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7919283B79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 19:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EAC15749C;
	Wed, 19 Jun 2024 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YoJZoIHo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ebe4Yjbs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F168475;
	Wed, 19 Jun 2024 19:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718824663; cv=none; b=MuKNQjGzhfXlWcZsZROg9E9CyOElKvP7ZNR5aWdHmXJeUJ7HKmUSzk+aLOoaJ+dS2NEenmJsZLON7Q71FQeElh9upAOOk1GBOEAXHSfsjXW9OeLHhfZ1WDgjMFOCAhri4+neV70wBjliiizC9F8gYn4VS8L1R30eS8vhz4z59EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718824663; c=relaxed/simple;
	bh=uvdix2AUJuTqObCGidaxun+B0yX5VPB9Y32EgkgNK1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFpaA6uJxNf5paPIGeAGNvtdWFgvDav2lsLfr0tVO6vI4ZBHFQqJ752gwEmxgPONdV1GtYahcLSfFL/41MByvADCN2ujOzm6wpRFDg1zFIGankTdM+KnG7yRbupydDCvboU+mL4s73P17Eo5my9hYmaGFylPqWJledd2zrD+j0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YoJZoIHo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ebe4Yjbs; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4W4D0D0XHBz9sbf;
	Wed, 19 Jun 2024 21:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1718824652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSr1Od9WFO6Zpf3tRHQVtZyK7tS6Amel2M2Nf15k1vs=;
	b=YoJZoIHoEpuOSUdLDSj6buFEgkxpb4GUaQW8g+brwF4RRxuXvKddAttN7SW7O717FpT90L
	hBoAVMShch+bQaDq4QIEljsk53gJ4ZFD7jsqzO1ngMkZdUEMt/+Z2Z6OmmMWul7MVBkDp0
	LFoJHQteZevBPksZT8aBz0JvQirFN4jsNQzSwGjYUMEgqf5BIl0221jNJVfQDtQank9Yxw
	NsgH6E8QWy29dckvin+R5OGKnj54zY+/5UtdBLoN6UhB7GHCo+wZp3Id1hk8J9hnSbPw/6
	sdRLKkb/6VnNu95Uu/AIJegQ9liNMjytRQNq6ysMeWkO+7uP9uMKs4w197iEMw==
Message-ID: <43a57696-eb4f-4ae3-970a-cee0640baa17@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1718824650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSr1Od9WFO6Zpf3tRHQVtZyK7tS6Amel2M2Nf15k1vs=;
	b=ebe4YjbsfmY6AZpNIGrFphYDMzqCyh0KhYYlofpgDnXdxFCTe7WvHCogurCVuZw9zvPOnf
	P9OEokfvQ2ex7W0G29K/TPyP47Q4vtVlDDzrWkEaRgAcmEjpcmiAlkKwoQtCxIeUKXVUuJ
	1bwyBSkXGqvzu2L6ZSOyerYQuAnPxSSXUuR8ZB041d7Tp9QsqZr3pz49YpGs8mkpIDwwDQ
	ObC8OPGz0mXJeHCX9pg71RsFJk8Mfbh/otv+eAQoMP0RZylldHGeQkUjqTuuM0KxGbvQsE
	4ASx3x53PB3HP71lwhArZDRJdImXBGpXPxfbQLY0WeRYajwjfgviEdpfZQNKig==
Date: Wed, 19 Jun 2024 21:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: clock: rcar-gen2: Remove obsolete header
 files
To: Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 marek.vasut+renesas@mailbox.org
References: <d4abb688d666be35e99577a25b16958cbb4c3c98.1718796005.git.geert+renesas@glider.be>
 <20240619-explain-sip-97568f8ac726@spud>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20240619-explain-sip-97568f8ac726@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 17c7cdeb49a11f25631
X-MBO-RS-META: ufzdkouswyfk5rtwey7cc4f3gw9hgh5n

On 6/19/24 7:48 PM, Conor Dooley wrote:
> On Wed, Jun 19, 2024 at 01:22:46PM +0200, Geert Uytterhoeven wrote:
>> The clock definitions in <dt-bindings/clock/r8a779?-clock.h> were
>> superseded by those in <dt-bindings/clock/r8a779?-cpg-mssr.h> a long
>> time ago.
>>
>> The last DTS user of these files was removed in commit 362b334b17943d84
>> ("ARM: dts: r8a7791: Convert to new CPG/MSSR bindings") in v4.15.
>> Driver support for the old bindings was removed in commit
>> 58256143cff7c2e0 ("clk: renesas: Remove R-Car Gen2 legacy DT clock
>> support") in v5.5, so there is no point to keep on carrying these.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> If U-Boot is not using them,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> (and if it is, another task for Marek I guess!)

U-Boot is using upstream DTs on R-Car via OF_UPSTREAM, so whatever 
happens in Linux also happens in U-Boot since 2024.07 ... with slight 
sync delay . I don't expect much breakage.

Thanks for the heads up !

