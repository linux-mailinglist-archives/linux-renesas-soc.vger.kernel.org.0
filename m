Return-Path: <linux-renesas-soc+bounces-23673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 748DEC0FE5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 19:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840AD19A7A8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 18:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE902D7DC4;
	Mon, 27 Oct 2025 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pdqDhQOU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0B2BE7B4;
	Mon, 27 Oct 2025 18:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589279; cv=none; b=o6+81Bl2GCCdjZkZfkGds9LgnmhsYJS1xtpuS1+37t1POYXZm7C57/r0xXH2Oz1odzYOKg9PB3gXcbN10syjVQRWjSlH117L9AybNbP/0HILlHAEIBY1m2/NTtzfPC8FffDwumDYpeZmFg5XSeH7Dex+4h5QEsTSCBEb+foQadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589279; c=relaxed/simple;
	bh=Z39cdubHOff8+JKx6/w34BrjsQRivvYjjTuRm9whb8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugxdtWnPFGjroPEsF1MJkEXI9JIi7Ugh4Jh43r51uLltd/xRWy5xYj8vGMd8afkAq+yXUkMZtzkoqYJZJlYq5if7p/0s204RoX3FYnU4KH5CWbIgk9yFT8cqgk0d7NkVrsQGByfhGXIef2gD+lCzIK1jWOdaE9bMgYmxB3z+gFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pdqDhQOU; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwMJp49cdz9v9m;
	Mon, 27 Oct 2025 19:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761589274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGXgCo6JU4IvXIGzJengbpq5Z6UZltKHNPMXOi7+mRU=;
	b=pdqDhQOUEkjZLDNyermMWMT4yNRlqfdwDnuDIabxWNYODbtZipil/WEcpHvLddc0Kr7oKQ
	vskG4Ej5NWbt9EXUGcX3I6JNur/OnuMsbG+Ld9gqe4BNTYI+exZj5m2KqvrglsLW6JTR6O
	hW1QBJfHWhQOMuTids1dyzRUmKCdalMXsTZz02mMnpVFY2qbnnl+sm7QD+akfOWQxQMb9i
	c5EhO555tgYqhu4fsWhN/+AGbBBzioOVzVvGWmGiwRJjuZ2FZZFx1bG3J1Sb4SkiB7zH+v
	5v5Ym3Vy+S8CbgekG5VMbioRfqIor0IQOh0fAnxGk4p3gaxVzvVKc5Wv5t835w==
Message-ID: <29497db1-9a85-4c27-a0cb-eeee839c3797@mailbox.org>
Date: Mon, 27 Oct 2025 19:21:11 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
 <aPaSF2lokJ748cTx@shikoro>
 <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
 <fba13116-2495-49a3-a1b5-2eecb33bb448@mailbox.org>
 <CAMuHMdUP_bH5WW3=3J1H=6SocKzQXPdP7PFfYDrgaj4EhYTaYQ@mail.gmail.com>
 <0e81437f-a13f-4605-b7f7-6e6640411f30@mailbox.org>
 <CAMuHMdXs+FoL5g4ZgFVQ4WwXRt9Y-8BcX27d7=wFFROa939CwQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXs+FoL5g4ZgFVQ4WwXRt9Y-8BcX27d7=wFFROa939CwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 766e2b49623b309415f
X-MBO-RS-META: d39bt3hz13uzkuekaq6cugatc5zwtu6h

On 10/27/25 11:09 AM, Geert Uytterhoeven wrote:

Hello Geert,

> My Gray Hawk Single still has downstream firmware, and I can modify the
> SWDT registers from U-Boot (unlike on Salvator-XS with R-Car H3 ES2),
> so access is not blocked.
> Hence I plan to drop the SWDT patches for all R-Car Gen4 boards.

Thank you for testing. You can also flip the DIP switches on WhiteHawk 
to boot the original firmware on it, it is left unmodified . Then we 
would know whether even the WH is unaffected, but I suspect it likely is.

-- 
Best regards,
Marek Vasut

