Return-Path: <linux-renesas-soc+bounces-27948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBv+BDKehGmI3wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:42:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD68F3701
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C06453002517
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 13:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2C22765D2;
	Thu,  5 Feb 2026 13:41:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C81B2773DE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298890; cv=none; b=otCf+XcCMYgCGZXOo1spTdPzGJ5TLdaP3GDa/j1DRW91I0ZPQ+aeLJbsRGQUfnLhOJO/xjtcVj6vMnllPp6MMNzwj9TdIQXrf/Ukj/V+nw4MtDm+VZ+hoRjjnC6bwMHcIWv94fF5hr795L9rk0FL4uNaVbr9ANjOVECSZD8YLBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298890; c=relaxed/simple;
	bh=MvdDi56nBcqeVhfFS06RPVpbBEwUFgl1c2WoubkP7c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFqY9NR7EgPqIB07MgxVHh5h7qlHql/XCu5FjuBmZUv+Ww4pQs00Fd76eoxbOrU1hlwcg8gRQ1qplEc/3nU9RJoHAQITF3m4rzfBhv8Ti5igphkwHYWnrhHXHuM9WzSu+/USTULKL8wgawA/hjoxg+TmP7mP4wMOqSLOZEBUkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89461ccc46eso21102756d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Feb 2026 05:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298889; x=1770903689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlFVvwC8fg/1wsOmrxHFIGxiwllHqY5skW1aHs4QBXc=;
        b=VHfb8TGuuqkxv6tj5+uhtdzswoOnTO9aYmiDrgUSDAAwN9Avev6ryj4o6nH6zrSK9P
         V/18+T9r/wizaahTLGbrnKdKE+zO16Ni4RMV/TAALrzJDp1ZdQI4eyD7kWdSeoTl5bha
         2fQpEloE/7C0DpDv4lxu/0rRCJCcff65q35f8Um5l7BBxKO4oiKytC2Ar1+H09Spe7Hv
         id5jHuCMJ7XLWq4LY01EmUyVEXH3FjvuNNOKr3uSS1PyEwFIhEV2lW9gMpfZ8ZksDSFf
         6sZXur8eVwhtDGjoRf/66f+RnpcUg+Q50FyfEl6sSDhoLE5RioWTVt4fH5fvQLdO6WnG
         jN/g==
X-Forwarded-Encrypted: i=1; AJvYcCVf0CJKVBZYh3w6QYyfSEggPYXqKy3Pfi2XyLA4A1LiO2scFz9+sjwKMa+HAaWJkB+oV18U+X2tIgdzEzKEMxuB7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL7TKIR1+PdRD7M8Cda/DY4ZEQMVbnJ/PqEAoGLyAX4dQpwfOo
	wwDIC1ip1o9kA/v0gG/UHfSsSe2CePjxybZcDbnk+7qTBcvWEj2Ivk5D7Q+7A3C5
X-Gm-Gg: AZuq6aLHwuQYZlEk6q9RY3SBKvByMRK9Hk74xkZ4huWcvAp4Tl8byhxOrHKztwK6xAF
	Y1b4I51oBdnt8b48onR293eSvpw3a8Zsut8BilUUs/iul/0OcwFgR/yXJJ1dx/OY6fldHS5c51a
	XwLsRd/WhNFGOLx+OmPLD7rlyHSj+KoMkZ2UQoK5kncs+6NYPnLVEHkPFKjFj3llTQnQzN7zjrR
	c71qislcP1DzOrBcdhiSPIalEsCZsExkm6/R9/DwWEGoaUYsr1yp98vEuDalVmkJcw7+XumhmHt
	gzmh38T+RJbFs/bncOS8BLO7KsbBLyFhFROZb01eG1BpEuGgDuq6LR+ztU7bBTSnGOfGSsgOxfC
	fvtoFeNW4bvWyyA0Ro5p3Bf54MeSo9/pej69Kx3DL+3U0putqzZo21TAamEuDT/0r+jM3oF3OHI
	y7sZC8imIbDab6Y7UGfWxt0kbaAif5mchbhgwCo1XDRMXQOKKO
X-Received: by 2002:a05:6214:e86:b0:890:3f6a:fab2 with SMTP id 6a1803df08f44-895221fda2fmr98936616d6.68.1770298889321;
        Thu, 05 Feb 2026 05:41:29 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521bfe715sm40716886d6.3.2026.02.05.05.41.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 05:41:28 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88888d80590so15614266d6.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Feb 2026 05:41:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/B6XRuqP2XHMnKWEmDOx+Lp+/4yDHtMH8Y91IgVHCzbxczWNOPAR1RPW+LNK+dpj4peU8a0dVOK5+PZtQHNQuhQ==@vger.kernel.org
X-Received: by 2002:a05:6102:38c6:b0:5db:3111:9330 with SMTP id
 ada2fe7eead31-5f9395a4fbfmr1887930137.27.1770298443995; Thu, 05 Feb 2026
 05:34:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
 <20260126103155.2644586-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113461F734BA087B60605C6FC8693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <16a6f14a-93e6-472c-8718-d46972f0ac5e@tuxon.dev> <TY3PR01MB113463BE8A4B1A40DBB0860538693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5438ccc8-ed5a-4dd6-8995-e8e9926883a5@tuxon.dev> <TY3PR01MB11346325F46C2BCA6B2B181D08693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ad752abc-275b-43ca-aec3-188c1a69c50b@tuxon.dev> <TY3PR01MB113460006A458AB2F8B96542C8693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346C8AD27554E40EC5746E38693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7f0305f6-ae2d-4069-b53a-d2a81e75d164@tuxon.dev> <TY3PR01MB11346321A9AAE93C7070C6E578699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346321A9AAE93C7070C6E578699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Feb 2026 14:33:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUpq1bUbNLu4WGheovQ1pYdEJGBMN3jdb6PZqXanN_GA@mail.gmail.com>
X-Gm-Features: AZwV_Qi97SNEv7WiclTdTjDZPIBKqJuIZIg8jIizASzQUOTxleO9LeGP-MsKx4c
Message-ID: <CAMuHMdWUpq1bUbNLu4WGheovQ1pYdEJGBMN3jdb6PZqXanN_GA@mail.gmail.com>
Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, 
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[tuxon.dev,kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27948-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email,tuxon.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DD68F3701
X-Rspamd-Action: no action

Hi Biju,

On Thu, 5 Feb 2026 at 14:30, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > On 1/26/26 17:28, Biju Das wrote:
> > >> For s2idle issue on RZ/G3L is DMA device is in asserted state, not
> > >> forwarding any IRQ to cpu for wakeup.
> > >>
> > >> For S2RAM issue on RZ/G3L is during suspend hardware turns DMAACLK
> > >> off/ Asserted state. Clock framwork is not turning On DMAACLK as it critical clk.
> > >>
> > >> Can you please check your TF-A for the second case? First case,
> > >> RZ/G3S may ok for reset assert state, it can forward IRQs to CPU.
> > >
> > > Just to summarize, currently there are 2 differences identified between RZ/G3S and RZ/G3L:
> > >
> > > SoC differences for s2idle:
> > >
> > > RZ/G3S: Can wake the system if the DMA device is in the assert state
> > >
> > > RZ/G3L: Cannot wake the system if the DMA device is in the assert state.
> > >
> > >
> > > TF-A differences for s2ram:
> > >
> > > RZ/G3S: TF_A turns on DMA_ACLK during boot/resume.
> > >
> > > RZ/G3L: TF_A does not handle DMA_ACLK during boot/resume.
> >
> > I'm seeing at [1] you are addressing these differences in the clock/reset drivers. With that, are you
> > still considering this patch is breaking your system?
>
> Still, thinking whether to add critical reset or go with SoC quirk in DMA driver.
> Some SoCs need DMA should be deasserted like critical clock
> that can be handled either
>
> 1) Add a simple SoC quirk in DMA driver
>
> Or
>
> 2) Implement critical reset in SoC specific clock driver and check for all resets.
>
> Is simple SoC quirk in DMA driver, something can be done for RZ/G2L family SoCs?

What if the DMA driver is not enabled?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

