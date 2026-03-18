Return-Path: <linux-renesas-soc+bounces-29821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ0sBUUQu2nGegIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 21:51:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A72C2B07
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 21:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1BD530470D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 20:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FB336E49B;
	Wed, 18 Mar 2026 20:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk1r4cd7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369236CDE3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773867073; cv=pass; b=VbKlg9RyE31mUBQAqjd60NIQtHui80kdYmK+UzgQrFX7LavPSZUhpOHOUZPk7kn7mlAG4tQlhlvDFr8RAaoa7GhrgBtsCXWSOFLqmVCfR4RU5HCIZSCjq/z8I6JYN8idurx94ywQkmZp4nGAmIZymTNRs1Vsr9esSvKxoDBVzhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773867073; c=relaxed/simple;
	bh=6P9xFqHU5a2/tPBoxIWZcIkCxbGqSw8qlEwtaFY4nAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9/9B3fH9HH7Gb2+BRA+eQzSPJY6vg3qKM/RcWHByah2Q26pwPAK85xveQ9pnNJmhJ/J1ZIRjKzreOx8PPbgU0/DXGNA1NATzoU3eW7Nhtg0TQZw6k76Vb6b0xpyIA8uq8bsFjLah3tLNkC3zJ9ztv0gT2sWCI8IonV5B5nRzmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk1r4cd7; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso953025f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 13:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773867070; cv=none;
        d=google.com; s=arc-20240605;
        b=eJmz0nzT3ONUW69lQjzyuSIzH5KQnBps9e8iQxjxSwDKDwom/P0LHdBdrKTK9YxQDN
         hu6O/EbeFd0jOey/yWGSy5bZhOmmwF7cl/VKoubpWdw4sd5ZuQnAXTosR+GSNtG5VGR+
         KiWeIVL/WYsJOMcPTDT+Y2wTnayTQlr6zuquEBS+1XKJlR1/JN5hMJWcEnNDtdMokotL
         /GwT/5kxvwVvirkjdBDIW8Wc+Jb6N+YoZ6Tel6+wJjZ4QoNcfvdV9iBbn/YjczmWGaF/
         x97NKRRLrKwy7j3fZ4n+6D0qY18iC05hYAv0YagxBPcMPTFSeJ+dBA5COVO3wMXz8Ut4
         hxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4o4o3+CQenCbsDaxrtVeBxdUmIUvAwrnaajaq8ygDt8=;
        fh=NwybHIjCKX5jW3Bv/Cx6LBg409ZAbMvGWP2TE5F41z4=;
        b=WDP0RgagsFXs3KHE7P5CusBYIx6Z0rAnvweura4oHLf8bBjEfgSgchY4T3rIJWgtlA
         CxBVeVM58wRHM67nwRipJ6gJ2cIIC8D7Q3jKqy+Ws7xGcp1vdzeFEPI3pB9rwa2N+LfN
         Wd68/nKINJB92r/VM/Zm37RWAhoVqE1pEZcu1y4R944kuK85xPzzCl+AlXRVV9/D9J8/
         dIbW6HGw9+CQwBlgyJW+5UGZyEmPFebmbI4sO54L2wo4lqttojQm7BYvhv3z1FK6ZnqS
         Dq/pLmwTNETbpKRjZwDE2HtV1yC0bSga67u1sFuNyRAdz+n02Pqt7q1dOZrlPq/nIZye
         c2JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773867070; x=1774471870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4o4o3+CQenCbsDaxrtVeBxdUmIUvAwrnaajaq8ygDt8=;
        b=mk1r4cd7uO0tbzoaZHDIAfJb3YyhnHLTW9l15juwN0ZLxS5n6RSbsVf+tlMLUPsjV7
         u3IoG9ACA5iTiUhlpyW0QwBl3/qUudlovajJti8ztQAxu9RoubKBlSmF3XMxqzRmQqRE
         TlpZzs653WTq/7GYOM+x+++vIanQOnyw6/fWs95LDC89a3v8qE16nVNcZULxjiSi4VZn
         /IbdGAcBspPvssf3O5/PUAI9Z8a47ht+QAHgizuZ89i3K3l5zNVjZvJ4dlbSM61prhnl
         VKyhuaUywQpDWi06zARYm/xTIlcGflauX+NhaaoaEDjZ21xCNK9cO3xz2jtnAsYfiSbs
         iVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773867070; x=1774471870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4o4o3+CQenCbsDaxrtVeBxdUmIUvAwrnaajaq8ygDt8=;
        b=Zyh/qh8Aow24sPZoHPTVebFdXI/gSxLcu9XuUaUDhWLLoKferSY8lsNNoMKHZeLGxt
         yM2fcsQ/1JHmFgosm7rRFTI6MBmBGGDLCMHIZ4P6pjnvuLYkW/DyogGHMlnntgLnU2zu
         9/eTCHeDEls03FLZRUysYS9lCVePV6ivdSazPI0JfWzMMccFji0eAuzhRtMhPbEgH1BF
         RTVhHPIpuEhLuZtFVGFi/GydNyhaL6KEr5CLJhIoKyDH9e0cMGf02S9t2XyVQaAM1rR1
         wSP89PZRG5L25tgbISAhn2AKpUHeuv5wOSSgS+xzMWT9AaBkU78zcKaG0omAz9+eBAFE
         q/gA==
X-Forwarded-Encrypted: i=1; AJvYcCUX/k7pEKoyNy87JvtTprP0axVjKRbQzbTTjAAavxHwLi4Fe4bVIyQcxBA7KHFrC5POHf4lA5VsRRYPBzCL0C7GJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnUlQe7NEeZX8xfLz4V2xTwZ4Xd4w3AsQxqA48ZCPDhrv3alw
	NWwH9cK+4e173Dr6a5dLpX/Sg5ipFbgb2vRrSFWva44f30fjl7H14tHybE5P5HF5z0hveexjyXA
	f7Yfwn055itYCIBBkfjOn/YmbqGLEnL4=
X-Gm-Gg: ATEYQzwVnTkic7tdcwBne7Ve/ctBKhI+n9cNNpVvhbOe7zPDbqqEJhb9rXG83TSP4JA
	ThoAKcxiKJu2x1DtLHBl5xk5LlJw/y5fLsC3WCYe9An0RS7M1WFcLHf4QxoCGZavpSH+ClnyHoY
	JTxVtYyjecZWdSwMeatKvDsZxUFi8DeQJYRU1Yni0qp/HA2q/YZugRzkhXMV7EAa/sFaRK4l4SP
	yXkuJiFgrxlBbIZHzms3YOmSw6l0PPqBrZQ1A7jcOyqFMy1/z6rKiwwCSfKXc2CjGfvklgxcvwd
	Vd2NZBh7YCSe897pVlKGKBE8sp3lVZRJv7O+bpj7Y5wOeW6x1RxDFW2Ch+kAquMrqY4=
X-Received: by 2002:adf:9d86:0:b0:439:ccd7:cdcc with SMTP id
 ffacd0b85a97d-43b577233a0mr1349825f8f.18.1773867069762; Wed, 18 Mar 2026
 13:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVxhiWXLapcHAUL6nA=-+6YLme8v8CruMESng3ZO4f2OQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVxhiWXLapcHAUL6nA=-+6YLme8v8CruMESng3ZO4f2OQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Mar 2026 20:50:43 +0000
X-Gm-Features: AaiRm52ceqKOVF2U8UD4sUl-gOqPbxnvdZRSHZUybMzo7SEQ2F0ePpHD9LutimM
Message-ID: <CA+V-a8viuC+jwnWsxKHO0Fud_Ta2k_iFLJYcQx0tZ1qhRDJckw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057: Add PCIe clocks and reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29821-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.852];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: B17A72C2B07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Wed, Mar 18, 2026 at 2:35=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 12 Mar 2026 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clocks and reset entries for the PCIe controller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > @@ -508,6 +508,10 @@ static const struct rzv2h_mod_clk r9a09g057_mod_cl=
ks[] __initconst =3D {
> >                                                 BUS_MSTOP(8, BIT(6))),
> >         DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8, 12, 3,=
 6, 3,
> >                                                 BUS_MSTOP(8, BIT(6))),
> > +       DEF_MOD("pcie_0_aclk",                  CLK_PLLDTY_ACPU_DIV2, 1=
2, 4, 6, 4,
> > +                                               BUS_MSTOP(1, BIT(13) | =
BIT(15))),
> > +       DEF_MOD("pcie_0_clk_pmu",               CLK_PLLDTY_ACPU_DIV2, 1=
2, 5, 6, 5,
> > +                                               BUS_MSTOP(1, BIT(13) | =
BIT(15))),
>
> So the PCIE0 and PCIE1 modules are always stopped/started together, oh we=
ll...
>
Yes the clocks and reset are shared.

Cheers,
Prabhakar

> >         DEF_MOD("cru_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 1=
3, 2, 6, 18,
> >                                                 BUS_MSTOP(9, BIT(4))),
> >         DEF_MOD_NO_PM("cru_0_vclk",             CLK_PLLVDO_CRU0, 13, 3,=
 6, 19,
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v7.1.
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

