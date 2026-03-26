Return-Path: <linux-renesas-soc+bounces-30356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iILSDu48xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:04:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF63367D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 995E43110281
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA4230CD92;
	Thu, 26 Mar 2026 13:55:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3793033E7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533328; cv=none; b=Jl91v8KK0vuJ3FrZbh8WQdA9RygFHx7ZFFwUaf8Ij/huA7aG0c6LrhZUec95QYXwgqncpDM/rlcsZRuB5c7ki7bawAtH4go6HvgKqtkWI3MPmqNfN21HH5ULf2jmT757qFuYPo8C5OWgR4IQ9JMZNc/V6E0C6TnESXiudsvOheE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533328; c=relaxed/simple;
	bh=BqVzxxwA86UD9pUCKKd8k4HfvcPEqtCoQm2hTa91rGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYt4NpQ8l4x7qvkL628k6d0SdCYTVH/5Af6Sg05k5YRFt/Y/gRpBuGuZ95X3kDYyaR/1k3xFS7rEkfD3KcCF/j9n2Qnbwqona2IawMe4qxmYSiAYwliyWArMNva7Ic9AOzuptnM737iL+0CsHv2sKEgVfOZ0ZTgXytuFWooh/YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5fff13d5a19so1419866137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533326; x=1775138126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BO+FbqAgMS/l/OrAPFbPc30FGp00FfB0y+WOPSOhxmM=;
        b=qyXnWDe5fWzthHtB4OVm6zT9l2ZheRcuvF/MFE16Yt6MQ1mh4ocFCzbrMjdKG3O6xJ
         bWQ+gsZUCNQ0WclL6Vz5nRDsXgZRdD9oRJhAFBJlvStbai5Z+tk9SnFEi5Js8qUoU0sZ
         OOPcmmdEkNS2sAGvfEY8/7uyUN+yJ9GN6TgMDIcr9qLg5Ex7z1f/JrgD2cCCUNkEkpBI
         g0aNsiPLpp9CnoR/35wodSedKUK7PgIyEro1xU/VM7jQwDSrr+iXgFQbGxDdaENmI/fY
         GgjMod5oSDZGTiPoBIin6m2f5ANSWhDRaYznTpNHtgO9meaqJ2MXodanHQjXzWzjQDJX
         N6+A==
X-Forwarded-Encrypted: i=1; AJvYcCXuPyOWS4RUMcnoym1lkuIBEntA7t9dZocG9AQHLt/MUbXB3v7mGDlBkvS6FBdpc4gSZtzvn0Aw9RmVnMfk+abCJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh662xkqrWfU3RR+JTjlH2EVdpPuJm5Wt6t3OSzZ+/GjVrDUsa
	sm0btS2cWI1NrZrirOkLR1EWMC35fls1mhrFbK0TpfDM5T++zD2wbtw6Umk+hyZXQdg=
X-Gm-Gg: ATEYQzzvxn8KGL6LakWc9/rrgytCOKsFk5c4lsXRQGhendbmMkbCvIZGYSLNCxcEjD8
	fpDmgCDlkJ4MaE+KaAaVtL7Y6vku30OuF8csWHMZqAXu1ug7pXoL6+xOWR0d0giBErkrcoDjvQT
	kajlMaxyKFF2y5uLS8sBDFcmTSVxh+fjzemZiYOozQkAE5VWm19hqM3Ls46y6T1t1R4mZ8XMjUb
	ESiLFRBo8BINW9T2qzzRmxjTwhj4wm10prUo9Axt0MHpL1lzHD1rP++qKfywCFvDdutA7TCxX0r
	HCpww9LYQvz1bPLeEUiV2QDymjCP8cUJmwnoIhgsj2odYyXhtLZTf4XW4VlSMKWBpHPurOdl/Nx
	ePh6KOEKUwLkBd9wl67aAnmrsl6ihgmzHFjWGDFvc1jaFc+N2wFBaZpBh/emaeor93t7WYI2xvb
	lvnpQjoMjAm5STBIIV48H2Uh7dWGsPosMCPWvB7KeciLBfe3rVfPFPA0IPgAYv
X-Received: by 2002:a05:6102:5816:b0:603:1ebc:2632 with SMTP id ada2fe7eead31-604e4aecf9cmr513616137.6.1774533326126;
        Thu, 26 Mar 2026 06:55:26 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d5105e59sm3126826137.6.2026.03.26.06.55.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:55:24 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94ac3958788so587249241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:55:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYEGSOsIZkhNE3/yv3uOaCaUV4EyTcx4IPojcQ5DIpRLEohueAQVMDbBiAm6tSVfEfdykjeP+s7SYXnBqZaZ8LHg==@vger.kernel.org
X-Received: by 2002:a05:6102:3914:b0:602:aeb1:730 with SMTP id
 ada2fe7eead31-604e4ac80bbmr587618137.6.1774533324225; Thu, 26 Mar 2026
 06:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:55:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-KW-d9v-Fp-MAg6JSB6o5FqC9U1KDbf2Ay2Fdi9FGWQ@mail.gmail.com>
X-Gm-Features: AQROBzB7sxTkJhDW8HcwP8aExdmtdPeMkeDY2fZPSNNJ9aG78EfyJ0tUfq4ycyw
Message-ID: <CAMuHMdV-KW-d9v-Fp-MAg6JSB6o5FqC9U1KDbf2Ay2Fdi9FGWQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: dts: renesas: Add initial device tree for
 RZ/G3L SMARC EVK board
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30356-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: 64FF63367D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.
>
> Added placeholders to avoid compilation error with the common code in
> renesas-smarc2.dtsi.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

