Return-Path: <linux-renesas-soc+bounces-31934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGx7Gbhp+Gl4uQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:41:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F03614BB205
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16C523006146
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 09:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4079B37BE65;
	Mon,  4 May 2026 09:32:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E944337BE6B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887164; cv=none; b=JKFcjxa7becogRA4cNV02KduNn1Ags2dDM3x4f2M1rQbFMkKb79quqY80Ed16BjM6TSk1KTpH+PAmsJsJhbhcNDY0wB4voFVVmPQ0j/VmQXDepf6b6/AAaNFHFzOMb4krE2B00cKlUVssGS6QSEBUBnWizQZdh10BZ9Rt8zmcO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887164; c=relaxed/simple;
	bh=lhMXoZX5EKaIKEyMd6/+4ptCK/lC4Z3mYLu5uWl9Ca8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GB0ZAVZOiVYSRwOLdzOUt+4l/OjNlsz6pgPmC6oFJwfm10oz9H1nvgQhfykW3Q/9ZbAbg+pIx0UDdLUElpQg8+IaDYB/kNWbe4y1nWQXfvykhp+DLntvRjUs5yYuSXg4jUkuPU4S51CWAuZrI+2mGIv4ICUvBBJiX7E5wtJDPaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-47c941f7213so808013b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 02:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887162; x=1778491962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XiyjHCJDl/rogPwAqEoOmuI7BlhASDQQxZixIp7ihY8=;
        b=eFJUN+OCLAZ4HQko/1yEfm9WPt19JMNsx9EUC0omh1YLlngK4u94TO/su8t9K/9ag/
         6mhwyifcRYFZMJk5cZmZ1MY33oMsugOet2v9FIwLE2qwZ4GV7Z54GvuW9H4LPPPXyybN
         beoxn69fRU+9k4mlGo5FYOsiIOIS+KBo3sr4N5oKQaDIe27oo1+BUt9nIaiCWwIIZK58
         fiHkoaSYL6oe0im2LKaPiGmcx0sx8CSla22GIC44X8NlbgNtWLwahx0eos/aCCw+ygdQ
         tktdHg0g5k747ym8LrnCY5WIdQSAjLgPCAAv5n7tmJVDWFazgCyXOqXwHiXYBPOr1H/w
         iUIg==
X-Forwarded-Encrypted: i=1; AFNElJ8ARgXh4B7Pwz6ngmwUTsPty3uUxlNGILGTb3OE6QaHZk4erOPHbYpXFIZXrSC49nVw6BC3V/jJQZOdpD1t05TzUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbU6ZXbqhfK5sjjBgNKDoZiZeiIcpCFwXW5RfnSzFxJB289ZID
	7Th6KTEr7jua1vKhF4qUVbAL9L76PK8NsTO1/I7aLNY8VO/v/Zc8aoCIR2qtbAw1
X-Gm-Gg: AeBDietNdZNgg0nxrUiJT6QbJLw1iMEMGyJuu6YZTB7Y/7dOLBb2edkpJd7kCbG4KVK
	XnP+3vr2LAkJNzSXKK8IO5t/JIL3KSzDID6RV2M01nH0H2loyeLXEA3oP9iJn+S0mfxXfhq4F1d
	cd6Z66Dsos6xR6nr9Rq+3JwtkuxcaQVnRZkiu/+wPGygYpj06K9UUH8c5HPTjSp+STLjDHO5re8
	JInWFZPFJXV95LL91bPDRv2TetfNoQDiJmVGoyN+vmtmLcV4flEWyW7fcRp8VKlI0hAoOIXs3LF
	lVQGQcuPLU6WXNn8nxZkg1cteWCuZB90RK3vM0+ly6E13Y/xdSn2sd4n0fHsEDdd6Gue1iLS2cU
	FTTgQxsiaXAQegYAFkLFwhEHEOK6ediQyv5ZlOEQJ+JHPgNKVeStHz7MBRSeWcHyWphTrEimv/b
	bsVmYnILJbS2IQ7MK0BGZe9W+rCjDloZ2v3QBwmeDJ7AJs5q8F+J4LgqM4jZT33dfu76wtYTX8A
	Z8=
X-Received: by 2002:a05:6808:3196:b0:47a:549:61d with SMTP id 5614622812f47-47c88fb481emr4786818b6e.11.1777887162013;
        Mon, 04 May 2026 02:32:42 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76985f8fsm6323673b6e.14.2026.05.04.02.32.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:32:41 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-479dc6d26e3so2191994b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 02:32:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8lnT+HFbw99DEa5FmjqXvcB3sSI4gBtcGALhePIV7C0Zh5pe6v0GoRm8j79bXKCeSEnVcEecSTyEgF8/eEU7sq8Q==@vger.kernel.org
X-Received: by 2002:a05:6122:2884:b0:56d:b639:5c0d with SMTP id
 71dfb90a1353d-5750ca1f022mr3391522e0c.13.1777886706296; Mon, 04 May 2026
 02:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-8-marek.vasut+renesas@mailbox.org> <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
 <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
In-Reply-To: <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:24:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
X-Gm-Features: AVHnY4LakVD8SFWNnLvI5N41V0dwMs_sPKYjvoWQU3neqkGpISJJCy9fOpu_jcA
Message-ID: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F03614BB205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-31934-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.915];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,mailbox.org:email,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:url]

Hi Marek,

On Sun, 3 May 2026 at 04:50, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/29/26 3:59 PM, Geert Uytterhoeven wrote:
> >> +&avb {
> >> +       pinctrl-0 =3D <&avb_pins>;
> >> +       pinctrl-names =3D "default";
> >> +       phy-handle =3D <&phy0>;
> >> +       tx-internal-delay-ps =3D <2000>;
> >> +       status =3D "okay";
> >> +
> >> +       phy0: ethernet-phy@0 {
> >
> > compatible =3D "ethernet-phy-id0022.1622";
> >
> >> +               rxc-skew-ps =3D <1500>;
> >> +               reg =3D <0>;
> >> +               interrupt-parent =3D <&gpio2>;
> >> +               interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> >
> > interrupts-extended =3D <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> >
> >> +               reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
> >> +               reset-assert-us =3D <100>;
> >> +               reset-deassert-us =3D <100>;
> >
> > Do we need these two? We don't have them in e.g.
> > arch/arm64/boot/dts/renesas/salvator-common.dtsi
>
> I believe we should add them, the KSZ9031 PHY does require 100us delay
> after reset is deasserted and before MDIO access is possible:
>
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDoc=
uments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf
>
> FIGURE 7-5: POWER-UP/POWER-DOWN/RESET TIMING
>
> "
> Note 2: After the de-assertion of reset, wait a minimum of 100 =C2=B5s be=
fore
> starting programming on the MIIM (MDC/MDIO)
> interface
> "

OK. So please add it to the other boards, too.

> [...]
>
> >> +       pwm2_pins: pwm2 {
> >> +               groups =3D "pwm2_a";
> >> +               function =3D "pwm2";
> >> +       };
> >
> > What is pwm2 used for?
>
> The signal is accessible on the EXIO connector D (LBSC) .
> It is up to user to use the pin for their purposes.

Usually we do not enable support for random user wirings on EXIO connectors=
.

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

