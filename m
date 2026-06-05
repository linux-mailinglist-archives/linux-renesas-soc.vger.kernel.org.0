Return-Path: <linux-renesas-soc+bounces-33606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UhtPJredImoMbAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 11:58:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E55ED6471D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 11:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3058307EDBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 09:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2573BBFC0;
	Fri,  5 Jun 2026 09:47:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573E3DB623
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 09:47:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780652879; cv=none; b=WaU6XP12qRWGZMrkbDttZQXMPatGLGDU7GVpR8JvocI9iVGl6487k/s/QgFjA5yAo4vdaAsnsb2jV2xWgdPLh2P4papRWTAGFfGIaJG7k1rVyVZseY1FSdte2G5VbvG5GB4PmTjXJ142YX4TYVeRuJ/OOSzflq8MwILGpvvgRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780652879; c=relaxed/simple;
	bh=XegPlP0QUg8N4ZbYcx0a/twqRUS5iUtjIM8XQ1lg9EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LS55DPYMlm8G4tTfoQpk/Aa3phAWaZPN3PK9FjO28ylp4Ypxmb+KjDVtkKkxTiNe2O7vo77YYe7PotxEQbdIOWZXw0cx1dNzNUlcDxptuhG+QAHnIlYaTN/JdQI46KGFF6dyYVfkakv50i346FxuAymBiV6zyX3CbjoIWx4cq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59cfbfe64baso568397e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 02:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780652874; x=1781257674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frpOI/birEQQyfTPmqA3egHq/XurZUvg89/zJvb+Gi8=;
        b=ht5I9Binv5legpGs3Y/KpQdGFtj3K7RWY8uKx3CcfPYMi+F9zmH/2WcTjko4/GCywe
         D6rrnRjMmJ5229dSlfMa7x7vZaFu+673b2xxU/K3P5kR+mMacWb2aRZrWcuV/IHWK9du
         92tEqskofXgy58yN67+F95EfH1ha/31WNB+AaH8cBKxdXzgyls01kahq44TndCifVXQ/
         nOmvQvnfzd7L34ZUooeHp0WbmImZT807vYkiYoJnlOMYItX1w8/J9txTDw+UlUAsynJw
         pZM9T9MPitAycse2GF4szSQzJKsmQRuO/+j9mfknfh189ZqEUcqlfvBuman3H123g8H+
         x+ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8ntacEoIDuvzyv8Q2ms05ROw1q2pjmnjbFcCHB0UEahzdy/Cv9XDWRoy1iOnb1kqr6LDkVfTG9fsWKnN4PvPxlww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4HUUWcvQTgYdkFFITioopnePZ1HXgUmAKQTdvlVpamOCAJ1U7
	XwQLtFvzpEcvtj8Qs6U4aZtYiKr2JEYIME/48rYF1dfefg2rdvbX3yNSYDXN8K4k
X-Gm-Gg: Acq92OErBgua7m4W38FJshbysamlBKReb3CFUP7njS9XCDKkqHofPQEZFP7etX901AW
	eA3h+zTyuCgt+QbraIaDz2tp/kp/JKCXJ3oCTLXShCmPjvaLVshFxhdqu0PsJoVe5DizfGhzkgo
	yEpwjxvyLyRTce+Ia2btcxreiAp3VhmmrGuiwMzAI8iUdTC+Ht1p91gl0qegfs8Iv/J0s00b0Zo
	ot7eBRjJN/eewGFuf0CuIuea0FoffaRHwadW8tJPfQPe26UrHLJyBX6mt2Lp+7MlV2lHDxkDsw8
	9tsULsUoHLhGxzqcBgR9Bi2MVhK7OYTm9e3w23ifkrkzR9WlhQMFbfxHZCkZErm5raulh2UsujF
	pv2mBRXLzQyiPqcosXxWenwmnusL3GtjlKKIFXdi+KV696bDe9crFS0TYAozLwvdjDo95/M1yD/
	wDQwuV1DrbKPSsrV+7oQ5gVJsDGJJy662r4UgoViojkPWiBgGatcZbI2C04+4JKaV4JDSoOZY=
X-Received: by 2002:a05:6102:510d:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-6ff07cf332dmr1153985137.13.1780652874281;
        Fri, 05 Jun 2026 02:47:54 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9641414e1d7sm6355486241.12.2026.06.05.02.47.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 02:47:53 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963a35acfaaso570245241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 02:47:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fzlx1nndGen2kc/O4H7qHpMWtFbntOFpKfETPmc5XfLbP63dkNEkSu9QKUOQBDDvDKTeEMg8X1fpWuEJHudIPYQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5094:b0:631:26f6:701a with SMTP id
 ada2fe7eead31-6ff156acf6fmr1089364137.29.1780652873088; Fri, 05 Jun 2026
 02:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
 <20260603151642.4075678-2-claudiu.beznea@kernel.org> <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
 <TY3PR01MB11346903E1B762B66EDB8CB8486102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346903E1B762B66EDB8CB8486102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 11:47:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5SE7KsiWsp+6eFpO2R_pA6k4+sjAQcOQFC+pgOY9chA@mail.gmail.com>
X-Gm-Features: AVVi8Cd8crXCTmvuTR9VXD3Qx0xyM45BlA1nZ2BpfmDiwjntvYP3B16PpfLU8T8
Message-ID: <CAMuHMdV5SE7KsiWsp+6eFpO2R_pA6k4+sjAQcOQFC+pgOY9chA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave()
 on power source update
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea@kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "linusw@kernel.org" <linusw@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33606-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E55ED6471D1

Hi Biju,

On Thu, 4 Jun 2026 at 12:58, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 04 June 2026 10:49
> > Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update
> >
> > On Wed, 3 Jun 2026 at 17:17, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > > The rest of the driver uses
> > > raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() for locking. To
> > > avoid concurrency issues or deadlocks, use raw_spinlock_irqsave() via
> > > the scoped_guard() helper for power source updates as well.
>
> Just a question, will rzg2l_set_power_source() called from IRQ context?
>
> This driver does not have IRQ. If any consumer calls rzg2l_set_power_source()
> in IRQ contest?
>
> Have we seen any such dead locks/concurrency issue during any testing?

All pin control drivers use the irqsave variants.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

