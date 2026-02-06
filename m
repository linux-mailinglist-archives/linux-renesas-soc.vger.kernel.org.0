Return-Path: <linux-renesas-soc+bounces-28007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BvaAAv9hWnUIwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 15:39:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E60FF11A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 15:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F6A3303AB40
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 14:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C083241325D;
	Fri,  6 Feb 2026 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O4/OYyMQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062AE35E521;
	Fri,  6 Feb 2026 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770388460; cv=none; b=BBF9VvgpmIPesz6rZRVGz1FyKhiqFuvkCzUltumjCrSfQlfiNB+MuraJcLMWb2W2uRnCnS92RS6RT3qmpsEAHSbehkyVwIUXxtXp7QikG2RAXPaYe/kqiaGprAau1b4Mwa6Nnk7Sfio/m6VfrKS8ONSffkq536PKQrMvceShHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770388460; c=relaxed/simple;
	bh=pWehA4hT35e5zQo3sOZ6upZVBGc9CyStGxGRYaeYtv4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=rAILqZiSe6tS0/urrn6BSXfg4ZP9WxtiBMnb2B4NfBiQk+zJ4QPmQRLVJqz/5v7hPEnaX1DK65RVJuwQ7/QUr2MvXV9YAOSGpRuyyeh39cCaGnJ2in4S+Vnrhc0WpZYYTaW3fqo/oDvqAwiaf31Q9M0IYzDJ69XcCRR/GgxgcNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O4/OYyMQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 854E01A2C5A;
	Fri,  6 Feb 2026 14:34:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5448260729;
	Fri,  6 Feb 2026 14:34:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5C85119D1E5B;
	Fri,  6 Feb 2026 15:34:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770388457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pWehA4hT35e5zQo3sOZ6upZVBGc9CyStGxGRYaeYtv4=;
	b=O4/OYyMQs02b9A3liRCnH3WTzei8KU+iCKdrKk5eipa++AiDshSrEqUyFzNNbXDKI0ZZGq
	1e2EuX5PmCNKwzTqs3tbZNBFvsMZ03KLxOsqGsKtJ/OUPB1RlMs9bjNVryF5VpjnSHK2tZ
	mfhuskJp2qkd+bNOhAq4HgTjs5q9hN1Zkf7JLk0CN+nNBkgTxiol6Af3NCj5hFIID5V+ds
	iDVmHhE4xma9LQNUy67QLosUJDLSolsJZC15dtK6D17uBdyYW2bkJ/yZxV5eYO31BNr31C
	1rTR8qFBMunDKrtPzj19GOeU5eWz+ig5f8L+jEkZkxHYSXm/Jpqfklq58MRz8A==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 15:34:13 +0100
Message-Id: <DG7YBVU2COFT.2JP8PKR4ZAKFT@bootlin.com>
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
Subject: Re: [PATCH v2] drm/bridge: waveshare-dsi: Register and attach our
 DSI device at probe
X-Mailer: aerc 0.20.1
References: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28007-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid,mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 55E60FF11A
X-Rspamd-Action: no action

Hi Marek,

On Fri Feb 6, 2026 at 1:57 PM CET, Marek Vasut wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time.
>
> Besides solving the probe ordering problems, this makes the bridge work
> with R-Car DU. The R-Car DU will attempt to locate the DSI host bridge in
> its own rcar_du_probe()->rcar_du_modeset_init()->rcar_du_encoder_init()
> by calling of_drm_find_bridge() which calls of_drm_find_and_get_bridge()
> and iterates over bridge_list to locate the DSI host bridge.
>
> However, unless the WS driver calls mipi_dsi_attach() in probe(), the
> DSI host bridge .attach callback rcar_mipi_dsi_host_attach() is not
> called and the DSI host bridge is not added into bridge_list. Therefore
> the of_drm_find_and_get_bridge() called from du_probe() will never find
> the DSI host bridge and probe will indefinitelly fail with -EPROBE_DEFER.
>
> The circular dependency here is, that if rcar_du_encoder_init() would
> manage to find the DSI host bridge, it would call the WS driver .attach
> callback ws_bridge_bridge_attach(), but this is too late and can never
> happen. This change avoids the circular dependency.
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the very clear description! R-by confirmed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

