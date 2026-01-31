Return-Path: <linux-renesas-soc+bounces-27739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAuLHkAffmmhVwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 16:26:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC202C2AC9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 16:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7400E3007F69
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 15:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38DF24A049;
	Sat, 31 Jan 2026 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rhT4ppLl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60DD2D97B4
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Jan 2026 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769873213; cv=none; b=RjqJbu9GaiaPqPQaV9v8Nxd5toJE8Ge25vGIrobrzuqud4cyoGOvxIq1hQ5YBPrBRKLWBv29WarvKqlxcvFd0mQr3gLkGyTUFw/9+GnM8xDhepxC3T7iLIM7ZiAKtB6I9LRAUpk7s7h2h5ZsqZzdKd1P5CDbNb21UZFvHJk5dDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769873213; c=relaxed/simple;
	bh=ME7pHoAEju0N5k3+ETPtM4gKEW2g2cPy/BmUFwMt/O8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=DXaPgskGpFCb5Q2ZJCp5aCFIGPjUAXk5RSYWZfbKstpFlYFNFckGQLVknD3u3wmW3mOlF7Tx0YoSG9Wdeh6/GCLUMRX0hD4+IApZx6HitCevEETIz5eClsu60nTu0NnFLoXC1L9IYpHcj3+C1A/Hj22Azm9UZysiDVa5VNqEnKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rhT4ppLl; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A7D3BC22F7E;
	Sat, 31 Jan 2026 15:26:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D500606B6;
	Sat, 31 Jan 2026 15:26:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA38E119A888D;
	Sat, 31 Jan 2026 16:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769873208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ME7pHoAEju0N5k3+ETPtM4gKEW2g2cPy/BmUFwMt/O8=;
	b=rhT4ppLlvuL1J9Kf8r7xznmQzhilwixZsftabPADKpgNziIFhRf5dGM24UjxSmrMSKB80S
	8YZfm0bOiZ+WAiBncHrw5S5PDyTCunMm8DsxauDXmvQCE2lgoATY1zde9Q6bMo/+cGZulQ
	gzkgT8EPrtZIWuS84S2/BJVmT7Yp1FJLGto14iGUUi6gyYYCnOiKwN42g1BniGKCIeRxMz
	t1A2UL1ODeFngNaqd7MROKzZCO9j3K6UFvstH23Q/sj1n1zEZWp8FSz8wCuWQ8apz6rRL+
	NVGFuiQ5GQu2+zs7jl+xs13nJqpRR7xQNKKdNo4R7X8IjsZ+4HwdocyoMKtNLA==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 16:26:37 +0100
Message-Id: <DG2VOQLW9RYT.181HW9ZI8HHOR@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/6] drm/mcde: dsi: warn in case of multiple subnodes
Cc: "Biju Das" <biju.das.jz@bp.renesas.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Anitha
 Chrisanthus" <anitha.chrisanthus@intel.com>, "Edmund Dea"
 <edmund.j.dea@intel.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.20.1
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com> <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-3-e34b38f50d27@bootlin.com> <CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com>
In-Reply-To: <CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27739-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC202C2AC9
X-Rspamd-Action: no action

Hello Linus,

On Mon Jan 19, 2026 at 9:54 AM CET, Linus Walleij wrote:
> On Fri, Jan 16, 2026 at 6:33=E2=80=AFPM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>
>> mcde_dsi_bind() has a loop over all subnodes looking for a panel, but do=
es
>> not exit when a match is found and only stores the last match. However t=
his
>> will be problematic when introducing refcounting on the struct drm_devic=
e
>> pointer in a following commit, because of_drm_find_and_get_bridge() woul=
d
>> get a reference to multiple bridges.
>>
>> Assuming there is no real reason for looking for multiple panels, add a
>> warning so it gets noticed in case the assumption is wrong.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> ---
>>
>> I think the correct thing to do would be adding a break statement when
>> there is a match. However I don't have knowledge of this driver and the
>> hardware, thus this patch is a prudential alternative, not changing the
>> behaviour.
>
> Go ahead and insert a break when the panel is found, there is
> no MCDE-attached device with more than one panel.
>
> There *exist* the Samsung Gavini device which has a
> LED panel, *and* the same lines attached to a mini-projector
> so these two can be used at the same time. I have no idea
> how to actually deal with that if someone one day want to
> support it. Probably by putting the projector as a side thing
> and not deal with the video stream in the device tree.

Thanks for sharing these info! I'm very happy to know I can break instead
of warning here. Change queued for v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

