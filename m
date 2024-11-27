Return-Path: <linux-renesas-soc+bounces-10718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C99DA4C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 10:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02873162280
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 09:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68218192B66;
	Wed, 27 Nov 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NEKIRtE8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359741925BF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732699738; cv=none; b=j7S5pILkwUa0tzdtJAfrxouJY2do0aHXipt+CwKw7k/mRpCsktaMF2U/pzgLO+JhJ38p/u5PHKX2mPvUZms7n8Pbmz8In8e0drAOqw/f3o9DNOOTEHLStn0X+48qleIZnjnRhguR9ItFVrEwVHtOwRGBR1YMq6bDBWCY0q5eX0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732699738; c=relaxed/simple;
	bh=xepUODRfSr/y5ZXoLDJKhQSBi6KIw60tlz00xsOksIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyUmCDL0rh9CtY76hcFg1g3y4GYMTJl4CTMXWdZvRqzw9JJuFkKr92WT4pEHBo5752x5Dj2Xl9723s0F1qSnmcE4ywNKFjZ2VNFEkJA/BYJpsgAm7os0gB2WFXgCfy+8NJm2Lo8ZrHpjOu//HWUzknKZOXkoyOBBUFnKZch+ydo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NEKIRtE8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E3C7792;
	Wed, 27 Nov 2024 10:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732699711;
	bh=xepUODRfSr/y5ZXoLDJKhQSBi6KIw60tlz00xsOksIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NEKIRtE8qbK70v5weMGYHDvGGE/MGyioseX8mPOJJlt73svBZo87tlGPqu077RVKV
	 jycURo71rr6N9SDoyHLftpOoErNnkuVQAmUJOsPO0mqJHTHS9/t2UUsMAA8d0cXqnw
	 AaCWelhsqLwl68pkZvv4Dt/S6A//YeF4BlwNRAIk=
Message-ID: <30ccdcf0-1937-4351-b91f-d35d86aae6f3@ideasonboard.com>
Date: Wed, 27 Nov 2024 11:28:50 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 0/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
References: <cover.1729240989.git.geert+renesas@glider.be>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <cover.1729240989.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/10/2024 12:32, Geert Uytterhoeven wrote:

> White Hawk CN15
> ---------------
> 
> Does not work:
>    - Display resolution is detected correctly (1920x1080 or 2560x1440),
>    - Black screen, displays say no signal detected,
>    - "modetest -M rcar-du -s 88:1920x1080@XR24" triggers:
> 
> 	rcar-mipi-dsi fed90000.dsi-encoder: Failed to disable video transmission
> 	vsp1 fea20000.vsp: Underrun occurred at WPF0 (total underruns 2)
> 
>      Note that fea20000.vsp is vspd0, not vspd1. I do have a few similar
>      messages for fea28000.vsp in my logs, so this may be a red herring.

I had a try with this. The first issue I hit was that ti-sn65dsi86 
driver doesn't work if there are two sn65dsi86 devices: Creating aux 
devices try to create sysfs files with the same names for both devices, 
thus failing. I take you didn't see this?

I brute forced my way through that by doing "aux->id = s_foo++;" in 
ti_sn65dsi86_add_aux_device().

After that, I was in the same situation as you, black screen. The 
ti-sn65dsi86 does detect the monitor, though, and reads the edid just 
fine, so I think it unlikely that the issue is on ti-sn65dsi86 side. I'm 
not sure if the second DSI output has ever been tested, maybe the issue 
is around there.

I did not see the errors you saw. Random underflows are know to happen, 
though, but it's odd if you see them for the display path that's 
(supposedly) not in use...

The fps looks fine, so the pclk and timings are probably ok:

  kmstest -c1 --flip
Connector 1/@88: DP-2
   Crtc 1/@84: 2560x1440@59.95 241.500 2560/48/32/80/+ 1440/3/5/33/- 60 
(59.95) P|D
   Plane 5/@58: 0,0-2560x1440
     Fb 99 2560x1440-XR24
press enter to exit
Connector 1: fps 60.02, slowest 17.16 ms
Connector 1: fps 59.99, slowest 16.69 ms
Connector 1: fps 59.99, slowest 16.82 ms
Connector 1: fps 60.00, slowest 16.82 ms

  Tomi


