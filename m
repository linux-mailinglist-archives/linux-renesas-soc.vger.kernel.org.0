Return-Path: <linux-renesas-soc+bounces-31673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AUlNgMu72mb8wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:36:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0B46FFCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAD323015C9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 09:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEC83750B2;
	Mon, 27 Apr 2026 09:35:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA082848A7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282545; cv=none; b=Qzx9hWCodZLjTRarb+x6qxj9ca7Omp1YpshOg2PbF146S0iay6qgitd1qiN8b15qJ/f5PkUV35Ogy24bk+Thj0NlEvdsyqtwUKl77Cc7+LJmIK2U1wKMKycBPkhoHZLkatjI2ts7oN0U3VeW2k4bUXM6m+zjJ2dzhZEDHBrgUfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282545; c=relaxed/simple;
	bh=GGByPRbKiZCMiBixxbxKzpR7CpahMYzsWAFszsM9luc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCUx2LycTjCUhGOLE1OHmA7/GaLhpvEgZbZAB8/HdoBVfvNqX9fTnfLJDs31TbuW/fU4STvccpxXVKURIJqwXWj+rWg+dENnlZF7jJ+7qmFdKhbFyWM4PCn1+liQAh9sCufbAV0jMhfWlIV56hYB5C5+lFbt6xPTeB2FRtv/QOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6729c6f0ca7so12060210a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 02:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777282541; x=1777887341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKaphviOKh6WHGvvV2s3OO7+pEMmVDq4wkrroHAe/4E=;
        b=RmToIgtaKS9OMKdihfIzmZJW0DAFMJG4Hcno6Wg8w33IGODwGN7ri3y0MDeeRTeyty
         UXVfzxyMMY8XjEiSu/0A/u0jqprhzwn0MtKhlD1qhvRKBXSxmo3jallR3b5vpVUc4069
         NECPCyncKo/AM0majwJErtNZLNHcED2T9trmmlw4McCRO/6HNDDyFwG04jXnSNMUn86E
         UUUgtsTQredbzO+1f4WkoZjHApOUS2bjgDZT9g0VMUTp1agFhFh+iuWLAeGEuI5EntRn
         aWtqh6gvVi8VuEJkuwIo0e6F9y2XOmDtg6cTto/StX2H3C4Ydd4I1NLbCp6hLg7+Rq9/
         K9Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+3QnXnFMR5KiP99EUo4C4ka+mll4cFN1ELaj2/2XFwDgLVHyUbJSLcwgT41nh7t2QDdX3vyC14yAEqucnukAniDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYa2G3IEay/db+vsuLBPYI6NTPwYmvWewxM7YAqwBJnY9F2jBx
	Js+jGh0vsj8PuTL4KcplWaRDoA1noNycurvYsfXRgM2G2r33Wh0KfX5ZEZ7ZorgQZs4=
X-Gm-Gg: AeBDiesTg90i2Qu5RLpanVKTioF9XNa7RGYzrMjUsTakboSXXny09X34n1yMpk+nIDG
	Hik12Z0Ho6KPnFECdAxDpmjA0nAWQS8treqy3kRHzON9dbB7ztgJpoZPIBYzHctm4ePvANetrUA
	cU5iLw3e1tEn7dmpVZfaUl07gnwygjV4sokGxk3K19weDasHVilKr1T/RQow7fZwpBBV64feuif
	7Zb/NQc5qo5wdISy7LugAQ/neqtQ09Ia3SIIz1QsOlaLxX8wKsoBmTCl0dbSMOC5shi0pETUzia
	+ozzdL83qs6kllW+GpHoeQ2phIoV0act6z+BgcyvgGBLMVY6PqgfknRCydsACouN0CAoLVpyRaU
	H7nfYX3DIcKQsDCqjAJVvFoV0B4Vw4YnPnshkeJ1DW5+DNLtWYpo5gBcgC4X7Kl//NzeNiInb7P
	oRZ72GKHON+8kFozNwlqI/4jNauWHES4sfcB5N37keDNSPEMBIonT9ziLoahGu0qT+/Br7M6A=
X-Received: by 2002:a17:907:72d3:b0:b97:1d24:c004 with SMTP id a640c23a62f3a-ba419a54651mr1856710866b.21.1777282539825;
        Mon, 27 Apr 2026 02:35:39 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm1069162066b.63.2026.04.27.02.35.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 02:35:38 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ba67b332bbaso1151524966b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 02:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Pq42Xw8UhelX0mnRaFsVAOCHNs+PQ+S+NXW2ZMml14qzxJrORKKLapw26cY2xPWO9XsoCW8b0bV7iznJbo2L1kw==@vger.kernel.org
X-Received: by 2002:a17:906:fd84:b0:bb5:8562:823c with SMTP id
 a640c23a62f3a-bb585628661mr33199266b.10.1777282537883; Mon, 27 Apr 2026
 02:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
 <20260330132349.149391-3-biju.das.jz@bp.renesas.com> <CAMuHMdVr8FKx-n7OEgFf6vufzPRK-XrYDEPn_Ki0siknT57DOw@mail.gmail.com>
 <TY3PR01MB11346170F9CFA9DA98539A3F5862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346170F9CFA9DA98539A3F5862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2026 11:35:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRK2W_F4ST41W9snChH-f3WtCmPtePQzj+oZnjcKp1og@mail.gmail.com>
X-Gm-Features: AVHnY4J59OtRzGhWHPYLLecHfzizRVy-LGPVJfLunkpA2TvBZiT6a3LEqeQg1Yc
Message-ID: <CAMuHMdVRK2W_F4ST41W9snChH-f3WtCmPtePQzj+oZnjcKp1og@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r9a08g046: Add CA55 core clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3DC0B46FFCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-31673-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email]

On Fri, 24 Apr 2026 at 15:24, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add CA55 core clock entries.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/drivers/clk/renesas/r9a08g046-cpg.c
> > > +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> >
> > > @@ -25,15 +26,24 @@
> > >  #define G3L_DIVPL2A            DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
> > >  #define G3L_DIVPL2B            DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
> > >  #define G3L_DIVPL3A            DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
> > > +#define G3L_DIV_CA55_CORE0     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
> > > +#define G3L_DIV_CA55_CORE1     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
> > > +#define G3L_DIV_CA55_CORE2     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
> > > +#define G3L_DIV_CA55_CORE3     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
> > >  #define G3L_SDIV_ETH_A         DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
> > >  #define G3L_SDIV_ETH_B         DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
> > >  #define G3L_SDIV_ETH_C         DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
> > >  #define G3L_SDIV_ETH_D         DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
> > >
> > >  /* RZ/G3L Clock status configuration. */
> > > +#define G3L_DIVPL1_STS         DDIV_PACK(G3L_CLKDIVSTATUS, 0, 1)
> >
> > G3L_DIVPL1_STS is unused.  Perhaps you wanted to add the I-clock, too?
> > If not, please let me know, and I can drop this while applying.
>
> Please drop it.

OK.

> > The rest LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

