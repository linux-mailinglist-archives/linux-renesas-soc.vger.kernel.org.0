Return-Path: <linux-renesas-soc+bounces-34400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uU9aDHPZO2qheAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:19:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9926BE874
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:19:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED32D3028F37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 13:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BD93B38B7;
	Wed, 24 Jun 2026 13:16:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0453AFCFF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 13:16:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306981; cv=none; b=u/wSwHfZhx9PS/rLwo9kFznTKfTKR0xt0SW4B+MBdl8+UtIw8Er2gqFI7MAQ7wbf+H7GKPBPaGDMFfSlvl2YkCoADMi7VZ85XPoymYUClPOU2DEuI8bJbOAip7N8BkffTJ+BDckkw/8P7jNtj1om1B1A/Nkn+v4XFLJMi/VZ2VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306981; c=relaxed/simple;
	bh=8OZs/3aYZE26lDlP1g6HVE9S8OvFdAoqeKt+7UfwzZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMfuCchwPBiJ8VY2nSPPI7/fxNlm0jVifdse6b7vPXfxXYSHloyd2UEnfPPM9orPHc/S9VodzR1qnbp+dlmdYkFm8hscnklvGAIoUVUN60m4rWk//xj7NyOVwa2ZLPu4Y6njrjSV7gPHR6p0j1kss+VMkuvYqxVhkLPtmT+XnLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bbc6c99c3aso703448e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 06:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306979; x=1782911779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg1Wcx6kQ6soA89yd1uZgMly7AFGnM5Vo9LWO71DzuE=;
        b=PnQZ+2Ha25P+giEGhIt8RmXW0zbLVO0PM8JA5VKF/0haIKdP/owH60LSvj50mIOJL6
         af1kA8u3jqh6ALO+3mT4zmPKHYZ0OIVYX0jLlEb3b1Yih5NtZBmbT+uw84lcUDcIfXKa
         lzRjcwSjib8PWm6IQihirbfPaTegikfHrRaa+Rt0xNv6W3YMc657QqgxSRTPVTi1tIBG
         K+DccZxj/bQzKIBfc+A1J64hKS/jLM7iTADcHRbNsdPzm+U4twQHOLwtqo5TS17A8AyE
         Y9h6asjRELmxWFqUoU/cpf6e58qUBsc2WHuQYK+w+gfsZPaa9fQcvb9gIVCsoNjapbHS
         QIsQ==
X-Forwarded-Encrypted: i=1; AHgh+RptuvN/iq8osI7ajTBd9mE2Kz8eu4dERnu+5a8AvyYxQQw0zOqvPeBItRECgFko5CgO3yzflg55yAfKFAUOQMihww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFTVVbQReRFWDsIWjm4X8yR9FSAAJFw5sGxpzeGqhnUzBdoWP
	Pk/xdVujpOnpbU8mpTzaHlZcUawxSW4e6lNoiHpySUrW8Oe7+yUGOi5ZI/SBcKXO
X-Gm-Gg: AfdE7cnDNg7XmOhcp5o9OpvwrnhOqwf+8g/8Y8XZufp5EA+kuT5AiAxpLbdE1IxNosk
	gvHY47dfDlXZw2BXuN3sT91obdFt8DlwMTe/ri688Oqht0Xh9ujXXWvUfoGHMLjyUXt38279Muv
	CIlxGtqTx/Sev2IoZc/VXsPKxCev9yqiBjuZ4ToIoWtoTCCxSb5jXCGu8btWPZWzWeIKwYQuZoT
	6xZhyUdxYuzUn5TkJanLu3cgAUF1t1z5GQWopPBpwAZqvGRA0r0qHVP2lLkxmrtCJoDnzB508lj
	0QP/pR/2ib3wdgt1fDW79Mmr6ml3cXXtKeuwTfQFp0z4AwPkpMn7pzpG30IFMlfGdgGSTj+Fhne
	xmci1EcuJjoRP0fApfogFIV/KfKg9Da/bMIw+ukWUDm9ajqtxdPr5ijtfy4U2ozbtaIGlpaIvqK
	m8wE5IxI6qH5/xDZJrz083fFYOagPs8ooxd2q2DuMKHu42D2V/HQ==
X-Received: by 2002:a05:6122:1dac:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-5bc3ee59b91mr1323953e0c.7.1782306978991;
        Wed, 24 Jun 2026 06:16:18 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfba4a086sm10121994e0c.11.2026.06.24.06.16.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:16:16 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-96358d0a024so751336241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 06:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoIw9xz+KsdJYhpk6xygWF1XB2JtrRtr0fK0Qgp+1Bx3sfpMaU8ANCKZgHWj943GM2jL/EZ+IABN7tUaQ6RBtGCVQ==@vger.kernel.org
X-Received: by 2002:a05:6102:644c:b0:6c4:5bdb:5e34 with SMTP id
 ada2fe7eead31-73110289029mr1451557137.0.1782306976253; Wed, 24 Jun 2026
 06:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
 <20260624-advanced-pink-dinosaur-ebe720@quoll> <TY3PR01MB11346659E1A238C232E29946686ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <77976912-b0b0-4e08-ad9c-5080c4d8adcc@kernel.org> <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jun 2026 15:16:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV67ZuhpSjiu-rWrgyPAMafEDVALD5b0k_bFMYkfQnP8A@mail.gmail.com>
X-Gm-Features: AVVi8CexLBXpgGHtP-P_1U1b_dd2B8tjjEWGvz_S2PVq7GutBSnqHQxq1klHKgs
Message-ID: <CAMuHMdV67ZuhpSjiu-rWrgyPAMafEDVALD5b0k_bFMYkfQnP8A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, Brian Masney <bmasney@redhat.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34400-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:krzk@kernel.org,m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:alexander.helms.jy@renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,renesas.com,baylibre.com,redhat.com,vger.kernel.org,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F9926BE874

Hi Biju,

On Wed, 24 Jun 2026 at 11:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > On 24/06/2026 11:46, Biju Das wrote:
> > >> From: Krzysztof Kozlowski <krzk@kernel.org>
> > >> Sent: 24 June 2026 10:42
> > >> Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
> > >> maintainer
> > >>
> > >> On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
> > >>> From: Biju Das <biju.das.jz@bp.renesas.com>
> > >>>
> > >>> Alex's email is bouncing. Update the maintainers list with my
> > >>> contact details to take over the schema maintenance.
> > >>>
> > >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >>> ---
> > >>> Ref [1]
> > >>> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
> > >>> ---
> > >>>  .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> Please also update MAINTAINERS file.
> > >
> > > It is taken care in [1]
> > >
> > > [1]
> > > https://lore.kernel.org/all/CAMuHMdW0-WsZuuc7PoVNC5DBUoY9dP+ULmGTQ76VW
> > > MO_SjpbuQ@mail.gmail.com/
> >
> > Just squash them together.
> >
> > When you fix such issue like wrong email, fix it everywhere, not just one-by-one where the maintainers
> > need to poke you to fix in other places as well. It is generic rule for bugs as well. The wrong email
> > address is the most obvious example here, because it is also extremely easy. Just use git grep.
>
> Ok, but both patches were already queued by Geert for 7.3.

I will squash them while committing.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

