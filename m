Return-Path: <linux-renesas-soc+bounces-7321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 160469306DB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jul 2024 20:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45C451C22C2E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jul 2024 18:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946C913C9AF;
	Sat, 13 Jul 2024 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cZz86+wP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A0125B9
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jul 2024 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720893815; cv=none; b=Tct6X14dOTj0ZaGj7Gx7bmvd39dI3Pv6dFIQZ524Y4Orp3fLlzLK6RTZWRFEX6MDQVTBotNkO6tiz3PX/LnI4IUBQD2xU1TemlLv9srHpMwEr5RcE1z7YU7Uq2MDUmt/TP9XWcHpOpO+DfmI+ZKltxDWTgCfJOoEEfzU4fMbJ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720893815; c=relaxed/simple;
	bh=qfNLClYKuLGC3GzzlG+xM5F7POXgIIlO4WSBFZVXzQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZo+Jvp6F0cBPo//WNhzO5EXFISb3oQFJLStrTvhAZpVM/vPcxOOJLO9iwBWeHXWxJwJW8TyIeYYyQPxHXP0gN4YA/lz5nYDsjYzMd+J91gwFSiEcDgHbt99pvQfb2DjUJ7uwajx+TfMUkAEOaiW+WIfsyY7SzDtndwus+7izK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cZz86+wP; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4WLxCZ2Jw4z9stj;
	Sat, 13 Jul 2024 20:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1720893802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoATaKDFjZas2rUjvaEOXosOGIl4QjglZECyAb1+ROk=;
	b=cZz86+wPgx/KushKdjV2YnTIxCM08d3gWO0Z3tD/qFLtE+cWrXMb02URNUTpVokAks7fcX
	kvNLxGiSYcZU/WQO6hM2ctet/7w/pBW9ydEKVbmc3oKex3yiMu+aD9V3QPQgtxCGdP3+vN
	5/viy0VJLW/QYBGXyXzNss6V0sHbmn+zeJ5hzyphJSRt3ztx78FBsRQZu9vcao3fD0WvLK
	mRcXU9IEagzAw1FdeORy2dWyjVpDqEWuyY9t0kl++ITw/zJ0MqL5F/HgvCRrLNXUovKtkZ
	f4nJLY9qWNUMe6uOY+WnO2RUs8YFvsTNvs+EGCKT/HE1voB1LIRiJc/FGEZfAg==
Message-ID: <f71513ea-8e13-45c6-a8c5-f6e5a8b84446@mailbox.org>
Date: Sat, 13 Jul 2024 20:03:20 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH uboot] dt-bindings: clock: rcar-gen2: Remove obsolete
 header files
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, linux-renesas-soc@vger.kernel.org
References: <6355fbaa5e3c40d6790cb5aa6ffc1c573c1f08ed.1720790104.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6355fbaa5e3c40d6790cb5aa6ffc1c573c1f08ed.1720790104.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 6078bff826a4355ec0e
X-MBO-RS-META: g88i6n6sz8pqnxxyk5d4xh7k4tmxedoo

On 7/12/24 3:17 PM, Geert Uytterhoeven wrote:
> The clock definitions in <dt-bindings/clock/r8a779?-clock.h> were
> superseded by those in <dt-bindings/clock/r8a779?-cpg-mssr.h> a long
> time ago.
> 
> In fact U-Boot never used <dt-bindings/clock/r8a779?-clock.h>.
> The unused headers, their replacements, and the corresponding
> r8a779?.dtsi files were introduced together in U-Boot v2018.03.
> 
> Fixes: 16b6e4aa3732cee1 ("ARM: dts: rmobile: Import R8A7790 DTS from Linux 4.15-rc8")
> Fixes: edd15fcffba31452 ("ARM: dts: rmobile: Import R8A7791 DTS from Linux 4.15-rc8")
> Fixes: a3fb9ff3b33fae05 ("ARM: dts: rmobile: Import R8A7792 DTS from Linux 4.15-rc8")
> Fixes: 92aa09959271d08f ("ARM: dts: rmobile: Import R8A7793 DTS from Linux 4.15-rc8")
> Fixes: 9a26fc5a73fe2369 ("ARM: dts: rmobile: Import R8A7794 DTS from Linux 4.15-rc8")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks

