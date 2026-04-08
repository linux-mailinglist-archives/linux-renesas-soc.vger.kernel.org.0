Return-Path: <linux-renesas-soc+bounces-30963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP2rLN0L1mlnAwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:03:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 662933B8B10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 10:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 044E6300A7E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 08:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6809939B958;
	Wed,  8 Apr 2026 08:03:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCF337F749
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635405; cv=none; b=SpIvKaY/euelMOsihRxSkHfX1BdZtbgWzdy/jq2UlViMfbj4okD5jVFYpGWObJHvD158VfJxEJEPJfqLC83v2orYf0XI6EYvhrcKXzr0NQCpUU6AYJKzqO2SK0aN5O+4qErrlC2vy9IdZVMdMF98A+gVxTtMbKbUCpMKSaYX5uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635405; c=relaxed/simple;
	bh=tb5ayrKCU1QRWz4F+1quo/d9UHKE8nDLKnD4uurIqwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDJDrKpmJw7quNJS7n0r9bjemxsJdSFXhhX0NkY8N3p8kOyAETROv/a5124Dq8/8GKkBrz0Bv+yEmm03Dp1L/nqEq97o4YqdLMWKd2nUe7LYL7VvdwZ3XWgwO+SXDLUA42IAFMPMV/bm2vDr70Nh+YjpTuno08hOBqlD1vBuLMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-953a2a4761cso3391022241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635403; x=1776240203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4R92sE+3j+L6v6U2wW4n9L1aU391JVM9cT4kRUC3wo=;
        b=JFYhlw0SgakijfdH1j2am3PLNqwElicnutMXXRnpUmZeF2dsUnXMGrPOE17CAZGYFF
         Tp6jtF4GPfHxTPCRLDv2mMKrxa03Gt20dUNOQ2pB9WF0QCHBgAh1sKZ6NJI04yjpdN2Q
         TgSChB2golGOed7zod325YDgeS/2xq8fJ2+JOSHEky+a4mZ8+hJQ9ayiKYdA/df6rwe6
         Jcko0zFIRFZI8B70abCiy7mKWE+O5a8YdoTwR4Y+/bjkZ/qe2+n61VqDQ8jpXcayL/Ah
         w2gxCMcBgqqXFeJ6NL+x7pcjcZd2Vc0Ha9oo0yHzDA94TMPisF11Uyp9Aul2YOjp8oJ8
         vzpA==
X-Forwarded-Encrypted: i=1; AJvYcCVArgg9k2sMVKxyGvu+Yr2XzPW7BTYwBb4Srb6kpjt701FHRj5/JU0tGHpQM9amOG8ndNDZayWASwrhSNB1pBLSUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqSykW2EM2GwT2sTDag50+rXx7rz7Lvcduqu0tMrq8Q1V89EMd
	O25PL1VVoXe71b7EkzsT5nt5oIkDrf54Z0ovcL3kecUaOG6NHi123Kdulm3A+Ysu
X-Gm-Gg: AeBDieuoAnooN34igAJzNtL6hM0AMNmVuMTCBxpQ0qoq5pm6DlC0k5bkOL0K0AnzKsa
	9AjSF3ynVHrcP4dMWFjInXWHp7SzTBT9CRvylWIhTRGx9ROnHABzz7btUgnIuayt1gSocyNXcYr
	XBePrwiYNSKZF7DJ0oTvAXUwRYMkGJ//YeZ5EPOHm3407rBZSYVa1dmms5qGxDvxB30dIgyPphZ
	HTsUNF3ERxSPHPdfDNGiGG2sV6F45JKFSzyRPxDGQysg34Qv/qn0o+bJRCW7PkZ0iecyeM5zIi2
	4iB4T/Q4MFnLLXfTOcB/OtiDqhDY/YSbpE835nWddnyyUcuVEbSstklmdhmYYUToPwftWNneou9
	KTKjWpeM9iA5p9OPi7pKuSAjIYuWtI704ltp+bBDMpksX8MCCCvSkBrIhA5nyizRbMmos3M2Mdl
	IhTtmryAs62Lm3kBdrjpaTGCXEBbk+Iy0uDAMd8PLuytcG8pMrs44m/AwrdUWY
X-Received: by 2002:a05:6102:3707:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-605a4e180bcmr7889385137.11.1775635403158;
        Wed, 08 Apr 2026 01:03:23 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb84c289sm15886820241.4.2026.04.08.01.03.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:03:23 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-605def5b7f8so1986407137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 01:03:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVamh+RkIJWuPg9pONOqi7UTqWENwFpir7zkvY4q9Do5rr0uYJA+fWIbFTxfj21J6zQ0qWxbFHpHidN56Byk7NLkQ==@vger.kernel.org
X-Received: by 2002:a67:e718:0:b0:604:e315:6eb1 with SMTP id
 ada2fe7eead31-605a4e92bb0mr8578869137.14.1775635086837; Wed, 08 Apr 2026
 00:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327192425.438263-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260327192425.438263-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260327192425.438263-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 09:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkh0Q0_O4VZ=DoJ26=+QiddsLi_CwTVwK-L+Q5zb6wPg@mail.gmail.com>
X-Gm-Features: AQROBzCZCuwf6NF6rEXqKfmkxTjFfqDW2pSk-I-eqOP6g3EoYNQgB2zRxA-RYgI
Message-ID: <CAMuHMdXkh0Q0_O4VZ=DoJ26=+QiddsLi_CwTVwK-L+Q5zb6wPg@mail.gmail.com>
Subject: Re: [PATCH 06/11] dt-bindings: timer: renesas,rz-mtu3: remove TCIU8 interrupt
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30963-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[linux-m68k.org:query timed out];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.053];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 662933B8B10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cosmin,

Thanks for your patch!

On Fri, 27 Mar 2026 at 20:25, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Based on the following pages in the User Manuals, the MTU3 block does
> not have a TCIU8 interrupt, only a TCIV8 interrupt, as the row where
> TCIU8 should have been is marked as reserved, and the GIC SPI numbers
> stop at 212.
>
>  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
>    Rev.1.40 User Manual

According to the Revision History:

    8. Interrupt Controller page 486
    Table 8.2 Interrupt mapping
    The =E2=80=9CCause of Interrupt=E2=80=9D column, modified (TCIU8 =E2=86=
=92 =E2=80=94)

So this interrupt was definitely documented before, and I think it would be
good to document that it was removed, instead of saying "it does not have".

>  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
>    Rev.1.30 User Manual
>  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
>    and RZ/G2LC Rev.1.50 User Manual
>  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
>    Rev.1.50 User Manual
>
> Remove the TCIU8 interrupt.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

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

