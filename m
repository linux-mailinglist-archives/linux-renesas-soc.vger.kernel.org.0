Return-Path: <linux-renesas-soc+bounces-34018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mhoeFjrqL2rfIwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:04:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A83685F2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:04:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4F88324D5ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E11E37DE90;
	Mon, 15 Jun 2026 11:55:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E93E63B5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 11:55:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524522; cv=none; b=FhCi3GBH3HJq7PLKRPm6JUvLB1Gqfqlg+obgxtZLfbpnIqfxkYPmduNV0NoQxm84CQC+bTACKXnU5zi1JXdiOU1GN3OkJ5N9/5ezDgoqdJcityCYif8PIlYW1hZUmk48nF3roCCOzSHR12drVEzK+zhb5kY7hbsVLKxdPcebh5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524522; c=relaxed/simple;
	bh=DBWE1CK73Wh70+bbScbL1hyMkGmtpiYqv2M1Rk9Kjyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A67yo+9kMvilqky7JtmViRw7J89XBdBicW31CgD6ieR48OLvGzi3WMi0tcoJXh2n5BoW8seXvjrJAn9MbVR5JLHzxLZOxk76scUWUUVU19/JzsJjH7C8auCOV0KVpsYTPd1nuTWt3FE3wWRkRlqvralkTG6Dyr9X/EGQ8wQJ8P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59c2a81ca92so2094609e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 04:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524519; x=1782129319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akuiOgYcbdwbz5CX+b5tWNYxkr5P1OhsIXqWYjloeWQ=;
        b=kK9ENg1pmsqs6bsdETnHvJ1DgO4+pOtxvbVKMNwcqaW7dxBtKlIeeKAoat1U/MQUgL
         bevQ3fqr/nsEAGWlY6dMJlf2abXGLT68P7BIn7055tgMHNR/ULLx267PSR1d3ogchngG
         7+ffIB/lF/SPIN20Fzn4GBj7qfYIB0774sVMyY/sSMuoRUmGG+zgY87E725KD5rmC/gM
         985IVwaAXjJY1wycw8rjsGPtbuf5AwpQn5BK9Fx2haCXdbRRmpG/qB0t0Jkpoaz6wGrD
         +MFSVnCWwlPK4US64XwMmB8uL0vTTnQfDi6x/J2NrhUM7tq48aJ8vWgxcpSa0plJeYTV
         knJg==
X-Gm-Message-State: AOJu0YzcBe1bmbhvxNJBQTSu1sgLbX3G01pzNov+uNGVGNqoCTWu5kjx
	zHPK1WVWeutCRqu4Jb3gTf5MVWtiJ1yp0LIzVvuZMC6MQrf2tso+MHWod6o4mVln
X-Gm-Gg: Acq92OHgZF5nIYcyVovt+Pt9GcoIzLKK1vDamjarW7sI9HkQQEeYqBQnszCbT1T9i08
	jEz5VgUsn+c3wBQdM3iL0J9eI5g+ClAE3dfu2Dcao+jo9jHQkQMCBTIopIwouzLl9TUHDZQXaXn
	0FzssKjdyh0z5zZ+U8zlUOgrCZmzUlAkShATqmeiQtX789TOuU6CysvH/UuknpgC2stIUsyQOM/
	VI6b3aHfDlxHAw3cNzw+x3tuheIQS/GBDZ/4hB7ZcCki+x8d/EqhpUXM5rx4bCxFpfGt6xL3TZR
	MYrhw3CuMFxN+lSVc4Y5qf/9lYZ3dPLVIBjJ8LuHFXEYde3XsdYzgfxjZw/we5t2TG1pHIoWzwX
	Ipu6e2JQp2o7L3y0IlghkDxuA9HhJEeEFDhVPoz3JjZFxaLkanl1vpRM4L7YMrDQYTofbAjeFdh
	bCjomzQPrXNHbNxQb2h5SWhteq4FUVRiYx0ACaafnx58FsAZOnoacayBQcA1JahyJuEMsul/E=
X-Received: by 2002:a05:6122:3c53:b0:5a2:9154:2792 with SMTP id 71dfb90a1353d-5bb6c058399mr6881257e0c.7.1781524519444;
        Mon, 15 Jun 2026 04:55:19 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901ac4d6sm3197294e0c.13.2026.06.15.04.55.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:55:18 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-963d7e5ffddso2319196241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 04:55:18 -0700 (PDT)
X-Received: by 2002:a05:6102:3306:b0:610:6e69:5235 with SMTP id
 ada2fe7eead31-71e88dae7d4mr6834578137.22.1781524518020; Mon, 15 Jun 2026
 04:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com>
 <20260612080354.57459-6-wsa+renesas@sang-engineering.com> <CAMuHMdWEJT8JYuSGQmNsbUZuU+zx7prwMHVikOuOS-iXYKenbw@mail.gmail.com>
 <aixTJEh-A4WeL4fJ@ninjato>
In-Reply-To: <aixTJEh-A4WeL4fJ@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jun 2026 13:55:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-R9KO-6gPu3KqEugwkQSoZ5my2PZeHXv8bCoQjW1P2Q@mail.gmail.com>
X-Gm-Features: AVVi8Cf5qLIzimAFUyILY9i1UCOrGcId5ncThR3LOBaauA3jobqJLHJUMwQOWmo
Message-ID: <CAMuHMdW-R9KO-6gPu3KqEugwkQSoZ5my2PZeHXv8bCoQjW1P2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34018-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6A83685F2A

Hi Wolfram,

On Fri, 12 Jun 2026 at 20:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> > > +&spi1 {
> > > +       pinctrl-0 = <&pins_spi1>;
> > > +       pinctrl-names = "default";
> >
> > Please document that this depends on SW2-4 being OFF.
>
> Hmmm, this is a bit weird. SW2-4 does only do the routing to the SPI5
> (target) controller connector. SPI1 is totally independent of that. I
> can read out the FRAM with 2-4 being ON. Dunno how well that behaves in
> parallel with RMII2 ;) Shall I still do the comment?

You are right.
Once again I've been bitten by the confusing naming in RZ/N1 DB/EB
schematics.  So no comment is needed.

>
> > > +       cs-gpios = <&gpio2a 31 GPIO_ACTIVE_LOW>;
> >
> > It doesn't work with hardware chip-select?
>
> I couldn't get it to work and I know other people also use cs-gpios on
> their custom boards.

OK.

> > > +       fram: fram@0 {
> > > +               compatible = "cypress,fm25", "atmel,at25";
> > > +               reg = <0>;
> > > +               spi-max-frequency = <12500000>;
> >
> > The actual FRAM part seems to support 40 MHz, but that may
> > be limited by the board wiring.
>
> So, what do we do? In my tests, 40MHz did not work. Up to 30MHz it seems
> to work. However, all of the BSP DTS snippets say RZ/N1 can only do up
> to 12.5MHz. I don't have an errata documenting this nor could I find
> another source. I would still rather play safe here. I could add a
> comment, though.

In that case it is fine as-is.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

