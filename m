Return-Path: <linux-renesas-soc+bounces-28520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEvMCzN7oWmdtgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:08:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA481B65C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46FC6301808A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 11:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0060A3ED122;
	Fri, 27 Feb 2026 11:08:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B089E1885A5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190512; cv=none; b=izWsvEF2hexbEDXN8Wj1UeSOmdzBVfiXLIv8bQauAc0g7IrYH0rV+XPvo59zttqS4mbUA4le4NoWzP5MMj5PeDswau/SMKglARdkYWWVg42s869WIDtN85DElvtmW4XYuDv7vrkmJtC+hvYGeai6Iy1rTS9mmfXwwhcQL2twO2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190512; c=relaxed/simple;
	bh=GMwj4J+/15CPffHYoNpuh/P0d+p59n13bVFVwv5TSDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kftcEFpT0y7m89WY4b29DiaisNay4cobdU/q2iw+4rjctoXcspcco4yZR3NHmMmiTBtqClDtI5FJV25WkrIcNlbyWC6MqijZGOfS9ecYoYeYaWRyl/HAUoI09osp6zqy8oJ+J4exIP9lpVfVlAAD1W6wfdduM8FK1nTJAwlRkDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5fe086fb0bcso462082137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 03:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772190510; x=1772795310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDfQnSnUgwZ0D2gaoP/+jse3qzI6E0xxpEhaImQcbyQ=;
        b=j4R8YvJ+171HILjNz35VAHxb7/cu7hEKx4nl7c+PrH0joAlsCWMe/fVFOTUR8hI5Zj
         fln0OaBjLXIz1h/yU1rylp5lygES2mAtikEHw2QvxLj3w/welC3e7IbPzL510s/pV9MK
         BR5JNR8JoXspwBiEdhps6zOL2QmrR/CEH44FixkG+pfKyo3qWuD1nelgptZhjA1lxYAt
         Lm0w67jb4qtB+HoU1llYxn4cZ/2jy3RQkNxNY+MMGljuYQ9WGuW2ndRiMSeNEKv3uA0v
         6N0xFSHjugTc58fiZfFKukJRGhlp28tV/Bh0ltHUeXEaWyJyis4fZ5IZfnbeeF0CaaFV
         Fvnw==
X-Forwarded-Encrypted: i=1; AJvYcCWxAMjVwySIRDvXHMNh2F5E74GHvGH4/ZAMS/GSwmouUFY88c6laXsZTkqjMTcmjrW/48nkHsRjmQrp7L9LzAA5Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOkk0jtAK/x2KvF8KHKxTzsVBJc/eUmOc7N7NzIk61LNbjR+FZ
	DmAfuh9xKtGdNWzjwaUNoc+ERYoOHX/w3OiM0HzmH2SRHNa8K6PDcnq8pafO6phQYSA=
X-Gm-Gg: ATEYQzzJrOTldOSsVWMerDroA2X1QbLA6YmoXr6g4B1XEW1In2oin/jpFTxkFJxEj5e
	nF+9dq6nn7Q64tQkMhY4iyMQV/PkxsL4/ecgCFZ0wYLQFbnYzcI+IXBw+QiYfHUoCwPBMF9SSxs
	pGKyTgmIkDcz04usSunhchaOrcmfOiw43UGQ8tiaHx4qE3mq9Vi4uDuqBaahBxAtPnOSwCmwVqn
	HL9q4Rcjzr8k/3VsRUR/5BTziFqcj9dMBis+MdxU5BL34vz9XSMd6jF2hM9Ggcw9Oxce5nLHwro
	IOhal4/iBo49kEYlGJE0MdsDMAwyTgLu+F8s2ZOjkYFKWfjZmKeroIcCumjwYE6Md7qv6yihSMY
	YEgm8bAulAH6lYLd4xjSkM6dwDBVA1345m/nxI6XIoDrlwjBY0y2kSRkYQkebZTx3aa8Ao6Viav
	Pudq+djGlUdakhpJcD8R1az69ncxzPN5Ep8nf+0f5mihYRpCLTfii4v7rG5u8mch7p5EVBg40=
X-Received: by 2002:a05:6102:2926:b0:5db:3111:9330 with SMTP id ada2fe7eead31-5ff324f68bbmr1084928137.27.1772190510574;
        Fri, 27 Feb 2026 03:08:30 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df65a2a0esm3984537241.12.2026.02.27.03.08.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 03:08:29 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94de664b541so550071241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 03:08:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsikPRweFRLbAJjdNyNsHLNJrNhENdTOgLgzYlQYmi5F4NyRHblFtUM4CuEWCSSLXuCvgvWvgPyFX2KTjm7Y0Gbg==@vger.kernel.org
X-Received: by 2002:a05:6102:3746:b0:5fe:49f:e89d with SMTP id
 ada2fe7eead31-5ff3256fd36mr1144024137.36.1772190509483; Fri, 27 Feb 2026
 03:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227015216.2721504-1-chris.brandt@renesas.com> <TY3PR01MB11346FB8BDCBBD83203F776FC8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346FB8BDCBBD83203F776FC8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 12:08:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUio47o1V4KBZyzu9zQdN5SxfRCPTmdwhV1E7EdNL-0CQ@mail.gmail.com>
X-Gm-Features: AaiRm51gHW9GETMAes2Z9ivngK3oJKl1o5FGPuNM9TjngwCQIps-FMH-5H7ZGvw
Message-ID: <CAMuHMdUio47o1V4KBZyzu9zQdN5SxfRCPTmdwhV1E7EdNL-0CQ@mail.gmail.com>
Subject: Re: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,hugovil.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-28520-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8AA481B65C6
X-Rspamd-Action: no action

Hi Biju,

On Fri, 27 Feb 2026 at 11:50, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Chris Brandt <chris.brandt@renesas.com>
> > Before the MIPI DSI clock source can be configured, the target divide ratio needs to be set.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Fixes: 5a4326f2e3b1 ("clk: renesas: rzg2l: Remove DSI clock rate restrictions")
>
> As my testing shows the above commit breaks RZ/{G2L, V2L} SMARC EVK connected to
> ADV7535. This patch has functional dependency on the above commit.
>
> Hi Maxime, Maarten Lankhorst and Thomas,
>
> Can you please apply this patch to drm-misc-fixes please as the
> display is broken on 6.19 kernel since the above Fixes commit?

s/6.19/7.0-rc1/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

