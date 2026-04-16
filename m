Return-Path: <linux-renesas-soc+bounces-31327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K+AMADa4GkdmwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 14:45:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9640E59C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 14:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61E793080A4D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 12:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF49F18BC3B;
	Thu, 16 Apr 2026 12:45:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B671A6811
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776343510; cv=none; b=Wpsxe1ZOKdNSL0mwElHbOii0Mv9DpiWN3yBtq9v+MGgDXqWB2UqcbkHhDV6NPc6ZTLqpIsEmAQjN/1/AtMHlMlVCkYcj9mrWeXq9jja07+nXPfezAbdAA8OrqYqIpRCmfE9nTJorn67wmbyasFRVAsoKjkuug6SrFr8UQSwUpC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776343510; c=relaxed/simple;
	bh=4kn9I0bcpQj2uVpf1c/P1i5ST8RdY7n9EFWCzmeUKtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqAoFfXz2VjLBWdXw2xS0z2Pg08sljdCzZzi6IWuj4cufiK1Lvdp8CuKRCEbD5ESNE5lCELieiOKUgq2yy7PHhlbtgOsIoHAQK1Bro/XAZBOFVQygOQVEZUtqXO3UMt+P2XfLu31fKeiV09hl+zzSbrPtRjpd7rafNiuGhy9L3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-953ac1602f8so360138241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 05:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343508; x=1776948308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6Trmvc791/1rDJLy3WyaJKC+o+3NUld8T5eNLrCZnc=;
        b=AGWA92hCBWwlXhZKXmV/8bkJNVNFgyabl4ALwkClNbsRr6cARWZBmgdjbyCTqMwrQt
         e2/+WpcLUl3hDGgwhThUwiVgcwFWfeb1Q39/6Sh4IiTYjGpyWAubk658KzqQTkcB803V
         Gb01YERMsjh69fxJx9nkLyMbD1ZTQ5JZXHUmfkxuydl3JtbyIr4DVt5e2sYB/XITKSIb
         3uffgkM8b4d0v0aMz/xLxXH6n1Y4Bj8igb7IxpMEdUIc4MN/qHU52+zwxKexjHuPzy4F
         EotdcxvlXVxQ8KKSOaeJDi0NhxUpOxDmqmcqPnpdSw7AUnwrdDMWZLKfDFJFCfmYaGtS
         zlOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6ffp5lL3b0Ol7aosvn8WBt/JP3XqwtQ1VtvociBApwI2ueWmFZ06MZN4qtlkaMiyBvrNDZFkW3KTLSylsNxjd5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0IZVVo4muqSJijW6wimktHB9zBUjOgGajHvROreH3j5/V3hr
	6CmdmG9v1knRQ16FRhE0scmPFjwhG1N38xWD8RnIyMCxRwDMt1wyOfvpoDLRJS1E
X-Gm-Gg: AeBDiev4ixQpc2RsdYZZ17Eb+tVePZB5G6BsqxBctZDmkyu2oTj9Rh9opkvHh4uLlyS
	iqBinnF6BZ1cVJjRHAujv2RbbVEQ70oGLGl7DZL/IspZJx1Mwp7WbkffVRBkZnHToywW+Gb98BG
	EgqvbLxRebTSZ+Oh1gVTCwJ6YqkBTNdnofPh5fD8p9NunEthw4wP8C1ezZSiXow0G2bPpfYRsGe
	42CVpcwK8z0Q/GZy/7hIALA/jGktigMVAe/bOrroclFR10Qd5kJ9VZ0RMt/uICrjSgupRkN84SK
	0aSYsAr3VR9jHWQfOJxI/TuhuZZJRWwPVDe068IqX3HX1QihQdTPMbnSRZEX0MhyQf13po85YSa
	RTQfHCiW4R9GaNwrPUTNwfVddgqOoQnpcVsqsUuKEzmABN2074ReTYxYJr0E+wqrJXG6214IxSP
	TX4K9OzgqZ6LHH8qVrsRz6mD0rLCLsc9XGt82EoK/ffmsbSNUFK4mB+sI77sVtQ095wObiuNE=
X-Received: by 2002:a05:6102:6053:b0:605:6468:bc86 with SMTP id ada2fe7eead31-61468ada66amr336046137.0.1776343508169;
        Thu, 16 Apr 2026 05:45:08 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612cf6fce00sm2313423137.10.2026.04.16.05.45.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:45:06 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6058a955e04so392868137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 05:45:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ83rIpPSmoED2PQePuErHCjk6F08YmLuCK2Cy/GXZkWVqqebnIh/yIvdy5l06G7GZUMs5VN6YYQtihVi//5E74+ZA==@vger.kernel.org
X-Received: by 2002:a05:6102:3584:b0:600:d0f:bacf with SMTP id
 ada2fe7eead31-613bc3401cdmr1332642137.11.1776343505953; Thu, 16 Apr 2026
 05:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
In-Reply-To: <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 14:44:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
X-Gm-Features: AQROBzAlwTEokj2EdisJZZId_dsgmifb7t182C9EYzjoqr7qTm3MDCvnELzLUhU
Message-ID: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31327-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 22A9640E59C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bui,

On Tue, 14 Apr 2026 at 12:41, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > Flexible is not allowed. Provide reasons for exception.
>
> I understand and will remove this approach and replace it with
> explicit valid clock combinations.
>
> > This goes to the "clocks:"
>
> Understood, I will move the description to "clocks".
>
> > > +    minItems: 1
> > > +    items:
> > > +      - const: own
> > > +      - &fsi_all_clks
> >
> > I don't understand this syntax.
>
> Understood, I will drop the YAML anchor and use explicit constraints instead.
>
> I will update it to the following structure:
>
>   clocks:
>     description: |
>       Clock driving the FSI Controller :
>       - "own": Main FSI module clock (must be first and always present)
>       - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
>         enabled to allow register access as the FSI block is connected
>         behind the SPU bus.
>       - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
>       - "diva"/"divb": Internal FSI dividers for port A/B used for
>         audio clock generation
>       - "xcka"/"xckb": External clock inputs for FSI port A/B
>         provided by the board
>     minItems: 1
>     maxItems: 8

'move the description to "clocks"' means:

    clocks:
      minItems: 1
      items:
        - description: Main FSI module clock
        - description: SPU bus/bridge clock [...]
          [...[

>   clock-names:
>
>     minItems: 1
>     maxItems: 8

and:

    clock-names:
      minItems: 1
      items:
        - const: "fck"
        - const: "spu"
          [...]

But this imposes a fixed order, and would prevent optional
clocks in the middle of the list.

So you may be better off using a similar description like in
Documentation/devicetree/bindings/serial/renesas,scif.yaml

    clock-names:
      minItems: 1
      maxItems: 8
      items:
        - fck # Main FSI module clock
        - spu # optional SPU bus/bridge clock [...]
        - icka # optional CPG DIV6 functional clocks for FSI port A
        - ickb # optional CPG DIV6 functional clocks for FSI port B
          [...]

>
> allOf:
>   - $ref: dai-common.yaml#
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,fsi2-r8a7740
>     then:
>       properties:
>         clock-names:
>           oneOf:
>             - items:
>                 - const: own
>                 - const: spu
>             - items:
>                 - const: own
>                 - const: spu
>                 - const: ickb
>                 - const: divb

+ the above making it stricter.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

