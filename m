Return-Path: <linux-renesas-soc+bounces-28891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OvNLaeSqWkqAQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:26:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B76A213587
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A47F305844B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 14:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B0F3AE70E;
	Thu,  5 Mar 2026 14:22:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A323A783D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720560; cv=none; b=HeMw1dEOfgRq28bJNEE0EQ2Fr3K4h1jwHtd8izYiFAuwRcVYE5kKtYn6kT7Wd8O2larnxSgq8WPAg4JGX2oXCVTlydQbWRnkCvT6udAznW2CDVcIq5aMipUZNNYzOk9i3O22SYIYO/ttD9kbPPJnKOb1CvFtwTX79YZV4qPRN/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720560; c=relaxed/simple;
	bh=/3f4nIlcCZ20P6/JbRx5tsmmqG8H3w9dAtoGznvYWWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxoQidpO+4xQil02Lsf47zsesWgjZf8PbmzbHk2U8ogejluud/+8IcsIipAqb/gVxEv7BFAYESxOs6g0JPifq2BMiFVSWJ2Ny25aWJ8usDS/083Aax0S7tnDfKXz3RPvKKQRq6HyjHi9TnKwv+DxYUXaFy9oynjlZsLZeIbbg/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b936331787bso1332154166b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720553; x=1773325353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMbUtOFBoMgA60FOVDAadgTwgL06nHyrUoMpJYzbdVQ=;
        b=NY/cOn2P/ZjYimKH3rGcTrUggxJTVqO3zaAJVYgwv/uL0TArsO/Id8L+YgdyHqoSGI
         u/DGUCZtra5EW7eWxgDeDSrtCUbo8LwvgkjR5pLOhXrJufw9aQJrQUfco361ecOE+RLY
         ba7s3ZmUQM1Q5C8DRpiaz3mTiKORnnM51GvOk38QIHYGXwI039u4PSzWPdhYiAvfyvor
         WGZbV1tXtqXihgiYK3DxjIX2PB5IqJPh2l9GlthHZnK3Z3EuZlKiJKg50y6uhAG1EKcH
         GrRFlwJTOLb1XO6UWD7v7TUkIILDdiOZDJ0R4Rljp9LTUFmLIILyfYKQTXXYajsSOg9b
         uMhg==
X-Forwarded-Encrypted: i=1; AJvYcCX53vjQ+QYK7jPvZC4n5oWjq7A3N061cbvOrb8187GQAgE5mG1NLi/vNZCL7+aIeCvZSBZuScyXxl5MwqYmXdP+Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxftQeoApTBExAygbguS8fWtoQu2l3P+wZLmrnsfp18gJW3SndT
	8Z/GjUZLiMY2exAf8ttOkZGXnFAnclIqjJvfpzb1SMumP8sQ9UkA6JXnbGcFPV+1UDA=
X-Gm-Gg: ATEYQzz4jDSyEszuPRtiyXXziPaSITgkpghDXqI/RzZ/dywwMnMMUZBTmbiw5zzBA7X
	qGYswTkxtvhqXgK9BN6XGD0C8bpNS3HUkJf5zTQIytc+IWydHhQJ92vtFyFIl+NTFDFe1PE+dw0
	iH40fDUrDr2VCX+OVWy0uZtAsQgxY6NtAdZ5lrBu1TqmLS2U5oZPHfODLnw7JvkL4AXuKPJDDXQ
	lzG69guCs/vLu21G7k7hl7LgTUVhUAZJy21AgtsMG4bSXtcBjJC+uMvLrLT8weERYWI6JnNblvI
	99lq0XebGcQfEGTQkwzJQxtkVyQ/FhG+IlKCOpgZ1rAR7HxkcTCzRxDUj/X9n2nrFJatNz2qVDd
	QqAoxaMuKHB3ylSayIeyBoBLtJ77o4i/tdM13/uU1M/N8Zt3nqDTJ+WHVegkkh7Aeb7bK/hB/3G
	BMlnjr4B4FAFqKH7xZeEjZnFx65+pS1lEWMwKOpCtt/5afmmGZHakFC5VTBOtYCDOZdjSd+gc=
X-Received: by 2002:a17:907:e895:b0:b93:c5a9:a5ed with SMTP id a640c23a62f3a-b93f1176789mr385349966b.10.1772720553299;
        Thu, 05 Mar 2026 06:22:33 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660a55b191esm2845085a12.23.2026.03.05.06.22.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:22:30 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b941bb3e23cso46658766b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:22:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWelOTMTbJGtGcxnvsekIUqZfkM+V4CGJIdtWXntCLD2tVUuYiwOFZa8NoBCRuZwexMyDqfxgNWkVjcQf4NLxaPaw==@vger.kernel.org
X-Received: by 2002:a17:906:f5a8:b0:b93:c5a9:a5e2 with SMTP id
 a640c23a62f3a-b93f1176dafmr385035766b.6.1772720549265; Thu, 05 Mar 2026
 06:22:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-7-biju.das.jz@bp.renesas.com> <TY3PR01MB11346C1B39DEE4A11270FFAE4866DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C1B39DEE4A11270FFAE4866DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 15:22:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYMWspJWVtbhk00B4nWGY_rb+a7h1WfJ0Y6gHGP72R+g@mail.gmail.com>
X-Gm-Features: AaiRm51ilseGDFMV6nGwWIBx2u0k7pUyutq0IevFJpQaDa-lK7xcm2qHhcqW6es
Message-ID: <CAMuHMdVYMWspJWVtbhk00B4nWGY_rb+a7h1WfJ0Y6gHGP72R+g@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] clk: renesas: Add support for RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8B76A213587
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-28891-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.919];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi Biju,

On Tue, 17 Feb 2026 at 12:13, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju <biju.das.au@gmail.com>
> > The clock structure for RZ/G3L is almost identical to RZ/G3S SoC with more IP blocks such as LCDC,
> > CRU, LVDS and GPU.
> >
> > Add minimal clock and reset entries required to boot the system on Renesas RZ/G3L SMARC EVK and binds
> > it with the RZ/G2L CPG core driver.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> > --- /dev/null
> > +++ b/drivers/clk/renesas/r9a08g046-cpg.c

> > +enum clk_ids {
> > +     /* Core Clock Outputs exported to DT */
> > +     LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,

This will probably have to change, as per my comments on the DT
binding definitions.

> > +/* Divider tables */
> > +static const struct clk_div_table dtable_4_128[] = {
> > +     { 0, 4 },
> > +     { 1, 2 },
>
> Typo 2->8

Indeed.

> > +       .num_resets = R9A08G046_LVDS_RESET_N + 1, /* Last reset ID + 1 */

This may need to change, too.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

