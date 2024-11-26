Return-Path: <linux-renesas-soc+bounces-10711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C849D9AF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 17:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80203B2C1BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 15:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072661D6DA1;
	Tue, 26 Nov 2024 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C7ylzyCt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108E1D63ED
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732636702; cv=none; b=jU2cDG6vdoz+XrZXt2mK58Ez8ZRorLofFEjByF/9TNhlsReaYdrZMgVytHmAs2deMZnq+gpJdinpnK63KXneNat4s/ZyPdaw8s3hXn7pdviBXwM2MmHDss+QnRz2SJVTOP/4DIsfHZVh2D6/dWSBUgwACcoNetDb04Q3thQncz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732636702; c=relaxed/simple;
	bh=pj1gNk/lE0Z4m2k/WNWGWuIBA44piyxGm+jSTuHtKgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eT98EPzLiCwYS0A8wKhweewfBrC9zECL2aIjyfPGc6YENtL7jUyNumDUgCUDCGXyP1H8SapwTkz+i+afPZnl29juziGK8dsSRrMruI24oEh7x8sKoWJm1vQi4kYT+41jk6pOGnpvqsCu4XWVLY36F2yUrtTtUFrUu1YV3pqj7oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C7ylzyCt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B86166BE;
	Tue, 26 Nov 2024 16:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732636677;
	bh=pj1gNk/lE0Z4m2k/WNWGWuIBA44piyxGm+jSTuHtKgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C7ylzyCt/ZdwPaB6DcyemI0rUD9CyJYzbHHFY4X4n3qJML1iDaw+WvfEDXGXWIyl8
	 78gm8Epi4iSD+odYlE1/g7peVwAKlDbPM1o9tEtnmYWAq+0z/c7ATFbPZMNjIu89Ri
	 /0hvYwb5/kgFay6mWydeyUe+PLrw6JEYqsdvbscQ=
Message-ID: <8fe8294a-b785-449e-850a-db334211deba@ideasonboard.com>
Date: Tue, 26 Nov 2024 17:58:14 +0200
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
> 	Hi all,
> 
> As I had to test Tomi's WIP patches to add mini-DP output support to
> Gray Hawk Single, I moved my (old and new) DisplayPort gear to my board
> farm, and thought this was a good opportunity to test mini-DP output on
> White Hawk as a baseline (CN5), and add support for the second mini-DP
> output on the White Hawk BreakOut board (CN15).
> 
> For testing, I used the following hardware:
>    (A) BenQ BL2420PT desktop display (2560x1440),
>    (B) Joy-It Joy-View 15 portable display (1920x1080),
>    (C) Lindy DisplayPort to 2 Port HDMI MST Hub,
>    (D) Passive mini-DP to HDMI cable,
>    (E) LogiLink Mini DisplayPort to VGA Converter.
> 
> (A)-(C) are known to work with my Intel desktop.
> (D)-(E) are known to work with an old Dell XPS13.
> 
> Software-wise, I used the frame buffer text console, "modetest -M
> rcar-du -s 86:1920x1080@XR24" or "modetest -M rcar-du -s
> 86:2560x1440@XR24", and fbtest.
> 
> White Hawk CN5
> --------------
> 
>    0. General:
>        - Hotplug detect does not work, switching display needs a reboot,

Right. It's an eDP chip, and the driver seems to be made to really only 
support eDP.

I'm not so familiar with the HW that I could say if DP HPD can be 
properly implemented or not (I've seen eDP chips that have had issues 
there...), but with a quick test one can do:

rwmem --i2c=1:0x2c -s8 -S8 0x5c:0=0

to enable the HPD, and then it seems to work. However, the driver 
doesn't support interrupts and uses DRM's polling, so it takes a while 
for the framework to notice the disconnect.

But if you run a command that does a display probe, say "kmsprint" from 
kms++, it'll update the status right away.

So, as far as I can see, without actually properly looking at it, it 
should be doable to improve the sn65dsi86 driver to support HPD too.

>        - fbtest test002 crashes with SEGV in 2560x1440.
> 
>    1. Mini-DP to (A) DP:
>         - 2560x1440 works but flickers (flickering shifts image
> 	 horizontally; perhaps a cable issue, as 2 below does work?)

I get a stable picture with my old-ish Dell monitor:

# kmstest
Connector 0/@86: DP-1
   Crtc 0/@83: 2560x1440@59.95 241.500 2560/48/32/80/+ 1440/3/5/33/- 60 
(59.95) P|D
   Plane 0/@33: 0,0-2560x1440
     Fb 97 2560x1440-XR24
press enter to exit

>         - 1920x1080 is stable
> 
>    2. Mini-DP to (C) to (A) HDMI:
>         - 2560x1440 OK
>         - 1920x1080 OK
> 
>    3. Mini-DP to (C) to (B) mini-HDMI:
>         - 1920x1080 OK
> 
>    4. Mini-DP to (C) to (A) HDMI + (B) mini-HDMI:
>         - 1920x1080 mirrored OK
> 
>    5. Mini-DP to (E) to (A) HDMI:
>         - SN65DSI86 behaves as if no cable is connected.
>           Expected, as TI SN65DSI86 does not support Dual-Mode/DP++.
> 
>    6. Mini-DP to (D) to (A) VGA:
>         - Detected 1920x1080, black screen / no signal.
>           Perhaps this adapter relies on DP++, too?

Hmm, are these two mixed up? 5. should have (D), and 6 should have (E)?

No, the vga is an active one, but does it have external power source? If 
not, it relies on the power from the DP connector, and I'm not sure if 
we're providing any/enough.

  Tomi

> 
> 
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
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (1):
>    arm64: dts: renesas: white-hawk: Add mini-DP output support
> 
>   .../boot/dts/renesas/r8a779g0-white-hawk.dts  | 90 +++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 


