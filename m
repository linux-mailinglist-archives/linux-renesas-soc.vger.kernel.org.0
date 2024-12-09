Return-Path: <linux-renesas-soc+bounces-11076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D969E8AFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 06:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D171883B04
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 05:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12191607B4;
	Mon,  9 Dec 2024 05:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MNcFaGRJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ECC14A4CC;
	Mon,  9 Dec 2024 05:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722017; cv=none; b=orQFSIUsLGY81V0pA/Mz9CCbETaGJyAopWn2JnP/Rd4gldSa//2Jsqr4rTamcyBEdxRG5DlJ+ge8gR3uH68nqjj6rWJvDE8mimihiyEB/1nX4WWbc+8Fu+iy6WDqtq7zr0ATXKbXgNmSxR28fSfkk0w4lmbIyKjPnKMEpbcmXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722017; c=relaxed/simple;
	bh=r3GRkniscda1h2jGia96dSzPLBBeCAFfWtcoKtCndGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3Ey/5CcDlDfGyEizT1G2idsi5seVhNVvN4f2eemWSNTCyhYgCwH24FybAjm3ogBTLAOwEDgSVyZYw7/oIXwddF68DhoSeVDD+cYd2il5KaxqUS+Dtv1twoVbuFaov6g+zg16BMa3STX7KXCp2WTBOFjKac8EQdulgsJnlwqTxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MNcFaGRJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D15D4502;
	Mon,  9 Dec 2024 06:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733721974;
	bh=r3GRkniscda1h2jGia96dSzPLBBeCAFfWtcoKtCndGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MNcFaGRJBul5yuH7NaP0tg2XJDSNmygMpCc4b5I+kzpZhFdf/+jqvsUrjcomDAGgW
	 HMcuw98tx6rcyZZu/0v8bh6E2hdpABQr8j3h+Tq0uBkEBW1Ay7jABVRJQRgvzqYonB
	 l3zuGGhsdXifB0AVrFn5g9BgwC7qQkiJrDXnZk9M=
Message-ID: <b0fffc87-a72e-4041-b3f6-7f2a4987916e@ideasonboard.com>
Date: Mon, 9 Dec 2024 07:26:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] clk: renesas: r8a779h0: Add display clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com>
 <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/12/2024 15:43, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Fri, Dec 6, 2024 at 10:33 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> Add display related clocks for DU, DSI, FCPVD, and VSPD.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.14.
> 
>> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
>> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
>> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
>>          DEF_MOD("canfd0",       328,    R8A779H0_CLK_SASYNCPERD2),
>>          DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
>>          DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),
>> +       DEF_MOD("dis0",         411,    R8A779H0_CLK_S0D3),
>> +       DEF_MOD("dsitxlink0",   415,    R8A779H0_CLK_DSIREF),
>> +       DEF_MOD("fcpvd0",       508,    R8A779H0_CLK_S0D3),
>>          DEF_MOD("hscif0",       514,    R8A779H0_CLK_SASYNCPERD1),
>>          DEF_MOD("hscif1",       515,    R8A779H0_CLK_SASYNCPERD1),
>>          DEF_MOD("hscif2",       516,    R8A779H0_CLK_SASYNCPERD1),
>> @@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
>>          DEF_MOD("vin15",        811,    R8A779H0_CLK_S0D4_VIO),
>>          DEF_MOD("vin16",        812,    R8A779H0_CLK_S0D4_VIO),
>>          DEF_MOD("vin17",        813,    R8A779H0_CLK_S0D4_VIO),
>> +       DEF_MOD("vspd0",        830,    R8A779H0_CLK_S0D1_VIO),
>>          DEF_MOD("wdt1:wdt0",    907,    R8A779H0_CLK_R),
>>          DEF_MOD("cmt0",         910,    R8A779H0_CLK_R),
>>          DEF_MOD("cmt1",         911,    R8A779H0_CLK_R),
> 
> As mentioned by Laurent during his review on v1, all clock parents
> should probably be some form of R8A779H0_CLK_S0Dx_VIO.
> So I'm inclined to replace all of them by R8A779H0_CLK_VIOBUSD2 while
> applying, which would match R-Car V4H.

What do you mean with the above? First you say the clock parents should 
be some form of S0Dx_VIO, but then you say you'll use VIOBUSD2. Aren't 
those unrelated clocks, from different PLLs?

> Are you OK with that?

I'm fine with that. I can't really get much out of the docs wrt. 
clocking, and the clocks I used were from the BSP. Afaics, it looks 
similar to V4H, so it's probably best have the same clocks, as you suggest.

  Tomi


