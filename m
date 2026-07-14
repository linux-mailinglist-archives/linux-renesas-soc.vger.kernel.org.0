Return-Path: <linux-renesas-soc+bounces-35215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MgYLLQ1ZVmoN3wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 17:43:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97E75689C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 17:43:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IoBF+bPu;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DD70306AD0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540FD494A03;
	Tue, 14 Jul 2026 15:42:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC4547ECF0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 15:42:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043739; cv=pass; b=BCPz67YI2o/Mz7R0iYYOcnkdh308QUkxChLwyOJnhgenrGdRWiU35OOLz7Js2XvEYYfM2kYaUEC6xXlbuztlphz7JKgo6jEWb40LeVQJ7s7tO3vl1aL6wNp87J6SD5dRlZhVSZev3AOx33AZ0kFLWLmiiklIJbRT0e8dET4YzRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043739; c=relaxed/simple;
	bh=sWqGyIl3Sy36dtoEqyN8K9IVF8mS5l6W67D4MCNUCJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3bsz5Gl2hL1vEyU8+AJrRryi16wmvTmjebwWYgzlJqchc7kfLlXg4Y1GvUwFoNhP7awUvinVXzSPZYSqvFAej3He5arFK1FXFfVa6S3O9je2lH2hClh3ZuAPiLecf+GCBPSTRRAQnkpVo50C+wcTyH2XQbs+61CKUBNR7J0HMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoBF+bPu; arc=pass smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1111127f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 08:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784043736; cv=none;
        d=google.com; s=arc-20260327;
        b=PvX7orrTwt7eEzapZBiHoTJmvnfmxagr5lBuSd98rORM/25H1b7owtk4O5kd3WBCvG
         GFPFJpPTm0Jz5ClRCidrW20xi66epMja6r1SxiHk4VZGzLBe+xFk6yOo9QlWVII3YMgI
         X9lg+DsfaQPLD69BqwGdqdBGjrrw+Wqq8zn9QgA+ggz63pMuETHX9N56IiMFyU6pD17Y
         A3ZCe7Fu6WBfvoXd53S072aK824Z7mJQKY0xLqexmsCmyeYSLydpuk1++vKMSN4dqlHN
         PNP4zhcE8t8mCPQFIieS4PBRYgQz2dkzEI/ZDqMRmHiKUa+G/KaaoE3PAUiOZ115HmTM
         RDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bFMwMWLTvMmruDXHajLVVzBdjpUaW16nai1w7KarYv0=;
        fh=WAnp0ksWfFZ8gUvPE/GU0R8Uh61GQl1XDgHaPiUgHII=;
        b=dltyd5dcwOq+JgkiQXofs5pd4E8e7IbJjWRNOUEgem6bYRIETG2/rOb2m7pEeQlIMQ
         P3WRyoAqBeQkjr7TbeMq42d6dQInYHiP9awazxjmTqWMvoG6HDPr1nEb9N9Ko1hRCZvf
         PBzbM8vVSYbcsWMTyaRtOQEyeXLFq7ntY8NdiCXln1gwVXUuBodHepZWITSB2ktIgBU5
         qS9jYEj0a1512DOaep3H7Or5wK5WiyTpIfopOu4z59IjwbQVdEobQgZjusIfozSx3xwg
         2NJs0oJLgYFSioIDRiGqUX1QYhZxTiFe8PLgKmPGWDsykPbXEM45L4+F+kV1iXDIaW1G
         YUpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784043736; x=1784648536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bFMwMWLTvMmruDXHajLVVzBdjpUaW16nai1w7KarYv0=;
        b=IoBF+bPua6+u9KqI4AgZGFAoautr7lOViMlTn/lj3EKnMIvkczf8wve8jB/4xq7hTd
         k6g3YLbSpCKtUo7VbcXidr+1bcyO93JJpT2pHudYAIGYHB+sVgzoF0+3hlbsx9WjSR3L
         xPn2H4NL0XjnJyafQXzCovZTE0LZ8mHlB6YKhF5Lw2KtDwYYmuVjvroUZ0prtQpmDN87
         eV5nH0qO1sUOCmrf1YEYDtI1Apm3kwOBatkDWEnWgd5xdUPrzRLUXd9Hr0ravlpxBAdb
         XNmohH8t+XvX7rDOpO2Jf68ER4yVpzb4qSQHjexXDb3CG+4bCwOxGcv6GFKKCwunyMkr
         l96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043736; x=1784648536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFMwMWLTvMmruDXHajLVVzBdjpUaW16nai1w7KarYv0=;
        b=LD15gD2Ta7JkP9caAB8YPXWn048450jtbAXcXAOndvHhpmwoZlF1tP875N79aTtxcU
         qQwvbSgAzunjaEAL2jBTU2Z8A5oHRdFmo6OBq11aALnyPyd2mhWVhzVqTW99SOvKL/ix
         /Q9dT1N6ZcToY9dg5l+nMpQm0e1TM9EveefAlmyTLwNf8Xg1FNClqd/YJQ8waqHYVZKv
         D3G0lTrXIa4a8yA2M5Ktpr0D0PMPODFDEAmq3Ev0zI15HWW64PLoiIyqFaRjT99TdKyd
         8AP0cju9NRFzyoNr8r93uTPVxwyH8c1UieEHrVLmHZ6H00B8Brt66lcOt78LYfNF1Rld
         FodA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+idEv/pca0K95pqNzna079tPeeJN+273olLZLsVNGWSI0BUHdpAuQ+l6WPeeN1ex4ep1gn5Xf64gMbdw2aXd1Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRlDGcZ5t7r+fl44qy+of6rX3KKGBPi/mKadP6ElGvPzZyapb6
	e7GvvUmplZbZOP78ILKfSx0iv9ofGjXR0+dDw+MMNO3QpDHBb8b4QHl82G805NbJgLgP2krcXST
	cykqeeE8YyE5s+0dkyDJOp7EUfYk7xo6gLBEJ
X-Gm-Gg: AfdE7ckgdWmeIo6V/3oWsafGyrdFZMtWZ9SCFeThPHivylPG5hytad+UjbxdH7YmPPP
	6PhE3vnQBR3X9dF292KQQs0AILySOIHd3APriF9amOTpqCEeNxNjoFzDT0EqjOsTjXO8itGcnkZ
	MZ9sCDkiQzh0BOQoEnkUVaCoff77eBYMQbXm7S5PZZJeTJiTGm5hXaDQKB7QLoS4y1TgrJ6A4lI
	j2u+54UosmJcRybn2alaWpWt63hym7N5SWqv8uXRE3b4SFucATCKm7uVlt/Usnmo2NjNvXIVMN6
	eSuqlE+e0xNbnCpdW3XN8oFB6TP0Rn+4aOE6iqrVGEVb4eFJCDiHvvWBf5s=
X-Received: by 2002:a05:6000:2601:b0:473:1ccc:15be with SMTP id
 ffacd0b85a97d-47f2dcf8b2bmr16217773f8f.39.1784043735618; Tue, 14 Jul 2026
 08:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702160457.1884345-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702160457.1884345-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <46cfa874bd2ce4b6189606ae391e24833c802391.camel@pengutronix.de>
In-Reply-To: <46cfa874bd2ce4b6189606ae391e24833c802391.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 16:41:49 +0100
X-Gm-Features: AUfX_myzFRk5zyRcC-DRg9lzaLxRzPGGbIhkzzOcp4mfT2S7yAzLBGupnIfXxos
Message-ID: <CA+V-a8sBuKRDKDWzwzzofLY6mTAWFHiGJvyaLq865BZuR6r6-g@mail.gmail.com>
Subject: Re: [PATCH 2/3] watchdog: rzv2h: Convert WDTDCR handling to regmap
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-watchdog@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35215-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,glider.be,vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:geert+renesas@glider.be,m:linux-watchdog@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,pengutronix.de:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C97E75689C

Hi Philipp,

Thank you for the review.

On Fri, Jul 3, 2026 at 8:35=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> On Do, 2026-07-02 at 17:04 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Convert the WDTDCR register access from raw readl/writel variants over =
to
> > the regmap framework using devm_regmap_init_mmio().
> >
> > This conversion serves as a preparatory refactoring step. It allows the
> > driver to subsequently support syscon-based system controllers natively
> > by passing along alternative regmap handles without forcing messy
> > architectural branching at runtime.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/watchdog/rzv2h_wdt.c | 83 +++++++++++++++++++++++++-----------
> >  1 file changed, 57 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index e9545b8f5fd0..d0b38450cc32 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >  #include <linux/reset.h>
> >  #include <linux/units.h>
> >  #include <linux/watchdog.h>
> > @@ -67,7 +68,7 @@ struct rzv2h_of_data {
> >
> >  struct rzv2h_wdt_priv {
> >       void __iomem *base;
> > -     void __iomem *wdtdcr;
> > +     struct regmap *wdtdcr_regmap;
> >       struct clk *pclk;
> >       struct clk *oscclk;
> >       struct reset_control *rstc;
> > @@ -89,26 +90,20 @@ static int rzv2h_wdt_ping(struct watchdog_device *w=
dev)
> >       return 0;
> >  }
> >
> > -static void rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, b=
ool start)
> > +static int rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, bo=
ol start)
> >  {
> > -     u32 reg =3D readl(priv->wdtdcr + WDTDCR);
> > -
> > -     if (start)
> > -             reg &=3D ~WDTDCR_WDTSTOPCTRL;
> > -     else
> > -             reg |=3D WDTDCR_WDTSTOPCTRL;
> > -
> > -     writel(reg, priv->wdtdcr + WDTDCR);
> > +     return regmap_update_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDT=
STOPCTRL,
> > +                               start ? 0 : WDTDCR_WDTSTOPCTRL);
> >  }
>
> I would drop this helper function and just call regmap_set/clear_bits()
> directly in rzt2h_wdt_wdtdcr_count_stop/start().
>
Ok, I will update as suggested and send a v2.

Cheers,
Prabhakar

