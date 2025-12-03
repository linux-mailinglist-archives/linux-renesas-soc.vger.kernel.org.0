Return-Path: <linux-renesas-soc+bounces-25516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B8C9D9D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 04:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D92B13A7592
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 03:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB54226541;
	Wed,  3 Dec 2025 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WFP0ckCx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-m32103.qiye.163.com (mail-m32103.qiye.163.com [220.197.32.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869382B9BA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 03:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764731437; cv=none; b=ccCW/J0cyhuZzjRvu5oDhr8DhdfswcGsfbIn1Vxq2V3jsKqvSEhHTy4Be0TitL70Ji8Wo7WwY92k8BiZ5KeOhH+azoHwK3bftRSZPJ/uaTjt0Dm+6DfwwsM9V3ofWewri0WbwEQx4+2tP0DSCvfgaOjjKGEPlPnM/8haHS9xb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764731437; c=relaxed/simple;
	bh=vs1ehEljA1B8ZwqDNBJJh/7+Bk5c9NnvFwx6OITLjFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eH9zA31w0v9T0/0b8HBG4TqCTnYBvdr9L6JohZG1IxPuaYa0m17QZlyycpvW94S1KoG/0ZyPK3z9pv34fUahirvnSyXncJczp9lKC/yN5Ud2AdUACYMXfD1YfE7qacHaVqwLEtpwgw/Ta57uIH3zR7oiW+byN8JAzQXlmubFjqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=WFP0ckCx; arc=none smtp.client-ip=220.197.32.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2bc5acc1e;
	Wed, 3 Dec 2025 11:10:28 +0800 (GMT+08:00)
Message-ID: <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
Date: Wed, 3 Dec 2025 11:10:26 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Linus Walleij <linusw@kernel.org>
Cc: Vicente Bergas <vicencb@gmail.com>,
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
 Dmitry Baryshkov <lumag@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ae2309d0303abkunmbdf03de92e5ec3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx8ZTVZOQk8aGUJJShkfSx1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WFP0ckCxMc2TXEkOjlnfNG0SBq9kSEG3ord66G0JSHlbBTiFFelKleqb+9Wq4pmr9TAhmksatZn+BwOiunomG/hvgfaeHrBOMywjNvukj8qAwM3Fit9HPC1jDc01EpMakn0x/xD3bGunmGNIozIKLzuNv4v5Ee8NkEyhyryzrbE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=pq/5QNIHYVq90gNYJdVHaCKxUaqH+AXLo6EK818Hzrg=;
	h=date:mime-version:subject:message-id:from;

Hi Linus,

On 12/3/2025 5:02 AM, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks when used with the Rockchip driver.
> 
> As the CRTC is no longer online at bridge_pre_enable()
> and gone at brige_post_disable() which maps to the panel
> bridge .prepare()/.unprepare() callbacks, any CRTC that
> enable/disable the DSI transmitter in it's enable/disable
> callbacks will be unable to send any DSI commands in the
> .prepare() and .unprepare() callbacks.
> 
> However the Rockchip driver definitely need the CRTC to be
> enabled during .prepare()/.unprepare().
> 
> Solve this by implementing a custom commit tail function
> in the Rockchip driver that always enables the CRTC first
> and disables it last, using the newly exported helpers.
> 
> This patch is an edited carbon-copy of the same patch to
> the ST-Ericsson MCDE driver.
> 
> Link: https://lore.kernel.org/all/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com/
> Reported-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> Reported-by: Vicente Bergas <vicencb@gmail.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Rockchip people: can you please test this patch (along
> with patch 1 of course).
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 50 +++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 

It seems that multiple drivers currently depend on the CRTC being
enabled and they implement the same atomic_commit_tail(). 

Why not implement this in drm_atomic_helper_commit_tail_rpm() instead?
Or why not use another common helper function for this?

-- 
Best, 
Chaoyi

