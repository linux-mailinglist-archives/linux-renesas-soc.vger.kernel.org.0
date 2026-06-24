Return-Path: <linux-renesas-soc+bounces-34399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dJMOKabYO2p1eAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:16:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7D6BE801
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=igRDAHUg;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC378300CB38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 13:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABED2E8DEB;
	Wed, 24 Jun 2026 13:15:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E7117A300
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 13:15:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306957; cv=none; b=d9ysdY+6TB/FidbShrlGNoEhiq9CM1wgnwlcb9L4FECLsny7DRsZ21PV8qB5rgd5KRJyZHcC7ZW8eK/e9eXDTGSHwcrILIauYElaWmJ7jpsc3L/fa3jfTYbTfT8+lOLUnixbK12+wOBewKFgaaygU+0gttYtaHxa/RzZEAeqai0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306957; c=relaxed/simple;
	bh=/nqB0qbAotm7Tm2k6JejyL6c3R4u9JfzmCNWpnZVIno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwcBPc9ElEsDkBSbhj8s/YcnCBCQvYMZ72LcSHOQ1pi8Y17K0dLOD7Vm+j5RfrFMUSgbzuD5I+NY+eqRWEyh/21mKZ/qhobVtTP7tE21+zVL85STi551rLu3jBI8oRMDd35oMgPjsTaXZwJif7tVKuTcXdkBXXqORsInkrGGk/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igRDAHUg; arc=none smtp.client-ip=209.85.208.43
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-697f3af8749so1171595a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782306955; x=1782911755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8zJXNAOj3TRSQqWHWqJVCbZ12C/VejTSJ/Qsl8Vpsg=;
        b=igRDAHUgYdSsbcEZaRHz/lszr/FDay4uqMsa+lrZw+BpH70CMnhrsFjJ20IvybXwK2
         nwc1aNEtF2fgYZW7ceZVoXHntd6zGfI1h0WKeQvLR/HnpPMBllofsxRsTBI5k9Ealo29
         hLEmYabCcInS3qngcMuPK9QtJsqYT0tx4NSIT7CKgcEoAJeUmPUemxTsvj6SVNemg9DU
         vlgvJ9jfhz/aPgOP7sWK41/z+7Yu23/xG67LA5qht6Gd9ZJoIgwQGM0wlWsZpKoIuXsN
         swQTyeJoOuKrGp3+HbjaIRlwM4K+9DnzR+yjmbNWm197GfMCcqFYJk+nKnyxOzKUujxi
         tCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306955; x=1782911755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8zJXNAOj3TRSQqWHWqJVCbZ12C/VejTSJ/Qsl8Vpsg=;
        b=NOuWUJvrosmDfzGoBU+eqmlR/kJIfbk7gmyPhF2bzLN8eXbmZmJnxoQM1qzxdDObca
         4uTOh927PJA2oODVS2ih84BNOUerF4t9+zK3NBw9sS13kLQcDk79XEuuwZG7At5iOlFI
         nMtVdQ57Ehwd+mwJ8Aj6CKW1vC7k+MKWlNyCOfqvsl2QMb3avFpU2ihPuPfs6nfJmaRk
         xHL5gwn/TiyfIOprAo3Irxjfl5bIZ0kmua1I50Kl6NfIklBbcb4MwK7nFfPdlF6cnfUL
         7WvtG5UMbhC/IMWexw/Zw/q+3Xi4W8Zgetv2H/4JdmVwqRvLqCFrYzwsBHZToJKAUvNM
         AWoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKH0k5kstK/u1hS38iEesfQ3XHtNf8PehoEBOB/4Z/8qhtkR0NsZJb/2g7aVr26t66FWOt0QhUEWjhY+ajwQUy4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIzAz2blo89aT5u1h3MCZ4LSRzYNjvHQeCA38Vo6EMq8/wAyE5
	KrjWSS2Cdi3Nm3JaTBmfW2d9XQaC19OPWzgH27GE0Hm1LaJnCU7oAXec
X-Gm-Gg: AfdE7cm01Jq5SXsmXaWqpJACfjZxSBMCNL7ftK9A5StC0gP+sYf0f/Uk0mczUtOJG86
	HP22PGO4oHz4asWLyC3NyUmmCpeNGgDYWG0lVnf34cxFeSHq8LzQqoHyqfDz7W/hGedltvp7Xxz
	nYxlgCVl0tWE+XcngbB4jN3XhMQusYtPYY8fOLC6TEJcNB6rrpPeDQdddf4nQMTs5jKxjZe0Pe/
	c5VXne5YMkV20IXHJoC4J6QfyjdOV6M19MVGu3votZX9n+1fdzeBuYCk9AeZ3Lrpmmb8DQRC2Ob
	4/wQ51LbL4xEB8xGx69Boqx1m7bCXeQ3tBgLlorGQVqJVUU0JQ6rc5TJQdfqJjCT3aBPpzLRvns
	JtYMgqy/Yvhnqp7s9dLbE0ZfD+jaLczMr+UvLBmt1aqwG+87mscJBSIF9MAXVlJMgB9I1jsDWRR
	YNkaIIIR52
X-Received: by 2002:a05:6402:4591:b0:697:decc:7f9a with SMTP id 4fb4d7f45d1cf-697f387a521mr1657893a12.9.1782306954280;
        Wed, 24 Jun 2026 06:15:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ade18esm1152759a12.7.2026.06.24.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:15:53 -0700 (PDT)
Date: Wed, 24 Jun 2026 16:15:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] thermal/drivers/rcar: fix error checking in probe()
Message-ID: <ajvYhfo-Y-zQ4Nuo@stanley.mountain>
References: <ajvVfSusxZfjNxVN@stanley.mountain>
 <CAMuHMdUpnXGUHRNrT856RkBtsrO_So+0sxJ47cG0OihoChB+1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUpnXGUHRNrT856RkBtsrO_So+0sxJ47cG0OihoChB+1A@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34399-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:andrzej.p@collabora.com,m:niklas.soderlund@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:b.zolnierkie@samsung.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,ragnatech.se,kernel.org,intel.com,arm.com,glider.be,gmail.com,samsung.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51D7D6BE801

On Wed, Jun 24, 2026 at 03:12:47PM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Wed, 24 Jun 2026 at 15:03, Dan Carpenter <error27@gmail.com> wrote:
> > This code accidentally calls thermal_zone_device_enable() before checking
> > whether thermal_zone_device_register_with_trips() failed.  Move the call
> > until later to avoid an error pointer dereference of "priv->zone".
> >
> > The driver works differently depending on if we are using OF thermal or
> > not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
> > call thermal_zone_device_enable() if not.
> >
> > Moving the thermal_zone_device_enable() call is a bit cleaner as well.
> > The original code used a three step process to cleanup:
> > 1. Call thermal_zone_device_unregister() to cleanup.
> > 2. Set priv->zone to an error pointer to preserve the error code.
> > 3. Set priv->zone to NULL to avoid a second call to
> >    thermal_zone_device_unregister() in the rcar_thermal_remove()
> >    function.
> >
> > Now we can just do a direct goto error_unregister and rcar_thermal_remove()
> > handles the cleanup properly.
> >
> > Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> > v2: Use the correct fixes tag and re-write the check in a cleaner way.
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/drivers/thermal/renesas/rcar_thermal.c
> > +++ b/drivers/thermal/renesas/rcar_thermal.c
> 
> > @@ -510,6 +504,10 @@ static int rcar_thermal_probe(struct platform_device *pdev)
> >                         ret = thermal_add_hwmon_sysfs(priv->zone);
> >                         if (ret)
> >                                 goto error_unregister;
> > +               } else {
> > +                       ret = thermal_zone_device_enable(priv->zone);
> > +                       if (ret)
> > +                               goto error_unregister;
> 
> This error path is the same in the other branch, so it could be shared
> after the if/else block.
> 

Even better.  :)  v3 coming up.

regards,
dan carpenter


