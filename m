Return-Path: <linux-renesas-soc+bounces-29471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IL9BK7ot2mzWwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 12:25:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E9298A29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 12:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E538C3004C5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 11:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4681F2848BE;
	Mon, 16 Mar 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yQc/dk0+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1AB1A9FBA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660156; cv=none; b=iQ+FoNVJgggt3VfJN/uk2nOjHxxC68JHxNzMbULJfN6kQVMfQzN0FD/9RB5/YYWGyP6QHry7AZVhMOuC37kzEaJU1SWcsjhGFrH4g3+3Rv8KltDRgTIjDHRW2AtKhk0JxRzH/MzBDlvplIrDi55pquK1piYzk3/DoLdetzuVaM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660156; c=relaxed/simple;
	bh=Vq342JcV2FeiEZGDKh1ajgkGt8udEwhu3JEGM5ZjURY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=plsQq3c+TGbjttoMJSM/MimT0Yb8Fmwl/m94Al9R10QNNqMjaII5FVhd7C0am6ZjZEVwtXUlS4bNtnBmd7GLIeUyQ1tczpwVPJ2S46cI9x9mb8cEpJMmyDzmH1g4wtMjzqtjggel41VX8j0UVBhM/UDwufDTjUQVkqcry6Po/34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yQc/dk0+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7413D1A2DFB;
	Mon, 16 Mar 2026 11:22:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C30A5FC4A;
	Mon, 16 Mar 2026 11:22:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4286D10368682;
	Mon, 16 Mar 2026 12:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773660151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vq342JcV2FeiEZGDKh1ajgkGt8udEwhu3JEGM5ZjURY=;
	b=yQc/dk0+Fu7bj8MfrlBwp/h6g+7/hV5V3WXjYAWG03UjSveuXfsS8tABdGLhOQPc8ZX6Go
	vlty2OFtxCGIX12PpXxv5eZrDFKMJ7ImgfILM7HHfeXZxFPtzSuXE3CK3CzesgaHGS67PR
	aH71cQ/JHIK4N+6TzQRkoIBwpViQ9o8vxy+wKG8i1Mx0K5TJTH5AqF8JEX62bDl3u49JBO
	dne0FH1JNaCJ8mg8kmCQP4IWckTuf20v9ZhCoU2pMDp+xy9+GtVkypkdxbpgJ8sMpOzfGj
	H32RLx2aeURiL73s1r5auIw8l1pprDegurU3ynzLKHCFyebXKShKzUMLT3cKLg==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 12:22:23 +0100
Message-Id: <DH461P9VAQXP.19TV6E01YQMS9@bootlin.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Cc: "Biju Das" <biju.das.jz@bp.renesas.com>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Tommaso Merciai"
 <tommaso.merciai.xr@bp.renesas.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Douglas Anderson" <dianders@chromium.org>, "Jesse Van Gavere"
 <jesseevg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Prabhakar Mahadev Lad"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-renesas-soc@vger.kernel.org>
To: "Biju" <biju.das.au@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29471-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,oss.qualcomm.com,rock-chips.com,chromium.org,lists.freedesktop.org,vger.kernel.org,glider.be];
	RCPT_COUNT_TWELVE(0.00)[23];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:email,bootlin.com:url,renesas.com:email]
X-Rspamd-Queue-Id: 754E9298A29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Dec 19, 2025 at 11:46 AM CET, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> On RZ/G3E SMARC EVK using PSCI, s2ram powers down the SoC. Testing ADV753=
5
> IRQ configured as edge-triggered interrupt on RZ/G3E SMARC EVK shows that
> it is missing HPD IRQ during system resume, as the status change occurs
> before the IRQ/pincontrol resume. Once the status bit is set, there won't
> be any further IRQ unless the status bit is cleared.
>
> Clear any pending HPD IRQs before powering on the ADV7535 device to
> deliver HPD interrupts after resume().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

