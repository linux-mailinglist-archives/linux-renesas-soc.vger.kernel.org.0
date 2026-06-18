Return-Path: <linux-renesas-soc+bounces-34185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yikKN6mbM2rNEAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 09:18:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D269E090
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 09:18:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3100F3019819
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 07:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABA33C1402;
	Thu, 18 Jun 2026 07:17:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FA73655F5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 07:17:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767060; cv=none; b=nZ9JePp8TNO9B9cmrZfNofsRrwONe6JUx1TTiBjlvio6zMd9sG4GWMr9JuszE1im9JIcgoFpQlJjOCDzAH3sFFQLIpPjVv45Q0f/pll11rxHlYY/E2Dkvs2RV+KeWSZbUXLtsRtuFX0QcHiJOdaclqqkDCuEeX3/CS5yXfeCEYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767060; c=relaxed/simple;
	bh=tfbcEFHyRGxmt/ZNMjfmkNiTbtmi4aiIGAAer8bH9z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fyhOL6CyDlkh9dMspuevLTnVRlioJz/4ZYn3gOHhPhSWCJz8s+/y4X35oxUdldVFnd8naIkrOGQHKOqPCVJ7455Hktajue8NVPi5o2dlSk/K9+UiQM3NmNo5NksSQIMqXX+dnfSi12SpmhCRepaibpGEGEy5B/J7aF5kdcff7DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59ebde7d704so220499e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 00:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767057; x=1782371857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xzQ4TuItSjjDfqcY5h5uPw4axpJfO2Kzm9zj8eN9JJg=;
        b=VXTvnbG3dkxrPji3uqya8Wt0vlRDYPrLfYGFqEYvLsvngI+mI2CJSRqSAX30G9ut5G
         oZ/mXevEBoMjPJSxGyHwnE2TSn7pJo/0sHRygXNvv0I+Q1kjjRDQ1dIigjZJUo7OcZJN
         gnux4n+oWVtovj596ETvNqyo5wbrAGjcvBNeI7525EjVt+meyEiIJO5judNaQlHXPt9i
         v+7QegVmR58ytKUsQn8mfDimyl3dohHN9eCpk4JpIDXz+pS3yPo26uqiuL5Uv0jqaZgE
         PDq+s9lwtuyiVtEkOvBgdJU8Cg98lUa/9l6K74IFAZgQGsu2eirN3RY77TPrqWa77sSH
         VMOw==
X-Forwarded-Encrypted: i=1; AFNElJ//aaSm4uEg3ONBy3iWS2HshU1bQHQLq796LF0+yEFmvJGoCVFDIME2B/aT3XMK65rrKepNFJnrmp5ZCY7xPmI+Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLksdQtzclg1tExBbEgp2OuhmaU6VNyJnO053/uPWChSRrQtP4
	gn8OdP/Pi/6F9P0AxpjfqrvUhBrVCF7yEGUlTTlqa8ZH0dYN/gymWD1R/RrUavk2
X-Gm-Gg: AfdE7ckdUXCjlthp3EDSESZk+ZeqlvWAJr7mrtbopQJE0gK5iZrbMq3/v1jT3QIBpb3
	8TkLI8y/BTQQoSm+Mc0tPdUUphYBPYtPYx8h7qrCmX4MyZNXgVBCNL4xzyIMk9bQZ3vA0PF2XKp
	KS8lBsdPTKqA+mNkU9i/dyN4T/cL3xCT2t9OkYaJCeVh7wPvbEhC3V0JJmnja8ASsq1kZnX5jP/
	TW0fIUk8d+Mbexun8wJ2DJ/kYDMpkUIv1zSL/cPqEgMvKlkUIxsG+TPSJRKEoxCZQWsP6+dXcLy
	F601ZI0aKo4F50NkobKdpc0H3ApBWrrag7zRRhGZGZt3rkJiC5kmK3lcRpyA7Z05t040vVGCRX3
	k4sShvfgsyns1VEkAR+DVshb6y2DHVHHAaSsbHcOs1iA4hoCtUBnw8xy05ScwYgWmH59JyRJ7gs
	USpe+j9opTNXGcB1LDVqnEGQM1LQ2oV9wlvtRtRBSPK1+aVoVa6Q==
X-Received: by 2002:a05:6122:4690:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bbbe5d095fmr3736337e0c.4.1781767056772;
        Thu, 18 Jun 2026 00:17:36 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901ac4d6sm10315183e0c.13.2026.06.18.00.17.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 00:17:36 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cfd17e9250so255267137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 00:17:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+FOqgMjd62S7OuShNZRSCqqMIaQ/HTsStX31DXbc6075hyws7kooaHo1V2RNxawvTszTp3M331pdHBEQWBKIDwww==@vger.kernel.org
X-Received: by 2002:a05:6102:3f51:b0:635:1bc8:3563 with SMTP id
 ada2fe7eead31-7246cde4ab6mr4100174137.20.1781767055966; Thu, 18 Jun 2026
 00:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com> <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com>
In-Reply-To: <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Jun 2026 09:17:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx_SS0w=x4H3WUb4BdnOXQOxboeFZwmvhP31HLoQNNkw@mail.gmail.com>
X-Gm-Features: AVVi8CdwNDnTBvDYfJRjdNKhkzB68fOeQnOFgapo4u-OWjhPO9Gwwv76NFhl4Qg
Message-ID: <CAMuHMdVx_SS0w=x4H3WUb4BdnOXQOxboeFZwmvhP31HLoQNNkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34185-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 617D269E090

Hi Prabhakar,

On Wed, 17 Jun 2026 at 22:17, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Jun 17, 2026 at 10:48=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Introduce a per-SoC PLL reference input frequency parameter to avoid
> > > relying on a hardcoded 24MHz constant during PLL configuration math.
> > >
> > > Add an input_fref member to struct rzv2h_pll_limits. In the core
> > > calculation helper rzv2h_get_pll_pars(), derive the base input clock
> > > rate from limits->input_fref, utilizing the conditional ternary opera=
tor
> > > to fall back to 24MHz if the struct field is left uninitialized (0), =
and
> > > drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
> > >
> > > This abstraction permits the reuse of the common PLL divider logic on
> > > newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL refer=
ence
> > > clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> > > disrupting existing platforms.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/include/linux/clk/renesas.h
> > > +++ b/include/linux/clk/renesas.h
> > > @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8=
 divider, int target) { }
> > >   * various parameters used to configure a PLL. These limits ensure
> > >   * the PLL operates within valid and stable ranges.
> > >   *
> > > + * @input_fref: Reference input frequency to the PLL (in MHz). If se=
t
> >
> > "in Hz", as pointed out by Sashiko.
> >
> Agreed.
>
> > > + * to 0, a default value of 24MHz is used.
> > > + *
> I'll also replace `24MHz` to `24000000 Hz`.

Personally, I find "24 MHz" easier to read.
Counting zeroes without thousands-grouping can be hard...
https://lore.kernel.org/CAMuHMdUp3fOkAttk2FKJTh5svaiMwgu4JZ8utPeHghU4TQLE-w=
@mail.gmail.com

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

