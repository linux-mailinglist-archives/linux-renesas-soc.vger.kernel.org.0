Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 800D07AD25A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 09:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjIYHxX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 03:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjIYHxW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 03:53:22 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33675E3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:53:16 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59e77e4f707so69683667b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695628395; x=1696233195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYgSQniKRup4sEi14ScPhZ+WR7jQQMmyGL+n1E8WaZE=;
        b=ST7GU15kxGqFOTnviEgAG/pMFtKEzLrmBO8wJYtux0zeQdI+Cvtf+RTpw7x0Yrc2Rd
         CiysIjMeF5pzf6u1GHafr5EbAX8u64a6vEBBPNyDJoLJ3xl7cWkeawUOhhYBipcs9Pxv
         VKwQgKxxx8NfKGm4+hXTFjPuVARYnW2OC57av2ZlOxbnnoOpX/dpucET2uz+yt7tg7ii
         u5FoI2WObJaH32ekroJFF73IRBc7JK9dJTe75TkIkTDgeJENZNTVl7YhW7alB3BHFJRF
         G+Bh2yemsQoSOPqLE8vZLBsbN2AhIe/C7apNlD4X9sGECU6sWMA6EiLSelAjsNZ1a0mb
         mB+w==
X-Gm-Message-State: AOJu0YzcMcT+ytODRYKuF8YLQIQyFy+hw3d4hIhMlIGAlwx93TaHY9oV
        8ifBog7PSMIO74gkd8StQ2YMWBkuSniaNA==
X-Google-Smtp-Source: AGHT+IFe8xuNUYzJeevGUxvd3rz5AaSx8pON8u6qqwMoM2h94NuUXK2X+2zG1yYCx7uODjg5dNHA1Q==
X-Received: by 2002:a05:690c:f0a:b0:59f:7ded:87dd with SMTP id dc10-20020a05690c0f0a00b0059f7ded87ddmr2580403ywb.47.1695628395232;
        Mon, 25 Sep 2023 00:53:15 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id z128-20020a816586000000b00559fb950d9fsm2298299ywb.45.2023.09.25.00.53.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 00:53:15 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d865db5b4c7so3500697276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 00:53:15 -0700 (PDT)
X-Received: by 2002:a25:d2d5:0:b0:d6e:3544:9871 with SMTP id
 j204-20020a25d2d5000000b00d6e35449871mr5300616ybg.44.1695628394825; Mon, 25
 Sep 2023 00:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <87a5tb8461.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a5tb8461.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Sep 2023 09:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1czxHN2My=Nm=wZ7b9j2OzN1BNQzpuSDysjvctxJEMA@mail.gmail.com>
Message-ID: <CAMuHMdX1czxHN2My=Nm=wZ7b9j2OzN1BNQzpuSDysjvctxJEMA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add Renesas R8A779F0 S4 Starter
 Kit support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

Hi Morimoto-san,

On Mon, Sep 25, 2023 at 2:53 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patches adds Renesas R8A779F0 S4 Starter Kit support.
> It needs Rswitch bug fix patch [1] which is posted to Ether ML today.
> I hope it will be accepted for v6.6 Kernel.

OK.

> [1] Link: https://lore.kernel.org/r/20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com

It also depends on DT binding documentation updates, and even on a
new clock driver...

scripts/checkpatch.pl tells me:

     WARNING: DT compatible string "renesas,s4sk" appears
un-documented -- check ./Documentation/devicetree/bindings/
    #57: FILE: arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts:14:
    + compatible = "renesas,s4sk", "renesas,r8a779f0";

    WARNING: DT compatible string "renesas,rc21012a" appears
un-documented -- check ./Documentation/devicetree/bindings/
    #134: FILE: arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts:91:
    + compatible = "renesas,rc21012a";

    WARNING: DT compatible string "st,m24c16" appears un-documented --
check ./Documentation/devicetree/bindings/
    #142: FILE: arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts:99:
    + compatible = "st,m24c16", "atmel,24c16";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
