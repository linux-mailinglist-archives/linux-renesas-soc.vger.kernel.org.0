Return-Path: <linux-renesas-soc+bounces-25533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD5C9EF31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 13:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 55406348431
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 12:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B9E1E511;
	Wed,  3 Dec 2025 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="YAU3Gdhc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-m49223.qiye.163.com (mail-m49223.qiye.163.com [45.254.49.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681FA55
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764121; cv=none; b=ntkgavYy+Tv2zINmMyONDIvPa2FEfKHlT3utWcbyWWv8IsRZ6VLNKGKiefSs56OV01xRjtM86ijv8VhoCwTAxPhggRZaPSgSYNOEPWUTKUgjAIV9/NAvy50jw7JKZIZo41xsi+CTZq5v+6WgalKHMmBcsUj9XVjVvXJ1rwRXKJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764121; c=relaxed/simple;
	bh=dUwrRQuKDQk2nlTWJDZD4rM6pJ5iTE3+pEKuO9LsxbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpPhTRq9zcRJt+dD1PFYtubVU6Ifpl+Lka7IpuJA7VJQyhiQZ3v1si8l8ziz4NxqNtXTtVpMR67oaNZYkfG5zZ4UWN+PdbSj6SxCJS/ZfY0f28tyBrE5INrLejk5C8Yx/pxTEwhxpP/gCZrOog+isijHz1+WyRhN3BYHTa8IyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=YAU3Gdhc; arc=none smtp.client-ip=45.254.49.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2bd94477e;
	Wed, 3 Dec 2025 19:59:56 +0800 (GMT+08:00)
Message-ID: <31c64e8f-3129-4766-b735-84a26198e6d0@rock-chips.com>
Date: Wed, 3 Dec 2025 19:59:53 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
 <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
 <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ae4155c6103abkunmdafda06941e8a2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk0eSFZPH0lKSE0ZShgdSkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=YAU3GdhcWgxEahXohg2T2PUXRrn7FEt4Pfj+0ryOWfo7paJh/sIHpwHv6eZGbRXhxOxqdKJ2csyeFBoVy4+DZvLN5e3fDu7EvsYzNoPJtnG8EXFOKZJpuxA1KGru6m6E+nXvtJFz0oqk2zPGjL9J8SiX0NwsHgxamdtZgnPSwQk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2d07mvFdS01wxsxr01fOMc8tzwEqyFdVB0HHl3Od8g0=;
	h=date:mime-version:subject:message-id:from;

On 12/3/2025 5:54 PM, Linus Walleij wrote:
> On Wed, Dec 3, 2025 at 4:10 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
> 
>> It seems that multiple drivers currently depend on the CRTC being
>> enabled and they implement the same atomic_commit_tail().
>>
>> Why not implement this in drm_atomic_helper_commit_tail_rpm() instead?
>> Or why not use another common helper function for this?
> 
> So my v2 version of the patch series added a new special case
> helper tail function to do that:
> https://lore.kernel.org/dri-devel/20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org/
> 
> It was politely NACKed for complicating the helpers library (short story).
> 
> It's part of the trail of how we got to this current patch series.
>

Ah, got it. Please take a look at my other comments to see if there's
a chance to change the bridge functions to achieve this. Thank you.

-- 
Best, 
Chaoyi

