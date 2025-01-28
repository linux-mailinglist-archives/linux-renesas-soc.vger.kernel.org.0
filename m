Return-Path: <linux-renesas-soc+bounces-12645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D24A208F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31775162C28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F8E19D083;
	Tue, 28 Jan 2025 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZFL1g2NS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1F019DF4F;
	Tue, 28 Jan 2025 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061425; cv=none; b=mH2SnT8Fnksf3Yn9lS6nbAiRmK4QrAq3uj9Rrnuvg2YLX7U4/3Mdqi8dxfwUGTwb5oZC5X/VJh9A3RvGICAYePbiLU4lNh9x7y7ROvz6L7+wtq5t9bEa2jI5J+iEXhzTI8HeJbMCPUgCBld/fut1LFn2HstM622PYbKi7FzmVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061425; c=relaxed/simple;
	bh=fDUAUwHl4Onj5yTdwIt75dSFCxTIIuZ0mg7NVyxjNG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVKKga1nqKF9RK4hUGMJW+JKPJ5Orh/NwLCM1xbxRkBHNW1FNv5MaPoEEbC3gzo6a+KCeRQNeM1pVqoAzj7tpmarz3r6pkUu8B943WpB/2bE5Vp0O7YOI5N12IezZv6m3r453dJrfeMaKnezN3W1DVBbMjivAxf4mifZkUMgEus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZFL1g2NS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29D096DF;
	Tue, 28 Jan 2025 11:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738061354;
	bh=fDUAUwHl4Onj5yTdwIt75dSFCxTIIuZ0mg7NVyxjNG4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZFL1g2NSiISqoTFBc7tg91o6WuPtnumQ6Q7eU1u6RYiOa4trVsT8iVDVzJgy+RA1l
	 u4JwXBhAByQWkm8j8XDWK1W0QCDakAyuaTZId7MgB9Ai6uypzZNCmKSVS3PUeAqZJv
	 sl/GC8MXlYExkba5IJkK9RL6a2ANaD/poX2eJNFs=
Message-ID: <e92601be-a9c9-4aa7-a250-4e3514202e7b@ideasonboard.com>
Date: Tue, 28 Jan 2025 12:50:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
To: Maxime Ripard <mripard@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
 <yvdba4secotjc4xvyophckuroywx6nv35kusdj3off3dsrnxr4@7buakt7wvten>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <yvdba4secotjc4xvyophckuroywx6nv35kusdj3off3dsrnxr4@7buakt7wvten>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/01/2025 12:41, Maxime Ripard wrote:
> On Tue, Jan 28, 2025 at 12:28:48PM +0200, Tomi Valkeinen wrote:
>> Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer to
>> reviewer.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>   MAINTAINERS | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ed86d884ee0d..5b1bf5fd56fd 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7760,7 +7760,8 @@ F:	include/uapi/drm/tegra_drm.h
>>   
>>   DRM DRIVERS FOR RENESAS R-CAR
>>   M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> -M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> +R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>   L:	dri-devel@lists.freedesktop.org
>>   L:	linux-renesas-soc@vger.kernel.org
>>   S:	Supported
> 
> If I understood right that email
> https://lore.kernel.org/dri-devel/096e85a5-30d9-4b53-bdcd-a70cde6baa4f@ideasonboard.com/
> 
> rcar-du is now de-facto under the drm-misc umbrella. It should be documented as well.

Good point. I believe this should be enough?

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b1bf5fd56fd..16af21c3a48a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7604,7 +7604,6 @@ X:        drivers/gpu/drm/mediatek/
  X:     drivers/gpu/drm/msm/
  X:     drivers/gpu/drm/nouveau/
  X:     drivers/gpu/drm/radeon/
-X:     drivers/gpu/drm/renesas/rcar-du/
  X:     drivers/gpu/drm/tegra/

  DRM DRIVERS FOR ALLWINNER A10
@@ -7765,7 +7764,7 @@ R:        Kieran Bingham 
<kieran.bingham+renesas@ideasonboard.com>
  L:     dri-devel@lists.freedesktop.org
  L:     linux-renesas-soc@vger.kernel.org
  S:     Supported
-T:     git git://linuxtv.org/pinchartl/media drm/du/next
+T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
  F: 
Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
  F: 
Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
  F:     Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

  Tomi


