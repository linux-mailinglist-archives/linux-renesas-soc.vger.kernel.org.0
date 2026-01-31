Return-Path: <linux-renesas-soc+bounces-27740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MLLFGQffmmhVwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 16:27:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77CC2AE6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 16:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0E3F300B07D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 15:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602A72D97B4;
	Sat, 31 Jan 2026 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BAMZMV9m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E930F54A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Jan 2026 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769873249; cv=none; b=o6uS98HnRMS4odrJr31qSSNMA4RpGM6tULzF8jFMbwY9ym/HWvqWmvHbxo2wf8lrdVsJ/6FiMUoKWY9u+rzCOkz8k23XCk6bOqDsrl5g/tAOml4oWXZYLng7XKQvvXADgEOYjYYBDaDPmTu1BTIGMRO7Rkh4uaVIHrJ1AH5qTYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769873249; c=relaxed/simple;
	bh=qtpmDsq3ytg4fhtKS3sLcNy2RBrYqbbzW5k5P5GOj2g=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=MlD7Yk+z5/C8EUKIT6w1bT1Yya35y57v0uVaXfs96z3ogbDZuH/sSwmwU5ALI2gicYM+yYPWKcXMGBWVkavsRrcM/jErt8H0v06SbDxBL5EWIYBv5uJIXI4KULJ47nARte40ihdY1eUEHM2MTLtfgG97kFb79u8j3u/Km4oTW74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BAMZMV9m; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 475CB1A2B5D;
	Sat, 31 Jan 2026 15:27:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B789606B6;
	Sat, 31 Jan 2026 15:27:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC896119A888D;
	Sat, 31 Jan 2026 16:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769873245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1BjwHKdIR0J3wfWhl7U6iKJkPH13bu7eeuse87r/j0w=;
	b=BAMZMV9mXKRYc3CwqSdirB45ZqkRodmw8anrVG1dtlflolsGttLuabyAEkYaiasbV8+dbH
	9vfIa1LFOWX+PVOrnvjZsEgFEkNS5vOY8YvpfoSVFM4v356maVJsYYGlwoiWCm0dPQPtNe
	WOdyn8mo1/mL3dYWGWvcRJdkCGNIGJMMeotKO+/OHi/4VWkS0GoXg9wAAN9Ie8SO+7S3Pb
	FbncBPqnyMwLRZdm99kTAB+mtyMc5zQQ+0G/AZ8Ycbyg/pOzKkj+ZOjPinkfy8pvhshK+U
	Iz7Y7UUT6u22Ez8olLUjgWmhcnQbuwfo/6a81GM9XxlUqAIKNKoqMOI6+fBatg==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 16:27:19 +0100
Message-Id: <DG2VP9N60DMK.30G4A13VNX7CA@bootlin.com>
To: "Linus Walleij" <linusw@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 4/6] drm/mcde: dsi: convert to
 of_drm_find_and_get_bridge()
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
X-Mailer: aerc 0.20.1
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com> <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-4-e34b38f50d27@bootlin.com> <CAD++jLmriwfBaMKGP=-pOZyCnHZt78RKKURmOXuyNSTZz5geWQ@mail.gmail.com>
In-Reply-To: <CAD++jLmriwfBaMKGP=-pOZyCnHZt78RKKURmOXuyNSTZz5geWQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-27740-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: CA77CC2AE6
X-Rspamd-Action: no action

Hello Linus,

On Mon Jan 19, 2026 at 9:57 AM CET, Linus Walleij wrote:
> On Fri, Jan 16, 2026 at 6:33=E2=80=AFPM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> We need to handle the two cases: when a panel is found and when it isn't=
,
>> even though the latter is not supported. So:
>>
>>  * in case a panel is not found and bridge is, get a reference to the
>>    found bridge
>>  * in case a panel is found, get a reference to the panel_bridge when it
>>    is added, so the following code always get exactly one reference that
>>    it needs to put
>>
>> Finally, use the next_bridge pointer in struct drm_bridge in order to
>> simplify putting the reference.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> I do not understand the change as a whole but the approach
> looks sane so:
> Acked-by: Linus Walleij <linusw@kernel.org>

Thanks!

However I'm not adding your A-by to v2. The change you suggested to patch 3
(break instead of warn) made the drm_bridge_put() call in this patch
unnecessary, so I dropped it for v2, making this patch slightly different.

I hope you'll Ack v2 too. :)

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

