Return-Path: <linux-renesas-soc+bounces-34364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9+JcEwc+Ompl4gcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:04:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED296B512D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:04:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7960C30421BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 08:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE3D3C8C60;
	Tue, 23 Jun 2026 08:03:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BEF3C9EE7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 08:03:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201828; cv=none; b=LhIkvxG8xH1Why03YMUo62n6WLMdM5M8/Hm+qdpWukMuERNAyqzy+Vezkqp3qxD2vY54egOGOZ3ORg2amKeJKzYcQ+NZB8DOyYOeQoz+9v8QK7mMfey1aC1YDwgZBabwyQlwBU3i3U6XCU8oLb06wKITFfyTYVbWdpeeRUOyDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201828; c=relaxed/simple;
	bh=9/9WurOzF9dwMznlkRpWinreZjoxe94EtrhFlkOjeOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urHrZUtqrrqqdCcnTrjO8JXpS7vLjQxHw15FdJV9GfRA3anYYm6ygTY9wUY3lZMiLV1ESkU8eRyC2V6n6HSWoSOyizEKlNqB86XAM9pkFWjjhVH/3XMUpZjmwNxIeuy6wxBeRYYq/IMuPB7gfpQ107J4OA0Jm0sQSsHnx6z9rr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-96387cf6335so518683241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 01:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782201826; x=1782806626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6Wevye877SnOLln/AlwHOkqlk8j8CTpCElmFHp1hxM=;
        b=CybnnPochM2GdaR6Z8ff4zoI4LKtfCeVjSJ8kNupsq8IgPysbLkQVsWHi7siP3yasO
         3+4oPFslmKcj1c+dos5lmsa2prWAhlQbMZpJgCZWx7VMoXKTwZDX4aDf9WmM1C7si4X1
         Lo7sLd7/8F9ma/BVZrFTGSthUnr364D0rs5VyEGd1Mk/ymDELk6VM8j20dInv7A50Taq
         StokCPvnpQl9CNGU6IRBJlcrFoJ3zOk6C6R1X2FMio7wwWI7ccyRdTZfcSH+fHXRVRqq
         oUuZDJyM6nuDfO/wmgxBgrhFMLYmSJuGD9Wn+uD4Dp9COEvrXnm7lPZhtttyZxSBPWmf
         jQ4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Iq0vS+mRNFeQCiLINukXj4nBFyoJol+UoMVyf++/TkKG7pBGF5RO7fkJkRiTNOOeROmhi1UU9V6znT2feZIxFAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxilFSYHxZWEgdknrMu6VywDqgiJ3vV2sCsZ3djx0wi2uHtzdo9
	Y8HbMS2xFyPEyGKGy8AYCT6Y/4iXI/0fGTVxymyIHariLYsy5IWvtjAy1auMjUj/2uQ=
X-Gm-Gg: AfdE7clq5Iu96bktgWBIB5DKWimlONSqsdjW6JEQHxglIjW4trzaBizV1rZGy0FBbo7
	5sSAL/OC4yeQTebOtHgx3FkZefZPtlirDuQiwHsyoDVJ6vWW93tqKRAkuRkWs3m8ZZ6aY4LD4Kv
	d3wUcdz/hIr5csVNBweZY072A517MelJvoEmOpjHqqL0U92IKO+s5/eeIj2vtnHq+BKdlKLQqOR
	3pqJZPwciguAQIrdtBE8WJxx32q4gcmnk4HCaGNaCnDWwjxxAAYEMK05EwQxY4EAGJ01KtI+X9k
	Ur2IWl5kW5FkZ5g0Nbu28Z8791MLaB7344rP+U6tCUMLwB9S1Kp9DRWwQ0Md7hLDFzPA4r1ZQkq
	OQMRsw/wXRgqERZJO591OtaITzMb9CxXODwZn2ezAAOLTjxZB1aySf85DtMZ7Y3/3yGf7R7a7Wp
	sFBCZS6e+7rODVPCE42uUGaes9rxu/3lwMla3jzpJEVuqRCxnI1g==
X-Received: by 2002:a05:6102:30d0:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-72f7f980019mr1038271137.0.1782201825588;
        Tue, 23 Jun 2026 01:03:45 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670c30998asm8121073241.13.2026.06.23.01.03.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:03:45 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6c3a36fa9edso484299137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 01:03:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Tfd961rqKbs+UAvEsrXpt/ZicaArfP7WSxDt56+iQUZDTtqEG4aYLQT2npNtZNUoMTNO5bzTgvCxXObyf3DUp1g==@vger.kernel.org
X-Received: by 2002:a67:f993:0:b0:6cd:23a8:3a31 with SMTP id
 ada2fe7eead31-72f83501311mr955964137.1.1782201825012; Tue, 23 Jun 2026
 01:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ajo6iQ3VWvcxedA9@stanley.mountain>
In-Reply-To: <ajo6iQ3VWvcxedA9@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2026 10:03:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXkXCj7ijeQmOkK7OQSAGkYgBZJyMJoEV4i_XhamwDSQ@mail.gmail.com>
X-Gm-Features: AVVi8CdbyX-JVUOWc5no0UNDnFuGEWPAevzQbiu2OWUTSFIMBurTqmBhzrOsCSk
Message-ID: <CAMuHMdUXkXCj7ijeQmOkK7OQSAGkYgBZJyMJoEV4i_XhamwDSQ@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/rcar: add error checking in probe()
To: Dan Carpenter <error27@gmail.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34364-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:niklas.soderlund+renesas@ragnatech.se,m:niklas.soderlund@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:andrzej.p@collabora.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[ragnatech.se,kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org,collabora.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1ED296B512D

Hi Dan,

Thanks for your patch!

On Tue, 23 Jun 2026 at 09:49, Dan Carpenter <error27@gmail.com> wrote:
> The thermal_zone_device_register_with_trips() can fail for a number of
> reasons, including allocation failures.  Check for error pointers to
> avoid an error pointer dereference.
>
> Fixes: 9d617949d490 ("thermal/drivers/renesas: Group all renesas thermal drivers together")

This is not the commit you are looking for...

Fixes: bbcf90c0646ac797 ("thermal: Explicitly enable non-changing
thermal zone devices")

> Signed-off-by: Dan Carpenter <error27@gmail.com>

> --- a/drivers/thermal/renesas/rcar_thermal.c
> +++ b/drivers/thermal/renesas/rcar_thermal.c
> @@ -492,6 +492,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>                                 "rcar_thermal", trips, ARRAY_SIZE(trips), priv,
>                                                 &rcar_thermal_zone_ops, NULL, 0,
>                                                 idle);
> +                       if (IS_ERR(priv->zone)) {
> +                               ret = PTR_ERR(priv->zone);
> +                               priv->zone = NULL;
> +                               goto error_unregister;
> +                       }

This check is already present below (out of context), so it would be good
to avoid duplicating it.

>
>                         ret = thermal_zone_device_enable(priv->zone);
>                         if (ret) {

The issue is that this call was added before the error checking is done.
So this should be moved below instead (to the else branch of the next
chip->use_of_thermal test?).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

