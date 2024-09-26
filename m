Return-Path: <linux-renesas-soc+bounces-9097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0501E987918
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 20:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF68E281504
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 18:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4AA165F0E;
	Thu, 26 Sep 2024 18:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="efMjJFaA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BBD13E028
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727375066; cv=none; b=kXohlQEKjLuUrtjBkNP5d5apmmjmT/a1buvV/JFwkXFoqLJ9K9hWK4ORm/l0gr1UrVavxAkRbs1QXWExexBnZCzDPzEenhWNv2t4LpenPr1d7YJmcOFmMgJdbGba1qkV+6k6LsDhtVGzvrys22KIoD+K12RY3vE1dmiXpaCe0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727375066; c=relaxed/simple;
	bh=bdwFS2SzYZ0cXKSFGRox5N9k8WJXmrvJAWar2Ff4zas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rN+CWVEfQRXkvmmWLkyMme1U5sksaTTWfYANuaf5hj5c6JBZlXxwWvZaJ7EmDh2oJ2NgZ/59h7v9hDsfrAwfts9aFv45uOMz9tQxVOq/ydu4Adwd1LfAANgDgnZgze/dw1j7Q+h5r3Mev9zxVx61NAFU3gGwhP3smmcLGNoxO9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=efMjJFaA; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <cb716925-f6c0-4a00-8cfd-b30aed132fd1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727375061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBpWwiAFWqFs5UxCna+MtvMLuFCVFCDh3YvfR1ViqUI=;
	b=efMjJFaAqPaXfnyrjlOHdz8KGd6T/WKWndUClmnSOmGTQzQsQC/nn4eyZzyGNWxWh82WtN
	NeresYp2ThFoA5010CTgTeUWmZNbptxJxgyvwGamrIOrMQpKzL9+liMcyXk+RBW+mcmIcT
	z/KjM6XRXZ9XP9UlkRKMuyiuHd9q3fA=
Date: Thu, 26 Sep 2024 14:24:12 -0400
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add SD/OE pin properties
To: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Olof Johansson
 <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
References: <20240926180903.479895-1-sean.anderson@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240926180903.479895-1-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/26/24 14:09, Sean Anderson wrote:
> Linux can configure almost every part of this clock generator without
> relying on the OTP settings. However, the correct configuration for the
> SD/OE pin cannot be determined automatically. Therefore, add the
> appropriate properties to configure this pin.
> 
> I have CC'd some people who appear to have access to the following
> boards which use the versaclock5:
> 
> - Salvator-X
> - HiHope RZ/G2[MN] Main Board
> - Beacon Embedded Works RZ/G2N Development Kit
> 
> as I could not find schematics for these boards. You can help me out by
> (pick one):
> 
> - Run the following command and send me the output:
> 
>     $ grep 10: /sys/kernel/debug/regmap/*-006a/registers
> 
> - Measure the voltage on the SD/OE pin on a functioning board.
> - Inspect (or send me) the schematic to determine the state of the SD/OE
>   pin during normal operation.
> 
> My suspicion is that all of these boards use the same configuration
> (SD/OE pin tied high) owing to their common design heritage. Thanks in
> advance.

+CC the people I meant to CC in the first place

