Return-Path: <linux-renesas-soc+bounces-22201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0007B952C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 051731884E1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911573203B6;
	Tue, 23 Sep 2025 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LcHkazmE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55223128D1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758618705; cv=none; b=gS/ztZPHFXTeuDHSh4omniflbsp/VxbT4liumAfkikwV/gXen6JpJIUZ1FkTZxYnVOkk1VEV+nyYvPjgkvz+GA5pS2RdwrSOo/tZQnu9FmOBcVvt1a/BGv/Lcl65zlxfEHlwj6saEmbV5FMaOB576+kUphAqGZUMYrw9yz4celE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758618705; c=relaxed/simple;
	bh=uerxYf+eEfT50V5pG5VQr7FO3btKNXnczyNq3yxqmQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XSdAnn16NgL9kLi3p4llSBdbZmHyn0kT4Ga0MNb/mLXjhz5V6cfnll5nhdp996DHNM9+ga3trjyUBZ+QBd6D90QSelVY3JkL1VhSswi9pdOynlnnReZ3uV7+FtWjrGjE1FwETPjqnltZhtCkutkFS71YmEKd+Iu5qqD7Fn2GBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LcHkazmE; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cWDkM6r9Yz9tcL;
	Tue, 23 Sep 2025 11:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758618700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wORAbE+fa3VQa1/NpkSIjaheDrhD2YrnQjGxBf0E86Y=;
	b=LcHkazmEKu/juvjliE8SiysSiob7L928/BkYRTwmYAKlwMQsr+II46XDltoTcpR/YJbA3K
	ptVr2l42L1P0uxZ4sOgqoYGJOYSpp2ZFwJqrb2yWSVpc6iKhIVQRfCJJXTGMQbvGTmVhND
	n2D4GXm52gKkF+GWyVFU9jXx3wJQrtZNkZQNRlq0t6zeI4eSMRH//H8ZiwLP5ST65m/nQN
	Y/lBIRz3A+P9kdgYtlgq5NsvXyMLz2jJgI+pDxHPF+NuqtPYfuVDCaHraIyl1g5a/7gVXO
	nXWMIN0i0nlxDN/CgU/pTR8ApwdoUBgs4rcRH1Y/fUXZUOKaa8DyB+W2TrfNvQ==
Message-ID: <856fe0f1-3bf3-4ad2-9e62-a8b1d7dc7eee@mailbox.org>
Date: Tue, 23 Sep 2025 11:11:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-5-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346FE123074366946A24C26861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ce2b5734-4a5c-4d63-be62-fc4c4cf7cfea@mailbox.org>
 <TY3PR01MB1134662359F7FADC6919AE0B8861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB1134662359F7FADC6919AE0B8861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 21ace9840633f30e14d
X-MBO-RS-META: g798ejwgtpi3rm9pecnybkhiju5quqzc

On 9/23/25 11:04 AM, Biju Das wrote:

Hello Biju,

>>>> -#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
>>>
>>> 0
>>>> -#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
>>> 4
>>>> -#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
>>> 8
>>>> +#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
>>>> +#define CLOCKSET1_CLKINSEL_EXTAL	0
>>>> +#define CLOCKSET1_CLKINSEL_DIG		1
>>>> +#define CLOCKSET1_CLKINSEL_DU		2
>>>
>>>
>>> Looks like this patch breaks existing functionality,
>>
>> There are no users of this bitfield, hence no updates to the DSI driver.
>> (see commit message). Therefore there is no breakage.
> 
> Can we remove it, if there are no users? Or you still prefer to keep it.
The header does contain a complete list of bitfields, that's why I kept it.

