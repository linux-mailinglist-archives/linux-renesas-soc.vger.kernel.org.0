Return-Path: <linux-renesas-soc+bounces-31034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCA9Cch61mnxFggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:56:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C43143BE979
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07C6930BA18B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 15:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6F83D75D5;
	Wed,  8 Apr 2026 15:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F647SVWx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C143D75C2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663063; cv=none; b=YbpD+9MhMsw4V3zN0G3wqKs1zFrbv5HqRDPCZHQrQEjknPWDYUgL2yAglxwbtTTwTJgfn2ltQdZC05HvVS5PqkXIiqOoxLB5sravKiaHwTtlfMqGRQ0Sj/J/pAkrLGwbsE+YhNnyQOSbD/b7mhYMSRQwsVqHzioETw/RxFELuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663063; c=relaxed/simple;
	bh=URJeaI8TxEuIPMKTAnk2URmZsVqW1FbMzYzVZ+sbVuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSlvObf1ayDcD1hKJOS97eJsZ65cZgsK5tCY6FZjRhjqEicL90rQ0Mkmffz5RpYc+8ntsDijNEpSVMRF3e9iCgQ8Y73aPBZaBS4TSZ4ogtM0z2eSk0/yXV7UjYi7VUIxKAYzb4fePO77MVSp28KoFggCLX0XSVEmAYHIoF/rDBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F647SVWx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AE08D4E42960;
	Wed,  8 Apr 2026 15:44:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B488603CB;
	Wed,  8 Apr 2026 15:44:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C50F3104500FE;
	Wed,  8 Apr 2026 17:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775663059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4EO/JE/FwVq0dU98Avlnkf4XMGjkvWX56jtayJxBDPc=;
	b=F647SVWxNQccNsBUe1ndY3QMSfrusQSw3UkSxpnohEADXhWn1093Dq3TCCqoY8KjCnS9/1
	jcZzy/OchX2V0TElb2GGEbt6btkGDQuxBNQVmBxtUMTSOOqqlj3c6EtrkNONrQNPD5v4TV
	0V1BCv0uHrycS1B47zX1nIwulJ2BsDhmEu4x+85wq8cEkXIKsk5nMPGK+Z84/h2iA496pe
	/qFHMCJvy0NUuLs05+X+fbrNitZt1EgKvQS21hPED5APEskf4lRxFz0X/g3QSKf3BwzSXP
	m5it+h1zO9eLVxTHnCO8zwHOV1IzsEfnfK710L5dcPrQXbLY4+mk7gD+nUKYsg==
Message-ID: <ed344175-3176-4677-98d9-172fd37ce194@bootlin.com>
Date: Wed, 8 Apr 2026 17:44:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/kmb/dsi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Linus Walleij <linusw@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
 <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-2-421781c8c061@bootlin.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-2-421781c8c061@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31034-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C43143BE979
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 18:27, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference.
> 
> This driver has global variables for the DSI host and DSI device, and code
> to allocate them on probe but no code to free them when on remove. So it
> does not at all support removal, and not even multiple instances. For this
> reason putting the reference would be pointless here.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/kmb/kmb_dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
> index aeb2f9f98f23..febca939bd01 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -251,7 +251,7 @@ int kmb_dsi_host_bridge_init(struct device *dev)
>   		return -EINVAL;
>   	}
>   	/* Locate drm bridge from the hdmi encoder DT node */
> -	adv_bridge = of_drm_find_bridge(encoder_node);
> +	adv_bridge = of_drm_find_and_get_bridge(encoder_node);
>   	of_node_put(dsi_out);
>   	of_node_put(encoder_node);
>   	if (!adv_bridge) {
> 


