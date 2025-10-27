Return-Path: <linux-renesas-soc+bounces-23709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FE6C11D5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 23:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C10FE4F0E21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DD034A3BC;
	Mon, 27 Oct 2025 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hnalsCzz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5752934A3CD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604530; cv=none; b=XOLlcFCBS8yqs6frBSLd8DJgwPq2IsZiI06SmodILOSSnZAESdlge3Mr2HktSgsm2rasWBKziAeIe7xSC7xPzVDQkfEKT2r01G5nLnSYFspG8y/cPbNdlywAZm/q9bT0Hkz//w4fF63IAl1zslU+YeKwjcOq7BjjalKYlvOirP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604530; c=relaxed/simple;
	bh=tIwKkrU+yfZgxjIJssdmmsRIQWBUrBUx+yzM78k5Y7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zw1ma+W1JEiZOEpSC9iEEnr4VyFLzjHW8WkdSIBJ6KK+Z3OtSe8hVvTnhVmTj6dG05wG5noTC2m+v82NkKhSZXBhZmGwTK3jyekLu8bOad9n/f99FfF3EVGYcfWKbo+B3SpQNVrb9kzuIHSICFiYZGI90wU5hiKISGoaXXWPCMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hnalsCzz; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cwSy3710gz9tLj;
	Mon, 27 Oct 2025 23:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761604524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2GaGZVblvCm/OcLSaKGf5lp7BDqmDx1e43b0GhqkmEM=;
	b=hnalsCzzPvwCIr4fjo2MOUMgZpF5nOKDiFG8PQgHHTMSH+4RldyVYMT2in+7CGRBbLl9uE
	OwLpHI09ef3CiZntjFGe0ygTiQkoGa61X77fUwyXxdH3IOECodCxTR9Y+0aaDKr+tfm7Lt
	oM0UvuQq7XhvWFuI0Zu4WFFCAYyadUlqIzMp0lqVIU2kAG87o4GQTJj1VK90/oY3WGGcGb
	6pWJhMVxuBQIgUISngusghaljHByUeLyIk8W3adSQ1OQmMRD2L99ggy+VdNP4wd1Yunfc2
	uJdKgN9p8tMLNYxlmdfjaIizauByjBT9pp3d11XyLu8zb0gWVaB74Hbe9cdEaA==
Message-ID: <347d6f05-d590-492f-b373-672f9c057f3d@mailbox.org>
Date: Mon, 27 Oct 2025 23:35:21 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
 <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
 <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
 <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
 <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
 <53b6f061-d8b1-4228-b647-9d229f03b999@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <53b6f061-d8b1-4228-b647-9d229f03b999@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: ac05771e1f633d13e89
X-MBO-RS-META: powe4k17sy84ombz649hudc68wdg61p4

On 10/22/25 12:13 PM, Takahiro Kuwano wrote:
> Hi Tudor and Marek,

Hello Kuwano-san,

I apologize for my delayed reply.

> I have submitted new series.
> https://lore.kernel.org/linux-mtd/20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com/T/#m2fa41b89e36d6061df9e979f49c573e46fd0d5c4
> 
> Please review and test then give feedback.

With the patchset applied, the readback looks as follows and the map ID 
seems correct now:

spi-nor spi0.0: i = 0, buf = 00, map_id = 00
spi-nor spi0.0: i = 2, buf = 02, map_id = 00
spi-nor spi0.0: i = 4, buf = 00, map_id = 00
spi_nor_get_map_in_use[800] map_id=00000001

Thank you for your help !

-- 
Best regards,
Marek Vasut

