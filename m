Return-Path: <linux-renesas-soc+bounces-32017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHl1OVaf+WmQ+QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:42:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC17E4C8231
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4689B3033980
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477903E3D94;
	Tue,  5 May 2026 07:32:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023D43DDDC6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966322; cv=none; b=VUCqU8UA0lrw/YNKFQ1QSg5AMpOwLrFhhrsVZTxKKzopPuueA6m8uaD+BNTSH6/vPfSGprBB4mDh7jkDml5nBy+TSuvfWtmToCgJPPycECnzOqJ4E9/y5edKgpCnYcyW0jUIJbcjGhZ1X7S3ZRjENWcC+peDf/WZMOf1DkqX7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966322; c=relaxed/simple;
	bh=ukZ9FK4VGWfiaXO2VPuEc3ogAHyIjVxYKoMVyr+5s8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NI41vBt3iXhHabuXGOY1sRjVvicI14GflguKKHEPArKd4ppt1ThkpWEMwmbKXi2o6MSjPexlmK45t7O86u4m7moRzxWrovP0ZNcPGc0AtFM/GSsFjy5mT1q99l4+7GzyZo1oAMNjFCzeObnqjRJacoU8e9askgZekWdJonFELhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56f70865797so2709444e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966319; x=1778571119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0fZD/PSymOwfq/roAe5oPCoIu7rlEolsxxYooXw1Fcs=;
        b=EMsamnV7GngKxahxgwp3sdM1HdPDVv8VsgNX03Pv1UFSTpDSv9T36cd843rvsm1oB3
         XnXqiAURbvMrP5PNR9T9VzttInDPNCu+gd0XMFbqj+HBCfbV2rS5te6ca1lj0OXACmEH
         AkEH7/KhZp6VB7aYpm5MERC1JC02nj/I+U2yucKrEkaOITk/4y0wk1wiR9YIBxVHR8TP
         NNM1PD+IdEgb1hCsYrhtEA+KtDz1hAxllaY+NbkFfiV22NhdtukZQiUVXP/c3msjx03J
         RI9C9D3KBPr8DMpOQ9pACD3glrfZt3MBGF3OJ5PT4Ar65oUzqY+t0XDWE3I/4EaK74zN
         c9sA==
X-Forwarded-Encrypted: i=1; AFNElJ8FTgbPqISfwmul7QLHEq4HO64RJr71XIVN0ZEcw0Z6CNAFOsGx2kRHxOTBc08wj15gtxe7zR15Y2KmzFbIE7MsZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq3ZXL5v5utBUGOee+o5WLQFkMMkzhdO3+wdZdcagmogdZZn6T
	+EVV9sFhmBdw/1H5/l1SFpHSv5C48IFkNJCZdc1gqpLXyhNoQuZmoRWuIaQqF+Ck
X-Gm-Gg: AeBDiev1SLOdhIMNusoom5xpDbGNMCGD2nkcc5/hLTqFBmdF9SQIL7Er37oRA3FSlJW
	pCq03EaSfr0WCYrBnhxVx3lX302JpOhcUQtAGeWrdMHThwjDuaWEQhRrvmluU76hAtml0sggit4
	5CTY/uU0YLU0L3fVv82SWAdpK5oKBrCXB1NPylj7pbVjQ6g+2t0G6rKtRt9afPm0UP8vmTwCkxp
	N/4YqBQtSc0ZOO0zoLJRAKMr/oV/oHB8nkpAqk/5xH9l+zKUaXkT7pjcPovTNebaFf7A0Dghz4J
	QxAKpQNd/yZoEzU18UAmnnC2heNHD+wrE1kODpqQ8Sm9RrjrEIFsTvVH6GSUEK+tTSFy1qZAAwX
	iCQaNtcr3rkmBiS7KWffCLAlhhMNjPoZbZU98ZTQHM+7rFgOZn6Co5++PRVFxZ+FeaBqvMHUI7g
	upyrShJ2xi0VhmbqXtb0evwnsiJ3fhiqmPvVsXJfa57Ke7xLAILL8NnxXsSKBXSc45KGju8Bg=
X-Received: by 2002:a05:6122:6282:b0:56b:8e17:25f5 with SMTP id 71dfb90a1353d-5750c6ac224mr6274349e0c.11.1777966318829;
        Tue, 05 May 2026 00:31:58 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0b71f31sm6543961241.13.2026.05.05.00.31.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 00:31:58 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6221c72515fso3500381137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jfMHowzYxb1OUZdFKtSvHM/l2x2+X5v4vr/aY2944GcBYJQZ9SH7dz8bUp5dr915M6fkdP03kt14Ru39Q7mTU4A==@vger.kernel.org
X-Received: by 2002:a05:6102:809e:b0:605:6089:674a with SMTP id
 ada2fe7eead31-62d8754d144mr5578911137.23.1777966318428; Tue, 05 May 2026
 00:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206112227.233229-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260206112227.233229-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 09:31:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfGA6yie7FJ1p5Vo8pzYfT7JaapVKKs89zDajyjoYdyw@mail.gmail.com>
X-Gm-Features: AVHnY4KGVyBJgcrD6fwdul7hiswvhvhZiaYkMacUewIFbE46z83RiXF3MOHRmi0
Message-ID: <CAMuHMdVfGA6yie7FJ1p5Vo8pzYfT7JaapVKKs89zDajyjoYdyw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G3L support
To: Biju <biju.das.au@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EC17E4C8231
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32017-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

Hi Biju,

On Fri, 6 Feb 2026 at 12:22, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the support for the watchdog IP available on RZ/G3L SoC. The
> watchdog IP available on RZ/G3L SoC is identical to the one found on
> RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> @@ -18,6 +18,7 @@ properties:
>                - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
>                - renesas,r9a07g054-wdt    # RZ/V2L
>                - renesas,r9a08g045-wdt    # RZ/G3S
> +              - renesas,r9a08g046-wdt    # RZ/G3L
>            - const: renesas,rzg2l-wdt
>
>        - items:

However, there seems to be a small difference in the formulas for the
timeout register value on the various SoCs:

RZ/G2L, RZ/G2UL, and RZ/V2L:

    WDTTIME setting value =3D \frac{WDT cycle}{(WDTn_CLK (n =3D 0,1,2)
cycle =C3=97 1024 =C3=97 1024) =E2=88=92 1}

RZ/G3S and RZ/G3E:

    WDTTIME setting value =3D \frac{WDT cycle}{(WDTn_CLK (n =3D 0,1,2)
cycle =C3=97 1024 =C3=97 1024} =E2=88=92 1

I.e. on the former, the "- 1" offset is inside the denominator, while
on the former, it is outside the fraction.  I assume this is just a typo
in the documentation, and both formulas are supposed to be identical, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

