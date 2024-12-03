Return-Path: <linux-renesas-soc+bounces-10789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B46569E144E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A612841E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 07:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03592500BD;
	Tue,  3 Dec 2024 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YsosJJ1U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364318595B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211222; cv=none; b=pkLdL6OWGdoz0V43k7L/hkQeMk2MxfM51+W9YO5dBucnVF3gMU53gtQpNo/zdA/5Wo2SpXMU2vnjjhKAwW8R+MYR2zQD5OB6sweymI0L12GohxzIjvKJZNWCsljfO0PvWY/1comC00H0EJ4N/Ttn2DVYPKy92SL4vJZjDXVgk2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211222; c=relaxed/simple;
	bh=84sI/O1MnNS90t12qXi5P1VLj3suh/WYK6iZ2gR2qjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuy8c4IDUTfwl0vwHj2ENz86ZgpLj12OEG5GzdltSLOG3Ciw20hgnrfQgIOLioXlAop7tKpGIBbuHYOmxfAA5o1NP1rHiS5TUGqauGY0l7+NqS759SRR3Frg2XCH/bqnmGDgQZPgfo7XMiUs4BVDGgSTY3E6dyE7oAdrbgKYaqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YsosJJ1U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7B974CE;
	Tue,  3 Dec 2024 08:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733211186;
	bh=84sI/O1MnNS90t12qXi5P1VLj3suh/WYK6iZ2gR2qjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YsosJJ1U9hG147epFUYNAKjEc5DkNJbiNP/bdrZI1qVxYcSBxZ9qFnZ4SFcZKJIIV
	 T844uH7yokZYJaXE5trbQsBB5dLRlQCV/SFB7sf1f7eqS/QbEcFMtk/ej/iAjDxiC9
	 s1OlYadT7BxtiwpjFglL2uYv8e8AIAzLjon0sV04=
Message-ID: <4ae5fa1a-27b9-451c-978e-6e92aff5bebc@ideasonboard.com>
Date: Tue, 3 Dec 2024 09:33:29 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 0/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <cover.1729240989.git.geert+renesas@glider.be>
 <CAMuHMdXok5W7d5XBOCrUY3gqd5_xKXrOmqOC33re0-OiZjOH6w@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CAMuHMdXok5W7d5XBOCrUY3gqd5_xKXrOmqOC33re0-OiZjOH6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/12/2024 17:49, Geert Uytterhoeven wrote:
> On Fri, Oct 18, 2024 at 11:32 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> As I had to test Tomi's WIP patches to add mini-DP output support to
>> Gray Hawk Single, I moved my (old and new) DisplayPort gear to my board
>> farm, and thought this was a good opportunity to test mini-DP output on
>> White Hawk as a baseline (CN5), and add support for the second mini-DP
>> output on the White Hawk BreakOut board (CN15).
>>
>> For testing, I used the following hardware:
>>    (A) BenQ BL2420PT desktop display (2560x1440),
>>    (B) Joy-It Joy-View 15 portable display (1920x1080),
>>    (C) Lindy DisplayPort to 2 Port HDMI MST Hub,
>>    (D) Passive mini-DP to HDMI cable,
>>    (E) LogiLink Mini DisplayPort to VGA Converter.
>>
>> (A)-(C) are known to work with my Intel desktop.
>> (D)-(E) are known to work with an old Dell XPS13.
>>
>> Software-wise, I used the frame buffer text console, "modetest -M
>> rcar-du -s 86:1920x1080@XR24" or "modetest -M rcar-du -s
>> 86:2560x1440@XR24", and fbtest.
>>
>> White Hawk CN5
>> --------------
>>
>>    1. Mini-DP to (A) DP:
>>         - 2560x1440 works but flickers (flickering shifts image
>>           horizontally; perhaps a cable issue, as 2 below does work?)
>>         - 1920x1080 is stable
> 
> While I don't have a second Mini-DP-to-DP-M cable, I tried a few
> other combos (now on Gray Hawk Single):
>    7. (D) + HDMI-F-F adapter + passive HDMI-F-to-DP-cable to (A) DP,

D is passive DP->HDMI, it won't work. Are you saying it works, and the 
result matches the test case 1.?

>    8. Mini-DP-to-DP-F cable (=X) + plain DP cable (=Y) to (A) DP,
> unfortunately with the same results.  Note that (X) is the same cable

"same results" means same as in 1.?

> as used in scenario 2 below, and (Y) works fine with my Intel desktop.
> 
> However, the maximum cable length for eDP seems to be 30 cm, so that

Where did you read that? I don't think there's such a thing as "eDP 
cable". In laptops etc. eDP is connected to the panel via custom made 
cables, and the cable design affects how long it can be. eDP and DP are 
identical wrt. signaling, so using a DP cable with eDP or DP should 
behave the same.

That said, I don't think the eDP->DP connector designs we see in these 
development boards are really made to match what one would expect from a 
consumer device with a DP output.

> may explain why 2 below is the only wiring that works at 2560x1440
> (despite cable (X) being 1m, i.e. still too long)?
> 
>>    2. Mini-DP to (C) to (A) HDMI:
>>         - 2560x1440 OK
>>         - 1920x1080 OK

My guess is that this works, because there's an active component there 
which decodes the DP input and re-encodes it to HDMI output, probably 
with different timings (read, more standard). So the (C) is more 
tolerant on not-so-standard DP input than (A) is.

The eDP chip is limited in its capabilities, e.g. back porch registers 
are 8-bit, so they max out at 255. While those are checked in the 
driver, I wouldn't be surprised if some other limitations are not (the 
driver has clearly been written for eDP panels).

You could try different custom timings with kmstest, to find if there's 
something obvious that makes the case 1. work. For example, if the issue 
is indeed the cable, probably lowering the pixel clock would fix it. So 
using the same timings but dropping the pclk in half might get a stable 
picture (then again, lowering pclk might fix many other kinds of issues 
too...).

Can you send your monitor's edid blob? I don't have a board up here, but 
it should be available from somewhere in sysfs. On my desktop it's:

/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-DP-2/edid

  Tomi


