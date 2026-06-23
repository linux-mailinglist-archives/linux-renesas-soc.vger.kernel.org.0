Return-Path: <linux-renesas-soc+bounces-34367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eUlUIAxDOmre4wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:25:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF456B542C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:25:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c8cRKsvA;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7423D3019AA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 08:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C82F3CE0A7;
	Tue, 23 Jun 2026 08:25:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392733CBE7A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 08:25:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782203142; cv=none; b=gAhbKXTxoN/hpVCpj2HXDS70ueVAzrQPZkV06gk4Kj8z2qzqdW5uGQRu0Q0s2iq1naMT13YRFVitlArsgrWMvri9vvf2/oFXJeR60wBjWHmpQo0JvZzHKmEw7VCMvX9bJeGkoG7qDUV0ZXTyaF9N7J7uk+aTbKgnAMLoTa5g1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782203142; c=relaxed/simple;
	bh=w+Yprz6gPnfCTWQzn+iEeqPdcFQuLBp5WN2JtzjdD/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fa/Re0RpWIJx9AnjzJoHbDe5DrH6ZyQmONotJTfv+wiEKRTxc3l9Nwy8vhTW4ySRASie4ui6dSR7gsrARr+4d51XV9k3i7DNSlHE2pRic74QVlzOD01lQs7dkXibRdAIn0B2uGjNsdjtwJxA/N20RiwtH8EgZsn9HSIbLsDzLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8cRKsvA; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso594537a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782203140; x=1782807940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rw8divJl7O5oozJv0YeAP+7zE7WJWMFNfq7nx+wH3uY=;
        b=c8cRKsvANRvkkaRL0jysJl+axY6ku9bN01GdKhJvOSn98BMR87uCDpETuAFNZOI9Qb
         koCR9D/TKOpolSKvtV2ZKO65YRyg+mxVCpKqbBmud+pICgzaAv9G/JKW+4vc5idf1yrA
         lx7VZCh2L87V4eWI5muUcRSN9GBXqeN3eqPq1TCb05kklOHAYI+sDSTHLTyCt4K1EUb/
         Kd16LPxYAmPlhQ7NLD+02ad5YSmfGD8u4x9J5Aq7ynk7sjkvelVZQxrxV5iRcNH2Z8qH
         vj9zdK3/1Ctakv78d4QH5m2URmzvqyMYNN3Jx+M0UmY+ti/N6Z0Bw/hWsSxAJDKFE39Q
         RQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203140; x=1782807940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw8divJl7O5oozJv0YeAP+7zE7WJWMFNfq7nx+wH3uY=;
        b=iLqD9fINgTUxDlhz7w6/47l+t0GbuGG4bJ2mQosiaTZsgdmP90hG0GkB2g9C7hwoTa
         pRUHZELf0k4PCWwy59lXJ0hEQr9njz+JQCtU7Q4aLlnMhldKhDmEIU3Dy6JmQrB+15Xf
         Z5DTNbRhprVNXzlcFA2/xsT53DQIdwFQyVkWBGdzEzT3Jz8Ya/GGaIPXNGBiVW5JmtxZ
         iJWXPTed1w+QeRdQYxg565ScyCm39oj/rRYHqTu00x4cOAQi9N7ACyaShjBIXkoqf/o5
         9RsgS3nHM4AagCRRIFgqRhJCZVdWWZoeGTzXRR+0uW4J49LnfeQMs+lgrVcB4ZZk5/uo
         XG2g==
X-Forwarded-Encrypted: i=1; AFNElJ9VmvJN5gCwkHbbKnMabeh8pOND5Ig4vP9PzCi2UgHs2FQ/4Wkf4Vv25b9n2bJrirvjVq+WXdGWJ27LfGQxf+PZMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFW//6FR295m4o8jc1ClYbNINDy3vd4fML/svRYNljzeVXxao
	xpmVS6a6ezZh+j6/duey4etcuQMrII+R9mYCUv4h7BLJ2j2hpA8tKFGX
X-Gm-Gg: AfdE7ck0jRFrE3XKPilXeZ3GpkrJP00GwuOVOBNtJj1EBOuBHTanH8XIMtrWpnGdRh9
	K28Tv2+KngE7lxpW7OVr+Nle4cZref0QtB/vAw71rniaC5ENfItCFLH0VAAH/YBRrCNvuIikC7m
	JU7q3DdnDzHWf092hYxSzX41ql8tY9fUbCIxjidwCVcbxfdCyPF4Vkp09iFW6v5IZsd326AsI4W
	JNwgP4NdLWt0hm20p9/Re5kN3NzG+LwptU3hezklLPmc8FcVmRuAR16MQKAtaAOItRxdpFIiQpj
	ETmgt0Yy8EG+rO/0Do7UJVe3fTJMZpOMVU2fdAeO/WYKicV82Aq6iB+ulv8I1WeSQc5iJZRkX90
	sxQIVjYl2I3nyYXRza+cdJ0EEhxctJpLL1UjpHB22+gyiqWKTXB9S9JIc05WKgEzkDV94E1vf4c
	bct8/U6m3S
X-Received: by 2002:aa7:d70f:0:b0:68f:9fd9:435a with SMTP id 4fb4d7f45d1cf-697d46111f2mr945051a12.17.1782203139356;
        Tue, 23 Jun 2026 01:25:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b84f362sm4117742a12.10.2026.06.23.01.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:25:38 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:25:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/rcar: add error checking in probe()
Message-ID: <ajpC__grEvoB9TCa@stanley.mountain>
References: <ajo6iQ3VWvcxedA9@stanley.mountain>
 <20260623081822.GB3937090@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623081822.GB3937090@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34367-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,glider.be,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BF456B542C

On Tue, Jun 23, 2026 at 10:18:22AM +0200, Niklas Söderlund wrote:
> Hi Dan,
> 
> Thanks for your work.
> 
> On 2026-06-23 10:49:29 +0300, Dan Carpenter wrote:
> > The thermal_zone_device_register_with_trips() can fail for a number of
> > reasons, including allocation failures.  Check for error pointers to
> > avoid an error pointer dereference.
> > 
> > Fixes: 9d617949d490 ("thermal/drivers/renesas: Group all renesas thermal drivers together")
> 
> I don't think this is correct as this commits just moves the file.
> 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  drivers/thermal/renesas/rcar_thermal.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
> > index 6e5dcac5d47a..71f836fbc698 100644
> > --- a/drivers/thermal/renesas/rcar_thermal.c
> > +++ b/drivers/thermal/renesas/rcar_thermal.c
> > @@ -492,6 +492,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
> >  				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
> >  						&rcar_thermal_zone_ops, NULL, 0,
> >  						idle);
> > +			if (IS_ERR(priv->zone)) {
> > +				ret = PTR_ERR(priv->zone);
> > +				priv->zone = NULL;
> > +				goto error_unregister;
> > +			}
> 
> While this indeed is an issue that should be fixed I don't think this is 
> the correct fix. Below the if .. else .. block where this is added there 
> already is a check for IS_ERR(priv->zone). That however does not guard 
> against the usage of priv->zone for thermal_zone_device_enable().
> 
> We should only call thermal_zone_device_enable() if we are on a system 
> that uses OF (gated by chip->use_of_thermal) which is the reason for the 
> if .. else .. block in the first place.

Uh, what?  Other way around.  Only when use_of_thermal is false.
This function is weirdly confusing...  Also the rcar_thermal_remove()
function already calls thermal_zone_device_unregister().  I'll send a
v2 later.

regards,
dan carpenter


