Return-Path: <linux-renesas-soc+bounces-20888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56877B30FE8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 09:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79DB71CE09ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 07:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0802E7BB3;
	Fri, 22 Aug 2025 07:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UIKbYIOF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF85D2236FD;
	Fri, 22 Aug 2025 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755846314; cv=none; b=JVgsyF4bvU6NVOf8SvvfdXSDC5M4vrRjsSLQ0W+lqJ/vwCx76JYlitIkz6fd+zxgfRNygfkErVQLRut4OkzbcX7M1GYKZ1OD9qTNDvAEeiMnCli0EgQ5nlmoA9D3BwcdrIvef7zzjWg3GCvocPpVSoNou8F6lhsi2+ebi493iIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755846314; c=relaxed/simple;
	bh=1ffcDsKG1iX++7NX+A4CuvUQDe3Z14ZS9DI1u4koEBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZDSD3wwHs12NI/3rxajnbRN79zF0PVojWXQ9JolGuTta9zVfTiz0G0RyPv6utuKw8/SvdszgKy2dlzK28gTPfegiAOHkPE2rhSSQgNhAUWO4KeSnJOPzFlVrVOK4M/W/0FSI/wPK2230VDd9nPREsR5Z9+rKi5hA/3tuJ9bums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UIKbYIOF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CECF107;
	Fri, 22 Aug 2025 09:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755846249;
	bh=1ffcDsKG1iX++7NX+A4CuvUQDe3Z14ZS9DI1u4koEBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UIKbYIOFIuFBzDLuzuKDdpuKEv+dvCL1hjESxRjxpvTugBZ280OjOzQg5MPiU75rA
	 IsuYNdjR3lKPhdwHRB84KR8AyittXVwb/wBN41Smg8agh0102QnrXZE2VL7df+17yZ
	 cKeS18SwRO0HeQ+rUu5t/ykWctn49ajCWUkPqIqU=
Message-ID: <e6f4a0dd-deff-408a-a5ff-8fdc74a6fd25@ideasonboard.com>
Date: Fri, 22 Aug 2025 10:05:04 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <7284cad0-b71b-49dc-bb09-cd9f1ff00028@ideasonboard.com>
 <TY3PR01MB11346B44AEFCB6B76F00FF160863DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <TY3PR01MB11346B44AEFCB6B76F00FF160863DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22/08/2025 10:01, Biju Das wrote:
> Hi Tomi,
> 
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Tomi Valkeinen
>> Sent: 21 August 2025 10:29
>> Subject: Re: [PATCH v7 6/6] drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
>>
>> Hi,
>>
>> On 28/07/2025 23:14, Prabhakar wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Add DSI support for Renesas RZ/V2H(P) SoC.
>>
>> I think a bit longer desc would be in order, as this is not just a "add a new compatible string" patch,
>> but we have new registers and functions.
>>
>>> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>>> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> v6->v7:
>>> - Used the new apis for calculating the PLLDSI
>>>   parameters in the DSI driver.
>>>
>>> v5->v6:
>>> - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
>>>   PHYTCLKSETR_* and PHYTHSSETR_* macros.
>>> - Replaced 10000000UL with 10 * MEGA
>>> - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
>>> - Replaced `i -= 1;` with `i--;`
>>> - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
>>>   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
>>>   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
>>>   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
>>>
>>> v4->v5:
>>> - No changes
>>>
>>> v3->v4
>>> - In rzv2h_dphy_find_ulpsexit() made the array static const.
>>>
>>> v2->v3:
>>> - Simplifed V2H DSI timings array to save space
>>> - Switched to use fsleep() instead of udelay()
>>>
>>> v1->v2:
>>> - Dropped unused macros
>>> - Added missing LPCLK flag to rzv2h info
>>> ---
>>>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++++
>>>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
>>>  2 files changed, 379 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>> b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>> index 893a90c7a886..3b2f77665309 100644
>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>> @@ -7,6 +7,7 @@
>>>
>>>  #include <linux/bitfield.h>
>>>  #include <linux/clk.h>
>>> +#include <linux/clk/renesas-rzv2h-cpg-pll.h>
>>>  #include <linux/delay.h>
>>>  #include <linux/dma-mapping.h>
>>>  #include <linux/io.h>
>>> @@ -46,6 +47,11 @@ struct rzg2l_mipi_dsi_hw_info {
>>>  			      u64 *hsfreq_millihz);
>>>  	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
>>>  					    unsigned long mode_freq);
>>> +	struct {
>>> +		const struct rzv2h_pll_limits **limits;
>>> +		const u8 *table;
>>> +		const u8 table_size;
>>> +	} cpg_plldsi;
>>>  	u32 phy_reg_offset;
>>>  	u32 link_reg_offset;
>>>  	unsigned long min_dclk;
>>> @@ -53,6 +59,11 @@ struct rzg2l_mipi_dsi_hw_info {
>>>  	u8 features;
>>>  };
>>>
>>> +struct rzv2h_dsi_mode_calc {
>>> +	unsigned long mode_freq_khz;
>>> +	struct rzv2h_pll_pars dsi_parameters; };
>>> +
>>>  struct rzg2l_mipi_dsi {
>>>  	struct device *dev;
>>>  	void __iomem *mmio;
>>> @@ -75,11 +86,22 @@ struct rzg2l_mipi_dsi {
>>>  	unsigned int lanes;
>>>  	unsigned long mode_flags;
>>>
>>> +	struct rzv2h_dsi_mode_calc mode_calc;
>>> +
>>>  	/* DCS buffer pointers when using external memory. */
>>>  	dma_addr_t dcs_buf_phys;
>>>  	u8 *dcs_buf_virt;
>>>  };
>>>
>>> +static const struct rzv2h_pll_limits rzv2h_plldsi_div_limits = {
>>> +	.fout = { .min = 80 * MEGA, .max = 1500 * MEGA },
>>> +	.fvco = { .min = 1050 * MEGA, .max = 2100 * MEGA },
>>> +	.m = { .min = 64, .max = 1023 },
>>> +	.p = { .min = 1, .max = 4 },
>>> +	.s = { .min = 0, .max = 5 },
>>> +	.k = { .min = -32768, .max = 32767 }, };
>>> +
>>>  static inline struct rzg2l_mipi_dsi *
>>> bridge_to_rzg2l_mipi_dsi(struct drm_bridge *bridge)  { @@ -194,6
>>> +216,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
>>>  	},
>>>  };
>>>
>>> +struct rzv2h_mipi_dsi_timings {
>>> +	const u8 *hsfreq;
>>> +	u8 len;
>>> +	u8 start_index;
>>> +};
>>> +
>>> +enum {
>>> +	TCLKPRPRCTL,
>>> +	TCLKZEROCTL,
>>> +	TCLKPOSTCTL,
>>> +	TCLKTRAILCTL,
>>> +	THSPRPRCTL,
>>> +	THSZEROCTL,
>>> +	THSTRAILCTL,
>>> +	TLPXCTL,
>>> +	THSEXITCTL,
>>> +};
>>> +
>>> +static const u8 tclkprprctl[] = {
>>> +	15, 26, 37, 47, 58, 69, 79, 90, 101, 111, 122, 133, 143, 150, };
>>> +
>>> +static const u8 tclkzeroctl[] = {
>>> +	9, 11, 13, 15, 18, 21, 23, 24, 25, 27, 29, 31, 34, 36, 38,
>>> +	41, 43, 45, 47, 50, 52, 54, 57, 59, 61, 63, 66, 68, 70, 73,
>>> +	75, 77, 79, 82, 84, 86, 89, 91, 93, 95, 98, 100, 102, 105,
>>> +	107, 109, 111, 114, 116, 118, 121, 123, 125, 127, 130, 132,
>>> +	134, 137, 139, 141, 143, 146, 148, 150, };
>>> +
>>> +static const u8 tclkpostctl[] = {
>>> +	8, 21, 34, 48, 61, 74, 88, 101, 114, 128, 141, 150, };
>>> +
>>> +static const u8 tclktrailctl[] = {
>>> +	14, 25, 37, 48, 59, 71, 82, 94, 105, 117, 128, 139, 150, };
>>> +
>>> +static const u8 thsprprctl[] = {
>>> +	11, 19, 29, 40, 50, 61, 72, 82, 93, 103, 114, 125, 135, 146, 150, };
>>> +
>>> +static const u8 thszeroctl[] = {
>>> +	18, 24, 29, 35, 40, 46, 51, 57, 62, 68, 73, 79, 84, 90,
>>> +	95, 101, 106, 112, 117, 123, 128, 134, 139, 145, 150, };
>>> +
>>> +static const u8 thstrailctl[] = {
>>> +	10, 21, 32, 42, 53, 64, 75, 85, 96, 107, 118, 128, 139, 150, };
>>> +
>>> +static const u8 tlpxctl[] = {
>>> +	13, 26, 39, 53, 66, 79, 93, 106, 119, 133, 146,	150,
>>> +};
>>> +
>>> +static const u8 thsexitctl[] = {
>>> +	15, 23, 31, 39, 47, 55, 63, 71, 79, 87,
>>> +	95, 103, 111, 119, 127, 135, 143, 150, };
>>> +
>>> +static const struct rzv2h_mipi_dsi_timings rzv2h_dsi_timings_tables[] = {
>>> +	[TCLKPRPRCTL] = {
>>> +		.hsfreq = tclkprprctl,
>>> +		.len = ARRAY_SIZE(tclkprprctl),
>>> +		.start_index = 0,
>>> +	},
>>> +	[TCLKZEROCTL] = {
>>> +		.hsfreq = tclkzeroctl,
>>> +		.len = ARRAY_SIZE(tclkzeroctl),
>>> +		.start_index = 2,
>>> +	},
>>> +	[TCLKPOSTCTL] = {
>>> +		.hsfreq = tclkpostctl,
>>> +		.len = ARRAY_SIZE(tclkpostctl),
>>> +		.start_index = 6,
>>> +	},
>>> +	[TCLKTRAILCTL] = {
>>> +		.hsfreq = tclktrailctl,
>>> +		.len = ARRAY_SIZE(tclktrailctl),
>>> +		.start_index = 1,
>>> +	},
>>> +	[THSPRPRCTL] = {
>>> +		.hsfreq = thsprprctl,
>>> +		.len = ARRAY_SIZE(thsprprctl),
>>> +		.start_index = 0,
>>> +	},
>>> +	[THSZEROCTL] = {
>>> +		.hsfreq = thszeroctl,
>>> +		.len = ARRAY_SIZE(thszeroctl),
>>> +		.start_index = 0,
>>> +	},
>>> +	[THSTRAILCTL] = {
>>> +		.hsfreq = thstrailctl,
>>> +		.len = ARRAY_SIZE(thstrailctl),
>>> +		.start_index = 3,
>>> +	},
>>> +	[TLPXCTL] = {
>>> +		.hsfreq = tlpxctl,
>>> +		.len = ARRAY_SIZE(tlpxctl),
>>> +		.start_index = 0,
>>> +	},
>>> +	[THSEXITCTL] = {
>>> +		.hsfreq = thsexitctl,
>>> +		.len = ARRAY_SIZE(thsexitctl),
>>> +		.start_index = 1,
>>> +	},
>>> +};
>>> +
>>> +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq) {
>>> +	static const unsigned long hsfreq[] = {
>>> +		1953125UL,
>>> +		3906250UL,
>>> +		7812500UL,
>>> +		15625000UL,
>>> +	};
>>> +	static const u16 ulpsexit[] = {49, 98, 195, 391};
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(hsfreq); i++) {
>>> +		if (freq <= hsfreq[i])
>>> +			break;
>>> +	}
>>> +
>>> +	if (i == ARRAY_SIZE(hsfreq))
>>> +		i--;
>>> +
>>> +	return ulpsexit[i];
>>> +}
>>> +
>>> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
>>> +{
>>> +	const struct rzv2h_mipi_dsi_timings *timings;
>>> +	u16 i;
>>> +
>>> +	timings = &rzv2h_dsi_timings_tables[index];
>>> +	for (i = 0; i < timings->len; i++) {
>>> +		unsigned long hsfreq = timings->hsfreq[i] * 10 * MEGA;
>>> +
>>> +		if (freq <= hsfreq)
>>> +			break;
>>> +	}
>>> +
>>> +	if (i == timings->len)
>>> +		i--;
>>> +
>>> +	return timings->start_index + i;
>>> +};
>>
>> I have to say I really don't like this... In the minimum, the method how this works has to be explained
>> in a comment. These values can't really be calculated? If we really have to deal with hardcoded values
>> and with that table from the docs, I would say that just replicate the table in the driver (i.e. a
>> struct that represents one row of the table), instead of the method in this driver.
>>
>> Or was this method added based on earlier feedback, for v3? I see "Simplifed V2H DSI timings array to
>> save space" in the change log. If so, at least document it clearly.
> 
> It was added based on v3 based on my comment on v2[1].
> 
> If you see each table entries it is now just 1 byte vs 10 bytes (u8 vs (u64 + u16)).
> 
> So, it is saving considerable space by using this methos. Maybe we need to document this
> 
> [1] https://lore.kernel.org/all/TY3PR01MB113462CC30072B670E23EC7F586B12@TY3PR01MB11346.jpnprd01.prod.outlook.com/

Ok. I guess it's fine if it's documented. It wasn't super hard to
reverse engineer it, but a short comment would have saved me the time =).

But still, where do the numbers come from? Is there a formula that was
used to generate the values in the doc? Maybe the Renesas HW people
know? If yes, it'd be much better to use that formula. These are normal
DSI timings, based on the hs clock, so I think they should be calculable.

 Tomi


