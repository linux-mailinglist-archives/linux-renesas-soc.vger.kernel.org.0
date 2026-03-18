Return-Path: <linux-renesas-soc+bounces-29803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO8cMg/oumkpdAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:59:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3ED2C0D68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 673E73169537
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3690C3128D4;
	Wed, 18 Mar 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LbzlFJ8X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6159C33AD8B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773852244; cv=none; b=hOStAXO6hEGiQTKtKOcgLzVSSeO5TDrR8ZnDkV+gQaJp5yOxsUcvDu66k8PUpYo+TJA9vQqrsW7YXvK45/zQCUJ1O0aLjNAAEkzlqwzdO7GELYMckRQF8ISV++0f1HnB9O59QZ+eqsIBa5w0CUSE/rHExgE8dLLkEqNxdg5lr1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773852244; c=relaxed/simple;
	bh=QB7asd5yne/ZDHleXh7tw2aGOGvdw7upoCqJaRQfnOI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=rhG7CEDH2SrkEboEYx4iBKi4f9zL5zYWApy/q4h0MUe1cbEMR97FaqY25CtRk1Sg9hDzZLCVItak+mBBQZ7gqYnpkWRYnRrHYVVjShRqclhAxrVCskoHPIuO+FHViHR1kl/3z8nLe8/97DI7tYKmA3iv6wrg9zidW8ZKpwUX3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LbzlFJ8X; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9BA4C5506C;
	Wed, 18 Mar 2026 16:44:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E5DF60050;
	Wed, 18 Mar 2026 16:43:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B44910450554;
	Wed, 18 Mar 2026 17:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773852237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFyWujQcWcLidxUL7ayZ4mliS2DvOdnHo4P290V1PlY=;
	b=LbzlFJ8Xhnh2KuQsoQmi3aaoY9HXy6iACQFSPY0M7LdYUGJdmCQCLv10Eoi200HO7NDuEY
	xzvatxldLpDNQqXbNB9BlLecEr07ff3KgqTauporTxAamodTt3BOqIliu6vjlhjIVrn7Mc
	bhUcQkUPHW+6e/DjVuzEMZo6NvOpF7d1C9AsSEHOzQPH0GhQuf6S89s4cGqlup+xawyfyP
	bE4EmbOUnKq94MeWYtcRYCSEADmF+SVbCqGw4kJkacRo+C2a2gP/Xv/Vum3su4qr0haFVU
	wBdp8yIzVMTfDs46XCAmFLqirw7dSyn+tdvYX9z+wpcSwYZKvN6yrOf/s3IkQg==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 17:43:50 +0100
Message-Id: <DH624WYWKT14.5TSCJXZPVN0T@bootlin.com>
Cc: "Biju Das" <biju.das.jz@bp.renesas.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Anitha
 Chrisanthus" <anitha.chrisanthus@intel.com>, "Linus Walleij"
 <linusw@kernel.org>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 3/4] drm: rcar-du: encoder: convert to
 of_drm_find_and_get_bridge()
X-Mailer: aerc 0.20.1
References: <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-0-10f502520357@bootlin.com> <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-3-10f502520357@bootlin.com> <20260318152533.GA633439@killaraus.ideasonboard.com>
In-Reply-To: <20260318152533.GA633439@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
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
	TAGGED_FROM(0.00)[bounces-29803-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	NEURAL_HAM(-0.00)[-0.977];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:email,bootlin.com:url]
X-Rspamd-Queue-Id: CE3ED2C0D68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Wed Mar 18, 2026 at 4:25 PM CET, Laurent Pinchart wrote:
> Hi Luca,
>
> Thank you for the patch.
>
> On Wed, Mar 18, 2026 at 10:39:37AM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> We need to handle the two cases: when a panel_bridge is added and when i=
t
>> isn't. So:
>>
>>  * in the 'else' case a panel_bridge is not added and bridge is found: u=
se
>>    of_drm_find_and_get_bridge() to get a reference to the found bridge
>>  * in the 'then' case a panel_bridge is found using a devm function whic=
h
>>    already takes a refcount and will put it on removal, but we need to t=
ake
>>    another so the following code in this function always get exactly one
>>    reference that it needs to put
>>
>> In order to put the reference, add the needed drm_bridge_put() calls in =
the
>> existing cleanup function.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 28 ++++++++++++++++=
++-----
>>  drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
>>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
>>  3 files changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers=
/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
>> index 7ecec7b04a8d..5789fc75092f 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
>> @@ -51,7 +51,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>>  {
>>  	struct rcar_du_encoder *renc;
>>  	struct drm_connector *connector;
>> -	struct drm_bridge *bridge;
>> +	struct drm_bridge *bridge __free(drm_bridge_put) =3D NULL;
>>  	int ret;
>>
>>  	/*
>> @@ -69,20 +69,26 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu=
,
>>
>>  		bridge =3D devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>>  							 DRM_MODE_CONNECTOR_DPI);
>> -		if (IS_ERR(bridge))
>> -			return PTR_ERR(bridge);
>> +		if (IS_ERR(bridge)) {
>> +			// Inhibit the cleanup action on an ERR_PTR
>
> C-style comments.

OK

> Shouldn't drm_bridge_put() be extended to be a no-op when called on an
> ERR_PTR ?

Uhm, maybe, even though I think I haven't encountered many cases like this
where this was troublesome, and all those I can remember are related to
panel_bridge functions that are meant to be reworked.

Also, drm_bridge_put() deliberately mimicks of_node_put() which also checks
for NULL but not for IS_ERR.

Maxime, your opinion about Laurent's suggestion?

>> +			ret =3D PTR_ERR(bridge);
>> +			bridge =3D NULL;
>> +			return ret;
>> +		}
>> +
>
> A comment here would be good.
>
> 		/*
> 		 * The reference taken by devm_drm_panel_bridge_add_typed() is
> 		 * released automatically. Take a second one for the __free()
> 		 * when this function will return.
> 		 */

Sure, makes sense. I'll add one to other patches of this series where
relevant.

>
>> +		drm_bridge_get(bridge);
>>  	} else {
>> -		bridge =3D of_drm_find_bridge(enc_node);
>> +		bridge =3D of_drm_find_and_get_bridge(enc_node);
>>  		if (!bridge)
>>  			return -EPROBE_DEFER;
>>
>>  		if (output =3D=3D RCAR_DU_OUTPUT_LVDS0 ||
>>  		    output =3D=3D RCAR_DU_OUTPUT_LVDS1)
>> -			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] =3D bridge;
>> +			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] =3D drm_bridge_get(bridge)=
;
>
> Line wrap.

I wish the 80-VS-100 policy were clear and valid for all the kernel. But no
big deal here, and you maintain this driver, so I'll split.

> I have tested the patch and it seems to behave fine.

thanks for reviewing and testing!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

