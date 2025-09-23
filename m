Return-Path: <linux-renesas-soc+bounces-22196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A9CB95189
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 10:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244B33A6FFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 08:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C65C31E0E3;
	Tue, 23 Sep 2025 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aEqAxnlb";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I21IKLyd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CA31DDB7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617921; cv=none; b=l4wxBSGNn2sMerlgRXUulVIYebfkwjw3+WHo+0sLki+qgYBQ/fe8fAobyLy04LkJORZHffl3lH0SYmEx/oDiWC3utX4yOFrgbtZhgss/HMzcPMmpM55ZbTNLCClfLbDj+vOPCccy3J2Xq2R9Rt3k6a3ypurxIlVRqK7tXEWr26U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617921; c=relaxed/simple;
	bh=GoRVhj7dXPiQYQ6Pt9E4keYh/IDD1Cc9Lv8cBCDoY/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=coR8dHoOdWWGE3+CceCu86IZGHFMnE6jHTq8hp1T57pckcurMXjfUEZ15Kj9b/TfUB1XaG0F1xCOjBHZrfZ9QnZHLYD1/kqXqbNKbWDJXyTKeUiVjnbdpinGj/QTkdGsYHM9LROXQ/DUHzifvnUE8cEcNqxUlYM3k6IirlzZB1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aEqAxnlb; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I21IKLyd; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWDRK5bj8z9svK;
	Tue, 23 Sep 2025 10:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758617917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5r/u7Mp6BK9X1rjwcYLYF/ePixUf4KU9AWPaRMbcoU=;
	b=aEqAxnlbObeuBGWH9TzhRM/cJzh8xWsjzLIsIb5now39zCl7gChTvbnZeTJuGVnvPqgO7O
	ZpTTRNQJZbFfKdKZ70MFMvzttb12YaglPaG+/QlFhPGx9DAxrnGIEh/Mju7iJRGQif0cF6
	f6+Az66IVSCe1+W+bhwLK3M680RsPWgLDSfw5bk/jlWNrgPlQHslM2HT+TITt71PfUwX+8
	bTN1kWqF/XrQvQ96V3RPZ0WjKuCWxYFLocxf6kqUlNGe4brZdy/B/CyaPIp7cazKeyjqtu
	M12OolfHYyGhoJbsD1wOmjLT1Hp3XKnLA+Dw7dUypBW9RUHXfkTebqTNUvG10Q==
Message-ID: <ce2b5734-4a5c-4d63-be62-fc4c4cf7cfea@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758617915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5r/u7Mp6BK9X1rjwcYLYF/ePixUf4KU9AWPaRMbcoU=;
	b=I21IKLydQRRFfxxkb/3hZ7XXwxHNkYQnLyN+nX7GgjQQJt2Wkh0H//mXysQEWZFGPmo1B1
	6EA7j6o12rto4vhk+uGTcCsgjvAhUFJwOU7tSMUJHOreH8Jr5bGPxKrmhr1iLzyWWNqHWl
	DKFT5RZkxRl75qHjpwtqsIuiCTHMtiF5EkVyMp4qUZHqTUr1YILiz5UG6ztByMOhyymNHg
	zYrv7hRSQHT8t1Y8rwxg6QgENizMfqQWKoovmfWbMr+rTdnJ4SEGyt07OUPWTYeylL7GXJ
	4AQNjTW+knrwH0xsWVeImuuAn2Hj7eDrkn4qPemKQiEX6DIkZLOzf63cDGUtkw==
Date: Tue, 23 Sep 2025 10:58:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB11346FE123074366946A24C26861DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: bea685a478041a0408f
X-MBO-RS-META: dr4b7uh8mdii73tengfw14mggq71esd9

On 9/23/25 7:45 AM, Biju Das wrote:

Hello Biju,

>> Introduce CLOCKSET1_CLKINSEL_MASK macro and remove bitshift from values to make this bitfield usable
>> with FIELD_PREP(). There are no users of this bitfield, hence no updates to the DSI driver.

...

>> -#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
> 
> 0
>> -#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
> 4
>> -#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
> 8
>> +#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
>> +#define CLOCKSET1_CLKINSEL_EXTAL	0
>> +#define CLOCKSET1_CLKINSEL_DIG		1
>> +#define CLOCKSET1_CLKINSEL_DU		2
> 
> 
> Looks like this patch breaks existing functionality,

There are no users of this bitfield, hence no updates to the DSI driver. 
(see commit message). Therefore there is no breakage.

> as the macro values are different.
Use FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 
CLOCKSET1_CLKINSEL_{EXTAL,DIG,DU}) with these updated macros, that will 
place the value in the correct location .

