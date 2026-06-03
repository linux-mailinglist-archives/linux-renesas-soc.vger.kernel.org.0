Return-Path: <linux-renesas-soc+bounces-33557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vbHzKQ1ZIGrk1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 18:40:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02A639DA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 18:40:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=UC3shjdA;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35CD2300C0D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 16:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05893F411A;
	Wed,  3 Jun 2026 16:40:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24F3F1669
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 16:40:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504828; cv=pass; b=urDfq21KbCT9iIZia9eYsFjAsaLSgYHKGeos7xep0Z7mgaABXZYfEmO26JcWF3UhR0GGU398chpJxCX61bjsMLSjfZsxTX8tvgvLliCglRGDdlnGB04rbutkNRrtKSJWKfw7KvZ0QSODDr7AQ8PI2MgFwccUD+WgAUBrRmIwPk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504828; c=relaxed/simple;
	bh=eFUqVxv/9+80Nu9hearScbYWdYDMy+i5moXBBKkWcw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSvG8sqCCPuNJhJglryxtpw7d4flfgbRh+nPOIvOSkzmOd2DblT6kDAfTsdRgIKX+fos6O7xxfBuTc12l8S2ItgkNxTTt9q2hArUntv+BGJzDUv86IacevwZufo/AJWD7du/ywZO/3y0JuuWglY+hAI6XQ0FTMJXrbQA0sYLQeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UC3shjdA; arc=pass smtp.client-ip=209.85.208.44
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso5600940a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 09:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780504826; cv=none;
        d=google.com; s=arc-20240605;
        b=A4jQPVntdBna/e0VrfHGquJzMByHyK2ZDpSZqP9HiSGMx4rZWNQ8Js7Eu/QDkB9ffO
         cShRBP//CCIuE0komvr/ldAKLLdcwtyecc4y5PGzlp+ParArOxXUpRofMxPZYQEHHwFN
         xIn0SGvEuTW9eCcZLwCYYODd/EstN7ZlKwCL5EP2VbU6vpJ31aDY5MmNcnI3L1zMhc4C
         sdvq+Wti8q9m6R7pQr/srJ43buMJZ04z0+J900yLT4MYTQK5vTbKR4A9eShww5y7uHTD
         b1fuRs0wgATvcZzoSXVIzoYJNLvELLRVrfeaVkrfD4ZSqdOVPIzIikPjJV9he0PWDfIU
         aohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        fh=wJYHQLlkO9gW8FoNNcgGSxK6IwXlaEhWLPLjaFZxiKw=;
        b=K/vGqp+P4fmcoQxj0hW9wLMQL2t6QH1J9Jcrt7wbyc20bV08gnUzlN/kUqB5e8YvhB
         4uyRN0YICSOxv16Jo7jIhmu4TpUxALv0O9hFkidBT3W3FILLAyj2JUTCiDiC6hIyD5YC
         8nBGvi5zlhpvEw3m4SerMx9TJO6EzrVsFsPcvxQbve/qgGElMfQ5hKlZtoTf0/JqE+6l
         CegrQ/w0BNJxSKZccI0Sn3UJe0E/BCH4PQPBiDFsbrZJ6SUgXJELWvmTzJMjEWkvMRk2
         SLj6mLXg4z1nCpWwMMX6XWPTLqkp+DSEElaXRKLfw2E0tmQNWhaohAl0wzAL7YQb0MVv
         ugng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780504826; x=1781109626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        b=UC3shjdAayfiqRfNjBff88uXqzcfQMtmEvLryFHpn2VR/AK0HgYwlp68xYj6V1H/0f
         8VBPS01r2NZI46nvX8aGyGJsSr14YOFjhlJpzgPrKgPGhNRaWHsksQkR9juWOB2bcray
         WhdKidALLgNmud9kj7K19t16idcQSfcW4fZVJWTKpOz/9h18S3SewtDx4aF7C1Kms4o9
         4Pwg98R0Z/vWfcYqosm0vyCzvGhNyC914iCnFeniWMthVdk3702fQ26Q3ZcZvtdVK8dG
         x/R+CzvEMn6hL1QXxBcMyJC3FamUZcK0dKkNFZX8qbA4mJCtmrsgmp5OYbIoxBdZpWrs
         VjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780504826; x=1781109626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        b=eHjBw2cXIRnJuTIV7ONHgybTP9D3gM8vY2RzK0qOpyojUgS4tHQQmMsgzR4NZ8KNWo
         7V0rBp7HQ56T/SiSg3u1itaQhfKX2cgcI37ZVBml4jH3xoH7fBZrL2jg1nKREq5iVni8
         8CURRK54sbFDAQMGxGVxZ5qP5KM4Gi6NW+qt2NX2ydZdfZ+pkmeEzWIxxKuvyG0orCHk
         uNgzLh5qjUU07eafCK7KTIpORFYs2wunAPX4VUOf4JEd6tv2HASPVEShv53B43sje+jo
         y8jG3NM7exnkQxri5eneg/26w4+VeMmpLOVgZF1ZXt8pN79nn9MruZQppt9jijdx02Rf
         Xd4g==
X-Forwarded-Encrypted: i=1; AFNElJ9Wry6gy7gBIFlqoyVzjn09RYUFB7oZtNy6eYIU7mgBYIp+eZpU5g8xce9Ikkhrb0uhz24zj7pjeVKzs4ZW09ViQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYY0sKGYdwjAfkYAhkVhK3FwS2sYkTGARB0whuUAOUGix8qqBK
	vazLjr23rUadC41FtEdmDm1GnVGK8VYg0Z7v918mvWhz7c0jZrdPkUCZ3D4CHjAxJoHIC4/n+mY
	Qe4Qjg/XTdOehVBUg6/BWPrLuMFSWFqtd28AoF01W+W4gXLmnc8hZj3aXsQ==
X-Gm-Gg: Acq92OFDzHojDfRioGi/p7bkHAq8oEnmQ0fjOcZcNikNIDuCFcisPwZ4Fe1/SFblIx3
	hibONh9q9uwsnv2LsyErMAjhdTYmFWXfeJ7Knl2U/8jKOwv+2pYfhbSSDjLsvZMY4b5tDuB3aP3
	Le8KXEU+t6ad5wEhBYVHUXFk7QP7Um/K25/hVZp47SfuhHQZc26qqV8r46rBUi4zVOor1tEFu7B
	M5QZ3MomfJJYpmH8CLdmnaFVxBtBRAwLiE02T2N7ZkVBnG1hpizld9tJCDa+PJuRbkPZBs0bQ+H
	cRQ738i1IL8FFStc1mEYPYR60o5kbeAgz/ZxOlmYyRHv21o8y0GlKtsbGSKcq6Rzblz7kYMD6tP
	JQiLwzIM=
X-Received: by 2002:a05:6402:2681:b0:683:93a2:dfb9 with SMTP id
 4fb4d7f45d1cf-68e6f2cbeecmr2236369a12.1.1780504825758; Wed, 03 Jun 2026
 09:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603110127.23930-1-naresh.solanki@9elements.com> <20260603-deskwork-perch-ae4eaf92368f@spud>
In-Reply-To: <20260603-deskwork-perch-ae4eaf92368f@spud>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 3 Jun 2026 22:10:14 +0530
X-Gm-Features: AVHnY4J_O1JkMI_4gzw8gRgkRgdM6PmCbsIr17Aw4fnyKw6IG6s36I5OjWTKSKg
Message-ID: <CABqG17jzv03U5=1zhVd57zDDWFXpt=mX030HVyLUpm5q0LRW1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: isl68137: Add RAA228234 compatible
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grantpeltier93@gmail.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:grantpeltier93@gmail.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:patrick.rudolph@9elements.com,m:krzk@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33557-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[naresh.solanki@9elements.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[naresh.solanki@9elements.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,glider.be,gmail.com,vger.kernel.org,9elements.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B02A639DA6

Hi


On Wed, 3 Jun 2026 at 21:39, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jun 03, 2026 at 11:01:26AM +0000, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Add the compatible string for the Renesas RAA228234 8-phase PWM
> > controller, which shares the same PMBus interface as the RAA228228.
>
> Given this, and what the driver change looks like, why is a fallback
> compatible not used?
Are you suggesting that the binding should use renesas,raa228228 as a
fallback compatible, similar to how renesas,raa228942 and
renesas,raa228943 fall back to renesas,raa228244? Or is there a
specific reason you'd expect it not to be used here?

Regards,
Naresh

>
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > index 8216cdf758d8..2988bc6300ae 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > @@ -55,6 +55,7 @@ properties:
> >            - renesas,raa228004
> >            - renesas,raa228006
> >            - renesas,raa228228
> > +          - renesas,raa228234
> >            - renesas,raa228244
> >            - renesas,raa228246
> >            - renesas,raa229001
> > --
> > 2.43.0
> >

