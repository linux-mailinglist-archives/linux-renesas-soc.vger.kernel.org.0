Return-Path: <linux-renesas-soc+bounces-30704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBsZDNATzmn1kwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 08:59:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF10384D7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 08:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 741DD30C3907
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 06:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D496D31AAAA;
	Thu,  2 Apr 2026 06:56:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE308333442
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113014; cv=none; b=lx3EwoojGZAyp+1QCbj/n3ywEKsZSSa8Cj60kpn0CN8wKKQVMYNx7+DW0tRjlyDFop6LdeiADo62YI+bsgagRqQuELnrtJur1IoQVgNP/ZBtO/laZ6ackqzKF8HsD9R8gtJ6OKSt7AoEgUgEl2jrbzCJAatOb+w8fFPcGZU7vrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113014; c=relaxed/simple;
	bh=ePSGLsiMhmFVR8HfoS82y6dWU7vjGnh0+ppzLHlH0T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZhUH6Hnta3ba6AMfAODAIsd4fCpj2SWZBqAjXBgxBIXc3Ls6eiIa6ja/GYTPNAJiUxEf5izCjuiu0IkmaTazD75yT7X82M7SwdqsCEMrKv5w+kT3GLtuFSHBx3II1gAtdDzZkmCXczpJIVth8t/4I2/08DGxkWPTWi+3nEOsD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso685183e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 23:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113012; x=1775717812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yg/9zln3oOsSy7dvNy1b6XIOWPnJXqk+HqcDI8SZtzg=;
        b=l9S5NTPATYzMWnUrd3k7jVuJp1qUOob+E0EWOUG+ZLL9pQWtX/ltje/7Rx81JsuoTd
         rKEBq3jOvbAX+PRpOMAkor2gurboQdf2O0/3/HZgwLuLdQX12yskQ8stEU8xt8lFeDRZ
         Q51mv0FC4sOT7xR1xxxHQcWbFi/68gOP31bXp4nhpizdhjRvLAAKWEOcmfQ+KPbkWCEb
         15EjKA8Hb+olEN5bJ1jUwq29neNpojEWr6YNE/fbl4ZaJPtPm79Qa8IDi+ZXwUczOIxz
         yXbHYMAY6rs9syGm8dKsxoyTUlaX1f8qjghJ7lr+HtvkerIMtRVcNXI8qZLLCnjiVI8I
         e8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXLHTcBy+Uj7hS/7wYcXRnhT4q1+S8eoIhcaV8qM+mRzm/FSciC2L57eqah21T4h5BvR/tIi5Mv18n5Bi2UdBb5nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw46DneUg6Rkk7fqItOb/eXmddgNPK65JNJOFOyPPX4gygBT2xK
	hY1LZOhLDWNf8sTrX9L6ws9oKwvuCmj4wN6rbU1InYJwCpy2Q+FczOfJZj6fuUvp4tY=
X-Gm-Gg: ATEYQzzcpg5H+4ScrAO/A4NAmnHVhZ7eGk7YfFTyx8//EtfNAOrQIKCsK3MlkDbddiM
	UwV6Z4ALrmUxJuXmA/tWeZMF2WKdIzkDbzxG1uGTG+TC8buv38JBXrhAtjhBcPVG9NFks01DYzf
	xUbyGj9Hr5Pdxu8yVhokqKsosrHaRsvHUCSBSfCbTMRQfCrZ8D7mra34sTVF27PhQqYGI8SB8fe
	K3xGYYxD1qEZKNB1ePK+hXVOwRMOjY7IhonXyDy9OSQGQy4w1J+ZcJXrstMlaaT2L6qpJ8CA2MP
	HJpYccCB96v9cwTiL2+FE2XjnPjcQ/fRbi53RulkZI3zJUWZLkXxx5qprbvYDbOG1F2+hkbzMG3
	6aFIQLRuhK7WJSYkEJfB5qOHIJ+7eOrHA8KJKFlQKyEYhjrrr4MGiSSVrz6azhrM8AG169n5Hb+
	AJGXu8humOQ2U3UBkYR+Ok2t+4zuT46BcAlpp719TrwTZVmrPE0z7jXRIOyHnHmM5v
X-Received: by 2002:a05:6102:f0a:b0:5ff:fbe4:8a8 with SMTP id ada2fe7eead31-605681a83edmr2805653137.25.1775113011950;
        Wed, 01 Apr 2026 23:56:51 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6af44sm2403972241.8.2026.04.01.23.56.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:56:51 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso456851e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 23:56:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQGr9rQAMKT/lB1KReK4xOeu7q4RvVyTVcBSizwAW8fb0rcswgzUJu+GyypQQgssdrW+qk/K3zH55dU+YLGzMoZg==@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:5ff:d434:b507 with SMTP id
 ada2fe7eead31-6056811633cmr2908434137.17.1775113011410; Wed, 01 Apr 2026
 23:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306104025.43970-1-phucduc.bui@gmail.com> <20260306111912.58388-1-phucduc.bui@gmail.com>
 <20260306111912.58388-4-phucduc.bui@gmail.com> <ac37o-N5lqFMwDCC@google.com>
In-Reply-To: <ac37o-N5lqFMwDCC@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Apr 2026 08:56:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6y4MkCYR-rgn=FA38ZUE_X=3oQWNOvfdyMo=D5_xoxA@mail.gmail.com>
X-Gm-Features: AQROBzDLl0x19_opYuA1X41uZg8W0wbeRV35EXp5674jHgoujIYpObmm59iBhFs
Message-ID: <CAMuHMdW6y4MkCYR-rgn=FA38ZUE_X=3oQWNOvfdyMo=D5_xoxA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] input: touchscreen: st1232: add system wakeup support
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: phucduc.bui@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jeff LaBundy <jeff@labundy.com>, Bastian Hecht <hechtb@gmail.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30704-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sang-engineering.com,labundy.com,wolfvision.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.439];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 9DF10384D7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On Thu, 2 Apr 2026 at 07:17, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> On Fri, Mar 06, 2026 at 06:19:12PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The ST1232 touchscreen controller can generate an interrupt when the
> > panel is touched, which may be used as a wakeup source for the system.
> >
> > Add support for system wakeup by initializing the device wakeup
> > capability in probe() based on the "wakeup-source" device property.
> > When wakeup is enabled, the driver enables IRQ wake during suspend
> > so that touch events can wake the system.
> >
> > If wakeup is not enabled, the driver retains the existing behavior of
> > disabling the IRQ and powering down the controller during suspend.
>
> I do not believe this patch is needed: i2c core already handles
> "wakeup-source" property and manages wakeup IRQ.

No, it is not needed, as mentioned in the cover letter of v4[1],
and as tested by me[2].

[1] https://lore.kernel.org/20260309000319.74880-1-phucduc.bui@gmail.com
[2] https://lore.kernel.org/CAMuHMdUqiaP=COTkKU_jK6Hdii+YJ5+zXnxFkOOnhLri5NakTw@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

