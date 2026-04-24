Return-Path: <linux-renesas-soc+bounces-31607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lFuKIa4M62mvHwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:24:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A43C45A353
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4712630039B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 06:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCEF34EEED;
	Fri, 24 Apr 2026 06:24:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6C79DA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777011882; cv=none; b=AYZghlqmxajsS2V645mYleURDRHYZsg/KFhr/YItQBoX2TZzDDHxcLEdddQ5wiw44ObBtIu3vNf2H8ksllXqOclD9NNxcFhlHnrc9y+36A2EaWnB20NmvkVxxkSnNwFVVfHm4K2lRDZjE/hc9uDY/vp8/d0jf+mguNLQahVYcJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777011882; c=relaxed/simple;
	bh=jWnKWFsq2UQMYrWu/2lPXunCsMi2nCGVKHLymQhz4/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdPRfH9uYxvL0TF0nMux5zXzw1Ty6i5qjvfy3R9q3ZwtLtfembgPZ8+3XLolVEIui6XioBetINn6CvBe8p0iSbba2vH2EJKdQ3I7hS46frOt5yBe/GFIfNXAVrBu/BTqH0tzYjhES+baOn0NSFBtF50DhV3g2ICP6sBD98oBmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso2648206e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 23:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777011880; x=1777616680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FapzwhdvoGXDd8qZ19lMZ3BT1g7fv1HHVzqpUQuOKIY=;
        b=HP+BqsJ72rULNdZ+EyJt/sKUDYE+Ue8U1zWfcB6VMmasJzLhMOFAyyBXMUPVFyB9jJ
         +EWlPO38R77SGrHgVm3C6hcKtvTWZpxVWTwwKwxgUUTxSEbPCXb+F9auOBlJqzozhTQZ
         AE1LVGilP3aJRBAiq/BeLLMI5tkk2hhJqshqxDnv4wM7jGCD/ESZfMBjHgw3tfpOBAgx
         O4pse+Obw1Zx8y1bhOtZcsdnpDtBWC1Z//Wo8AbdqeWKM15NxWQHI5lOuwJTtl34O+oi
         95SowWwGN7gGU/8DL+6Xn6eFp6rGWEeOTIltajTSC69sqdTDSpRAOaN9WwHpYI372JaI
         4rMg==
X-Forwarded-Encrypted: i=1; AFNElJ+JEpkZ2YobV5kROCuBV7xHZe6r6bTC+B9zBV9ntKRmruGjdy947JD/svIgkT1u3MhZm0bx7TB9gS5Cd5gu5VrDsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynr7ETLVxPhgCoIM5DV8OgN+oEnh9QoQjamI4G9UVfgIKP9Gra
	dZuQ2UuNnLeINFynv1TStsoAPORc4Z4/SDGRqcOs1nAKr6olJwmXxAbLNkGquBic9ME=
X-Gm-Gg: AeBDieu7P5qYt4WRcI/60PTqNL5QJAw4oR5be4nD5E7fXN2TGqc2rntRLSKa5Pdfn82
	bMzBZy2thpF5+qiMidAIswgjMcMmWwKCtI8PDrdrOsoyIDcR/nsrjoj7XwLi+UKsxcD7HLGk6om
	tdNDKXuNp9kDllFigoIRQ+nVdhk8AvJp18Uat7KbzaZNZWUiCBY2mh67nbX6e89d8axXix313bv
	tA7pcFf8xPyhybj83ne75YbaNIdHe6ssVxIKn7phQLBIrS5xsTvn1OAy0nDFBGWYXKAmxRJTdPa
	/GavSB5RVJdYGUk3UeNEW0JW72eCeF+izKmil/+ii9bFgGcOSQ9X4Ysn5LfIvMWNfPTbNHKtP1l
	w7npCIVDtct3hgEv963cEj+/eQMd0GRGJRcYiYhtVQkLLU0HbtI59IswUskuTdVzUXPxumwrCi+
	PKjhA2ZqQvmyhHSLfc8eVN5+2xx1ptFLtPod6FiLVgd8CciAx5pGNVve0SNGwSd4jWoF7yIdZua
	Qk=
X-Received: by 2002:a05:6122:f8c:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-56fa57db05dmr15358402e0c.1.1777011879900;
        Thu, 23 Apr 2026 23:24:39 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa91bf90fsm12877941e0c.1.2026.04.23.23.24.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:24:38 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so2232409e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 23:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98f8S4qf72YUoeEyK1YS1wBjaTOimNMD8rBuFs7Sy8/EV++44mvRugd1hoVIzpqCD0FiQ+7LJXzEUiSZhPfvBqLw==@vger.kernel.org
X-Received: by 2002:a05:6122:f8c:b0:56f:6cc0:681e with SMTP id
 71dfb90a1353d-56fa57db05dmr15358381e0c.1.1777011877979; Thu, 23 Apr 2026
 23:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-2-john.madieu.xa@bp.renesas.com> <20260417-energetic-practical-frigatebird-5b93ad@quoll>
 <TY6PR01MB17377C02109A651FBCB31CFDBFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB17377C02109A651FBCB31CFDBFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 08:24:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
X-Gm-Features: AQROBzBh__-xpGTZuPSCZvvq_Mj1-8UpRxwY9s8nlkbsDmTamvZ85Y60nHWYt7M
Message-ID: <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, John Madieu <john.madieu@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 1A43C45A353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,renesas.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31607-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]

Hi John,

On Fri, 24 Apr 2026 at 03:39, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > On Wed, Apr 15, 2026 at 12:47:18PM +0000, John Madieu wrote:
> > > Add a standalone device tree binding for the Renesas RZ/G3E
> > > (R9A09G047) sound controller.
> > >
> > > The RZ/G3E sound IP is based on R-Car Sound but differs in several ways:
> > > - Uses unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) instead
> > >   of R-Car's rcar_sound,xxx prefixed names.
> > > - Supports up to 5 DMA controllers per direction, allowing multiple DMA
> > >   entries with repeated channel names in SSIU, SRC and DVC sub-nodes.
> > > - Has 47 clocks including per-SSI ADG clocks (adg.ssi.0-9), SCU clocks
> > >   (scu, scu_x2, scu_supply), SSIF supply clock, AUDMAC peri-peri clock,
> > >   and ADG clock.
> > > - Has 14 reset lines including SCU, ADG and AUDMAC peri-peri resets.
> > > - SSI operates exclusively in BUSIF mode.
> > >
> > > These differences make the RZ/G3E binding incompatible with the
> > > existing renesas,rsnd.yaml, so it is added as a separate standalone
> > > binding with its own $ref to dai-common.yaml.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.
> > > +++ yaml

> > > +  "#sound-dai-cells":
> > > +    enum: [0, 1]
> >
> > Why is this flexible? That's a defined device meaning you have one XOR
> > more DAIs. Not "1 and more".
>
> The IP exposes ten independent SSI interfaces, and a board can
> reasonably wire either a single SSI to one codec or several SSIs
> to several codecs. The cells value follows that wiring: 0 when
> the phandle is `<&rcar_sound>` for the single-DAI case, 1 when
> it is `<&rcar_sound N>` selecting a specific DAI index.

How does this work if both types of wiring are present?
e.g. SSI1 wired to one codec, and SSI2-4 wired to several codecs?

> > > +  clock-names:
> > > +    items:
> > > +      - const: ssi-all
> > > +      - const: ssi.9
> >
> > Use consistently -
>
> Agreed, I'll switch to hyphens for all indexed entries
> in both lists (ssi-0..9, src-0..9, mix-0..1, ctu-0..7,
> dvc-0..1, adg-ssi-0..9).
>
> > > +      - const: ssi.8
> > > +      - const: ssi.7
> > > +      - const: ssi.6
> > > +      - const: ssi.5
> > > +      - const: ssi.4
> > > +      - const: ssi.3
> > > +      - const: ssi.2
> > > +      - const: ssi.1
> > > +      - const: ssi.0
> > > +      - const: src.9
> > > +      - const: src.8
> > > +      - const: src.7
> > > +      - const: src.6
> > > +      - const: src.5
> > > +      - const: src.4
> > > +      - const: src.3
> > > +      - const: src.2
> > > +      - const: src.1
> > > +      - const: src.0
> > > +      - const: mix.1
> > > +      - const: mix.0
> > > +      - const: ctu.1
> > > +      - const: ctu.0

Why are these listed in descending order...

> > > +      - const: dvc.0
> > > +      - const: dvc.1

... and these in ascending order?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

