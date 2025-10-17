Return-Path: <linux-renesas-soc+bounces-23236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7EBE87AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 13:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA2944EB205
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2E22D73B4;
	Fri, 17 Oct 2025 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kc7V9LSZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1931425B1DA;
	Fri, 17 Oct 2025 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760702098; cv=none; b=bYEBsevCOF6AoqT9g3g/mv1iK7dH/scddztjJ4zcO6JubxUgQWOr3S0oYNipkP6sPQtLQR6HRMIARjMb1fljOkItnU562t9UFDZneBGhO6g50FbxZ471xOTb7qTpPJoQO1TiZolkzJclZVu1TASHdj6BF0Wrp9hMzjpp3F0gQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760702098; c=relaxed/simple;
	bh=JdAbJBpF9zCBoKvtDSDBNLnvobggDoj7c0HLygpXH/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5P1mycXolFJvx1dwQbCa3k67q4AyUJBEHorY/Uc4pMsMrPX/a5lKZuF6hD3tZhPbKIoSIQRb1eRoLWC7A2HL7iAl6xtS1ZDGfGv7WlFBzYaVTcB1cLHuer/OmKHYlu1TYHM8hmENCsCbMXkgavEli0pbqVaK2Zidq+X/zfsONA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kc7V9LSZ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp3Cc1h0Tz9skc;
	Fri, 17 Oct 2025 13:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760702092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JdAbJBpF9zCBoKvtDSDBNLnvobggDoj7c0HLygpXH/w=;
	b=kc7V9LSZo66ir7JcUJFGhlBxzRvoxPLTR/Knz7XjYFfumcTY67TphUakUXv+pg4pPI6Ztr
	wp9vtz7K7OqorSNIb+gSfD3Khbcj4V7y0F/hSrcviyYCCbvNqUJD1XnAWjm1254eDOYFHg
	U585Kul+RscurBTHevxOSO1Y6iYbnJFEMGhKyKL1gOnVqQ9vFYXyBdDAoaIJ4WR36xCvm7
	6M8wFCdncpGW10Uz6CIwQnD5+NDOB/NY/kged5JcXBdwattx3GY99s3SzmRuvAi/f/Dbsg
	9EFzwmZzL4doUaYTjtkHBaamAXC7Qywz5xldLzMPJaHmRtCU4uMVLQPQkTXG7Q==
Message-ID: <dfef29e0-ac4b-49c6-acc0-dacce63696de@mailbox.org>
Date: Fri, 17 Oct 2025 13:54:50 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: t9jbm8gacfmjx31xweo6zfzwxoc1fcfg
X-MBO-RS-ID: 7befe648c9dbbe42869

On 10/17/25 1:51 PM, Wolfram Sang wrote:
> SparrowHawk may run without ATF

Nitpick: It is abbreviated "TFA" now.

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

