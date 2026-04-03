Return-Path: <linux-renesas-soc+bounces-30815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJwhHTduz2kTwQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 09:37:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E6391C58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 09:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFA7330315F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 07:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92F426ED45;
	Fri,  3 Apr 2026 07:37:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51818374E7A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201828; cv=none; b=ZvotnLrno9i2YIB1w80g7xj2PeIaLrFmQWsucL8MyO7zB7qmQT+FXJ9s+5abvTi8oiR2M1NYnHVpuZ10UqyLl6t+NkJ5vol6KuENtpkxm8IuS1znkJx9aMHMIMIxu9q4WVHh9TOOrY4QvdUN30RMPzX8omDMm2UUUU06lEOTn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201828; c=relaxed/simple;
	bh=RQFIDvkQ6UcLgwztbD8oBHl4tS+ZCKb3aINkg7VeBsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQEGkpJPvP2xbGKOYSR7mweR+y94sdNZbCH7eL/ahQCFTjq3HrS7ZzdNHDk9NaBN3LvCnC2Qr4pTH7Iu3DlOxo7HsgjysT3qXZt+XdzzXXd4sENA+Tf7Et11CmNqa4pS7MNJULCLBmTKVO1Ce2U0C8HOcLVm+NprLreFlpm7xnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so1280304e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 00:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775201825; x=1775806625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4N0YKA/XUUd7O8Nr0votH0EtcIVeq9XRBqx9j9NkIk=;
        b=OAT51Ps138hzrbFOy2F5K1x79m7a0fvXr1BCNRblpOVaHHCPdk9LUbtIEIwNVPSH0c
         IaSSBKeElnGHasurX9P+v98gxAnb12lB/jqd4L2/rjNDKOgHAUns70t+rQ+bjShh1dan
         5yosqQksY5w/mMIdW7t+1JQIv9XNjrfGPu0BsVgWwLsPhzyHPE6ZSv+6B0Ioy7hUniA3
         1dKcs/2oYfIwnanwrgMfz0K6bK92oviPQGuDk6RDo4IUvT64udaUgnZh+ORNdH6EvOBX
         VRcdaUd2zlKFU8wYritS9STxBhBTiv6vOV/n1NtjszmU6bvXK+Mf7LXcJPpE0G+hAHEJ
         G1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFft9TijQvtrlGF+Gj9wcXvXhFE3w279BfrxxjKCkKaHER+Ft9AZKL5z+FkdG+DTc2sVwEY1XqPV1yEV8lolqQbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDc47j9j48oYgfP22PcaFizffLTIcL55oyLNzmuCleZJRrVkNz
	tGttYcxP6aDC31YJAdPzNKgzYF0ENUp0xvZFrVh4MGKbOS/Y5/c+kyy3XKDIuQcQ
X-Gm-Gg: AeBDietcM7q01I/toFSe6B6KjXKU2WJJjdnCSGUbxRb/0ci5OLbek62VX9b+sZJpf1/
	sfkQccu16sXXKIAbfT6jI7V2LmkR4y/ysVkGT4nGCXggd6yxLvmF0VFaE1+JDxjybK+1TWgWzFe
	Klg2wrXYbpIwFhqgLfonbYxhL3Pm4IPqdI2zRBOAnUZyTI5nvAp5bo//jTp/AQfXhBEbxoDLZO9
	qYxL1QsFEnsKczlTTkWElTpbq4rxtjBaNyJgA3RpIAC6gtKU76bW0WqXMF9NrXIxouRZffWtuAK
	PqcDc9VwZDz7jCS6ESlJ+/QWnpK9Oe3OYFqyhEeb7P2XjSLxgFzUrP8lAkj1CP+y+H9fQA977he
	MdxgtACTJiEWmxAxeGtN1J2YfmhFRRih5WFtK98CSSYmxEYPb9zch5hL1dPDXaHbVwCdZJxalaU
	ks6pCUFkGi/jDHDCzh7A1g3Y3/cNxH/pEcCF6aPhyjHjyTRk5y5fA32jtS5BI+
X-Received: by 2002:a05:6122:4d03:b0:56b:815c:961d with SMTP id 71dfb90a1353d-56dab86ed80mr765343e0c.5.1775201825227;
        Fri, 03 Apr 2026 00:37:05 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba81b53sm6108788e0c.4.2026.04.03.00.37.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 00:37:04 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-605a8c4ebc6so323674137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 00:37:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfGU+uw1Taq7HSPfxBiwxqot4ROKgF+n2AkE36nadenWgiGTdnNybBk4xrJDeiuIGJhB30PcbNjraWU4at92a0ug==@vger.kernel.org
X-Received: by 2002:a05:6102:f0d:b0:605:315f:49f7 with SMTP id
 ada2fe7eead31-605a4d81988mr717338137.6.1775201823680; Fri, 03 Apr 2026
 00:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com> <20260402162436.12059-10-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402162436.12059-10-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 09:36:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHzcq_f8t0hi-FjiG2FByNmx8k2sz9-QEqzroLSWqXNg@mail.gmail.com>
X-Gm-Features: AQROBzCXZAB5loNy5rsTC4EAiI9aKFN2pLERVORaR-uHChRoGZT6taMr9lCmLJs
Message-ID: <CAMuHMdUHzcq_f8t0hi-FjiG2FByNmx8k2sz9-QEqzroLSWqXNg@mail.gmail.com>
Subject: Re: [PATCh v3 09/14] ASoC: rsnd: Add ADG reset support for RZ/G3E
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30815-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.335];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0E3E6391C58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Thu, 2 Apr 2026 at 18:53, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E requires the ADG reset line to be deasserted for the audio
> subsystem to operate. The ADG module clock is already managed via
> rsnd_adg_clk_enable/disable() through adg->adg, so no additional
> clock handling is needed.
>
> Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rcar/adg.c
> +++ b/sound/soc/renesas/rcar/adg.c
> @@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
>
>  int rsnd_adg_probe(struct rsnd_priv *priv)
>  {
> +       struct reset_control *rstc;
>         struct rsnd_adg *adg;
>         struct device *dev = rsnd_priv_to_dev(priv);
>         int ret;
> @@ -779,8 +780,13 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
>         if (!adg)
>                 return -ENOMEM;
>
> +       rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
> +       if (IS_ERR(rstc))
> +               return dev_err_probe(dev, PTR_ERR(rstc),
> +                                    "failed to get adg reset\n");

Given this file already uses lines longer than 80 characters, the
above statement would fit on a single line.

> +
>         ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
> -                     NULL, NULL, 0, 0);
> +                     NULL, rstc, 0, 0);

This one fits for sure.

>         if (ret)
>                 return ret;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

