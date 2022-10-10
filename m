Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D205F9D63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 13:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbiJJLPi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 07:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbiJJLPd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 07:15:33 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091CF564F3;
        Mon, 10 Oct 2022 04:15:21 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id g11so1614504qts.1;
        Mon, 10 Oct 2022 04:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q8gYN+meolkwajOnUp7BlnCyTpfwZsnyDYDLUctHYRg=;
        b=3l/sYJL1EQ03qsBrKEtdKKiFcp1r5DXiGLoqiwD5Nj1iT+FjtxEnNuWhcXWl1ZMPyV
         EcyJJo8Z6sX0piLBFDDb/Re7hTKxUNA5Wg9VYzhj4XDvnl980M9rQCgJeUPjVgGLcqHN
         BA4fZfYdj1pzWenuVnxutdAQ+oQGnQmols0EIp4vchd3r6hPeky/wVG+INCX1QpmC2No
         XoiZFm2gm9ci/+mTzm10sCMjd5mAS0SdyoYNuFbBqU+cBcqBFe87Z3c1ex9zb5uOeGfN
         DOINxBQDogSD55A5DHtz2K2EzEufxXGvHXJbSvlVa/WHSlLhjW0pMQpUidgUCADWhhJH
         ZeSQ==
X-Gm-Message-State: ACrzQf25rs4fsZ5JBnmZdBDtg/ju2Nw70yKg6xFXG4c96U7+AkFWDHgC
        Gz2W7xIUyYOxxFOWReq++NUjMp14enWxyw==
X-Google-Smtp-Source: AMsMyM7h1NHgGTdBbb/oskUAVQgZKNEomqEtAOozee571573X20RnkA02oZudsiXQUULfY715jNUqA==
X-Received: by 2002:a05:622a:282:b0:35d:4999:10cb with SMTP id z2-20020a05622a028200b0035d499910cbmr13918901qtw.191.1665400520064;
        Mon, 10 Oct 2022 04:15:20 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id bs32-20020a05620a472000b006e54251993esm9950225qkb.97.2022.10.10.04.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:15:18 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-35befab86a4so97296037b3.8;
        Mon, 10 Oct 2022 04:15:18 -0700 (PDT)
X-Received: by 2002:a81:1b09:0:b0:35d:cf91:aadc with SMTP id
 b9-20020a811b09000000b0035dcf91aadcmr16263120ywb.47.1665400518454; Mon, 10
 Oct 2022 04:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665147497.git.geert+renesas@glider.be> <d0f35c35e1f96c5a649ab477e7ba5d8025957cd0.1665147497.git.geert+renesas@glider.be>
 <Y0M7JVPVmrudEvZI@shikoro>
In-Reply-To: <Y0M7JVPVmrudEvZI@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Oct 2022 13:15:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXK1Bh=6p_8LL54gJL0nKZ27wQb_wxM0ve0svBDG5X-6w@mail.gmail.com>
Message-ID: <CAMuHMdXK1Bh=6p_8LL54gJL0nKZ27wQb_wxM0ve0svBDG5X-6w@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r8a779g0: Add SASYNCPER clocks
To:     Wolfram Sang <wsa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sun, Oct 9, 2022 at 11:20 PM Wolfram Sang <wsa@kernel.org> wrote:
> > +     DEF_FIXED("sasyncperd1",R8A779G0_CLK_SASYNCPERD1, CLK_SASYNCPER,1, 1),
> > +     DEF_FIXED("sasyncperd2",R8A779G0_CLK_SASYNCPERD2, CLK_SASYNCPER,2, 1),
> > +     DEF_FIXED("sasyncperd4",R8A779G0_CLK_SASYNCPERD4, CLK_SASYNCPER,4, 1),
>
> Some spaces missing after the commas.

I did it this way to keep the columns a little bit more aligned.
The alternative is to widen the columns, and adds TABs in all rows...

> But my main issue is that we have it a little different for S4-8:
>
> 112         DEF_FIXED("sasyncperd1", R8A779F0_CLK_SASYNCPERD1, CLK_PLL5_DIV4, 3, 1),
> 113         DEF_FIXED("sasyncperd2", R8A779F0_CLK_SASYNCPERD2, R8A779F0_CLK_SASYNCPERD1, 2, 1),
> 114         DEF_FIXED("sasyncperd4", R8A779F0_CLK_SASYNCPERD4, R8A779F0_CLK_SASYNCPERD1, 4, 1),
>
> So, no CLK_SASYNCPER at all because R8A779G0_CLK_SASYNCPERD1 divides
> PLL5 directly. I don't mind which version we use but I think it should
> be consistent because the diagram looks the same in the specs. What do
> you think?

I can add an internal SASYNCPER clock on R-Car S4-8, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
