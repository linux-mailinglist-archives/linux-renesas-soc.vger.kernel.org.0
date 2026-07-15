Return-Path: <linux-renesas-soc+bounces-35243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3h8EC9dKV2rkIgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:54:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32775C16F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:54:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B687A3005D15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 08:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042323D88E1;
	Wed, 15 Jul 2026 08:49:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B633D7D8D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 08:49:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105383; cv=none; b=M+rN0iWj+DRKSBg//9AAltGoaGu8JtyNmRigl8XxMdSJhShhZ/h00iknbee/mFDTW59Km86ED2OIUT5Q4LhipGXUgZr55s5e4TMkC0hWQ1Jx952uWOw54gR4vnPKqI64X41z1Y9DwDqEF7oN12dq3oeW5oRi/xxqzEvpDZygpbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105383; c=relaxed/simple;
	bh=sPupfMIvRyc1zwc1GOdAnPJmK/zIKkGIh1ujRUFw7q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UB27kINgNj5dfApRPsb48ghCzrxz25EGeJLxpdZzx9WOQDVjawIuGibvwF5TPbdQu3rZfSeQAV/fS9B4oRRAlUph9GTS6EJ/hE8xM5eBonk5I4S3fRkEJ2JqYxbKyK/fsvlv37qFfriT37YRYPI5d/9uup/NgguzaQAGczDzyH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfaf91daa2so571804e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 01:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105375; x=1784710175;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1TRR41G4fbrKFn7izDIjOVXGMByR097P/ma6UvjSrTg=;
        b=SX9fWagQVMBs4a1RsBtSdTflZbMaM4aMjmYq+ZD9q+htb88rudB+Ohnnq46hoChzSv
         roQ9svqJm3kad55FdAcL+EZm8LpY7Q877KXLkVcgeRQBYyald+SVdfF94i2953sMHZKV
         qro+zY4OWlMy57EV+XBq1n3OUwYuwx3+dZZQyvWl4nTotb4YFJi+b+lIuMyDZD9E/Rd6
         HnmOi+YYn408eqVWqTct0Ddey1vXLAu5y8Tr3p7NJBvmCdEkgUZ13q2FDzLu+1yGG0GR
         ZWKUHqMUwONWTjTaYqigIOn8wD2o4h1fY4haLYwL/DVOIqM84HmxGaEbVJzBSL/P5eZi
         qABw==
X-Forwarded-Encrypted: i=1; AHgh+RrOwunYPSAZfkIuAKWuCn5UQvr5vKnVk8v+/pujdU6LjofeCQ9ZNnejAe0/ZPYzfMcUcNVLMoWtwyM1Tigr1dH/Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZpvFl6og2JqaWZ0IH4XmGgQdS86WdSq4qmjlxdzCt0YBLUQ4
	YZcSv0W8pQsL7QcLJB0kpFWCJQV5sqgUqb/zX9r68pwiee+KfhIQS0wUmDLsBxP7i6M=
X-Gm-Gg: AfdE7ckAitDI/Ka1k6lzZxKFiVsVzH4dHZtKa+8Hg6m0iBpq3tg0Tsp4Ik9mDcfp9UH
	U/Gn0W+j51szert8mSbETiVi8jXzUuryl7uCEnmyTFXq8XTyqe5xRIsd3q9SMQXepTmY/5iaeVa
	SVFSOMq2ZbBb0lTXa4QhV5oI1sKmnhdwfGGIqU77Rf8pUb7/JlLRa0kO0H6vheNPxZ8ekWbogsA
	Gns1E0kx0JJ0EVAydgSXY/VLeuiCNjn9GrjfO/X0cXSz5NpFqs0saoylDajxghQHiWgztktVdNA
	vECQhK1Rh3eWwfygmpmZabIOkFQsIIhpzq0eqgS74lrvUZV0OhHZoDwvJqn4Wmg83C7hUOTquPZ
	TdlbiJD8UcSh3ayCn0Pd2kYBiCINu2RWV2hdJWU6ySe1pmF4wN23QxY5dx6PA8vl2qppjyrby1a
	0IBGFLieeGQrYcZp7QGsBUGSwbpPubPEiOI8gvDJeOzRcxbEK6oz0ftTXhGopq
X-Received: by 2002:a05:6122:660c:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bfbf39bab2mr9358971e0c.11.1784105375391;
        Wed, 15 Jul 2026 01:49:35 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed5d4da60sm10444751241.8.2026.07.15.01.49.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:49:34 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7466771f1caso85461137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 01:49:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqSnOI1n10zbSb9eUVX7l3A/jt+cKpI9FRnvSQ2uAhCu5LavKmKfZEWR6Psj8msUH2CGQmGEsikaXasqZiG8y8mkg==@vger.kernel.org
X-Received: by 2002:a05:6102:5810:b0:744:dc62:55ae with SMTP id
 ada2fe7eead31-74533d60832mr8373853137.16.1784105374266; Wed, 15 Jul 2026
 01:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:49:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfwYbMhzU4Q4L3Gz1vaatJs8gdgPytVGRUCzWAHTVK1w@mail.gmail.com>
X-Gm-Features: AUfX_mx1W4-bigTkTe8QGRV7_w2yUpf2F_MMUV3Tv1JEabEnQSmtIJ8bjCQbjW4
Message-ID: <CAMuHMdXfwYbMhzU4Q4L3Gz1vaatJs8gdgPytVGRUCzWAHTVK1w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: generic: Card name parsing should be called after xxx_for_each_link()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35243-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C32775C16F

Hi Morimoto-san,

On Wed, 15 Jul 2026 at 04:13, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> "tidyup simple_util_parse_xxx() in xxx_parse_of()" commit changed the
> function call order. But simple_util_parse_card_name() should be called
> after dai_link settings, because it might use dai_link->name as card->name.
>
> Fixes: fa6222d5e121 ("ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()")
> Fixes: b8081307f5c9 ("ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()")
> Fixes: 27ecf4da5ad3 ("ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()")
> Reported-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/r/b81ebfa2-6a35-4ff0-9d04-b867233eda4d@sirena.org.uk
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Link: https://lore.kernel.org/r/20260714103428.2318895-1-geert+renesas@glider.be

s/Link/Closes/

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks, this revives (at least in dmesg) the sound cards on Koelsch
and RZ/Five (simple-audio-card).  Sound cards are still instantiated on
Salvator-XS (audio-graph-card) and Gray Hawk Single (audio-graph-card2).

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

