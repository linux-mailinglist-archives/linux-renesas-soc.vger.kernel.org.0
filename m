Return-Path: <linux-renesas-soc+bounces-21404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58742B447E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D00C5A1BBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D794B288C2F;
	Thu,  4 Sep 2025 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="c2HIQa76";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lMBa0hyJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1412D27A928;
	Thu,  4 Sep 2025 20:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019540; cv=none; b=j6FNHi+CP7eIVW1d6FbEubOYM2uwQgz3l3js6YWx84qxj8dR5LRQvjMQ6NzUQqvoVye1xJG99QHReeOyY2cGmhMdzxqPHA7I8a/BCkr/PLnKlzHcxIhxv8Ef8Hyb6gRCTOM7JNVY8h8gLRNRHUTZpJ2pzgOzq3SizLP592gdYhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019540; c=relaxed/simple;
	bh=JYDj1OIztCr5OiL1ZbftT7q5gXvSL3rxMxqitZ9Mnvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKPvICKxzTlgeVonAWqijS9F/bjkRxwStIwkVKk88+l5Z8KbLrOt4viFjk8NmdhGn7ju7FOBIMQ25z/ZDptteIMpS51ODyNMgrmL6bLlbbFUeRk83xSKUA+I/1WGHAR7O14a94PqI8i3k7DN14mnP9HLKqRvOZcPDErC5z/OqdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=c2HIQa76; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lMBa0hyJ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cHsKF0J6vz9slr;
	Thu,  4 Sep 2025 22:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rg+PnvAmYfHcTW9ePYJ3Od/BFTWzgseic6q6Ul2fUEY=;
	b=c2HIQa76pDtRwyXiMHVeLuwlQeWUq2Fbg2smh4VUKWFU7c6/zPEa9CqLJfNelUbTh82hA3
	+ZIf7Hd1ihqaXvv7YQ4xcvtmEIBRWzEFfClPuPL5ZXV5q4kO5kOGDh0BSd09QK1h3jcfFh
	YOjMQRGxi5vTk8DD2PJfRFpiQt24fiBH+v8+QX4mdpNZyc5UIOAH1DK+k89/kK4CuktH7u
	Iwct8b4RcrcJe00sz+Cc+3Ha/MTkC4hPOHRvVZ5Yg/TBzy7aprwTBhOmudle2TAkn+xo3H
	RSriszZSEvA7mpjS3WDHFhZpBaL6mjZmINhSn8xb73Z+sk6hz0gSHx/5hiCQ0w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lMBa0hyJ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <30974d20-951a-456e-9040-ca9b0ee2c338@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rg+PnvAmYfHcTW9ePYJ3Od/BFTWzgseic6q6Ul2fUEY=;
	b=lMBa0hyJUI6+RtsrbUYwUBu2Eyle0EXinC50apqTfh9AuTu4PvvE7giOLYm0g6ZB0BYlyK
	JkKVk/EgBWB8nwERv/A5/omejOk9Om0JN1g+Y7zofaSHkqxlrwuRY9kNV8BzHDkRVgJchX
	0Ff2Kpf+PVVuCWMoeuMnjO/N/ka0xaOCA1N8OJ75DSpMGxMcQF5qFUEsbVVDCUFMTa5OFd
	8+v2vNjjxcurMDn79fQUa91HV78LFaumy2kj6y3vHzKAKFI3kX2pnmKbKP2fvcGn26pASP
	w1A/CnloJJ7r0+MaAt55j8IkeIWWEpBkMfjqnZPwPQt5kQe3lW72EXd/ParSuA==
Date: Thu, 4 Sep 2025 22:58:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/panel: ilitek-ili9881c: Add configuration for 5"
 Raspberry Pi 720x1280
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>
 <20250904200238.168307-2-marek.vasut+renesas@mailbox.org>
 <33t4oznhr442t6xu2xccjanc5ujdbzo7m3gtmqe6aqpzevazgk@5fachuynkvsu>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <33t4oznhr442t6xu2xccjanc5ujdbzo7m3gtmqe6aqpzevazgk@5fachuynkvsu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 394ccd19a0f94bfc51e
X-MBO-RS-META: karecyw7dmxkkhu5qrbo8rxpankrki1e
X-Rspamd-Queue-Id: 4cHsKF0J6vz9slr

On 9/4/25 10:21 PM, Dmitry Baryshkov wrote:

[...]

>> +	ILI9881C_COMMAND_INSTR(0xD1, 0x52),
>> +	ILI9881C_COMMAND_INSTR(0xD2, 0x63),
>> +	ILI9881C_COMMAND_INSTR(0xD3, 0x39),
>> +};
> 
> Should the hex be lower-cased? Other than that LGTM.
Fixed in V2, thanks.

The other panel entries are fixed in

[PATCH] drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR() 
parameters lowercase

