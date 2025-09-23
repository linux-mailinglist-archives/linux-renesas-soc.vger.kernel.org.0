Return-Path: <linux-renesas-soc+bounces-22194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD6B95173
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 10:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C19C2E55DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 08:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67BF31DDAB;
	Tue, 23 Sep 2025 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Jiu0s8Pl";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YPvvkUO2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8631D72D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 08:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617731; cv=none; b=OB8JCLDQHF7eD9RRctZzGy+61tVYgcvQ4YtNKHI8uUj0JHZehDSTK8zoT4exAB3BuAjjE/aaoSKdrcAHfo09suY4KiiiUFyRDcDUcuQnphlv9i29VOGY0PRIxKO0pXDRE4x7LVgT6AjC5XalrhaTX7mRdiBwbGCxEFVFkz39ZZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617731; c=relaxed/simple;
	bh=0mSWFUEawWeFeswoqZmT8XF4grrPaUFHQ2x5Ede74z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3fGSM7txFtLghBCnfB3vF0YSbNjYuGbfh8GXGhKIOowvIhZRlgIyhaz40fxZ/jeqfN8QC3iq1q8RWACfg3yFohF2HSUU1BOhh4IE06Ikgu2UI94pS1ORTcj0L6jZQ1uw1zxo1hWOG5wqnUYcoixlaSy5jtZfcPpSfiDoOmCZks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Jiu0s8Pl; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YPvvkUO2; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cWDMg2sfJz9v15;
	Tue, 23 Sep 2025 10:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758617727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFTjsGC1ruVeJvlk4bpbnwl5SaSgQh4mta1x0689hkg=;
	b=Jiu0s8Pld9zH3ldy/ix3uH3xOESjUw0y+6Ijx4Qj9TzFffX+Zu5c9Brcniim6lQ/YrL3qd
	1DU2TIS6ll78WGCgao5ByJStp0B1zv151WvpSbZ/eCOkwdDcgNLT1cdfHhKc8iM55t1Vn/
	AzCVpG7SwUOkm/g+PfmDC/TtE/k2G39TYfaLE+0UiInIg2+poL9EYdHpTLKwXg/KbN4bvG
	GIM3vgCj4GI/k1k+SV4GR5e0v+hyHm3OqoZjUyJwbxaF0lbjN9WfXYXVGXLcP7wojbz8iG
	0PVh35dAZmunBZiXagKzWhkB+E9M8iPKQCgscdPo1T4AJmBeHwiiEIC4W8PxaQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YPvvkUO2;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <241530bb-7c06-4055-b95b-83a89f27895b@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758617725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFTjsGC1ruVeJvlk4bpbnwl5SaSgQh4mta1x0689hkg=;
	b=YPvvkUO2fhsChARaHMzn+pvIs6ahjbeEBJn2XFCjwPZubh4IsMZenjbZ2/sLREAlv2iPeg
	jczkv58O30QasFX00d6w9swmBn5w395VV8U25VmMCIO824Mv7p6vXorxVCS4QIfGu2NoNj
	+aQd5e60kB8W5MB66DlG7Z+xzRFvAomxNNmaveyz6+fUWvYOtW/6jwYC4t/pvG/TU9iivd
	riqgtI1Ex3iP7wlwJ2FlV1tZogVpNml/vtnlkeKZaL7k1uqL4CdAY4jxSoRrsSbu4Mp32b
	Zc0DR4IpHfcPtDLKqJpOnqwp5GGzQFt/sHIhduBx45YAOkU2yLZLq7UbhkqU6w==
Date: Tue, 23 Sep 2025 10:55:20 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] drm/rcar-du: dsi: Deduplicate
 mipi_dsi_pixel_format_to_bpp() usage
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: ec39362ed284428eeda
X-MBO-RS-META: urtzmziorf81axtffdpjeamfaqwmmhz3
X-Rspamd-Queue-Id: 4cWDMg2sfJz9v15

On 9/23/25 8:47 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> @@ -457,11 +458,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>>          u32 vprmset4r;
>>
>>          /* Configuration for Pixel Stream and Packet Header */
>> -       if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
>> +       if (dsibpp == 24)
>>                  rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
>> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
>> +       else if (dsibpp == 18)
>>                  rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
>> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
>> +       else if (dsibpp == 16)
> 
> What about using the switch() statement instead?

Not for single-line bodies in the conditionals. The switch {} statement 
would require additional break; in each case and that's not worth it 
here, it would only add noise into the code.

-- 
Best regards,
Marek Vasut

