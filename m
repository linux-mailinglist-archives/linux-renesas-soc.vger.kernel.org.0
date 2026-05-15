Return-Path: <linux-renesas-soc+bounces-32657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAAbAkHYBmqDoQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:24:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F954B3B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4484930B85C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 08:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE7E3FFABE;
	Fri, 15 May 2026 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AH3Pu3Ej"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A165401489;
	Fri, 15 May 2026 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833072; cv=none; b=HWN6j/ai8K1Wv9ltT0CvgbYNUTlPawXwtmi76rHakvUbOLPsxE1VIh/GpbiUkqtp5+02vbBxO54MtHT1mln5EoB3SvV24UX5em6mKPhmsnCQZhYjxE1AntKC4uNQ8jdzDrfHn7bzHF0bsIcEBbxk7htKDrAyCpSQdE1PqrkX9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833072; c=relaxed/simple;
	bh=b0OEhP8qvyiis/NQ4grQI4aqjG0M9Ql0pGcC48E6k7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQx5MDbcq0xjqGgKu+6pwI+TItSRYM03tF71/QDItZlFqW6B0ppldqT8qtRirovgrbwMPKGw+SdZhdVevvvizlfSAt3BsN6A380k3ky/lnPVNbSQkEtPyEEDIbSpj+rf1uIUV4uOg4hakcAV2fNUraMkPulOk4GqzrHF5Y6msog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AH3Pu3Ej; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8908063C;
	Fri, 15 May 2026 10:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778833056;
	bh=b0OEhP8qvyiis/NQ4grQI4aqjG0M9Ql0pGcC48E6k7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AH3Pu3EjoCZzvtcnrUiKvK55iGeHCjQLkNPgq5qKvPw7mCpEdzLNiylbnbstODP0R
	 Cf2zW43dk6zFuEO19RZJTSLTvsV/o4WBrBdKkVzGPM35zy2YzZrctfIhnqcyZQkFlX
	 h7EN5XSWeuShMFS5p6wLUF1CD5AnDCJfTirm38x0=
Message-ID: <d7447f51-c2f7-4947-9fd0-ac0d45027c59@ideasonboard.com>
Date: Fri, 15 May 2026 11:17:42 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
 <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
 <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com>
 <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 755F954B3B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32657-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Action: no action

Hi,

On 15/05/2026 11:05, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Fri, 15 May 2026 at 10:03, Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>> On 15/05/2026 10:49, Geert Uytterhoeven wrote:
>>> On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
>>> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>>>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>
>>>> The Renesas DSC Display Stream Compression is a bridge embedded in the
>>>> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
>>>> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
>>>> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> [tomi.valkeinen: use bridge->next_bridge, minor changes]
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
>>>
>>>> +
>>>> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
>>>> +                                  struct drm_atomic_state *state)
>>>> +{
>>>> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
>>>> +
>>>> +       WARN_ON(clk_prepare_enable(dsc->clk));
>>
>> Ah, just missed your comment and sent the v2.
>>
>>> Who don't you use pm_runtime_resume_and_get() instead, like
>>> rcar_cmm.c? Then you don't need to get the clock at all, and the driver
>>
>> Hmm, why wouldn't I need to get the clock? What does the runtime PM do
>> on Renesas?
> 
> Runtime PM powers on the power domain (if present), and starts
> the device by enabling its module clock.
> 
>>> will keep on working if the DSC ever ends up in a power domain.
>> I can add runtime PM. I just felt that it was overcomplicating a "dummy"
>> driver that just needs to enable the clock when the video pipeline is
>> enabled.
> 
> Funny, I would say you are overcomplicating a dummy driver by adding
> explicit clock control ;-)
Well, now that I know the runtime PM does magics behind the scenes, you 
are right =).

How's "module clock" defined? Is it the first clock in the clocks DT 
property?

I'll have a look at whitehawk too. The funny thing is, I had a 
recollection that dsc was somehow used on whitehawk too. I looked at the 
board, and saw only the single mini DP connector on the CPU board, which 
already works, so I then concluded that the other DSI path is for the 
GMSL... I think I need new eyeglasses.

  Tomi


