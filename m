Return-Path: <linux-renesas-soc+bounces-31448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CHxClc/52no5QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 11:11:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCD438ACB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 11:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BA6630045A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 09:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480D82C0299;
	Tue, 21 Apr 2026 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OCwOAE5o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678A6388E6D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762694; cv=none; b=cM0B/6cCxqb6MV05wnOnbnaT+4RrEEE3AcNJ8t6EOB0tzWjiUwO/rs9f3wQL+pLZgglHPgvl3fv/NhPM0n53SMQXsnraKna4hDdWjh8l5D6VEvbCKHMWdvB0MR2DHrHXlZSW0Uf8/A/79dMupETNRe4+OOMnTmLpHuqesEnUNXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762694; c=relaxed/simple;
	bh=niz+CPjCc0QKcD0G2DUKyllqyoOHdqsDE1K7p92a4fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lINrRUptvXb+UY1gHloTj9j6S2sV+Wxg6Ep7kczjV8C/xtF/TWM1vhEpvjJYi6OWz9jKoo+Cdy0FZ30z2GUAbgtkJUr7ENeRYzmjyvEYT1x34WrGWxACb3i3U7ua4SPNlYwol9aAZs3jmRWgRtK96xgBoFp1N0zzuD9yQy1R3Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OCwOAE5o; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso36226215e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776762690; x=1777367490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNfuWJu37z+/2le7LSB6+FRY2Cw1Ca4xlFzZNv69CQ0=;
        b=OCwOAE5oIKtlyrHktEbpB04ZSgNqb5gN4eEuIFbLXw1n+R6RDsGmQFfBUDppZ7Tsd3
         WSgIuVT4tPZcSztTTD8YUuNF8nIa7qX6tMs/qfMtRCCcqPP+N9QgZdpWTMmTwlCKeC6k
         O4envsWZ7PTZFpn3IswT3AZp8XPdHlxXbI2vOBsELZHId3Tos76jGfXJc4bggT2OQ4oR
         +w2yMSz+I8LAG4dApG84QJxXw9MVUOz6Du4MCSNpIT4KeesgiA1ooxdH4C8GJJTgpIyN
         KNaZ/mkQr6qC0zCvLmK4YwIgBzbSplZH0Spp30ofF3ESwbXKkkR5co0RKiMmj2VJhVXt
         JnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762690; x=1777367490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNfuWJu37z+/2le7LSB6+FRY2Cw1Ca4xlFzZNv69CQ0=;
        b=IR8TC1OqsR6IugDtjMhq9J8czl7WXcVNWPjH+T26NBUYdldu8XbI+fltuIIeGCEmvZ
         0LA4C/Q9XlF7qtOMnUMmbBMg6vBeKEJAOYA91R2TjQYONlF0gEMmnd0mGwcIvKL8ngd4
         o0vAdsr9CCETfCwawNOoYDCDamT1yq930S7QKj/lmByKwseqa6uRWXrDChy/oO+B9MDV
         7pmajMwDL6wMfmKXkxx0TW7pCrE4at0yvMBLU71a8y3hs0+zHNWgPLu/kRhv4cxH+854
         DXVUCqlMcbK3/cfNOAWye5Q/Q9zHYcn3sjYBsliSn8bj8X6py+vIX/xLRq+ZbHq4YkDl
         vGSg==
X-Forwarded-Encrypted: i=1; AFNElJ8QTKuleIdXM+Nrs+qWa1X6iAjZ1+wwGMD6pizQFnSyhx46u+sC0o1nMhIdFPeX84WS21rf9XBlfWkEEjtJ1do8qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC9tFt4QbQ2RA5tCpFKSBDR2UxHKidwTcC/pqrXiTChwCvsg1A
	f3raMT1BpVXiNCuZqk6C8T2XB1d+EeiCYIF4Y7urj91Ays6UAN4n0rRGiRxeSNlzxhA=
X-Gm-Gg: AeBDiese7N7tw/9jhaplo3UfIKKbPuRnEknqrnDUZISuIHnC9wBwMW4lb+L6v4jcPRa
	3auQGXhRQa5Idj4PttnSH+YP3izfZEEWo795p4oB91hUPpHek5n9aL9KDni3sqoHynMyiOsXvhD
	QUW87fYO9Ce2HgfFroMjUlgHN/4Rj4u5SIhrf77jSFAPZeg0utP3D0fwV7aTsRi1Tr3xDNMDKNe
	M2q3LIIpOwtOEzHcv4aeBYfz/f1wuQLWZ0PcPee0w2Hl2x8FS1BlfmUw4NO8kOKfQpv9InKcJyz
	tBKnP8D7yGqeKH0h04H9ipAk030PcOK8NsAe4/YdkGkoa+dxybwo7/FY2O66VExohyo51mekGgW
	cwHdvUmHAig1P5B4ywVsWyKzPMaDGCTOhurWpFec2UvB93cDEqaxzSKs61+9c+aSriVrAS+jlsu
	R1YzxGRvVZ+RD7qQVWs/9mXxSVxrKLBihRee8wRgTjWw==
X-Received: by 2002:a05:600c:498a:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48900ad7b76mr107952685e9.24.1776762690040;
        Tue, 21 Apr 2026 02:11:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55b8baaesm55126775e9.10.2026.04.21.02.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:11:29 -0700 (PDT)
Message-ID: <9523bd97-2730-4b99-b3d0-6accc7622478@tuxon.dev>
Date: Tue, 21 Apr 2026 12:11:28 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
 <td55nrjrchomtatyx5phbojvjipwh64gnlnydqame5xakviafp@ixzaju2lnkpm>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <td55nrjrchomtatyx5phbojvjipwh64gnlnydqame5xakviafp@ixzaju2lnkpm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31448-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesasweb.s3.us-west-2.amazonaws.com:url,tuxon.dev:dkim,tuxon.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8ACCD438ACB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 4/19/26 18:58, Dmitry Baryshkov wrote:
> On Fri, Apr 17, 2026 at 06:52:30PM +0100, Biju wrote:
>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>
>> Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
>> mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
>> from 25 to 87 MHz. The LVDS module cannot be used at the same time as
>> MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
>> the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
>> MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
>> module.
>>
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>> ---

[ ...]

>> +/* -----------------------------------------------------------------------------
>> + * Bridge
>> + */
>> +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
>> +				     struct drm_atomic_state *state)
>> +{
>> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
>> +	const struct drm_bridge_state *bridge_state;
>> +	int ret;
>> +	u32 fmt;
>> +
>> +	/* Get the LVDS format from the bridge state. */
>> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
>> +	if (!bridge_state) {
>> +		dev_err(lvds->dev, "failed to get bridge state\n");
>> +		return;
>> +	}
>> +
>> +	switch (bridge_state->output_bus_cfg.format) {
>> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
>> +		fmt = RZG3L_LVDS_MODE_JEIDA;
>> +		break;
>> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
>> +		fmt = RZG3L_LVDS_MODE_VESA;
>> +		break;
>> +	default:
>> +		fmt = RZG3L_LVDS_MODE_VESA;
>> +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
>> +			 bridge_state->output_bus_cfg.format);
>> +		break;
>> +	}
>> +
>> +	ret = pm_runtime_resume_and_get(lvds->dev);
> 
> If this  fails for any reason, the atomic_disable() would still be
> called and it will decrement the counter, potentially undeflowing it.
> Consider switching to pm_runtime_get_sync(), which suits better here.

AFAIK, the clocks of this HW blocks have MSTOP functionality. HW manual of 
RZ/G3S [1] (should be the same for RZ/G3L as well) mentions the following in the 
chapter 41.2.1. "If the master accesses a module that has the clock stopped and 
the MSTOP bit set, a bus error will occur". [1]
MSTOP is set though the clock enable/disable APIs.

The clocks on RZ/G3L are part of clock power domains. If the 
pm_runtime_resume_and_get() fails (or any runtime PM resume calls), the clocks 
will be off and MSTOP set. In this case, calling atomic_disable() or any API 
setting HW registers will lead to sync aborts.

Thank you,
Claudiu

[1] 
https://renesasweb.s3.us-west-2.amazonaws.com/prod/docs/X014/X0141882/r01uh1014ej0120-rzg3s.pdf?response-content-disposition=inline%3B%20filename%3D%22r01uh1014ej0120-rzg3s.pdf%22&response-content-type=application%2Fpdf&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA3WXFIBJWSDVTHJX3%2F20260421%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260421T075408Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86700&X-Amz-Signature=435eb49a37a080094aecf291bc3dc2d5b7ee62d3de8075151082e9db6c6acbe7


