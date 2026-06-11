Return-Path: <linux-renesas-soc+bounces-33870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfswKT2jKmqVuAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 13:59:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F14DC671974
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 13:59:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=oQDbrg9V;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A3AF32C2DF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 11:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17C43CF956;
	Thu, 11 Jun 2026 11:57:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB7E3BF69C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 11:57:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179038; cv=none; b=OSliSQsgidy+YldVPJzHmGL/L7y8fhvJ9/F9qWCmOotT+1yP6UJNDiiFmToGjwC1DD8JKwdEvXjqa45CT6nyuO3RZ2nT84AX7lTwZ64Te9+lp/r9hzy1gYk9xGqOo3QEL8F2TQcYFsuHzkfoEjIk23waPrjG7L8haB7xwxiRLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179038; c=relaxed/simple;
	bh=GayVEXmjspQCJ2oKuic7KfnIc/ANvTHDE1M6PULQaTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEe1FTkFhre/XTKVt8d8G+m8oM/iiiRI5yQYadcMZn/BWEVaiQ3CdrzD1BZI9C5tRDT6+gn21jqxpgA4Tw1siE7bQdIxlAsJnZdbMys40F1wflXWVEM85KftKSNhLzKwBgC3FRMHzIxX+ZVJ8SDo7w2jnHOScZnNWPzBk2iPLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oQDbrg9V; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48A2F497;
	Thu, 11 Jun 2026 13:56:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781179003;
	bh=GayVEXmjspQCJ2oKuic7KfnIc/ANvTHDE1M6PULQaTU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oQDbrg9VRiflCx4NQDPol/QNPs421dw5QYBIOkR6UZ4k820yrSWkT/pWDJ/wasY9n
	 0w/DfxgU7MFVB2sB4RfczbIKzBOaq8JpIZklovpWkErcOFBT4kSSm9CEvCxeNehkNS
	 XhvrbpBPRSOQ1xyu51apoWO7ZuGYAMPV1gGu8kds=
Message-ID: <dc0b6669-c7b3-42a1-99fc-c7850ac69abe@ideasonboard.com>
Date: Thu, 11 Jun 2026 14:57:09 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rcar-du: Drop superfluous spaces after assignments
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33870-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[glider.be,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:mid,ideasonboard.com:from_mime,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F14DC671974

Hi,

On 04/05/2026 10:58, Geert Uytterhoeven wrote:
> There is no need for a double space after an assignment.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This started with two instances, and got copied each time support for
> a new SoC was added...
> ---
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Thanks, I'll push to drm-misc-next.

  Tomi


