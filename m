Return-Path: <linux-renesas-soc+bounces-30622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB34OkR9y2mLIQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:52:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C8336584A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AF6A303E77B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 07:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD8F3CA4A2;
	Tue, 31 Mar 2026 07:44:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE83CEBA6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 07:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943098; cv=none; b=LrEX8he2p3aoqLQA05AgQ3Ekn5ypp0T9Ja0bK4xCGyOEQ7ejVX0lJk/YnZc8ne2TZ3QhbNrqTUAlJ2x7KwYZ6S9hemayJuDASgZf1mwBhSzJLXyOWTjj8lbQQme//NAT+GVJrAlVZ8bX3xVH+sqPLXlBkJN0sZDONLPvfWIyasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943098; c=relaxed/simple;
	bh=nKmyEyb7D7X36SQfOAdROYfUNgUvsyP0yfSF1pdMOHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9GY2UzyD4sfho4mFqzRbs2vp4rJ7vzTn7VG9kyQtGvEZBE/UhJvpuLU3F+pTnU56SdJGV9VHtadI8idWXmlzIoeGJwEqxQJ8R3w6jC71WwR+TcyFibCt+Mg/1NfjFjpaAtYZPZnsnc5NMvG9r2/F846j4oMx2Yk9+CJ+HkxxAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953ac1602f8so1647967241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 00:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943094; x=1775547894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCnU+44uyO1qnSG/QzkF9pVqHllgFD/vqjs6wXakTZE=;
        b=lcVLFP9BgMgOEJriZjQvEhm7VyPMHMp+oEu4V5JfL7FEaf4KNQSxEzZHafbXvHt0UX
         kuJq4Y08b5XmCe/ryKZVOuTXhxeOUdV+ELvR8G/hNd8f903GH/AEBe5Yyf5UeEZ141Xi
         A3WsFFhhc4tf9zZn5sf+OrPtRPLvnSHi7rbgwXzYyS3FzeSUxbgqZdxRX5AEvA1XZeNo
         QAPWTDqmUbm7ARxyLfRIWFOmQg+EXw2WsHkRn4yEMJycje5V3hoHhCbR6PnkfLPJSL6R
         JtGj2lmGr1e07IuHjOkfLW79N5VQkN/i3Wb9V1qSr1YB5gBzr03QYUFOMc1LwgtJNcJn
         brsg==
X-Forwarded-Encrypted: i=1; AJvYcCWM0c07KLuKZO39pKbIP+hi/6twHMAna2m61F+XdvbLpxjazuhW7Zr+bMmmWdmYnoWp6lHy1FUUzfFL+LQhre6NlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzhZ3ZXF+8kSnGHtxZWbYevYKeTS/E8x1t8rGKdnVjj9nUbwbZ
	rSIkswxBQUomjF7TAqjvJtSDJjbzFq+15iFfyylNQ7js3YW7OCiVLDYrAz+DX+bY
X-Gm-Gg: ATEYQzwvPCRp8nQ0c5vENGb94vx4msyqTWM1VqCv/LaT8TKAcYk17WVcIi1WZIkxPjL
	xZq6nuQjj6NDvxXUb05lLxjwANmpgYuqdG+O8fNM/2HiQErkWw/gmx9S7ACmN6nWnMa0N8DrEJt
	IBetuMJjs/1+QN121HNjWIHEhJf2IUAkiLHYDig5lBeZe0SYg4Ma5HjNr6S42PgXmEaTGKgIN7s
	4vL9JK/51do+REQ+SJcVmq7MELGiFbEFV6Hcm4gnEltT94AO++fsjf4KNHSmoriGv3t/EkG/aBm
	kxULNVB8ZkLpSmFmMVxlwT+cnDfwPoiOp6v5Dsokv9LOjxG0ciHjJvOTm4liLwdxnVEceTjjJNI
	XxQrlrSvRUltmRnKVEMgbOmuz9MGJAcLDGRTVnE9nac0XjdxDwPaQciCQ8Eq71Sl58zRp8ikxGJ
	JmPLr1ptkLHdHH/zGHqjaBi7pg91Y24hzk7zvzIOUcxpIkOEBVzlFeptcvr4GbItzz
X-Received: by 2002:a05:6102:6c6:b0:603:1ebc:2632 with SMTP id ada2fe7eead31-6054fd620efmr921736137.6.1774943094376;
        Tue, 31 Mar 2026 00:44:54 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a4eb23sm11078703137.5.2026.03.31.00.44.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:44:54 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56ccdd0044dso4520655e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 00:44:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVw5+d3mKhDhcLczc4fbfkuw/SvL8win1rEwSDDXg/KFrgp/28qZUI8Y/paMzW23vtG2Y39WOSmK+3PgpIR4Q6Mnw==@vger.kernel.org
X-Received: by 2002:a05:6102:1612:b0:5ff:c40b:27eb with SMTP id
 ada2fe7eead31-6054fad1639mr1014244137.3.1774943093640; Tue, 31 Mar 2026
 00:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com> <ab-vWbjdlAIt1qaX@ninjato>
 <87a4vyynl2.fsf@linux.dev> <acIsrJp2Zq2ntS5f@shikoro> <87ikalp9b2.fsf@linux.dev>
 <aco7CM5N3E6A0v8v@shikoro> <20260330135050.GD22278@macsyma.local> <act1L-2tQV4fHyU7@shikoro>
In-Reply-To: <act1L-2tQV4fHyU7@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Mar 2026 09:44:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP+pQwFuZDLV6LSYc2EBK-R2di8hzi1GA=jFYSigZDfw@mail.gmail.com>
X-Gm-Features: AQROBzCR6aKRoB9Ee50lh5NCZXLipl3ougC2vqJW_UoKb9r6jVHt12x4oHiJeb0
Message-ID: <CAMuHMdUP+pQwFuZDLV6LSYc2EBK-R2di8hzi1GA=jFYSigZDfw@mail.gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Theodore Tso <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mit.edu,linux.dev,vger.kernel.org,gmail.com,renesas.com,glider.be];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30622-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.352];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 61C8336584A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

On Tue, 31 Mar 2026 at 09:18, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I was thinking about proposing some tagging convention such as:
> >
> >    Suggested-by: Sashiko:Gemini 3.1 Pro
> > or
> >    Reviewed-by: Sashiko:Gemini 3.1 Pro
> >
> > to Documentation/process/coding-assistants.rst.  Alas, neither is
> > perfect.
>
> Yes, maybe an email is not so much needed and the information about
> Sashiko and Gemini is much more relevant.
>
> > Suggested-by: is generlly used when someone inspires a particular
> > commit.  This might apply if Sashiko found a problem as an incidental
> > finding, which we then fixed in a subsequent commit.  An example of
> > this might be[1], or in the case which you suggested above.  But what
>
> What about Reported-by? The required closes by would then link to the
> actual report:
>
> Reported-by: Sashiko:Gemini 3.1 Pro
> Closes: https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com
>
> The drawback currently is that only the whole report for the patchset
> can be linked. But probably Sashiko-reports could have some more HTML
> tags to reference only the paragraph needed.

And the Closes-tag can only be used when the issue is closed in full.
You can still add a normal Link-tag.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

