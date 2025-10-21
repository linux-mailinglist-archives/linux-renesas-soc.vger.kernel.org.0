Return-Path: <linux-renesas-soc+bounces-23382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852DBF6B3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 15:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4501355AD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 13:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208CA33375D;
	Tue, 21 Oct 2025 13:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xRxrEqrB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC5328629;
	Tue, 21 Oct 2025 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052482; cv=none; b=DOJeVLvQzNrQPQwS+UZKatF+DY9CXuj09yKNljLyfYzonhiv5Qjs6R3prssqtq3X8ugct0BTzTzX4KIDdGK//ygJeE5s7u9qpQ3wrVHn0PX3zEighoZ9MjBi6GrHpN1AGyOsg6Ay3MtVyCOzUj9EE+fUMT5zaGM7TGw/Yvlp7eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052482; c=relaxed/simple;
	bh=/CBY5XyDoYp57hZ59ItzVntpFvB/9eNEPFE/lL6ab2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTSfe4fIDgVyC5lCvDQQa4zN25wbuG0PQv6ZtAWNDQXjj34X3V8FuZpGqD1j5qBMmKCbFTEGH7GWe/mJUkd5uW8rT0T8qlIlXdO4IrgRz/QloAX3pR0LuawkepzkilB4HPkyONFRiHc6oKJhVuUiT7mX2gTxazql7S6CFuwbl6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xRxrEqrB; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4crXnl74qNz9tK4;
	Tue, 21 Oct 2025 15:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761052476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/zEd5xqpUOFkILaZxmM5oruTGgqFYEwqRpwn4E7Czw=;
	b=xRxrEqrBI56SFMgp9hWE/1ebdGZmXyv030YtGhmYJAUDI5HAuaLX0SEVTAmtvRkj1GJ4/8
	KLSdPTPsrRNnmyZkODzbjxuns336oTy1PGTJpF6tl/Jm9RLH7W93b05pb2oumhfaDo4Rla
	gqTlsDxgNATrdLUYp7D5+D6CEcgyHKDpN6xj4MIJoqm8EBKt7jXxrYELTGeMJ15hv3GbZp
	V3ZmgbEFTygkNKeB7agkCfDi7g73DcnNc9ppFDajvviGQdQQgcAdwTptUVALVCtEXKnK62
	M/4oxntZS9ox0QQaLXwey2N/ITzTEjD9lXof8WuDlKJp7+r7P10NFkK+ABqrhw==
Message-ID: <fba13116-2495-49a3-a1b5-2eecb33bb448@mailbox.org>
Date: Tue, 21 Oct 2025 15:14:33 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
 <aPaSF2lokJ748cTx@shikoro>
 <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: c46a08b9ef3b2cdfa6f
X-MBO-RS-META: qufb5q9rxdj7417677rhtgrwinh4stk3

On 10/21/25 9:09 AM, Geert Uytterhoeven wrote:

Hello everyone,

> On Mon, 20 Oct 2025 at 21:48, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>>> Or better: drop all these swdt = reserved commits?
>>
>> Maybe. Since Marek is maybe interested in fixing FW...
>>
>>> TBH, I always had my doubts about making them reserved in the upstream
>>> DTS, and there does not seem to be much gain in doing so...
>>
>> No strong opinion here. With "reserved" I think I followed your
>> suggestion but I personally don't mind.
> 
> Well, the proper mechanism would be that firmware using SWDT would
> override the status to reserved, preventing the user from using it if
> it was enabled in the DTB passed by the user.  But (a) the current
> firmware doesn't do that, and (b) we currently do not have a use-case
> for enabling SWDT in the DTB.

Upstream TFA does enable SWDT for R-Car Gen3, but not for Gen4.

I can pass SWDT node from upstream TFA to next stage on Gen3 if you 
would like that ?

-- 
Best regards,
Marek Vasut

