Return-Path: <linux-renesas-soc+bounces-30092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPhVEkH2wGmvPAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 09:13:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7E2EE25D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 09:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACBCB3023A72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 08:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038A2370D43;
	Mon, 23 Mar 2026 08:12:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969436EAB1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253540; cv=none; b=blTJAnmpjTJ77iC8MkZ5vKCHDCRm9AqJHncRKONIunCPRi2SurNkPNbMQmW7VLWXU7uVz5lmIApVo1aUbfWZxHC5MZGqQJHmzlep0LkNdEHu41dhc6vEC8jva194ENCCbTtybs/7UaIxafyeXN6zIviiz8nThee+RjZTZW19nKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253540; c=relaxed/simple;
	bh=2mo6GiOM8nr9n8Mozs77z1ZO4b+tGmBAyzQSHNSjLnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROAzKY47AWwLsuUcZAVmQWwDri1CTNFe6WdI7sFVab46LMxPqfByeJMUqZe0BmbDxVrs+bgibqQAOhwCKrdXytjk0J5kM48PeaN05ADVMvJFYmlqRaehdjXIizR2xdGsNJ9g9ZOd/bWhJ2VJA+25ipqsJCHU9DqiZfm4pAq3kwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffc8987050so2444885137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 01:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253537; x=1774858337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzEMYYVtDBGD0mp2TQPMZhU1WtqUi9892WrKlxY68vI=;
        b=nAh6Rxy5ccnMDJmC6vdwgEdH7RcGtc952G53BleNmWBiYZELooU9Y7VF79yhwKPCkU
         o5DybrA0YaJvR7b5QYtx9PaLYorwGEQa9MaqOiVLnID04C5fQnSxef51yiFuwEsrRM7p
         POQ8p1OM0rJuSDTIDeazMMgaU6wO30ZPuQ4ePMWtJ+xqNhv6HM3PWPeWow4dSvFd0MZn
         csCu+rpTC53ufjpert3jMtmIdw9fQEFdLIY3vaf/fiD908qmkuue7qacy/uEvv6+8Wg6
         ENCIqr+VCsKU9Bij1vvpCNKUwB6NfPp7srwoUpcu9X3y7Xn7GXSr68+TBc+b/gPpQOJ7
         6sSg==
X-Gm-Message-State: AOJu0YyB3Us5P2g1/Iqv2Ilus/kIqcpgmTtZA6tDHcMo9U2h3CMJFLL6
	NEhGtWyKWYedetYlVc4a6LISw71E83ty8vQhaHNOc7EkELqLOKhuF/mMjZk8Mvt0
X-Gm-Gg: ATEYQzz15zIxshCLpCoP1Fw44wcn946h1l8eKfN5+RcKl2jwjKp9iXZ64bXbNmyIJpj
	HegXZvRhU+6503Jh6ekpKcjHzUUydsUG97Tgtc7xa6sbyEI1H6WcwLslobysQIIm2Khn9KGSdo6
	GvVx9m69rSdxNiSLZm+2nGIR4SdmLu5gUavySQPacaX+jCPJsKiEfYPrk25YOQydWZu9YZlsyt8
	7F9t5rfvPEdhdBr2tTlYAAzokkkHu6bxKO+3HHa3KzYvHiEjSaqZ0Hwja7j1E4ab4Y+beRo/yWz
	EcOVPnKWzJSLFXqQKsiFhN36VCAupjU/AwM3o5JmvdAZTIsa7KRp6i351FNNZT7qan5DJNsY5ff
	3fzTrDUThAyh3bLyquNPJf49He6irj1WRaqzoL7WqwPSl4TEH++Jk3msoTkLZWRAIitdGIQvjxN
	0eoQqKilsqmtxf8yqnrAJhZZGiO8g9p71js9B/KUsc3kGgzCU3x2s16GwPXNox
X-Received: by 2002:a05:6102:449b:b0:5ff:be25:894a with SMTP id ada2fe7eead31-602aed8ee81mr5645219137.32.1774253536680;
        Mon, 23 Mar 2026 01:12:16 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af5ea90esm7018770137.0.2026.03.23.01.12.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 01:12:16 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94acf9ce1b7so2575237241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 01:12:16 -0700 (PDT)
X-Received: by 2002:a05:6102:508f:b0:5f7:2430:cba with SMTP id
 ada2fe7eead31-602aeb13e80mr5874429137.12.1774253535858; Mon, 23 Mar 2026
 01:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com> <CAMuHMdW7jAfXmOHdmd77sB-7aXz3H8xDfAjJUWbU=7SUHiEfSw@mail.gmail.com>
 <acBJ_G1ZgZwrJfEh@ninjato>
In-Reply-To: <acBJ_G1ZgZwrJfEh@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Mar 2026 09:12:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_AFhOEi3fimZF467EWpupmcOQTW4SpdUffjzskBrNmA@mail.gmail.com>
X-Gm-Features: AQROBzDAfcNLNelaxhdswBm5kNwkcNhan96dxOlefi5tLP8FtQiMexGsvBNEto0
Message-ID: <CAMuHMdV_AFhOEi3fimZF467EWpupmcOQTW4SpdUffjzskBrNmA@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add Renesas R-Car MFIS driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30092-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: AEE7E2EE25D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

On Sun, 22 Mar 2026 at 20:58, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +struct mfis_priv {
> > > +       struct device *dev;
> > > +       struct mfis_reg common_reg;
> > > +       struct mfis_reg mbox_reg;
> > > +       const struct mfis_info *info;
> > > +
> > > +       /* mailbox private data */
> > > +       struct mbox_controller mbox;
> > > +       struct mfis_per_chan_priv *per_chan_privs;
> >
> > This could be a flexible array, if it weren't for the hwspinlock array
> > you will have to add later, right?
>
> No, hwspinlock doesn't need any private data here. But something else
> could come in the future maybe? I also don't see a big advantage of the
> flexible array, too. Maybe it's too late in the evening...

You're right. Somehow I thought you were allocating priv and
per_chan_privs next to each other.

> > > +       chan_num = sp->args[0];
> >
> > "chan_num" is the hardware channel number, and should be validated
> > against mpriv->info->mb_num_channels.
>
> Ack!
>
> > > +       chan_flags = sp->args[1];
> > > +
> > > +       /* Channel layout is described in mfis_mb_probe() */
> >
> > Given you already use "chan += ..." below, perhaps:
> >
> >     chan = mbox->chans + chan_num;
> >
> > > +       if (priv->info->mb_channels_are_unidir) {
> > > +               is_only_rx = chan_flags & MFIS_CHANNEL_RX;
> > > +               chan = mbox->chans + 2 * chan_num + is_only_rx;
> >
> > ...and:
> >
> >     chan += chan_num + is_only_rx;
> >
> > > +       } else {
> > > +               is_only_rx = false;
> > > +               chan = mbox->chans + chan_num;
> >
> > ... and drop this line?
> > With a proper preinitalization of is_only_rx, the whole "else" branch
> > can be dropped.
>
> I agree it saves a few lines, but I really think the original code is
> easier to understand. Channel layout is already wickes and doing 'channel
> +=' twice is harder to understand than a simple assignment IMO.
>
> >
> > > +       }
> > > +
> > > +       if (priv->info->mb_reg_comes_from_dt) {
> > > +               tx_uses_eicr = chan_flags & MFIS_CHANNEL_EICR;
> > > +               if (tx_uses_eicr)
> > > +                       chan += mbox->num_chans / 2;
> > > +       } else {
> > > +               tx_uses_eicr = priv->info->mb_tx_uses_eicr;
> > > +       }
> >
> > "chan - mbox->chans" is the logical channel number, and should be
> > validated against mbox_num_chans, to avoid out-of-bound accesses.
>
> "chan - ..."? You mean "chan + ..."?

No, I did mean "-": you do have a pointer "chan" to the channel,
instead of an index into the mbox->chans[] array.
Using a  index would  make validation easier to read, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

