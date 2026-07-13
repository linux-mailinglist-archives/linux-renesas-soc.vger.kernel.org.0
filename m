Return-Path: <linux-renesas-soc+bounces-35128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SuG7AS3lVGq3ggAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:16:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8793874B6EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:16:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA7023041466
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6694189C9;
	Mon, 13 Jul 2026 13:10:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6D34189BE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:10:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948257; cv=none; b=Dac8r1+JT3BZiadEGpBwNWD2eqlnaNApX15/zDVRgSvJQi4cBpGuVB9DG9NmPC0rFLgO/wmGNLRlhE3ZfDNr1DX3BoyRDCus4H/ShSKLH8iMQ0U6l6jEN2efeeHRVvSxJq9EGUjZ/kxaEQ6zBruBeBNbkAx6qNJLK39hSZ4DESg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948257; c=relaxed/simple;
	bh=J72RPEUWpw69+8gRsrNf9t7y1FmXMcRPCp5J2rBAYD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=UXUnWmy7VrwL4mqmO1DMrMoZ+q9lIzkgPVFn+QwjIak2qpt37D7mCpH4Nk0J0Zq77p0H6onrGk2qkfyooIJYEmWSQkUMXH77JIciqHpBxjADYR2fYLOCW2I+aJUKRGaTUKUOUHaAhamIro8iuz6ox3tz9PWbmHs/W3kHrKfsHAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso4724519a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948254; x=1784553054;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kToaFJB4jtffouKVc4DW5j2DHgm7GF4lCPs3V/J9u4=;
        b=efstzI8UpSQnCeRDDBVp36jEJLIZnOXCMX+zX2qCRS6q+bRWmCMnO/obUaXF/pHTsU
         VplErQKsoFpszeLDVoevD9KiPmXT6XnJvxu3GEP33nkBrtEvFzuK9mVJUy9YUSho4ztH
         ONYL9KtaNnLaiR4Rl0p0UqdWScull2Qt3kKboF07o7ObcD5/OdBXpIk7l10skZ8gCi+7
         zjhlX8iqZAWraH3OeH36Ghmkzb+Vv1EFxrPVSuBMcT0GgP4kCw/s3PmyhnaZjjjSQfFx
         5gjy8BxYyjIc9W8YBmXqlsmJU7c+e4otMSMKHbuUdZyemQfcyLC274Y8xiiZmblBwpTt
         ETZA==
X-Gm-Message-State: AOJu0Yw67C3gCmynwmXM8tfPr1rMwEMHctjlYGwiuVtPZfP6d7zWVVtL
	9xMBdWBF7Wtw+gsUCuE/9TvCC8ouAXcq1iROC8Ml4l7FfncJXGpib3C3x08m212O6aY=
X-Gm-Gg: AfdE7cmNNwVA/oo73WVH7Hm0uYdjNf4dWxv+qcuX4I5QLWHjcgWBavk3tNqMnP0BpE8
	8y88tS5GDazCLtxNPoTrFneDGLOppKYaYYRUyCsO0Pkrirb37Z+yDmNWTLR17QeP1+e8VQVkSVq
	sW6RZV0hWLhxglBbj/Irg2l7fHFZCg/kSSq04w81g3hxkwANkVuZBx6dFrhEGNmxr1oLb5AbJ9v
	tS9MEmidOJjuOEj6HRGXokbr6TDzy0D6zllM4zf3X6TUYzW3P5Lv7HjKiZPEQSTUFmvrT0J8TNk
	gVsRjW4T0O0SwzqLRiCHwf2C4qFyvfk7WfBYRFn9qrbjoZHbLKlx9ZKWoP9E7YMQ4LGI4Mv/tsU
	Qi0xT9bAbQ93uLcUq+fTMa6C/ljGFJxcv6kvsdf8K99awqOz/CfFuDSCpXZXCwttvPwK6a2/hKC
	6fZiGFfx3UirF8ipa2lgNGxa9oY1yUI31iOkm3T1nFnf12dhLD5tofJ4MnoP1h
X-Received: by 2002:a05:6402:1e96:b0:69c:4051:69e5 with SMTP id 4fb4d7f45d1cf-69c5f102c06mr3981795a12.28.1783948254175;
        Mon, 13 Jul 2026 06:10:54 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4a60sm14913688a12.8.2026.07.13.06.10.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 06:10:53 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15cd3fd760so363895566b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:10:53 -0700 (PDT)
X-Received: by 2002:a17:907:cf87:b0:c12:992e:184b with SMTP id
 a640c23a62f3a-c161e9af448mr387413466b.26.1783948253416; Mon, 13 Jul 2026
 06:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
 <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
 <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
 <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
 <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
 <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
 <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
 <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
 <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
 <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
 <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com>
 <CAMuHMdUQv9i1ZUhzZV+YhhmjbO-f-0n9ocfBYAiVYP6We5Evpw@mail.gmail.com>
 <CAMuHMdUrk5GzMWqbYa7PnrQf157TCnS1xjyiV267EakcL+bCLQ@mail.gmail.com>
 <CAMuHMdWM_Q-Tk++nt2ZhwpzZmo=M3fv0fzPr59jAv6q=ec=vtQ@mail.gmail.com> <CAMuHMdX-QTWTukQbLn+pYgmzZBu0b4OtM_oTGhS5_SMMtazhEw@mail.gmail.com>
In-Reply-To: <CAMuHMdX-QTWTukQbLn+pYgmzZBu0b4OtM_oTGhS5_SMMtazhEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 15:10:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvTc8LEQNH06MQ7tDB9RDoLRnVRh=AqOqY2J7qfN9Qjw@mail.gmail.com>
X-Gm-Features: AUfX_mwoDgLCkpRO_nvwT-rMvRWg8IajC5hUMcsNWDibP0K91nYE65L6z4xB2vM
Message-ID: <CAMuHMdXvTc8LEQNH06MQ7tDB9RDoLRnVRh=AqOqY2J7qfN9Qjw@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35128-lists,linux-renesas-soc=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8793874B6EE

On Thu, 16 Apr 2026 at 10:33, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2026-06-16-v7.1 (TBD),
>   - renesas-drivers-2026-06-23-v7.1 (TBD).

That became renesas-drivers-2026-06-16-v7.1, followed by
renesas-drivers-2026-06-30-v7.2-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2026-07-14-v7.2-rc3,
  - renesas-drivers-2026-08-04-v7.2-rc6,
  - renesas-drivers-2026-08-18-v7.2-rc8 or final (TBD),
  - renesas-drivers-2026-06-04-v7.2 (TBD),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

