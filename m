Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E365C7AE747
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 10:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjIZIDX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 04:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjIZIDV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 04:03:21 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737D9C0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 01:03:15 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59f4f80d084so67727297b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 01:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695715394; x=1696320194;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsnEFQbEcxq0kwC+9UPXlQfSWHGzQm4HA4sai3chasA=;
        b=ZH2ke7uzH3FfXbJ+k3xWGiLLDYePHIq263TkLsZ/lWcrFQF2OheKBZP1D9KGL8xMf4
         iYtWly///L20F9fBm58a3X5W81lXedeHYBbY4XFCAKziN0Ou4EEkRYcYwcUkeQf1Pcjj
         +6o0G6Kbc6pbhou4MWBzYEK2kOA77Ung1Zpz3mgxXSSVO0NKemUX+X0Aul14/MH+uizf
         ak+cgZL5Y7B3p7/0NWXQeg7v5KZd1LRSjIvoCtFeur9/jxt/oXBWbezArcnRxANTuR03
         LnrMGZRxhaCkfP/jKeRNSpzIHARJ5oZblQ7eBXxpiv9Semy/tHEzYIS9tZ1buPlBurOJ
         HBVQ==
X-Gm-Message-State: AOJu0Yx5Q8K7xNqReMbpetPU/bypctTfUo7xcVbfzrtLRj6aiulxPG7G
        z/yo2rRSqrEsWoaHyTnkrd7B+nKqUCt2/g==
X-Google-Smtp-Source: AGHT+IFdNrUjxGrlbgajC6dCNK/at0TiBzhLSOC9T4RPMVgJTeRP9cvjcXS+lUJZhK1d1FYLt7BhrQ==
X-Received: by 2002:a81:4f92:0:b0:592:60e9:97cf with SMTP id d140-20020a814f92000000b0059260e997cfmr8349472ywb.12.1695715394535;
        Tue, 26 Sep 2023 01:03:14 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id x202-20020a81a0d3000000b0057399b3bd26sm2867200ywg.33.2023.09.26.01.03.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 01:03:14 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59f6e6b7600so47580067b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 01:03:13 -0700 (PDT)
X-Received: by 2002:a05:690c:4442:b0:59f:6440:957d with SMTP id
 gq2-20020a05690c444200b0059f6440957dmr6598641ywb.19.1695715393400; Tue, 26
 Sep 2023 01:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
 <ZQtY+NHFzFBWhrZj@shikoro> <CAMuHMdU_S7+rgykqtvTVaSSO53zXGHNpiPJ=yzcF1GMf2QXvgg@mail.gmail.com>
 <ZQv4SY8VUXMZ600S@ninjato> <ZRKMww5Lq9L+PDic@shikoro> <CAMuHMdVqvmKMu9adZ37Qgs2w2mqJ6RWND79TemK-+xbEJyEcGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVqvmKMu9adZ37Qgs2w2mqJ6RWND79TemK-+xbEJyEcGQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Sep 2023 10:03:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXf2Zn9WVYCXuKTwQ9neQ=bE4oDFT8hSZ5Vy7qAVNrbCQ@mail.gmail.com>
Message-ID: <CAMuHMdXf2Zn9WVYCXuKTwQ9neQ=bE4oDFT8hSZ5Vy7qAVNrbCQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Extend SDn divider table
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Sep 26, 2023 at 9:59 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Sep 26, 2023 at 9:48 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > > > An alternative would be to let cpg_sdh_clk_register() sanitize the
> > > > pre-existing contents of the SD-IFn Clock Frequency Control Register,
> > > > so there would be no need to extend cpg_sdh_div_table[].  An advantage
> > > > of that approach would be that it can handle all invalid combinations,
> > > > not just the few that have been seen in the wild.
> > > > (following the old networking mantra: "be strict when sinding, be
> > > > liberal when receiving').
> > >
> > > That sounds very reasonable to me.
> >
> > Thinking further: Sanitizing a pre-existing value of SDH means also
> > sanitizing the value of SD because only specific combinations of these
> > are recommended (or even "allowed" as I read it). This is getting a bit
> > complicated. What about just applying a default value to SDH and SD
> > which is from the recommended set of parameters? That will also help
> > when probing the clocks. Once SDHI probes, it will modify clocks anyhow.
>
> Sounds fine to me, thanks!

On second thought, on a system where SDHI is assigned to the RT core,
this would interfere with the software running on the RT core.  So I
think it would only be safe to overwrite with a default value when
the current register values are invalid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
