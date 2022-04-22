Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E9550B0D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 08:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444514AbiDVGu6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 02:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444366AbiDVGu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 02:50:57 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53F850E00;
        Thu, 21 Apr 2022 23:48:04 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id s70so5213362qke.8;
        Thu, 21 Apr 2022 23:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m6HPhJ0w/YCYbG1CtnrPIlmqlHiQywBms+joUGlVeEc=;
        b=1R6CCt52+dhiS3/vVMUmE5SjT9pin/vUsnxRkq77KcqhMBfndGb536MfCMZM67OHPg
         4diBYardCDZVaqylrD2KoMTcUCxU47fUTYirDB254tVJFzUYfYNS0XvykA98DrIRsL3r
         14Yurl42o2i6UZFbEEaPefI/jS8WXRTWBek3x3N3Xc6rtr0A2H4UoHSjWHtMur9BDyqA
         qF2Q4pjLpRcJExaRQwukVdQvLlJDPX/0nUjfaso+ClfWUmLB+da+oZ+fDZr5cm15BBdA
         OfGsr0W4vPtzVQhJ4E4GAAzXvxvTEbc9Nl1mRpSUCtBpwNWoDBDwzq3vOoFT0fUPUiDl
         561w==
X-Gm-Message-State: AOAM531WueG/uqHQxDlcm+m/oxmoMUpLPViMu5FAbZsmznBUqOhXZ0uT
        Cd7oMlSO1pKCLEIXJ0GPf5XF2HLXpsnfGQ==
X-Google-Smtp-Source: ABdhPJzErHsjfoAQ3RSyCumup8J1Kb/NBCllO7MW9c54qDxLeWBMDT6+0pp/h3OjqW3JmYyOb85Dnw==
X-Received: by 2002:a05:620a:4309:b0:67b:3fc1:86eb with SMTP id u9-20020a05620a430900b0067b3fc186ebmr1737663qko.495.1650610083942;
        Thu, 21 Apr 2022 23:48:03 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id k14-20020ac85fce000000b002f344fc0e0bsm897836qta.38.2022.04.21.23.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 23:48:03 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id r189so12794604ybr.6;
        Thu, 21 Apr 2022 23:48:02 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr3101621ybq.393.1650610082372; Thu, 21
 Apr 2022 23:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-8-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVkcG-edq=v_onOc66y3UpJgr74R1c9t7kfYhnOnqZdZQ@mail.gmail.com> <TYBPR01MB5341601F1268F4E74E5EE7CDD8F79@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341601F1268F4E74E5EE7CDD8F79@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 08:47:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWs=N7yj=f-bVj6TAG62pMKSyLL=tr_-6XYPy7p3RhjVw@mail.gmail.com>
Message-ID: <CAMuHMdWs=N7yj=f-bVj6TAG62pMKSyLL=tr_-6XYPy7p3RhjVw@mail.gmail.com>
Subject: Re: [PATCH 07/15] dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
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

Hi Shimoda-san,

On Fri, Apr 22, 2022 at 7:40 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, April 21, 2022 7:19 PM
> > On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Add all Clock Pulse Generator Core Clock Outputs for the Renesas
> > > R-Car V4H (R8A779G0) SoC.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/r8a779g0-cpg-mssr.h

> > Missing IMPA0?
> > Or is it internal-only? Perhaps the same for IMPA1 below?
>
> IIUC, IMPA[01] are internal-only.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
