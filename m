Return-Path: <linux-renesas-soc+bounces-31700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCeOKVSO8Gl4UwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 12:39:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D856D482C5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 12:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9650930DE916
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 10:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818FE3E4C94;
	Tue, 28 Apr 2026 10:25:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189F3EB813
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371947; cv=none; b=RA9CJRG11iIMBipuUdaxc3Qg1F2anXOdz1DMr/lLK7DermHd5kMaYamxmZgb5yavLwVSCcdt++KKWWImhEvB+F5dlCmN3i+pacBVIlyK/RpP3TpTfzCW9C6gZvWD7XxE0O5zLEXjzHKxUseeGhSxzeYUTxExCzAbIXev/uBTrF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371947; c=relaxed/simple;
	bh=UG+AWWYF8+8wcJMCUjbTFh4VwOPAlhF8FZLDzvsNMAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVB7glKmEpIcBoNvytq6Xrs1V7f+qLVf9Y4AbEH6oiLKDmiJyQ1wzm6c2KKoylq1YtHZD3XseiSiqit9PVHLflfHgADNH7hwwij/qr/HkX3EaeXtmQftXIl3Za4u7fJ4lsmpaR5pz/h8jAemejk9a0jR003PMn3FR5tiFLPTYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-953ac1602f8so7257656241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 03:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777371943; x=1777976743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX0h1Y9Mkq6p8qHdHFJchBdDb8mSjHkwiA1G/+/zjKk=;
        b=ZDjr54lXYOoRzXJexhV87D0g0Kz/JyZ+fFwRyw31Tl8m1Wz7L+M77FH8tGnRSkEiiV
         UW0DuNK8PxmrQM5fjOLHY3GViesJltzQDZbHNd0kFo0DM2A8BLhAjZV3dLqhlPqGYYvA
         e064N+zSFkm79i8BBgbl5OlISMSYqN6KsJe7RYC12Euem00Osio42d7EuWjZbkHWTvuP
         WkckJOpgWuzOeYht1s6/Os+zKnLKz3yCdX/nVVTOdCOGSkBIOEAJeUoFKtoUHYVeApOh
         tKTuQlMHncWwxvguXjGqnvg0tqPuaVZJE2dwTptfONRsVAtexd2293YFhyGa/ilbDdCK
         vxIw==
X-Forwarded-Encrypted: i=1; AFNElJ8v8xAKL5EwGLoifEi+PvS5OCLqBvV8cpUxv7mWjdi3ijwgEt0/0ZfpsxgrZBM+uCCPA2kDZvHuUphSNMszaAKaEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJxo14h056KCm+Cc/52IkcNitujww5PK3xBl8XPBqonJBfMGp
	8kfYkFcexU38dCy6TLTk96f71JzVQeWcYTOHAxEaEF0VTVooBmPYNqKJC3fvORv6FcM=
X-Gm-Gg: AeBDiesBpAUoDG1sNApx0RhsTPM2li/nGuhogLUvF0i808pWWciOW2Af4BmwQ6TzlJ9
	smoYMKL2b3JGz33BK+3zo26qJymqBj2wl8JFWiXLCFLmy0pey4C4V3EleMuH2JBzy/bauJsaRv8
	/qdXWjXKQ5Q7FcUiqcfRtwKkuvhiNsqKs7PKY6p4zHjldSj48N2g8DF8fGXVJ/owNEEyjvcvI1Z
	JwC+EEa2rt4kiQQVSXpU7JrCF3nzvtWOoDF6QlUZEOe9FQSZAGhhuaJvmoTgSpzlXIwc2uRxrJi
	XENfNK4DwhCJ5BVrU3+5jQZWO2//lec/UhlNif1Negw96p/qKepj8Eobs1g7tN8AkAkeAY6mn2a
	55IUMGN/GzfPsvhLJsW1UgYorihnxuGKRalqTS/SUjx04uLzSsCCVhIsdDhRmO+JQ+jYXBViAgZ
	wqraUtwjv7idvXm6zGXf50Cn0JJFvlFM3tvxBpoOuz550ZyfIjZe6zcBE9RhxG4/xz/K/KN6LvK
	7s=
X-Received: by 2002:a05:6102:38c9:b0:608:ce6d:4db1 with SMTP id ada2fe7eead31-62805bb1271mr615653137.3.1777371942870;
        Tue, 28 Apr 2026 03:25:42 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-627f50790dfsm1005326137.2.2026.04.28.03.25.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 03:25:42 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso10236265e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 03:25:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MSpvJQQLSA/0EsBCXZnkv/rVmkGtxRlTg2kMmLLIripLaqek9gr+/ePhp5Ciq540Tcp0Ow2h4iWz4X/6iOpMzmg==@vger.kernel.org
X-Received: by 2002:a05:6122:4b81:b0:56f:b831:909c with SMTP id
 71dfb90a1353d-573a54f6dd3mr738558e0c.1.1777371942065; Tue, 28 Apr 2026
 03:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com> <20260415124731.3684773-15-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260415124731.3684773-15-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 12:25:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnZhUeY+498Ot4wCjRKM3YEpq9C1vcqbyKe=_Rt4O3Aw@mail.gmail.com>
X-Gm-Features: AVHnY4JGBNGTte30b8cNYuVFq1Ftrjan7Mckgl-ml10MKOiPXuleAlM2Dd1l_54
Message-ID: <CAMuHMdWnZhUeY+498Ot4wCjRKM3YEpq9C1vcqbyKe=_Rt4O3Aw@mail.gmail.com>
Subject: Re: [PATCH v5 14/14] ASoC: rsnd: Add system suspend/resume support
To: John Madieu <john.madieu@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D856D482C5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31700-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.537];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]

Hi John,

On Wed, 15 Apr 2026 at 14:47, John Madieu <john.madieu@gmail.com> wrote:
> Add per-module suspend/resume functions following the existing driver
> architecture where each module manages its own resources in its own
> file. core.c provides common clock/reset helpers and orchestrates the
> calls in the correct order (reverse probe for suspend, probe order
> for resume).
>
> Infrastructure clocks (ADG, audmacpp, SCU) are managed globally
> using optional APIs to remain transparent to platforms that don't
> specify these clocks/resets.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

This causes a crash on Gray Hawk Single (R-Car V4M), but not on
Salvator-XS (R-Car H3 ES2.0):

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000008
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    user pgtable: 4k pages, 48-bit VAs, pgdp=00000004879ed000
    [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 0 UID: 0 PID: 675 Comm: s2idle Not tainted
7.1.0-rc1-arm64-renesas-03756-g4cf47bc1e3d7 #3579 PREEMPT
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : rsnd_src_suspend+0x60/0x98
    lr : rsnd_suspend+0x44/0x6c
    sp : ffff800082e03ab0
    x29: ffff800082e03ab0 x28: ffff000444022ac0 x27: ffff8000817d9050
    x26: 0000000000000002 x25: ffff80008073dd64 x24: ffff800080ab0b20
    x23: 0000000000000000 x22: ffff0004408a84a0 x21: 0000000000000002
    x20: ffff0004402d6e80 x19: ffff0004402d6e80 x18: 0000000000000000
    x17: 003fffffffffffff x16: ffff800082d8bc18 x15: ffff0005bef86f00
    x14: ffff000444022b40 x13: 0000000000000112 x12: 071c71c71c71c71c
    x11: 00000000000000c0 x10: 00000000000009f0 x9 : ffff800082e03880
    x8 : ffff000444022ac0 x7 : ffff0005bef86f80 x6 : 0000000000000000
    x5 : 0000000000000084 x4 : ffff000444022ac0 x3 : 0000000000000000
    x2 : ffff000444022ac0 x1 : 0000000000000000 x0 : 0000000000000000
    Call trace:
     rsnd_src_suspend+0x60/0x98 (P)
     rsnd_suspend+0x44/0x6c
     device_suspend+0x134/0x3d8
     dpm_suspend+0x164/0x268
     dpm_suspend_start+0x4c/0x64
     suspend_devices_and_enter+0x1c8/0x544
     pm_suspend+0x194/0x1e0
     state_store+0x7c/0x100
     kobj_attr_store+0x14/0x24
     sysfs_kf_write+0x78/0x8c
     kernfs_fop_write_iter+0x128/0x1d0
     vfs_write+0x210/0x390
     ksys_write+0x6c/0x100
     __arm64_sys_write+0x18/0x20
     invoke_syscall+0x50/0x104
     el0_svc_common.constprop.0+0x3c/0xd4
     do_el0_svc+0x18/0x20
     el0_svc+0x24/0xd8
     el0t_64_sync_handler+0x98/0xdc
     el0t_64_sync+0x154/0x158
    Code: 6b13001f 54ffff0c f94013f5 f9402e80 (f9400413)
    ---[ end trace 0000000000000000 ]---

> --- a/sound/soc/renesas/rcar/src.c
> +++ b/sound/soc/renesas/rcar/src.c
> @@ -848,3 +848,29 @@ void rsnd_src_remove(struct rsnd_priv *priv)
>                 rsnd_mod_quit(rsnd_mod_get(src));
>         }
>  }
> +
> +void rsnd_src_suspend(struct rsnd_priv *priv)
> +{
> +       struct rsnd_src *src;
> +       int i;
> +
> +       for_each_rsnd_src(src, priv, i)
> +               rsnd_suspend_clk_reset(rsnd_mod_get(src)->clk,
> +                                      rsnd_mod_get(src)->rstc);
> +
> +       clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu_x2);

Apparently rsnd_priv_to_src_ctrl(priv) is NULL.

> +       clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

