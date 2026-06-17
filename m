Return-Path: <linux-renesas-soc+bounces-34178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VqCnMe8AM2r+8QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 22:17:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42D69C53F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 22:17:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rCn5o+MH;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 461A130A89D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 20:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C963B0AC8;
	Wed, 17 Jun 2026 20:17:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848AA3502A7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 20:17:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781727469; cv=pass; b=BhWrs/aMA0Y79zint/HYY6sy8pZohsWJRVavONaBn8iUvmODUD/6Ec0ufbh15l5sP6pK3vc+zVPL/1DHXxtbHEpY0RqsWpH1o+3o/tLAvnOcmdaBptIunaRz+/b2tferCASztbFkqyiBoWCafk9wBR5Ok8g2TSGU/FjiLgyU+IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781727469; c=relaxed/simple;
	bh=Q9Tg5HXtBgjaBlJcgN82i6LPP5PISH66DDdSazi6cU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGWx4frTVlh7wGaGwHpjzX8G/EdpPQEVly/wquBFQTMy+PaFEg2WwsQdO77CL5YtGwcQG7yaXRhdAlrUjpqEfosMOOAG63aLrkXokC/nt/ouKBnfSLNgwdisMx/CMMaBcGRdkMVwqtbxdmpc4lLNB5MuaNMthwUEYcohseuHE7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCn5o+MH; arc=pass smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-462ebd5d37dso242746f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 13:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781727466; cv=none;
        d=google.com; s=arc-20240605;
        b=dQg38z8ZSOM3IUbbD2Y+6EZ0kBcrwb7FGff5jh7ea6PrvT/6rYFcwOyS224MVqWm7M
         zDHUH3a+OENG7bTeamU74y11LA+bnqBpfJQ57oDhu8ESGL64+zlRq3mLrxxO9W9GRA1+
         Mjry8z7gvBSI2z3uSQzPjYe/Zm8Jl0DzMI70bGvo7gGVfwWWG8VwcOkqqjK77zFPXNlj
         P6H/66ELifthyvzVk1o17cb6rKprlTowG4HlG/DL0rCd0oiGaZrCPB519xu/LBr++Zfw
         Ea1HGXVTwMHBy6Zc8wy5CU4aiEJJ1M+JHSO0oIQ9lNMkcW55iv4S05dC2RAc2FGV/yCn
         uZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        fh=RLS2iQNovT8NQlgD9HaEKarVVyuWfaWQ+Vn4WhwI0zg=;
        b=EU8MzioYr3Z9bLP2fiy1+26CduQAJEWfVTqqNJdXux5meyhxTdx6zJTeXymRDjIVGp
         LU1Z9JRc8ehTmBVu6ZPIg5Lsno/LCK/LuTYgVpLS9kLY/iUCKxarqxiUgs9Zsv4e6DBF
         2GmW4PPgWIiI/p1v8i3howUM8O7lQzVFsBnZtOKWP8mNHHr/VrMVdiDNzIBqAkj4tEUu
         lC4FEJSVAN6s1Utywxn2ofJPrI2pFAglvn1Rxd6BB0mIqNzzgIxzMyul1KfKB2oTaXgV
         1o3Jr6QkpFwLeE3gVRy16JUZDwRBvEv0YmAUJIq+o2mOTkJlzyaIyqPFMke9GAse5bP6
         Qkyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781727466; x=1782332266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        b=rCn5o+MH6S/4HWuqYm4hJHfhmmTGZN6OpcAuGGIcW9ZFhkonUtPh+hufxTVhUxeICK
         iVqOxP3xUf8gn05TMnwP95gnoJsnvulceVBZlI8G1eJLIZuYHU2jBqnxlS2cbc4pM19J
         P20RAENfZT7JPUlpanxvIOInd9MSMcXhDV1BpV2pFcgo//snA9Zx29PaU/FVVlvy2+lt
         rUyJWEiNu5ipEhlgfSlnvRgdKD9J9Rt/kEeTLJrMgUepf79VWousmIu9m4w5yKkqYMOu
         GG1WUHQzaLFdvHi74A+COu6xdH7fLXCI3/x8Hgmwfd+aiNHeKQ2NoyJ/SQT1e81sq7sO
         QJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781727466; x=1782332266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        b=V0wn3I0a3vWJ3uppop3bg1tSZE5TQZXw+o2mtPTcnQjOPM2PZOGBD4a6XUbt6+Q9qB
         5ae6xT3U3CyxhBOE9D75qbNfJVdip7o3xKaEaaApkqcrq3z6rH8lPqAJ6cIPeTUu2Wip
         BAd6DLKp7lUPUMPQVYWIA5MDwjP/NH55yE2nupM6citXdA8tDMd2Jn1Mx++uWAkX8/tj
         lZRnONyudr+CXaeCTkLhRmB3sdsXOmGc1wm+yoxtTbmESjRWJ32ZCqNjoOcx7vpQ3EIi
         ALAOgKRV8FVycx9KMC3D3MEMId/QvoH/W+mwgy9kVgLq4SLThMyEawpHa7rxKsgno2QL
         Pqig==
X-Forwarded-Encrypted: i=1; AFNElJ/+ibpgfOu10Wsd/27EyWByOPZjReUgRPACoGw38ojr1Ed72VlE3eo+sIpWHy4zv5lF0rkVPfy19H9TYnYjxsuabw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ4AzmG82FTTGcgCDUtG+H7Aez0pPK8UuIWJw3AgyfFwq524Xv
	vNRrxHlTrGTF5gVJyHrXVaEllWrjauzDtBaAVDnfq8PFKclZmJ7BcsNYW3IVsWaXvD6LaUrqT+J
	un81Q9qWiwfeutp+Wi4jtUajrgmIBKg0=
X-Gm-Gg: AfdE7cm4ymSWqIMJgsYfRCh7tIVtJ03jU79qV5cJSyYXm2W/S872q5M0zjTaIHlDdG0
	EeHe3CCCAYd1eBc06CUL8/HKYKWo72/ANhihhTA+PYEEjbmDdug+7IUFyI+BRFKQuYY/Oqngst9
	KGcBxO/6y/EhQV4g09Do7Rf+WRo15S8Pr8/2vd7/Q24puGW7QwAfPadI/S3nHvsQQMCnqKhn0e/
	LEKFjTO2qfqSdYEXSeB6xs9vC9XhR5RvuIbYYeZIzN/faT7TW9kDTuf+G6+/SNcUQKDGyk+cgjw
	gAJyVNbmQ92j9UFlc5bz7hbqbBP5SIyfpvd7vlQp7CnhPmBZEp4XDbnmMa2Ya1JYCSMhpw==
X-Received: by 2002:a05:6000:608:b0:460:64e8:2553 with SMTP id
 ffacd0b85a97d-463ab7024c1mr1161137f8f.4.1781727465727; Wed, 17 Jun 2026
 13:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
In-Reply-To: <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:17:19 +0100
X-Gm-Features: AVVi8CcvqvFDB97cccuGqXXMZPwXSO4sA5oZyLX7YfroXbBiGEnNUoByjqYmvPY
Message-ID: <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34178-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C42D69C53F

Hi Geert,

Thank you for the review.

On Wed, Jun 17, 2026 at 10:48=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce a per-SoC PLL reference input frequency parameter to avoid
> > relying on a hardcoded 24MHz constant during PLL configuration math.
> >
> > Add an input_fref member to struct rzv2h_pll_limits. In the core
> > calculation helper rzv2h_get_pll_pars(), derive the base input clock
> > rate from limits->input_fref, utilizing the conditional ternary operato=
r
> > to fall back to 24MHz if the struct field is left uninitialized (0), an=
d
> > drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
> >
> > This abstraction permits the reuse of the common PLL divider logic on
> > newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL referen=
ce
> > clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> > disrupting existing platforms.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * various parameters used to configure a PLL. These limits ensure
> >   * the PLL operates within valid and stable ranges.
> >   *
> > + * @input_fref: Reference input frequency to the PLL (in MHz). If set
>
> "in Hz", as pointed out by Sashiko.
>
Agreed.

> > + * to 0, a default value of 24MHz is used.
> > + *
I'll also replace `24MHz` to `24000000 Hz`.

Cheers,
Prabhakar

> >   * @fout: Output frequency range (in MHz)
> >   * @fout.min: Minimum allowed output frequency
> >   * @fout.max: Maximum allowed output frequency
> > @@ -78,6 +81,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * @k.max: Maximum delta-sigma value
> >   */
> >  struct rzv2h_pll_limits {
> > +       u32 input_fref;
> > +
> >         struct {
> >                 u32 min;
> >                 u32 max;
>
> The rest LGTM, so with the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

