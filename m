Return-Path: <linux-renesas-soc+bounces-6137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C33FD906722
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 10:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 757FF1F21AD6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 08:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0E31304AA;
	Thu, 13 Jun 2024 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cy69vvtD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6356F13E40E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267887; cv=none; b=CTm1BYoG9YWWBIRmotcIotr0fC53npFzgJg+U2fQBj6M7TdQs5SVx+/Mbm1gt1sVmlObnLklRU2FbaTcoGhfajbyhTJu+HZ/nxSlATUouiKxArrATqqPTihrQd3v+2PpUaqpLEdt0vIwveMUql3mYQMBfTM2DTSRo++rwgA+RZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267887; c=relaxed/simple;
	bh=gvBB4VRGIbrrUzQv9lGEtqrCa23mZiVTh4i9rOyOKiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPbIjTKFpA0ziViLmFVqhHhfoZGmNZyb/FI15xJK9r9rdLTuF+79ReoAjflz3pyZLR+UhXq8ndvU3EN3822r0ZK1aAZONQ7etHFypI0bfYMida8Qba9swEQwilwcoU77O1FLbh8WRnvyAv98J3aRonhRS+nciUy2XkUI/rx1pZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cy69vvtD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718267884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdO1WJIrqIg61hN5vELUIZIHcL7hxfeUZFi824LjBqU=;
	b=Cy69vvtD0izzHRHEwqCf+3ehGIxqtqNd8ZB3Rs9uCjfSMxZUKDK0RGYbPmXTvG+rbWKrD0
	Zcl5TxMjDqlSvKNZ3++TJ5et0gwFEAA9q8mySbgOlK8Bmx+g1pt1yM65RNh78lWj0a8wGy
	DNPHFrov7q9p9p7i5CJrPDk1FyAR3LI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-in3_muGYOkiKC0zC8FgaQg-1; Thu, 13 Jun 2024 04:38:00 -0400
X-MC-Unique: in3_muGYOkiKC0zC8FgaQg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-357766bb14fso420308f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 01:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267879; x=1718872679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdO1WJIrqIg61hN5vELUIZIHcL7hxfeUZFi824LjBqU=;
        b=LPopwwD9j1X3wJ/6Lu0kWytTAJrYsPPpFqxK6p+01FxV9xJotGOqM4qmztrHtwch+k
         Sbs0QQVLW8LPLrrUahvytMoGoUCKyO2cDnOa1mTMPdMlSO4EQBsRwusj5wEy5dRxt3Xh
         z6jdER0spL9fN79cTGWCMGeyAvyO1R4jrd9qhqUukmJGZT4xFvoov60jxshTAoHJluQ3
         vVQW5bQ8Gk/Qf9J1cuj6vUWokdozN5qYMEVkWB4ScV59yL7SP6/54bbmfgy8VpAVRObX
         CZs9pL7BN7ySMJtuMk8Mw4x4sUu+TsalQr4l3juF0yDPwi/tpD5v/Pa+bJ0YFBBZOthj
         OtHg==
X-Forwarded-Encrypted: i=1; AJvYcCV+zJbMgZUmtP5N333jOxmOzSQALr8gW6e6ws9N+WBDpQauQu7PXMq1FljXCbYBpcEm8PWASaxORmnsc52q16J7HuwHWdmffkQSmCiHVnXjXlI=
X-Gm-Message-State: AOJu0YwWDNMuflYsJk4UbKPDtveWRnee6NhscwanDFz0ADE4/dFErFl4
	bexzVRlYWY5LulGTy/AG5SexAXjyUtsk1pIsNOtycZEqz0PJo0fmi47JQVILl4GkA+JKTpW+CEA
	sOQjkRmkFSeCfHKt3S9zswH9zXltxJlKRMuv0b5+u8PEs1cS82f2xch8lZPM26nJ9X2aR
X-Received: by 2002:a05:6000:1563:b0:360:775d:f917 with SMTP id ffacd0b85a97d-360775dfd15mr630605f8f.4.1718267879571;
        Thu, 13 Jun 2024 01:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqGjyQ/umCl2P9LZ32xVZd+McgCS7SCUcfkDyw5neb2L6t38GU4AsvVfow9TXTVGdrXdS6/Q==
X-Received: by 2002:a05:6000:1563:b0:360:775d:f917 with SMTP id ffacd0b85a97d-360775dfd15mr630592f8f.4.1718267879169;
        Thu, 13 Jun 2024 01:37:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750ad177sm1011707f8f.56.2024.06.13.01.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 01:37:58 -0700 (PDT)
Message-ID: <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
Date: Thu, 13 Jun 2024 10:37:57 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718199918.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cover.1718199918.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2024 15:54, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> If drm/panic is enabled, a user-friendly message is shown on screen when
> a kernel panic occurs, together with an ASCII art penguin logo.
> Of course we can do better ;-)
> Hence this patch series extends drm/panic to draw the monochrome
> graphical boot logo, when available, preceded by the customary fix.

Thanks for your patch.

I've tested it, and it works great.

You need to rebase your series on top of drm-misc-next, because it 
conflicts with a series I pushed last week:
https://patchwork.freedesktop.org/series/134286/

This rebase should simplify the draw_logo_mono() function.

> 
> This has been tested with rcar-du.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>    drm/panic: Fix off-by-one logo size checks
>    drm/panic: Rename logo to logo_ascii
>    drm/panic: Add support for drawing a monochrome graphical logo
> 
>   drivers/gpu/drm/drm_panic.c | 81 +++++++++++++++++++++++++++++++++----
>   drivers/video/logo/Kconfig  |  2 +
>   2 files changed, 75 insertions(+), 8 deletions(-)
> 


