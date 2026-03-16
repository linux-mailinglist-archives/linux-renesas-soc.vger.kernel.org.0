Return-Path: <linux-renesas-soc+bounces-29507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJl1OFUnuGnhZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:52:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA829CCA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37DE53041A5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288B33A4528;
	Mon, 16 Mar 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIp015W9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6104C3A4F25
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676067; cv=none; b=L5bQCCtq+QJHoNQXAUYHXY6elyF8+lrdcDyL/X67JrjoW/eR0eLkV2Q+hykBQzPmyNrkm3C9MtJO0A+lNLHQbDyqzsceIFJXnd2OYoFx8GfnfJbnIS2IgW7/lh1L2ThxBXy7v9uxS1Mo5RW6BXOiJX2vY7U4DbYWNvoGVDk8fzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676067; c=relaxed/simple;
	bh=mt7njM8AMm3366rY9bZXkt/iQj9L9Y+U9ts2fzBUnT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+zAv87hcUN44qFd5uQ3RL0UMwo0XAIPKhOsvcqlYGLFOHG6bkfSR43Tja/RMBYCzf2g4ZSKR9R1pwvm5ZZ1wrtSyrZU7ShOu2J0fJcWf1QiwlnSgSiM9mMlgme80q1brnbrc73rsPp6mTZf8Vq0089iFx/G61AILg8zmHyDqWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIp015W9; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2beab594d8eso6934322eec.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773676064; x=1774280864; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIbl9qFxJrmkiuonu3RjguYUay2gXS+vKFLd6XX8oOc=;
        b=LIp015W9YoJTicgjk8ovsupZRgmsJQjS/JWd+D3F2zRM8dRflWQ9O8pcbzHALWr6ay
         9cQF+ZcnVTSrsFqHkIIHNFqWfZaEq+1lgy4XIbG6ieETcUgYajTiN4QvZh2gaT3qucd1
         Zg4H3IUGbStHSpwJPOJLvOHPdeSScVPe6T+wSdv4BbLUcLgpGd9yzKuMFr7BhgbrKOSQ
         NH/CGbu2DnWSeBqhTQnok+jjBh6NuXn7lnBMsNk5bp+JwKbGPddB69ZM5hIGyYZyF3fM
         5nwh/APwOD+TjBxorMJ++ysRR9ltIxDKNlrjea7DuZtZcquUMscD4y+bJg7qqjc2QWxu
         h0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676064; x=1774280864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIbl9qFxJrmkiuonu3RjguYUay2gXS+vKFLd6XX8oOc=;
        b=YB80jY4J4KGaVMiXrLQRUUgFDKov+p/cYZmVCJUfBd019VYb2o5KB03AxfLApUA3Kf
         ox8RGwI/w4f0LWKcj2/Ivz8B2/nqiAcOKjKI/xOhPh6UJMZOnZ07xp9nOUkdMz9daABJ
         faHp3WgJOUhRUVevgkn+r2i0f4WKed4O0+Ak48zCJxQHxBjF673RMX3lEMYD4IKPBffn
         MnncSwGjt6HydSecze1/Rd6cSNVt5rDSINJClHPdTaoRLP0Vmdj1NjAmULHgXh+xShL9
         K5+H9s9hXkMaEbqqXt0WaKmUw/c7XS/OaHjxTpW86MUod5V0vJjP0sqWEZ45g9JchMB3
         tuow==
X-Forwarded-Encrypted: i=1; AJvYcCVDMET8QYtK2dHt/iMGqVRWVQFJZ+qAnR8z3mucq5PxdGDaB6pa7ohgeMxqqq+Kl+2DthBlOxyf87px9vtlkLu+jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+p84wYPdeWIahyzIXtGfkBArFbSFN9PLXLPk6Dmg8Lmcvbjj
	7QFiUTOXlINu2IV0m8dNGA/fVKXlKHd00PocTfsFofbRSb00ivOYr+6j
X-Gm-Gg: ATEYQzwwjt4A7buktBvqGNzZkYnr39/mYwmbqLQDBJfPllcv+3/NZJGKzPAFFpIsCZm
	gV9+kCwWiVJoyFikLjEF8tyiwha3SgKqlGqeSat2oUaa6EfKP1zaqywFnGu5TZ4wIG0zR1yarhE
	MIixYkopJVfBPE7SUfPB9WPSaRuxIJkRdzSKBxzrqyX4P8bOwwiozBPZ2ugsiwQpo9b6Jsh/b9y
	gYiPJy3aVLfbFNYnlMsbOJW65YyhOe6SxsAwo3EleGhXV9CkXkKm3uLJwgSilQ45UXBoSbdTfY5
	W+ajvypB0sFynBNNslsn3e3vmcAxQqVEsusjxPd37Ut6jr2gHXuPVhRmDVJZY3+v1vPr9Sutpzy
	PkpbQ2nG5V56OgevCa9L5kFZyJfzA0hQeVWwB2VdAlY1qgKR5siETMm7TC0y0S26MudbLoCHIQ2
	JLOWq8PhZIGKgLNvg+oN8DMKd6rkcf1eCc2C4z
X-Received: by 2002:a05:7300:c9e:b0:2ba:6b03:909b with SMTP id 5a478bee46e88-2bea558f037mr6495235eec.19.1773676064417;
        Mon, 16 Mar 2026 08:47:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0b1fc876csm9911380eec.29.2026.03.16.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:47:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Mar 2026 08:47:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com
Subject: Re: [PATCH 1/2] hwmon/pmbus: (isl68137) Add support for Renesas
 RAA228942 and RAA228943
Message-ID: <35c39de7-773a-4f94-b495-97eb25555a71@roeck-us.net>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29507-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4ADA829CCA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:35:40PM +0800, Dawei Liu wrote:
> Both RAA228942 and RAA228943 are digital dual-output
> 16-Phase(X+Y ≤ 16) PWM controllers
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
> ---
>  Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
>  drivers/hwmon/pmbus/isl68137.c   |  6 ++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
> index e77f582c2..0ce20d091 100644
> --- a/Documentation/hwmon/isl68137.rst
> +++ b/Documentation/hwmon/isl68137.rst
> @@ -394,6 +394,26 @@ Supported chips:
>  
>        Provided by Renesas upon request and NDA
>  
> +  * Renesas RAA228942
> +
> +    Prefix: 'raa228942'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
> +  * Renesas RAA228943
> +
> +    Prefix: 'raa228943'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
>    * Renesas RAA229001
>  
>      Prefix: 'raa229001'
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 78cff9712..da2484d42 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -63,6 +63,8 @@ enum chips {
>  	raa228228,
>  	raa228244,
>  	raa228246,
> +	raa228942,
> +	raa228943,

AI:

  Is it necessary to add these entries to enum chips?
  Looking at the rest of the driver, this enum does not appear to be used
  anywhere. The device data mapping seems to rely on the variants enum
  (e.g., raa_dmpvr2_2rail_nontc) instead.

It has a point. 

Guenter

>  	raa229001,
>  	raa229004,
>  	raa229141,
> @@ -478,6 +480,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>  	{"raa228228", raa_dmpvr2_2rail_nontc},
>  	{"raa228244", raa_dmpvr2_2rail_nontc},
>  	{"raa228246", raa_dmpvr2_2rail_nontc},
> +	{"raa228942", raa_dmpvr2_2rail_nontc},
> +	{"raa228943", raa_dmpvr2_2rail_nontc},
>  	{"raa229001", raa_dmpvr2_2rail},
>  	{"raa229004", raa_dmpvr2_2rail},
>  	{"raa229141", raa_dmpvr2_2rail_pmbus},
> @@ -529,6 +533,8 @@ static const struct of_device_id isl68137_of_match[] = {
>  	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa228244", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa228246", .data = (void *)raa_dmpvr2_2rail_nontc },
> +	{ .compatible = "renesas,raa228942", .data = (void *)raa_dmpvr2_2rail_nontc },
> +	{ .compatible = "renesas,raa228943", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
>  	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
>  	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },

