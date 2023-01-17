Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5958766D735
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 08:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235727AbjAQHtD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 02:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235992AbjAQHsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 02:48:46 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3618B7EE1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 23:48:36 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id h10so21111698qvq.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 23:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hO4O47NNKsNto7eUC6o0e+JxfjS2hkwUbQ3dQyv9UGM=;
        b=0V4hvOZ+aF77fu2iEy1MxRCUxWVu9JnKrKAeTNb8aS+qm2Q9mxZaBIT/Os4Ot3PzI7
         0dBO18UWn6vfWJjg1jayM6xs/8US+phOuwol+t3fXtXOQPFcUGZWeKhDawy1DsEw3Byv
         e/DOF8Prym4aHZbU0twBB69804zD0Pwe47v7k+ZJe0RAsQEy86uNxZDUmJVSKgWUTLRR
         xw+48ZmjA+VlhpROTNuGU9KAMa/1Ar3drYvhQqdqBwn/ySjtDnzlVzEeNFKl2nTCXVwv
         Igd2WJ8g9ZUUupaVz/QvbLXD3GTucYZmtJnRmrTGhEMK3DG/oCVTrtJbIknRmX5Ho+5r
         cchg==
X-Gm-Message-State: AFqh2kryUNoNNHifMoPcJnfW8BXUXwH91HbvTh0uRgE7EZnByBf49CZP
        siP2Lmr7deIf7ThliW5bw6OYs9j70KoRmQ==
X-Google-Smtp-Source: AMrXdXuACh6CZghTxAhk45G52LJnPOEuePqSBy6Usd7b7S6gAZQ8nrXVwTTZJgHQokFjGUSFR2uxyQ==
X-Received: by 2002:ad4:4f24:0:b0:531:af57:3109 with SMTP id fc4-20020ad44f24000000b00531af573109mr31853876qvb.7.1673941715123;
        Mon, 16 Jan 2023 23:48:35 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id br43-20020a05620a462b00b006ec771d8f89sm19959901qkb.112.2023.01.16.23.48.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 23:48:34 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-4e9adf3673aso75108917b3.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 23:48:34 -0800 (PST)
X-Received: by 2002:a81:1012:0:b0:4e0:d096:7795 with SMTP id
 18-20020a811012000000b004e0d0967795mr367214ywq.358.1673941714421; Mon, 16 Jan
 2023 23:48:34 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
 <875ydbi40l.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVr-c=ht9GKkvSxdokqEoZTuOk41hRzXL7tpREy4+Pb9Q@mail.gmail.com>
 <878ri22hwm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878ri22hwm.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Jan 2023 08:48:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWuzu3EpmFQM9CnVYMz6At715qarXj5=EX+JU-OxmDLiQ@mail.gmail.com>
Message-ID: <CAMuHMdWuzu3EpmFQM9CnVYMz6At715qarXj5=EX+JU-OxmDLiQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph
 Card dtsi MIX + TDM Split dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Jan 17, 2023 at 12:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > +/*
> > > + * Note:
> > > + * Because there is subdevice maximum, it will ignore HDMI output
> > > + *
> > > + *     (A) CPU0 (2ch) <-----> (2ch) (X) ak4613 (MIX-0)
> > > + *     (B) CPU1 (2ch)  --/                     (MIX-1)
> >
> > Shouldn't that be "<--/" (also in the other mix+split patches)?
> > No worries, I can fix all of these while applying.
>
> (A) can handle both playback/capture, but
> (B) can handle only playback.
> So, above allow is correct.

OK

> > > +               /* (B) CPU1 <-> (X) ak4613 */

So the above arrow should be "->", too?

> > > +               ak4613_ep2: endpoint@1 {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
