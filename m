Return-Path: <linux-renesas-soc+bounces-34187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9+znCFmqM2pjEwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:20:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDF69E68C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:20:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QT7cVVSQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 999E7300576B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 08:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003A6379EF7;
	Thu, 18 Jun 2026 08:20:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA443932C8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 08:20:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770834; cv=pass; b=rsQJqKRCubAyCUcj09XNqizjBV2WcrXlX90jn7k67/LftS6PUJnld7IDYbfpyuYL71jtmVJuB/+YAljLTQtTZnZSBRR/au0lG2LoHLWEN4m+afOKCw945aShNWcHGIbqMRN3oR/KY+ZxINARSvvcb8VonWvCuIDwck8D0njbh5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770834; c=relaxed/simple;
	bh=fiMoFb2yDwUTE2GdMx5xeBoU/9rZgzEwoxvoMoWxtos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9rwVGDpgYRN+de+rrcGTjYslidObCJ+QcFmLEnDhy8UqoKUaiqMebkwbUSF0UjV90upgAsXD2bJKgHv4mIi2E2516K9QO9LRVRH3bnk+z96Yg9WO1DnuGJroCpsPv+V/DJaEj4EmKp7NGNi2TseXMzHYF0B0iG/nvepFLfzE3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QT7cVVSQ; arc=pass smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-462ebd5d37dso757958f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 01:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781770828; cv=none;
        d=google.com; s=arc-20240605;
        b=loQ0QyuaREC3JtN5QfsmkAQAfRmTVPA1NwB2xyI2vd1m9d5ncs3sDVAipTqD9xNbOE
         qmSoebgmOlFiyBPlt8vR6Mb0klbxzjMFZEzCkaG+I/pdtVvStc5TEIZNZxAfMUpq9/0q
         b8NWjaTvdpZoyLTizGQEBenr8mX++VbPC4PPNi84LbTJZnUfIGh/jZsVJoNmOX53FZ0L
         zcWRXKCdBkEQ/lv6HKqtb5288CCzXo+qZ0E858EO+PlLtBLBpFj6iq/pxVJJDwZ9Vyk7
         mK+4cs5PC11boev5/AVziMUrtvUZyBXWwrXZFmrwn/320Kb4I55ED5F49PHTCE5a2YIK
         eJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmxp3UYQzWdAJNffCvhOnFb1/BbRExCkHu3N92bH3tM=;
        fh=UujsxMe5zG8AAlIeITsSH/Y8Iar9/WgmvulwTfdwNFE=;
        b=dhXBKphcluQy7gMxzDASpDenQl9hiQtN5r0eqqPh2ks5OUiTO1BqJv3068fu6wF4M0
         Lg5crONfIsW52o8kFTmQIYILcN+ApkglmvE3CtIjmteAqAeHiWtQaTmPXBPzwm0I3SxD
         a9czQUSenjxyc4MvJQqPdQGjkxh7QfgH4Hwl6pnJ91tDaL7xT9fBp5SEvnlCrQs1LZEw
         SKnav0GbmkJrkNpstXIQpYmU9sgT5BDRMMwxGa2lYg9cNGoyBNQui/biLfV/ebKbfbt+
         2z6BsJuOT+wQWFH2KHBBAdbpPpJyHg14KJVCqt9Yme3mL4+iC7/N1LjJaui5u4e8tDFx
         J2JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781770828; x=1782375628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmxp3UYQzWdAJNffCvhOnFb1/BbRExCkHu3N92bH3tM=;
        b=QT7cVVSQZuAz6NuccHVwpkgY9DFYs6yKNBeHevouBsdjzS7z+B8iw4w07VYXdAFOiJ
         F5OEvV0tvnB8ddk+rXKzOFDDhHzNZGqixLtC2hLgfTY5hDWH/SHAR8xil0G4bOFR5Zdq
         ybhdJpE9SNDVr75Ra3aCbjlt7gigNzP84luuAYfAlIrKDRNRKi9llaAv9EWAtGqmIm3y
         9SQVkyd6kMFDeDYxMhA6aSdXO420bAkxKSccEFcLzdEoBOTzcWyWKnBpPZfw+cfCnwp8
         vyBcnO3mLslou8IE+8zn5UWjha9V04DoJ2PvS6XNwBxElAzqbOW4woSnmGqSOyJyUioB
         bZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770828; x=1782375628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jmxp3UYQzWdAJNffCvhOnFb1/BbRExCkHu3N92bH3tM=;
        b=oi6jIAL06kViO79vkE9arAUOF4wMAdxM7Oe+u2egiTPfMEpHzJh5amL56DiRP/uIi8
         m7Fsx7JaARNxMsFfAkSUtnrYO9hu7Qjn8lm3PYZpSfdrykIiVZfczH90AZAH2/EemDQN
         KJMmsPBZVVT/65bfvDPJFfh7mQTefKoxhkSw+WLnm6ro+3EW5HFb9f3h7y/rwFNhxOHD
         eXRQgTKoIF8TxmBWAlkVUq1sVLD7/Amf8AgIuHM+M6Oa4IvvstQsq2+ZSxF2c8Xa0SR1
         QM4qpDikVJvAwcDFH4jHTboBzdSMbHNcQV4Ieu9UgAZSGd//jHVvS5TeiHQRXK3eXYEx
         1X1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Gzgf3VslE/TREALXPr0el4MWzmqd1wSw+b8sVNW4JCyPifpoKfWVyGZfELK0wH1NjHHw9UFxNv1pkAr+H6hwAWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yHnj1j1HSG5zDTnFUcDW8y0iHB0MaliEV5qy8HUdliutTRCB
	Tzez7u314u17EdiiR5S/R4Pchn/o2Oyh+MTPTX6H5K8mJkrLtC9k9cYFQaMWkc1BjGIqlZBwAXt
	n3X3yrN8zS3Fgj7zk5PJlzVd1Uonj6oM=
X-Gm-Gg: AfdE7clEB9WuUqykdoUTwVhapZ8oSb7miDnf++bC2jjk21e6gF69tQpulGnXGUksrsW
	RkeTeEPXmN/I+5KExKbXyDeJanoBTrpEILeAQv3QZhLitYVw3SDa6yHmgrXC1UNUoEiynxhUnth
	tFngrbIojE8ibuq4PgBjyr69aTrtXta7fo85yDHUikgkppgMOsaoDXp3VkECHelaG4qenwy52SO
	5kohYgFKsP/rw5t1fL5e5FVWsM6YVKhgRw1cWYXKzGFn05L8rpK9OwjYi/CghXVKXp94Z580Vcj
	DSS8XdHrTc0kgARhmkD13XUj02Npmt7AP9TLSvzqk+2tXw5y8IieSNmA7XJAdIvs8ZE/nXwckOo
	6oFS7OyFLhaLWeAU=
X-Received: by 2002:a05:6000:22c9:b0:460:2eee:4e21 with SMTP id
 ffacd0b85a97d-463ac0a944fmr3916466f8f.17.1781770828175; Thu, 18 Jun 2026
 01:20:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
 <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com> <CAMuHMdVx_SS0w=x4H3WUb4BdnOXQOxboeFZwmvhP31HLoQNNkw@mail.gmail.com>
In-Reply-To: <CAMuHMdVx_SS0w=x4H3WUb4BdnOXQOxboeFZwmvhP31HLoQNNkw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 09:20:00 +0100
X-Gm-Features: AVVi8Ccg4AT8n1omfHvxVoN0Ah5TcPCtg6-Pb4o9uNtxeqlzJVr2zsf7kYawbAk
Message-ID: <CA+V-a8uLoOdFcMzE=1=TDRhQjf7ffy9C=gzOgNf55HpAJ3_+zA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34187-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EFDF69E68C

Hi Geert,

On Thu, Jun 18, 2026 at 8:18=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 17 Jun 2026 at 22:17, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Wed, Jun 17, 2026 at 10:48=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Introduce a per-SoC PLL reference input frequency parameter to avoi=
d
> > > > relying on a hardcoded 24MHz constant during PLL configuration math=
.
> > > >
> > > > Add an input_fref member to struct rzv2h_pll_limits. In the core
> > > > calculation helper rzv2h_get_pll_pars(), derive the base input cloc=
k
> > > > rate from limits->input_fref, utilizing the conditional ternary ope=
rator
> > > > to fall back to 24MHz if the struct field is left uninitialized (0)=
, and
> > > > drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
> > > >
> > > > This abstraction permits the reuse of the common PLL divider logic =
on
> > > > newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL ref=
erence
> > > > clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> > > > disrupting existing platforms.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/include/linux/clk/renesas.h
> > > > +++ b/include/linux/clk/renesas.h
> > > > @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(=
u8 divider, int target) { }
> > > >   * various parameters used to configure a PLL. These limits ensure
> > > >   * the PLL operates within valid and stable ranges.
> > > >   *
> > > > + * @input_fref: Reference input frequency to the PLL (in MHz). If =
set
> > >
> > > "in Hz", as pointed out by Sashiko.
> > >
> > Agreed.
> >
> > > > + * to 0, a default value of 24MHz is used.
> > > > + *
> > I'll also replace `24MHz` to `24000000 Hz`.
>
> Personally, I find "24 MHz" easier to read.
> Counting zeroes without thousands-grouping can be hard...
> https://lore.kernel.org/CAMuHMdUp3fOkAttk2FKJTh5svaiMwgu4JZ8utPeHghU4TQLE=
-w@mail.gmail.com
>
Agreed, I will leave it as is.

Cheers,
Prabhakar

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
>

