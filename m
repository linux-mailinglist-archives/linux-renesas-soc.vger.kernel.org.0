Return-Path: <linux-renesas-soc+bounces-26973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA7D3958F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB7A6300974F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3603314DD;
	Sun, 18 Jan 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pTVvOrQS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36A32B9AA;
	Sun, 18 Jan 2026 13:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744439; cv=none; b=DeULyDBEWlBUirVOo4QqlIhZkRwrXlamh3W2pgvaGI8nc76r9RBPNay5F+7aoH2kVd845LMzizoQ66BDTFDskMfPZoiPmuSSTHOgXRlvvhT1WTwoRhBSQRVns1QcJWnEXWuVgAss2NTcOArtzJV+yoNk0xCknlXf4EiovycHHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744439; c=relaxed/simple;
	bh=eay7wPLxQfe3nYEScgjq0qMMQY3Hxy4x4/YcLmz8WG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfR9u6P6uy8xLwytwyTa+/1yhTJG36D6cSfJzPSZM/2XZ1LITuTo5qGoXilEhO8l2W1PJowBqXhBeJZ7SIOHR1BQdGvcH9wRtM6NCfhSC9MbEEg/w0qNYXyO2MOPoafNDlyAGa3JC6fTx+nLIUNp7LSMBw9yejC0ApvoYkdG56o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pTVvOrQS; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dvFS22HWjz9tnX;
	Sun, 18 Jan 2026 14:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RP95xjhO0x5zacRzTjckv+YNw51xsx1l34bJNxCRC2s=;
	b=pTVvOrQShEbKCwguVoY7Q01yVoqs7E5ZnRP06ZNyM2yOPCtuG5/6rR6K+FFpDnz+ry+jbX
	2moksGUYUz1wx4+zRDAkjJNtVRlbwNkGXhyipdL8jwX292PRCsOf6NYFuybCvc/SavK4mQ
	Y/TTstD+Y6h0o2kncz7hSchSryY2gWA2wxM2OcVbDbpMaowjyMJFbpo2m8Czgiwrw4t7hK
	+S1O6ZStsS1jXWg13/IaWQPedEYcoh/rikUwi2NHPZcxDNEJ7r2mqXn5UHOUr3sHvYRUUV
	/pR3BebVQ9G32uFHsRHKWYRNEdtx2kJ+fvqBbljcfJclRZR8l/JmLcxfEGdYpw==
Message-ID: <0bd00d89-fa5c-492d-aa79-74cd6f91dfb4@mailbox.org>
Date: Sun, 18 Jan 2026 14:53:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 01/11] dt-bindings: phy: renesas: usb3-phy: add r8a77990
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
 <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWZzL7nUCv6LnDaDhpMwfrnJp3ZYPAqQtDJ3BsZyH9k6g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWZzL7nUCv6LnDaDhpMwfrnJp3ZYPAqQtDJ3BsZyH9k6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1f3453732dad7ff4a3a
X-MBO-RS-META: f5b3sgjocbmrwb1mudzxi78w997h87wo

On 1/14/26 11:22 AM, Geert Uytterhoeven wrote:

Hello Geert,

> According to Section 76.1.3.5 ("PHY Register Configuration"), the
> USB3.0 PHY register block is only present on R-Car H3, M3-W, M3-W+,
> and M3-N, but not on R-Car E3?
> 
> Likewise, Figure 76.1 ("Clock Distribution [R-Car H3, H3-N, M3-W,
> M3-W+, M3-N]") does not cover R-Car E3. Unfortunately there is no
> separate picture for R-Car E3.
I replaced the PHY with usb-nop-xceiv in V2, it seems there is some PHY, 
but it has no configuration registers.

