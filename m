Return-Path: <linux-renesas-soc+bounces-30611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B+WAgbHymnw/wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 20:55:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD5360004
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 20:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48B323013EDE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 18:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44AC2FDC57;
	Mon, 30 Mar 2026 18:54:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE73DFC88
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896898; cv=none; b=qk/BALwgedtB6mPbQo17o+8BhLB1kuHYW7s4IYI/wpv23zWxS6dGTugXJ2oa9WJ8OCfU0//Ca5dEJtQCC1IywCNqgkd4o6VYaU+EUNAFUMe8vGKrJbXX1l3TGnOxi6nnVIIiFqlz1c5wFi+fDXltMie0P3QpcoR1OiJLoKB9noY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896898; c=relaxed/simple;
	bh=PZJA8OYSHkcjEb6yeCr4bU8DRy/2gacrQ+n6Z6q9zPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mq4c5JHOXDBNZGbqSgIWVbE7N8TzvYghzT3WQVhkrJKznv8o3oG6pxWzVkeurDcd+E4/nq7z9V3ghZNgEGUWCPQnfQ5dTnjanG1NT9HBx+rJHwDUvnsUTnhkIOMkYzs7rcG/3vQvYxDxE8GBPfnNmL5C8UEA+q2Te2O37hgBMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cfc3ca1922so549894985a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 11:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896896; x=1775501696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmbdfERIdYVjSOaA8rBMP7lXVvFsi5yyzuqKEhnFPsQ=;
        b=skRJOPcWe6oKcy5rYGRykHVVdjCkmiwtMDCoZJCwOKRfiHWa6D/jXmxevtO0n2RAvO
         ruCNn0bQ7yNC+3EGJZBwQ98h1vl9BURdjWylCZffVjZgC64f2hgal+SEjpojQ/yOYw1e
         CsCCZ8gP0c1q7BsP0RVZec/smwJOlCsETTpKeT6cUDF09mfxzVSfGP4x9F7yjxmG5MvB
         LW7wamLW+kIQt4XsMTX3TPCbj4reSyAlYt7GRC/GK2lR7ZLBhwOv11O6eG2tKZcTRDG2
         2kn1JDhl+Gz4f8vjxblc83m0Cp3TP74kVp04luSG3leDbYePl0OYkYvextnF9WMtRO5L
         NlEg==
X-Forwarded-Encrypted: i=1; AJvYcCVm4FCmIKV9f88d1vc88E51aTviCQ9gUYdfF8Y6slEFIihyt8V65xqViiU1/w1AuHQ2JpjS8ObAVOXvpe1VaCT//Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0+GoPbHGbBIJh0ruycQK/wuCiHwkAyM5Odoos63xlQedhFJD1
	U4g+Ou9lwZICGMT9hpUwCtAsiRgmyinwL+7q4SxYCzSUHFrA1V8ga0iEXff/Rn62
X-Gm-Gg: ATEYQzxKaLxyBIqUtUy6oy58b363PxjF7dCDfF8Vnjm5k2VhDMqLwVQy2pd0iaDDz/p
	527mjRNZmXhJNRcwslP+1iRhoe5BPt1qUYy0fpDU4K88F4uwYBwenFmVc+4fWzulWXZMrhaqyXS
	FKul469Vc6Au2QxgdcGLkC2rZ1v8iPm2ooVKoQyDWhxcpKJSjS4Jc4fJj74b5F0lNSRKWoA7aad
	q0YRYnkJwXDxLML6rrfMKIdTUUeFQv+1nt0q+IppZgvWmyuP3wnGBjH0F6KUAqfNDQlyd80fhM3
	iL2LRZRRZa5pXPNe1P2+p24oThmNlsgVvk2x69nsJonXczrZomdyLN0T0BfA1LZ7AptiYNiWpC+
	fvV1vD8eM/VOd+d/Pr/XGTcNvHFQ1nta/IJHTM6CY2LwLjZeVarJkxAA0W0FEWW9LE9dw1DQWs8
	/A9iV8hFSeQx+/wdaOteFX40gPRjvvLhNoGs+P6riW4R8aB5Ku+hH83bh7l4KL
X-Received: by 2002:a05:6214:5286:b0:89c:d57f:18b6 with SMTP id 6a1803df08f44-8a2cba69a9dmr9581836d6.27.1774896896065;
        Mon, 30 Mar 2026 11:54:56 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf281b2asm71564066d6.23.2026.03.30.11.54.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:54:55 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a068db9989so16537206d6.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 11:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXdCrXhwwY1YBr+SJFzq1WNgBE/UXtYo/hVHRqYPB+2XA1cyfKJ6w6UUGqdFf1Jk7tgm9IsaHeAY6NRSyHUhYEnQ==@vger.kernel.org
X-Received: by 2002:a05:6122:21a7:b0:56a:ed84:e2 with SMTP id
 71dfb90a1353d-56d7bf9a1a3mr395634e0c.1.1774896484928; Mon, 30 Mar 2026
 11:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
 <20260319155334.51278-8-john.madieu.xa@bp.renesas.com> <20260320-peculiar-cat-of-acumen-c6f6b3@quoll>
 <TY6PR01MB173775E9970A41ED3A7FFF1DAFF52A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB173775E9970A41ED3A7FFF1DAFF52A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 20:47:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6Ac_=BugNJaqWnazdDsuzBB765jpzXt8fUasbypXFxg@mail.gmail.com>
X-Gm-Features: AQROBzBY2yW50P7_EhVQZxwFTstX-3Z9DxWPu0ijoIOHvrdSgZhFLZHzJwI06ec
Message-ID: <CAMuHMdW6Ac_=BugNJaqWnazdDsuzBB765jpzXt8fUasbypXFxg@mail.gmail.com>
Subject: Re: [PATCH 07/22] ASoC: dt-bindings: renesas,rsnd: Add RZ/G3E support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,baylibre.com,gmail.com,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30611-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 55DD5360004
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Mon, 30 Mar 2026 at 17:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > > RZ/G3E has a different audio architecture from R-Car Gen2/Gen3/Gen4,
> > > with additional clocks and resets:
> > > - Per-SSI ADG clocks (adg.ssi.0-9)
> > > - SCU related clocks (scu, scu_x2, scu_supply)
> > > - SSIF supply clock
> > > - AUDMAC peri-peri clock
> > > - ADG clock
> > > - Additional resets for SCU, ADG, and AUDMAC peri-peri
> > >
> > > RZ/G3E has 5 DMA controllers that can all be used by audio peripherals.
> > > To allow the DMA core to distribute channels across all available
> > > controllers, increase the maximum number of DMA entries in DVC, SRC,
> > > and SSIU sub-nodes so that multiple providers can be listed with
> > > repeated channel names.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > index e8a2acb92646..bc8885c4fa24 100644
> > > --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > @@ -58,6 +58,7 @@ properties:
> > >            - renesas,rcar_sound-gen2
> > >            - renesas,rcar_sound-gen3
> > >            - renesas,rcar_sound-gen4
> > > +          - renesas,rcar_sound-r9a09g047     # RZ/G3E
> >
> > Do not use underscores in compatibles. Previously used wrong style is not
> > the excuse here, just like previously poor code, mistakes, bugs,
> > unreadable approches is not justification to repeat the same.
>
> Got it.
>
> > >    reg:
> > >      minItems: 1
> > > @@ -97,20 +98,22 @@ properties:
> > >
> > >    resets:
> > >      minItems: 1
> > > -    maxItems: 11
> > > +    maxItems: 14
> > >
> > >    reset-names:
> > >      minItems: 1
> > > -    maxItems: 11
> > > +    maxItems: 14
> > >
> > >    clocks:
> > >      description: References to SSI/SRC/MIX/CTU/DVC/AUDIO_CLK clocks.
> > >      minItems: 1
> > > -    maxItems: 31
> > > +    maxItems: 47
> > >
> > >    clock-names:
> > >      description: List of necessary clock names.
> > >      # details are defined below
> > > +    minItems: 1
> > > +    maxItems: 47
> > >
> > >    # ports is below
> > >    port:
> > > @@ -136,9 +139,17 @@ properties:
> > >
> > >          properties:
> > >            dmas:
> > > -            maxItems: 1
> > > +            description:
> > > +              Must contain unique DMA specifiers, one per available
> > > +              DMAC. On RZ/G3E, up to 5 for transmission.
> > > +            minItems: 1
> > > +            maxItems: 5
> > >            dma-names:
> > > -            const: tx
> > > +            minItems: 1
> > > +            maxItems: 5
> > > +            items:
> > > +              enum:
> > > +                - tx
> >
> > Multiple levels, multiple if:then: (further) - I don't find this binding
> > manageable/readable. You should split it, with common binding defining
> > common part of hardware or interface if there is such.
>
> I as you suggested, I'll split it. Just to double check, should I fix
> any bug found in there (like existing compatible strings having underscore
> separators) ? Or should I just split and make sure only new SoC support is
> bug free ?

You cannot just change existing compatible values, as they are part
of the DT ABI.

When you split RZ/G3E off into a separate file, please drop the
"rcar"-part[*] in its compatible value, and move the SoC-specific part
right after the comma.  Perhaps "renesas,r9a09g047-sound"?

[*] Disclaimer: I haven't read the RZ/G3E audio chapter yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

