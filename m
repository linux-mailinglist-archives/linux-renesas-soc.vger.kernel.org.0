Return-Path: <linux-renesas-soc+bounces-17471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567CAC34E0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 May 2025 15:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E643B70AE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 May 2025 13:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C171E2847;
	Sun, 25 May 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fLs4NpxT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F801DACB1
	for <linux-renesas-soc@vger.kernel.org>; Sun, 25 May 2025 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748179716; cv=none; b=jU+Vuq44fQEdTQ+a2OInGZ8q6TmLNbUatoDc9W75rr6BHVUgCRSkCAwxEttD7qAmz4xWDCpBqPM2p8OD4ZrtjfDm+ZJky08W+CB9CtcFdF1048dwVvIUxLaIEJtHyAVOXUUAibP+OByCrvatZOYAKiw+NhCzMtByhjBCg4ivMjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748179716; c=relaxed/simple;
	bh=WqDSk+LEAoAmUmZyWFkAeOu4G/9Kd8v3MqSjE87teKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqHWMgSLYvcYGTOLmcCVf6xk5/iiKSwde8lkEQ10mFiU5riHVX3EaukGgVVknhOyUyBsBOMj9Rr1sPpaf8WhP8+a1XKey8QSZ4uafXXIC55pyd/4fVF6J9QQm0DBcoN+bKww/8oMdREUgwSWMhSd6154BQq3AnXK/8Y2OUa8abQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fLs4NpxT; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b508Z4NTRz9smH;
	Sun, 25 May 2025 15:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748179710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQmWWku/FFu+96lIaBr90E2AJl45VhKfSp5o/IXdKBY=;
	b=fLs4NpxTS60hzCUCszcVoHhpTcPyZgehrNac2ewITxQ3O0auiy+hkDQVxtJbwZLBa0tQhH
	TRSZpSZZpd8dEwt1L+oe6UrjrFG9GgPwZUnyDFKrHwUVLZUR20lqu55gEnid11hXyVTvOE
	4rCcoHQyyuCRtwHlcl1T9ba7iZ0WsWbCdlSEyzUN069SsicyUA5UoMw7RmNq0Nk9quv6CF
	u+X4DTzeZ+UUmTzJcAonWfBSh5jRfNjnWd5xZHMq3aEdCuyL5PquzjBzr9SbnvPcW9Y0nv
	Jnu1pm4JnZSbU2tKW9z40H2jbACPo2A/Swu+ulwuX0tsSGdjxkLDWS2ysQekmw==
Message-ID: <b29dd7db-8832-4716-9af1-f63a6cd507c0@mailbox.org>
Date: Sun, 25 May 2025 15:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH/LOCAL] arm64: renesas: defconfig: Enable more Sparrow Hawk
 support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
References: <b798900b9ffb0c7f88ce0b960be011d345a243c1.1745842607.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b798900b9ffb0c7f88ce0b960be011d345a243c1.1745842607.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 81c15b6bb0207a8eee2
X-MBO-RS-META: esjd5kzhstd66f7c81t3pk8n6rhjz99j

On 4/28/25 2:18 PM, Geert Uytterhoeven wrote:
> Enable more support for the Retronix Sparrow Hawk development board:
>    - PWM fan,
>    - Renesas 9-series PCIe clock generator.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks

-- 
Best regards,
Marek Vasut

