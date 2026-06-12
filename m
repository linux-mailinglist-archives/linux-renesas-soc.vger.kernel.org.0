Return-Path: <linux-renesas-soc+bounces-33920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jy3uC/3zK2rRIQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 13:56:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B3679272
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 13:56:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=S5OWJK8k;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CE7D3004DC4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BF83E866B;
	Fri, 12 Jun 2026 11:56:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A483ABD95;
	Fri, 12 Jun 2026 11:56:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265382; cv=none; b=lCiLfnZpbEkjURNqKLvEAWacXJ2zS02g34juLfS2IOnT1qTzt1ZkCAknRDX9A10u9Uufw6aPYvnOeyNq8hDdBDvlxhiurAcQO53srapPCJuUEYM94Yzh8/b9Va8VXPznps9ap1kZiRgAgjBbNaTsSjG1QOhEJDpIDiBDvJjqhwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265382; c=relaxed/simple;
	bh=/xxC0Hha6e9anXB89K7UKFjQ+uG1t5JBiZJIaIWVBTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTKHDURkLsIaDeJjXQ5mAWKs/Q8tRsj2OdHZzUKb2yuJZ3tLwpv2em8TBQr71YaGfRIzTfYZuBNMqXo8cw0objcy5ab8Y8KQ4F6fPBIb3SLr1DUjSU4b9ndr2z8BLcuvnZIMV9igtOz+rmlGDYPlHfLM3s66Lx62G/3inVfQOFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S5OWJK8k; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7E3619EC;
	Fri, 12 Jun 2026 13:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781265346;
	bh=/xxC0Hha6e9anXB89K7UKFjQ+uG1t5JBiZJIaIWVBTI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S5OWJK8kRzafUXg0MuDQBVbhE6YPjdKfzc72GwxH5rvDO1NR/aqkHMCwtEq2nc+FU
	 0itHpCzeLULzO8uXyt0fnnbEVdBiC41tPKL1Aj8NQ2l/RHqvbOl9bZiDaClYb8GixQ
	 2JtwCK/jrNNDav4X7KPHkbeQ3Rp3Z7M0TCanLszI=
Message-ID: <11f27d38-0224-4fce-a975-7c3f7d8d1d38@ideasonboard.com>
Date: Fri, 12 Jun 2026 14:56:11 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/rcar-du: dsi: Support DSC in the pipeline
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
 <20260515-rcar-du-dsc-v3-4-164157820498@ideasonboard.com>
 <20260611000324.GH1632628@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260611000324.GH1632628@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33920-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,ideasonboard.com,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF6B3679272

Hi,

On 11/06/2026 03:03, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 15, 2026 at 12:09:29PM +0300, Tomi Valkeinen wrote:
>> Enabling DSI clocks on rcar-du needs some tricks as the DU dot clock is
>> provided by the DSI. Thus, we call rcar_mipi_dsi_pclk_enable() from the
>> crtc, when enabling the crtc.
>>
>> With DSC (added in upcoming patch) in the pipeline, between the DU and
>> the DSI, the above call path is broken as the crtc tries to call
>> rcar_mipi_dsi_pclk_enable() on the DSC.
>>
>> Adjust the rcar_mipi_dsi_pclk_enable() so that it detects the DSC, and
>> in that case gets the next bridge from the DSC, which is the DSI.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 36 +++++++++++++++++++++++--
>>   1 file changed, 34 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> index 4ef2e3c129ed..085e229bcb0b 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> @@ -88,6 +88,8 @@ struct dsi_setup_info {
>>   	const struct dsi_clk_config *clkset;
>>   };
>>   
>> +static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops;
>> +
>>   static inline struct rcar_mipi_dsi *
>>   bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
>>   {
>> @@ -844,15 +846,39 @@ static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
>>   	rcar_mipi_dsi_stop_video(dsi);
>>   }
>>   
>> +/*
>> + * We need to skip the DSC bridge when we have DSC in between the DU and
>> + * the DSI. We detect the DSI bridge via bridge->funcs, and assume the
>> + * next_bridge is the DSI bridge. If this is not the case, the DT data
>> + * is wrong (so it shouldn't really happen).
>> + */
>> +static struct drm_bridge *
>> +rcar_mipi_dsi_resolve_bridge(struct drm_bridge *bridge)
>> +{
>> +	if (bridge->funcs != &rcar_mipi_dsi_bridge_ops)
>> +		bridge = bridge->next_bridge;
>> +
>> +	if (!bridge || bridge->funcs != &rcar_mipi_dsi_bridge_ops)
>> +		return NULL;
>> +
>> +	return bridge;
>> +}
> 
> Hmmmm... It's quite a bit of a hack. It would be nicer to do this in
> rcar_du_crtc.c instead, where we cache the dsi bridge pointer. The

It's actually cached in rcar_du_encoder.c, but used in rcar_du_crtc.c.

If I understand right, you'd like to do the DSC detection in 
rcar_du_crtc, and skip the DSC, if needed, before calling 
rcar_mipi_dsi_pclk_enable()?

> question is how to then identify the right bridge, as we won't have
> access to rcar_mipi_dsi_bridge_ops. Should this driver set the bridge
> type field to DRM_MODE_CONNECTOR_DSI ?

I'm not sure how that would help. Or, I can, as the dsi driver does not 
set the bridge type, so only DSC would set it. But isn't that even more 
hacky?

Or did you rather mean that the DSI driver would set the bridge type, 
and DSC would not? We can then do:

		if (bridge->type != DRM_MODE_CONNECTOR_DSI)
			bridge = bridge->next_bridge;

in the crtc driver. This works. It's still a bit hacky, but I think the 
chances of the code getting it wrong are quite low. If the output port 
is RCAR_DU_OUTPUT_DSIx, then the next bridge must be rcar-dsi or 
rcar-dsc, so it's all under our control. Also, it's less code than this 
patch, so I'll go with that.

  Tomi


