Return-Path: <linux-renesas-soc+bounces-34744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id facXMYSHS2oSUwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 12:46:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 167CD70F6EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 12:46:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="l/eOddAd";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F280638A1416
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 10:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DC242F714;
	Mon,  6 Jul 2026 09:45:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCB11CEAC2;
	Mon,  6 Jul 2026 09:45:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331131; cv=none; b=H27ib+Z3ETWGqVLEACXC0RLp9s7ZasjwhMo0BHwPnouhpvzdIn1bXBsMMDr8q3EGPUJ6VnHxLK/Ch8rwQL/WMBmL8osMAgeurh7WKdZz95sP1FDg1Dfq4tj76qfM5c2c0jEvR0ulQV+iS/pezbt4qj2Lf3K3zuPcyDIWVviiaTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331131; c=relaxed/simple;
	bh=M8pn+QlLLysMqwQcLRLoz0lnTqJieKWaHHlj88GmCQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0Wnc40/8YPIyLAT44nkbgmkU3555sMyp96DG/5zbT4inAiciAF2EJiNbVG0IhAA8cum+YWyCkBMid4jDLO42ftsj31K4vTt0nU7cP8ljDqyBvMyBWJEIBzGJAi561uGdOkdOwnu5ySixPB5yAiWixlNwrLB4ZlAlC3F5ZA75Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l/eOddAd; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32794524;
	Mon,  6 Jul 2026 11:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783331076;
	bh=M8pn+QlLLysMqwQcLRLoz0lnTqJieKWaHHlj88GmCQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/eOddAdOyPtNffoM9mczj3RP1ic6Gc38MwtOFPIqRqPlvgsz5EZ3KhnYEmFxlt4x
	 Erd5fCEETscm3HdL3RkU3IXF8ojzNtcr4Wb54IYIP/WHSRLfeu9t2EktMSK9ffVfcB
	 JXzIy1OGkvxejhGV8z5E1kNRrtzNjshDa0x3qWLA=
Date: Mon, 6 Jul 2026 12:45:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
Message-ID: <20260706094522.GA42740@killaraus.ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <20260706-capable-beaver-of-excellence-a3cf10@houat>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-capable-beaver-of-excellence-a3cf10@houat>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34744-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:thuan.nguyen-hong@banvien.com.vn,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,banvien.com.vn,linux.intel.com,suse.de,kernel.org,glider.be,gmail.com,intel.com,linaro.org,kwiboo.se,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 167CD70F6EF

Hi Maxime,

On Mon, Jul 06, 2026 at 10:52:32AM +0200, Maxime Ripard wrote:
> On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> > Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> > data over an I2C bus. The bus is also used to detect the presence of a
> > connected monitor by trying to read the EDID data.
> > 
> > Some devices where the VGA display is integrated in the device and
> > always connected do not connect the DDC pins. Some development boards,
> > such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
> > 
> > To support those, add the ability to provide hardcoded EDID data in the
> > device tree. This is mutually exclusive with specifying a DDC bus, and
> > can only be done when the VGA display is guaranteed to be always
> > connected.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> This feels redundant with the EDID firmware loading mechanism we have in
> KMS already. It should at least be mentioned why we would need to set it
> in the device tree at all.

Very good question.

I assume you're talking about CONFIG_DRM_LOAD_EDID_FIRMWARE, as the
debugfs override_edid feature isn't meant for production. If there are
other relevant mechanisms I'm not aware of, please let me know.

In the use case at hand, the VGA display is an integral part of the
device, the same way an LVDS or DSI panel would be. Using
CONFIG_DRM_LOAD_EDID_FIRMWARE, the manufacturer would need to set the
drm.edid_firmware command line parameter, and provide EDID as a file in
/lib/firmware/ (possibly in an initramfs). Beside the complexity, and
the fact it won't be very friendly to people who run a different
userspace on the device, I think EDID counts in this case as system
description, the same way we support specifying panel timings in device
tree.

Does this make sense ? If so, I'll update the commit message accordingly
in v2.

-- 
Regards,

Laurent Pinchart

