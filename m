Return-Path: <linux-renesas-soc+bounces-22904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7ABD0679
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Oct 2025 17:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECA921894AFD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Oct 2025 15:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8615C2EBDF6;
	Sun, 12 Oct 2025 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uNz2uPcJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97A41F1534;
	Sun, 12 Oct 2025 15:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760284348; cv=none; b=h39A/3fgFlITnFJ0sUDpCBPLn2nOvPp8rAxOiS7IHkG0dbEWcctQp5fJDl/e9WsoqV9vXP429aGLvhFCvJ1lfsPWvibVJpL0E5F6GOzzPS89dz3a757Ve4pYPf7xqPCwmJ1ElBpkngUywDcfrVlPVBFheJZB6iwQPTZolDqPvw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760284348; c=relaxed/simple;
	bh=vAgiogqYavtLK4gE6vtKryr1y4ryKsEWd3KwGk2DZLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6lH90a97tEw+ebBUD/K8TgiW8CnAt7HdtlItz2SkyPxvQ8KT8mg5opUB417Fvg0pXudGFpIGXOrMIwqk4zAuTGt1ARArbAIY02GvWBn7mvz2GYBS5BezrF1X6e/dOugxvhgXfRPkbEHYce2KdQeH1j4iPbefrAZnipfB3jvcVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uNz2uPcJ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cl4jw3qzSz9tTK;
	Sun, 12 Oct 2025 17:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760284340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=neqAsnNDMRMx/Htt8KicS7vRg22+z4O6QaJ/GuwKbVA=;
	b=uNz2uPcJLJj6s7WPnyG5MmAhgwf6gm4X6hmhd7pVscNphAAKTMjYodc5Lcz/UeY6MhlI2K
	+bSsD01hmma5iMH2Qr3O0MNrbIWrvzYpeuR0F+xbXnV7W+wUfy7T1OskTWn288aUDLsmEW
	kP5BSbYXsTr0u4GPQAA9iwnRdUAXdSAp8Klmtplp/mjrbJKOZ2w97JVO/yJgaXUlEpQGeD
	30pOc22qfNM38LanlVuHU8ptm4E9IP3ra3PxaTkBXXcw7HC5N6XZu5O1BRymWP6Hi4wwph
	uQ9qc2/Iy/73mBWQb2/Xt3T3gOR83D/7DrYe98Z1zoJjfn9QbofaGPRUwUA/Qw==
Message-ID: <c0e6abf1-9800-451d-bbc4-a070253a3d66@mailbox.org>
Date: Sun, 12 Oct 2025 17:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR()
 parameters lowercase
To: Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
 <175930287176.425863.10274979935592534719.b4-ty@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <175930287176.425863.10274979935592534719.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: etqeq58q81jsjnxamdrsrxwm46zuer8c
X-MBO-RS-ID: c5f8110e907efe1075d

On 10/1/25 9:14 AM, Neil Armstrong wrote:

Hello Neil,

> On Thu, 04 Sep 2025 22:55:15 +0200, Marek Vasut wrote:
>> Make all ILI9881C_COMMAND_INSTR() parameters consistently lowercase.
>> No functional change.
>>
>>
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> 
> [1/1] drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR() parameters lowercase
>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/02b6babf22eb60d86b4030f08204f6e7853da4e0
Please pardon my ignorance. Is this supposed to be in linux-next by now, 
or will this show up after rc1 is out ?

Thank you

