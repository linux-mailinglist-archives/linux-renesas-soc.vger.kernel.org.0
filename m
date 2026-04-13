Return-Path: <linux-renesas-soc+bounces-31218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN6fMsA+3GnFOQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 02:54:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 307653E6866
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 02:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F2AF3009FBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 00:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D2D1E5B64;
	Mon, 13 Apr 2026 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn2jRuQZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD81A9B24
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 00:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776041661; cv=pass; b=Of2TqRdszNXGoWVw+JPEJ6UFzn44F9dXx1CaCoL8JIKgW0TpGZfuIHoD6YtArHyWv6OkAi6gW2x+ARtGjX55WqovI12gRwJ2MHXm5bVyar7kqzt9tpXIx4Nm/nIfxze6cNPvgwSpL0JQ8JXC+UBHe9QWkzgWw7O0JioUySlIOxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776041661; c=relaxed/simple;
	bh=c0OL+qidx0nBRgFcxE6rF8S544sj8BcwwimjGoOnLFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSebF1zJ7iCsxT0qJ1ieF681oX4BtX2C1v3dbARcs7NeBeD3KhaXATJRPtOdwuiEWYcRiWVcbtnfXYTGjxE+WPi/v/vlFccGJAytCQqN+Mjm/W3csEK7hrzU18Wa0nQff1aAx0pFZ8VifbKx4CtySaabGGNYMZqy2/hRCghOsjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn2jRuQZ; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-476448429dfso2051731b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 17:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776041658; cv=none;
        d=google.com; s=arc-20240605;
        b=jbTZm//CHDElQ60VKgHl2CGJYkwfYZ1voV8RtsJizvC/iwwub1Tndb3m6MK+iz8DgZ
         YRwO+XUPNebxiKw+qCBsSs7xI5hjfdO5SeyVuwY4P51TdKvZPAm3GlvsVysLLsVqyHsI
         6+CVkH4g9Ha1jd9Sp1lgSNNEJeAYeogFe7dJI2ge140B04bPJJlRBUuBbeu3zPmqeBO1
         0nbyEYjXhNWhAKlztcdhcFqyzxnuviHOXbzUcDhggPfNGq7bttbiJlT3fuPtIa7fn5IL
         hBXbsv+4Iv+QJNZvg0fXe4k2+gYEB049dnqpbpTtqnXdYOVQI5gTALXeURWpGmkAM5so
         Wiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JFYSfcfB8TYdsAVrjtnxwH676wxz3zjbSZxEUuycoUg=;
        fh=m7PZ8P9XvrBAE7hnaCZA2ShOQ0GF821rqxd63+UFGLY=;
        b=gT+jcIi+uwerFHUaeze3oGnHEtQiKtwLwiEaQZ5q3w2lXzfAqTu4SiabIaQ2VcwAZh
         U3PmAf+sA453EC0ZGoBTZHnV7uKhgS/YM3XkVNskwfrA0yH1hK8VMUA4Hw0VTQFrHo/p
         rlPU3k1ItD691a7U6h/Mhpl2XNm8rXITN8QfOUe7iku21T45PznuwYQnf2eyuKFg3IXi
         vzU8HcpBZ2wRg1ppM9KoWYahJyc1Fy/pQM3Z3XYE1TDNKprCFqPDxjDg1kPM70RW4jSl
         utE8XeINRVzyoQIGaTU2pvhggfGJoiaY2LZo8iQAIBv3wIdLwDSLGIbTGps1pGx6fnj3
         3Nqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776041658; x=1776646458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFYSfcfB8TYdsAVrjtnxwH676wxz3zjbSZxEUuycoUg=;
        b=Vn2jRuQZHCQm1shc9YwLTx5vnOKUJ2q7pJbpmYYJw9sfbhu/ckwbWjscNRESC8tIg0
         Vgp1ekSxiZCFYkYY3mBgSLH7fUGcul/zT638/HuabY1Ox30jRJ8MeliWPBag3zTtl6KF
         HhfQk0YZ2xHDyJ7ZX17x4x/7mingtGouXaGp/CS9h9b6QVLL0NNX/Sl9tpBFKfwWcKFK
         ORL8oldjBKrLm4whpSylObsDmc60nZGSfTMLZAvJxQvoMM2Ivz5JFjj48P4Fy1X4DfpW
         ffD4vNfPdTkmfvIy/MwuSBJppGMt0rDlAPb/9sTsiiB8StCPeYmxRUVUawuig6bozrEu
         ueKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776041658; x=1776646458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFYSfcfB8TYdsAVrjtnxwH676wxz3zjbSZxEUuycoUg=;
        b=BOR3gRB9mXY3A/Xq108q6Hsxk6HTjtp3I0IV8iiq4thFsGLii9OsRSRRcjAdWcncbg
         F8r1x0/usWy1NXHbu+k+KDu9kWk1T1bpdC3+WOun/pu5T1a2Lg6nJjh2eM1twRAHh1Zw
         5C1vJIlaF+5XHNH3qgxGnYjLf53gKH6LFj0Gqk7apzg44cfl6cguD8CZoSJj+SaVsckV
         5TMVHYHz0R8xQfYVhT+AqZgtQiSFtya07Qs9vEmAf3Ue4HcwDdlT66jHkJAKOD1QGoV1
         PvuHCsebh++DmDeEgyy/nxNBDdH6OkMCOom8cv3UbKRx6yNHaFo3vwVb1cPK2EPA950h
         WiRA==
X-Gm-Message-State: AOJu0Yw6pWARE4K7JEg7VHMNcFwLx4lU4k/RQAf9m4ABrWLgpMRjQFtq
	HbIw1m032SDvglbNYK15LXmcMzyZVLfqEj9eXLziLYxo+U7u8FqQYjQhv5sp5wJopkrBC49kkct
	q/Bm1J2AIhPzYxGVTrytCSRdgLkSQij9wdHzN
X-Gm-Gg: AeBDiesAXn36N7SlpZLGxORxhWHnc05Zo6fDU/Sbjnc4wmFaYdejFsSy804KNz7C+TM
	GBlCytcd7xoGu2tXCINowy1G8nxb2RnGXCmFk7jEd65OE1/Hxfpl6ryxIkrQexzjIasfPrJcRuw
	KzeH5AW6Q5LnS6quVDSmENwYAiy/YF0a6/SG/NGfJ2l0wr3YEHzEvzPwUKRCcx/OY+mO+TPlN8M
	u5rIdxqnuZEXRC+fwzG5btiT+Ewe6eFuVL4seWJkijY0aEiTBhpKw9LN/jxt0X8pqbpR404P7aG
	9w+LzPlW
X-Received: by 2002:a05:6808:5293:b0:468:776:1e9e with SMTP id
 5614622812f47-4789e4298d6mr5874438b6e.16.1776041658490; Sun, 12 Apr 2026
 17:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
 <20260402112709.13002-3-wsa+renesas@sang-engineering.com> <ac6GcLutDew1wMkS@shikoro>
In-Reply-To: <ac6GcLutDew1wMkS@shikoro>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Apr 2026 19:54:06 -0500
X-Gm-Features: AQROBzDUC6hVkfvbYggnTN7m4phfW1WCtH2TG0CfbdhfbegFYv4BgMEIasesIXQ
Message-ID: <CABb+yY0bpu8rTiQKQu17ZNKkEK=y1_jNYk8fPbnpSxpcivfgog@mail.gmail.com>
Subject: Re: Sashiko review (Re: [PATCH v4 2/3] soc: renesas: Add Renesas
 R-Car MFIS driver)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, roman.gushchin@linux.dev, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	linux-kernel@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31218-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,kernel.org,mailbox.org,renesas.com,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 307653E6866
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 10:08=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> Answering Sashiko:
>
> > > +static irqreturn_t mfis_mb_iicr_interrupt(int irq, void *data)
> > > +{
> > > +   struct mbox_chan *chan =3D data;
> > > +   struct mfis_priv *priv =3D mfis_mb_mbox_to_priv(chan->mbox);
> > > +   struct mfis_chan_priv *chan_priv =3D chan->con_priv;
> > > +
> > > +   mbox_chan_received_data(chan, NULL);
> > > +   /* Stop remote(!) doorbell */
> > > +   mfis_write(&priv->mbox_reg, chan_priv->reg, 0);
> > Does this clear the correct register for bidirectional channels?
> > In mfis_mb_of_xlate(), for bidirectional channels (!mb_channels_are_uni=
dir),
> > a single register is stored in chan_priv->reg.
> > When the receive interrupt triggers, this writes 0 to chan_priv->reg. I=
f
> > this points to the transmit register, it looks like it would fail to cl=
ear
> > the receive interrupt and inadvertently cancel pending outgoing
> > transmissions.
> > Could this lead to an interrupt storm?
>
> While technically correct, this does not matter in practice. The HW with
> bidirectional channels looks quite different and will need a different
> interrupt handler. Sashiko cannot detect this because the part for
> bidirectional channels will be added incrementally once HW is available.
>
> > > +static int mfis_mb_startup(struct mbox_chan *chan)
> > > +{
> > > +   struct mfis_chan_priv *chan_priv =3D chan->con_priv;
> > > +
> > > +   if (!chan_priv->irq)
> > > +           return 0;
> > > +
> > > +   return request_irq(chan_priv->irq, mfis_mb_iicr_interrupt, 0,
> > > +                      dev_name(chan->mbox->dev), chan);
> > > +}
> > > +
> > > +static void mfis_mb_shutdown(struct mbox_chan *chan)
> > > +{
> > > +   struct mfis_chan_priv *chan_priv =3D chan->con_priv;
> > > +
> > > +   if (chan_priv->irq)
> > > +           free_irq(chan_priv->irq, chan);
> > > +}
> > What happens if request_irq() fails in mfis_mb_startup()?
> > If request_irq() returns an error, the mailbox framework handles the st=
artup
> > failure by calling the shutdown() callback.
> > Since chan_priv->irq is populated earlier during of_xlate(), it will be
> > non-zero here. Will this cause free_irq() to be called on an IRQ that w=
as
> > never successfully allocated, triggering a warning?
>
> Uuuhh, yes! But this is not a problem of this driver but more of the
> subsystem. It is definitely not intuitive that shutdown() is called when
> startup() failed. There are more mailbox drivers which fell into this
> trap, mostly by freeing an irq they never got. I will have a look at
> this, but as said, I think it should be solved on subsystem level.
>
> While this adds another item to my todo-list, it also means that none of
> the above issues are related to the driver itself \o/ Looks like it is
> good to go upstream, finally!
>
Honestly, I'd treat this as a cosmetic issue. If we fail to get the
IRQ, the channel is already dead in the water. Seeing a warning during
the subsequent cleanup is just a symptom of missing that critical
resource.
How often does your client acquire/release the channel and how
probable is request_irq() to fail in your platform?

Cheers!
-Jassi

