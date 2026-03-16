Return-Path: <linux-renesas-soc+bounces-29459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4APHIum9t2mpUgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:23:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A514B2961BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44EC0300A596
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BA4361DDB;
	Mon, 16 Mar 2026 08:22:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D53612D2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649360; cv=none; b=GVQiOBKE8IjpsuT1HXCqbszb/ElGq5NbKeah4MI0r1mQAmlTeLRUFwhxMIpHBRKnHZO+8FUKaAgmXqKsg6hzvj9CoKJOflqSk8R1IyhVZaXUwTB1rny9diiHfnCnFFlwxHa/dDbFFyskjtzA7FJ54mhW9JgmltwfQxuJ4SkOaog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649360; c=relaxed/simple;
	bh=K4PRTP6RiXe4ekfnxbKijRsel6dDC+QKM/gt9YizooE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ja/V1Hg0H3TA8BSXnM9a5hZ1VoFtz4sGas/TtfOpxPNdncrtLCH4ztfkEUo2AtVPOMv/cjzLgM09DlY2kPIbowEeItzw+oQnsMZOV/c+gYqUddspdHF7WbdH7SpzeAedNV5Rn1lUMUG4KE+yjSp0MoR2c3cCtN5+I4gdKx06SAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso1037416241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649353; x=1774254153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHPoB6LHBRts05kAm+HAniBgww0f16o7iYE+d6aW+Hw=;
        b=bgvhF371CAS7tbqRGLh5q21PhzsK+Ujhtitnz76AZcR/2P9o/OzdWGdQRk8ug6UmX7
         0wwRwfaf7Q1eOolJURtZc7jYLZIIS3v9vXII8gTBgdamvzMHuTkJ4FWqxQKDLrNRp+ed
         2+Shkz66YGqGD6dE8o/1kZ0Nwf0CBxmEFthyXyg7DHl9E/253R8xaCrEzvT6aTHVSL9K
         RX55ascFK1swTmXULt9chwbGGxLjCSy0bdvACLeXyRWHdV0erGjjk50nyv1gjTKlHE6V
         bejFjoum6gdUAQbq5OyUNgPxKKNp88agIWh2rWPSKgum6Le5XmxzgyP++EqLec6hQ3Ll
         ipxQ==
X-Gm-Message-State: AOJu0YwLtAoUWjb48XG0B9r3PHyNjajcLc3B+ml1CyRtoGewOu0vmlsq
	Tq8+3vHl95Brw1CkD4VNQ0B2vRyGFIX7zy9euz9I1O9xTo5gabQ/1t7HI9Fq50yK
X-Gm-Gg: ATEYQzxVtcvwoIPaZFknVVBhnXBaNYpvP2TFl/ycgTf89PAGHyKPwRF+hid+I1SVZPk
	R09BukzlDRcreZzwdO5S2+rZWn6tRcy1XG3n6qMDEfPt6lW7bAhZ8RF29LYNDOzxoC4zWtP5HXI
	UQ3jHIuAyDF50bARsIuEYnDY0ygkjmT3a1LqceeOy3+yRnGSqOPLQaClMY8tFebxzz4ECy2S0TB
	FsDdtRotAFCDys4Xoe+hgvSRBZkKWR+qdLeGOQDjumMteRe3QxAYDcyN6AhoS0Hbc1p2dIUUh9o
	1GD9Yq2cPZ5Ok1HDALQnIFndNba7wmxm/0/Aal6oUMz8lNTTSiLWPGvfxW9MgEPIbtxeu8JESkL
	Vne2ibnL9EQGP5K7C7HhTjdRZ0WXZ+Az7upaPibsz3WBzQVGVpMF0WkS/vTmXuDJeCv3Yo8Q0L8
	byqi+Nzvevza3GLTXuGoJAd11kghA+9ioCjb8FL+lu0sQB12/n8zihxavXqpHTD6MN
X-Received: by 2002:a05:6102:38ca:b0:5ff:1130:bdad with SMTP id ada2fe7eead31-6020e212d86mr4359868137.6.1773649352561;
        Mon, 16 Mar 2026 01:22:32 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60254bbe001sm476723137.13.2026.03.16.01.22.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:22:31 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5674d8be45eso1593316e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:22:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0e:b0:5fd:f744:660e with SMTP id
 ada2fe7eead31-6020e60078dmr4136686137.28.1773649350869; Mon, 16 Mar 2026
 01:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ccda7a00f250e87b0457e276ac1070cb0708d71.1773321267.git.geert+renesas@glider.be>
 <20260314020107.2241383-1-kuba@kernel.org>
In-Reply-To: <20260314020107.2241383-1-kuba@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:22:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7TJoDTYRtca1Y86pVuvUbnDX_x3MUYtvEbgPu915Yhg@mail.gmail.com>
X-Gm-Features: AaiRm50TKdino7hX__Fr8XbUbMY5_IOg8mWiIXEhr4B3B1Mph0NJ-Pgqg-orWL8
Message-ID: <CAMuHMdW7TJoDTYRtca1Y86pVuvUbnDX_x3MUYtvEbgPu915Yhg@mail.gmail.com>
Subject: Re: [2/2] dt-bindings: net: micrel: KSZ8041RNLI supports LED mode
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, 
	eichest@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch, robh@kernel.org, 
	davem@davemloft.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,gmail.com,kernel.org,lunn.ch,davemloft.net];
	TAGGED_FROM(0.00)[bounces-29459-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,netdev];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,linux.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A514B2961BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jakub(ot ;-),

On Sat, 14 Mar 2026 at 03:01, Jakub Kicinski <kuba@kernel.org> wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> dt-bindings: net: micrel: KSZ8041RNLI supports LED mode
>
> Micrel KSZ8041RNLI supports LED mode, just like KSZ8041. This fixes (a.o.)
> the following "make dtbs_check" warning for the r8a7791-koelsch device tree.
>
> > diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
> > --- a/Documentation/devicetree/bindings/net/micrel.yaml
> > +++ b/Documentation/devicetree/bindings/net/micrel.yaml
> > @@ -54,6 +54,7 @@
> >        KSZ8021: register 0x1f, bits 5..4
> >        KSZ8031: register 0x1f, bits 5..4
> >        KSZ8041: register 0x1e, bits 15..14
> > +      KSZ8041RLNI: register 0x1e, bits 15..14
>                   ^^^^
> This isn't a bug, but there's a typo here. Should this be KSZ8041RNLI
> instead of KSZ8041RLNI?

Yes, it is a typo. Shall I send a v2 with this fixed?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

