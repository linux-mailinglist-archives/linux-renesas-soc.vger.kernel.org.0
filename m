Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD8261DF28
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Nov 2022 23:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbiKEWlz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 5 Nov 2022 18:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKEWly (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Nov 2022 18:41:54 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453D5B1D0
        for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Nov 2022 15:41:52 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id t25so21582507ejb.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Nov 2022 15:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfmEXeFgbdMj3gsUyt6lpX1UpHQKV916HoEE3gJfFeo=;
        b=XtkTbzPVNhvRHYgo7BUGgi5bqlcB8MqYHlLlnB8FnhvCMS094yVunIvf/jdsuZDOOs
         tfY3Y9DNzzJ2Wesj0mIts1AHC8PWGmw98CEf4wnCCakpgtIlessS/13oUGakS1bvQZCu
         uSxcYs62ym12RYwgIt+etHbyr2hnCSXtSFporz9RAp0K1tWu3EdtlaHnVPTXCJPRf6z7
         I3ifM7mCMmlGF42+/cWEhObapyCR1WlDL41vpiZzoM0TP3/kooW8cD/ixd2lrTlar4nr
         OJ3qC5Qo/Pc/h8XCxi4nlRvgdrLslg09LbMbkcviQMsRBFY3nEL8HLrGo+/TYuTdrQ2X
         nSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfmEXeFgbdMj3gsUyt6lpX1UpHQKV916HoEE3gJfFeo=;
        b=RAbIx9hojvSZ5MYjvuazCV+6ci5DgJP6pttKMiNH1v9CkALIe2oXWvAN/5eHF8BmNh
         Yq5CA/Hr+ui2KMPSBZd0w4rYUCX/r+0jY59iVvrR4Yqo9///7SW/qPfgniBMeOsdgeyj
         eouFptq+V/G51udXW/HtFoyjjc+h8dMMExkYMTQxAvxWKetwhmt1BEnNCYiOz1jwUTbX
         l/wBblUoGV6vfIqwMyWpo1BSBk4bt+rdeI7P6mxOVelwltqFYVfUiHsl0Ysg+d1j32IM
         22SMv9CP86gehYQEPfruhZ5gh3sWp0xBUn1SOTQY4UQfBXgUhiCv4cFaPXvlZED0LXlk
         DP3w==
X-Gm-Message-State: ACrzQf12qnbxwFziKayoy0uH6JEn6yXs6Mfx6pAXjFy+tL/b47s8xIvl
        EIZzJMbqy/uew4msJj/3LHm8ONIZHVAxHwFjx2Hq4osGIWg=
X-Google-Smtp-Source: AMsMyM6ns4MEPdLaoD8n40DozQzUic8AQ7fU/pxX6sGEs2hcnnNui7DIE5vrzrSchKxyfsCAlQCAoqMogao9R5KGUJk=
X-Received: by 2002:a17:906:371a:b0:7ad:c01c:6fa0 with SMTP id
 d26-20020a170906371a00b007adc01c6fa0mr36486106ejc.267.1667688110637; Sat, 05
 Nov 2022 15:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8u_u9Q6Hb8kOZVKFjGyPsc2HQt88c4y2Nh8dzx0XSebeA@mail.gmail.com>
 <13365637.uLZWGnKmhe@diego>
In-Reply-To: <13365637.uLZWGnKmhe@diego>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 5 Nov 2022 22:41:24 +0000
Message-ID: <CA+V-a8v=ki9MJ-rUfuGaEYznaFM61w=G4F8Opce4VM95P_DNsg@mail.gmail.com>
Subject: Re: [QUERY]: RZ/Five (AX45MP) non-coherent DMA
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <Conor.Dooley@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Heiko,

On Fri, Nov 4, 2022 at 11:07 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Prabhakar,
>
> Am Freitag, 4. November 2022, 23:09:15 CET schrieb Lad, Prabhakar:
> > When trying to add non coherent DMA support for the RZ/Five SoC, I was
> > suggested to use the ALTERNATIVE() macro [0].
> >
> > My initial intention was to implement the alternative_call_x()
> > something like what x86 has and from there call the C function, So
> > while doing some experiments I realized that using the asm "call
> > <func>" would cause adding the whole lot of registers in the clobbers
> > list.
> >
> > As per my understanding the only correct approach to
> > alternative_call_x() is if the function itself is inline assembly then
> > we know the exact registers being used and then we could add them
> > appropriately in the clobbers list.
>
> I'm working in a quite similar area right now and I've Cc'ed you on a
> RFC series when I'm also worked on makeing call work in alternatives.
>
Great!. I'll go through the series and take some inspiration from it.

> As you noted, using assembler for the call'ed function makes things
> way easier to handle.
>
:-)

> > The problem with the above approach being we have quite a lot of C
> > code [1] for the CMO and it also requires some register writes of the
> > l2 cache controller, converting this to assembly would be a pain.
> >
> > * Is my understanding correct?
> > * Is there any other approach I am missing?
> > * Is there no way out apart from implementing inline asm?
>
> In the inline-asm part that will form the alternative, can you
> not just save and restore the registers manually around the
> actual call?
>
> ALTERNATIVE(
> [1] ... nops ...,
> [2] ... CMO ...,
> [3] ... THEAD ...,
> [4] save registers to stack
>     call ax45mp dma-func
>     restore registers from stack
>
> That way you would no incur many penalties to the other alternatives
> I think.
>
Agreed, thanks for the suggestion. I'll continue my investigation in
this direction.

Cheers,
Prabhakar
