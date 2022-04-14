Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B2950077E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 09:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239417AbiDNHtP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 03:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241412AbiDNHsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 03:48:17 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B83D5E747;
        Thu, 14 Apr 2022 00:45:25 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id b17so3448192qvp.6;
        Thu, 14 Apr 2022 00:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=33XiQJpPXpQ4UXAsE/8HG8mnWkmeJLCo8tle8iDLH6E=;
        b=EFpANksrW1VbvO7aMoUIS6ITKTb1VX1rgZGPyT51VSSSdy32r66kdAiHk7coRFgilA
         bIiwJ6XWIzTCRUxw9Rd2Bzh3os5fKUl3eeoRpFQ5otrjITPupuakNVFQZvT9Ejup7sfl
         sn8NoSUu/dP0ohHFFMRMSxqGF5NPFSmEML9xU+J26mZVtHnBmfgAmFf1vo6ab06QFH/B
         3heO/iwpSrrd7Acjuq+sbq6z7MzQzPJSWa0qJLAbN4jesG3Kwj9ncFq1P+Aro4T8Diik
         bRHhVKTfp+6suypOB6xbXPdsnXbkBXzm66JndmnNMT/sq3miWf/ZPuuGjQlbxfMfg3l5
         PtOA==
X-Gm-Message-State: AOAM531kvUwTn9vOsl0G4n9PnH+HsVSY/pnZCRLf5iSdQnphJyX2tzf+
        WKB2ri3O9696NRvSa5+1FxUlgZ/tJAHNiw==
X-Google-Smtp-Source: ABdhPJze7sAfMZlfYoPURb3BaJRsqXK9C2HRxARDtgEfgHDldAFu/OqANhyCMaHpsvyyVQW/x2G9mA==
X-Received: by 2002:a05:6214:11a9:b0:444:3f30:8ae7 with SMTP id u9-20020a05621411a900b004443f308ae7mr2152815qvv.79.1649922324447;
        Thu, 14 Apr 2022 00:45:24 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id q123-20020a378e81000000b0067eb3d6f605sm629654qkd.0.2022.04.14.00.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:45:24 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2ef4a241cc5so39838017b3.2;
        Thu, 14 Apr 2022 00:45:24 -0700 (PDT)
X-Received: by 2002:a0d:e743:0:b0:2eb:3106:9b32 with SMTP id
 q64-20020a0de743000000b002eb31069b32mr1030313ywe.512.1649922323841; Thu, 14
 Apr 2022 00:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <5861565a79a2bdadc07ae84e23e6d96dbb764823.1649680949.git.geert+renesas@glider.be>
 <95580a26-8595-1fa1-5e3d-112ceb767ae6@opensource.wdc.com>
In-Reply-To: <95580a26-8595-1fa1-5e3d-112ceb767ae6@opensource.wdc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Apr 2022 09:45:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwnwGdbZQ37U0zPm9ORQ7jaF=e7xas=1nhbFn+_MW6Bw@mail.gmail.com>
Message-ID: <CAMuHMdVwnwGdbZQ37U0zPm9ORQ7jaF=e7xas=1nhbFn+_MW6Bw@mail.gmail.com>
Subject: Re: [WARNING: UNSCANNABLE EXTRACTION FAILED][PATCH v2] dt-bindings:
 ata: renesas,rcar-sata: Add r8a774e1 support
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Damien,

On Thu, Apr 14, 2022 at 3:23 AM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
> On 4/11/22 21:43, Geert Uytterhoeven wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document SATA support for the RZ/G2H SoC, no driver change required.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>
> I queued this is for-5.19. Does it need to go as a 5.18 fix ?

Thank you!
No need to queue it as a fix, silencing "make dtbs_check" is a multi-year
project ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
