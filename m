Return-Path: <linux-renesas-soc+bounces-28704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Lz6NtXhpmkPYQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:27:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0541F0336
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 171143028C02
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5624266AA;
	Tue,  3 Mar 2026 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ooLRfBca"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4DD34C9A3;
	Tue,  3 Mar 2026 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544300; cv=none; b=GTqsWfBb5179xnx5IwDNHn3ZnZE7kvUDU6YdEDx2XRKLGJKu9wJBdVUbBXoiUIZw5JA94b+tIZvsTnNqyQmq8KY/riPUV5SAY2GYCU25r788zaeAmwQuzp8w9SFVfZoXUXHheb/ycrzdp94QuoDp0d6Mhg0lIl9uJ29QV6ZJXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544300; c=relaxed/simple;
	bh=5STwc6cUJfY8nE7pmW+Lf4c/Xiu43vKMcApjGm70axo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=W3EvLw02dWA+H9a/G/sCBixh01eU8X++08z47WmISAiPsPRzb5vYCD3nDhzeFzigrxPl0uRhtToN8Az+jtKVva2zqtF4BNgQEqFSIsGhYKBZQn4WK2Ld5BnsMdPehTpt+zH5Sa03qNOtYqdHyr3J6ohszoJHUEhMAzWySXTLqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ooLRfBca; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 802DF4E424FD;
	Tue,  3 Mar 2026 13:24:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50D485FF29;
	Tue,  3 Mar 2026 13:24:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22F32103696DB;
	Tue,  3 Mar 2026 14:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772544294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5STwc6cUJfY8nE7pmW+Lf4c/Xiu43vKMcApjGm70axo=;
	b=ooLRfBcajd9cL6yYEnGnl1Gd8OAE3AX4PMSf0W8JSAn9x19kM0is3wHX5ap9LCPF7SUnxp
	thW6p7BWWWB0LDA1Um7FuB5dvRAnCas3bCgUZeeoBNwPtroDZ/4Jx82tWiBptwJuROjyuf
	8lb5qCcuS3hl4hKxyqSKWIDYHn4ji3TGZQXDQH74zjL23HBiWAr3QJiRi53IGL+9nshmXj
	vPi1kUtULaSCr6K2kxsWiro/IflKdaOuOrfIAZX2Nom7qhngI4BspHzrV/wfp67ZYDYfOB
	fXTnVzLODhWAZlA2ahoryCa+8JI4vfhNRJnH99Pj7zj8FfxoXrSpvAq0eB7xcw==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 14:24:32 +0100
Message-Id: <DGT6I5G4ETM3.2T5C2XO2XHDAW@bootlin.com>
Cc: "Joseph Guo" <qijian.guo@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Conor Dooley" <conor+dt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Simona Vetter"
 <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
X-Mailer: aerc 0.20.1
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: BC0541F0336
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28704-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,intel.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid,nxp.com:email,mailbox.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu Jan 15, 2026 at 3:39 AM CET, Marek Vasut wrote:
> Parse the data lane count out of DT. Limit the supported data lanes
> to 1..4 which is the maximum available DSI pairs on the connector of
> any known panels which may use this bridge. Internally, this bridge
> is an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>
> To avoid any breakage on old DTs where the parsing of data lanes from
> DT may fail, fall back to the original hard-coded value of 2 lanes and
> warn user.
>
> The lane configuration is preconfigured in the bridge for each of the
> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
> others seem to use 2-lane configuration. This is a hardware property,
> so the actual count should come from DT.
>
> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

