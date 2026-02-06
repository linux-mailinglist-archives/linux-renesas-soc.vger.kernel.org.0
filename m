Return-Path: <linux-renesas-soc+bounces-27971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPgyMdqjhWmSEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 09:18:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BB9FB61B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 09:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39D973009382
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 08:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D609A30ACEE;
	Fri,  6 Feb 2026 08:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vIP5OAA3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF514348463
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365895; cv=none; b=UDpR1wJsgyyegFowS+VcZHFukKXPiHkKERjERZWejYHKk04L36shTBt1Yp3Eg9aXASb7I1lWHP6ozN/kkMcVWn3+O8bVf9A50MdWRzyKERBJjFekvFUQRUosXiPbIDlEsySa7yEn0uPniHth1CuvoLGJqUKGB/4VozXCObdtzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365895; c=relaxed/simple;
	bh=E9Je2RiCNi6N4lUYFc/4uUlQPtV42kSF5db8iOikCwo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uU6yGctsSshD+dMpXcWajTIq3RcLHMmYfIMJKWmI18U4vtJzp2zq0G1Vgz8sE4+mHNtop0RYOlLJcwZSs0iYAXJ8Zbx6BldZmZwl3sRjMCVbNtYPuDE7FjdML8xueCfBsAxZ9At2tezvDKDazvx1ZIac/7g3Mn9tF+zUHSGsifI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vIP5OAA3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C38D4E4243A;
	Fri,  6 Feb 2026 08:18:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC0AC60729;
	Fri,  6 Feb 2026 08:18:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08656119D051A;
	Fri,  6 Feb 2026 09:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770365891; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AxpqQFxfhLZTXkaSuFljytHXexdHWwvNyD5mMDCRNAE=;
	b=vIP5OAA30W+criFOKid1I9J/V5CfmKGcZ2/+M7Gi5giVop11T4ssqQhWqedQlwoVlTtXt9
	tCzDdgLku7NPn24r+Vwj4RHGW4e0QyNdn56Lv1IdzsQIBreUGRgMiozuErCoBUnHUqvCSA
	D4VP9Txor72S/Z2CmInvyBwLprMgGHse7VRRrn18BwBedlrBCZj1gidtBg8iW9jBXnGPRD
	rfI5J0fdsIwEK0FTmq0fE2PvzHleRfNnrKvwnlzh9IixgivdBJo/WYpgxmK/wFQ9M3WBbI
	oj8SSR0+WIGg0CRDvU8Rwf87PdKDX2xhS6wlWMxd0N84mSw2+lPOJ3zE7bF1xw==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 09:18:07 +0100
Message-Id: <DG7QBWUAL0WL.1VY49M9I8ZVH@bootlin.com>
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Register and attach our DSI
 device at probe
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260112234726.226092-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260112234726.226092-1-marek.vasut+renesas@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27971-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid,mailbox.org:email]
X-Rspamd-Queue-Id: 01BB9FB61B
X-Rspamd-Action: no action

Hello Marek,

On Tue Jan 13, 2026 at 12:47 AM CET, Marek Vasut wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Hadn't seen this patch initially, but it caught my attention now.

> Note that this is similar to e.g. commit
> 6ef7ee48765f ("drm/bridge: sn65dsi83: Register and attach our DSI device =
at probe")
> and pretty much what every other DSI-to-DPI bridge does.

Digression:

  Looking at 6ef7ee48765f, I now realize it has removed one obstacle to the
  DRM bridge hotplug which I'm working to achieve. For the interested,
  there would be one more issue in addition to those I discussed in [0]
  without that commit.

  [0] https://lore.kernel.org/lkml/DE2LCFM56Z2Y.2V9NIXP26QOM2@bootlin.com/

Back to your patch, I don't have the hardware but LGTM and I'm not aware of
any issues it might cause. Still it would be good if you could describe
what goes wrong with current code.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

