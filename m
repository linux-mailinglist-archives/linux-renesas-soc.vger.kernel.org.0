Return-Path: <linux-renesas-soc+bounces-31047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDFyIvOS1mmiGQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 19:40:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2463BFB61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 19:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F76C302C900
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 17:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D853D7D8C;
	Wed,  8 Apr 2026 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JuriSJgw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523F3D669E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669955; cv=none; b=Uxq6GiRF3XKmnEwuZXG0HlzTmQmL54/4fL4C4uhYqpP/mbY52FohjWUIYpQ4HmFYEVw4gike6wzi8EvGc7RWxgIIt1ZUjPobIC/0Ygc//IwoomCnVVs13/OYJ9axr/252rMHhou4YdUWrThVOgyOKZ2UWXoI94jWIl1SCj4feHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669955; c=relaxed/simple;
	bh=Nsc35/RMCTbxADws9df6lAP8GtBXp8OXB5FR1wkvgkQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=trVjcZqjMNjjsVj0+/pAphfCsM+MkT54W/b/D/SPrle05i47y8Xvvi0APzMCkVUOMYSHcDJuWHUaAvtmTnUgWgkS7ixoLQLv3DmxTWACLEcYB87Cu3GrUZjCANT4SueGhu/MHztHmdATnGOrRs/xp/P3sF8//1RSS7DDlgTTxNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JuriSJgw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE6ADC5AAA8;
	Wed,  8 Apr 2026 17:39:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EEE6603CE;
	Wed,  8 Apr 2026 17:39:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0E60104500F3;
	Wed,  8 Apr 2026 19:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775669950; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o1r78Oe7IhroDVFua4r3F62SWxavC2jpM81v5Mz3foQ=;
	b=JuriSJgw9+8ml1Ogw2VVzBdYD2DmSJIGpR4sQs5SbqIAJTjKGCJhxw6uOoEhQXtN+Bz4l5
	N+cizsNqX4Div0NMZPHQYwPbGdkHUj90rtPc6poxq7/Z6519e7hDBPzii/4mSFyyga1x8Y
	KfBfE5R9S52FLbiJIypjTjiOljb6S/SMvhOrMcdua7qfzK7LNtyA13LnOBIxCmeQfMLynY
	moVbo2sSvGrsuhNs9LhAU9G4PbI1ZP/nwYXpNQDfLc/gFzxUcLcY/0h7vCVh+L5O+tVRjp
	g5xDgxfWGtPyGQOu2I2VI69EXsprVy0Oqk+502RRH6VpRUkcDVk5jsQoWi4fag==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 19:39:03 +0200
Message-Id: <DHNYGMWPQWLM.3OBWO5G9NPWK5@bootlin.com>
Subject: Re: [PATCH v4 1/4] drm: renesas: rz-du: rzg2l_du_encoder: convert
 to of_drm_find_and_get_bridge()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Biju Das"
 <biju.das.jz@bp.renesas.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Anitha
 Chrisanthus" <anitha.chrisanthus@intel.com>, "Linus Walleij"
 <linusw@kernel.org>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com> <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-1-421781c8c061@bootlin.com> <a3c30888-9818-4355-9d09-5398172cd698@bootlin.com>
In-Reply-To: <a3c30888-9818-4355-9d09-5398172cd698@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31047-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:email,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE2463BFB61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Louis,

On Wed Apr 8, 2026 at 5:44 PM CEST, Louis Chauvet wrote:

>> @@ -83,10 +83,21 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *r=
cdu,
>>
>>   		bridge =3D devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>>   							 DRM_MODE_CONNECTOR_DPI);
>> -		if (IS_ERR(bridge))
>> -			return PTR_ERR(bridge);
>> +		if (IS_ERR(bridge)) {
>> +			// Inhibit the cleanup action on an ERR_PTR
>> +			ret =3D PTR_ERR(bridge);
>> +			bridge =3D NULL;
>> +			return ret;
>> +		}
>
> Can't you use
> https://elixir.bootlin.com/linux/v6.19.11/source/include/linux/cleanup.h#=
L230?
>
> return PTR_ERR(no_free_ptr(bridge));

Ah, nice cleanup indeed! However, being this patch already reviewed ans
tested, I'll postpone this cleanup to a later series.

> With or without this modification:
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

