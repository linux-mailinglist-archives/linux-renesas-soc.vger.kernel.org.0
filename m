Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690E470B74A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 10:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjEVIGk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 04:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjEVIGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 04:06:35 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB814CD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 01:06:31 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-ba82956d3e0so4835510276.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 01:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684742791; x=1687334791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efX0Ed2sEAZdnloU+zHR0aFzt/Ns9ayia8W8FTseb4Q=;
        b=hZByhgO1BVvIUvMIVpPBFjIib7hMNl/G/Y2Fsano1aEkTKxTgHprp/S/QBHTV6Yg2y
         bTiYqebwzinowFqfqtEjXGUALHb7M2KG0tbecaUxif9Z7s/iYqWFTupGu5QRLbFmLQjf
         /yuFeHXilGz2Qjq3kWFg+d0SOr4qss2ISGTaL5Md1JbwmHt+Ys6I19gqvkI4Thzr4avO
         zq5/1fPy5Jiy3htEGzuPEs+plZSwMuNmPT1WmWjwg0kaDHIcoDjsLMaKVC27hQho9Vq2
         8yDqeYcDKjazQf8GpQ+PPS8IM5Td1LCKbC67q+0JF9fG5RkQeuAh0kSysLgL30G+dPlp
         DbwQ==
X-Gm-Message-State: AC+VfDzwikszZlsUesqDEt/4bnS9V28f3rBFZqehYPH7y58z2eNUSi7N
        bxyutyaCpSHX1p+irGa/S7AuBSoIDfuzFA==
X-Google-Smtp-Source: ACHHUZ5hlcxas7F0IisG9DSuRmELTf3AYGtl4QcwRexmIaItvlg31l55CWsp2zk1Xgd9jPPOJXYCAw==
X-Received: by 2002:a25:cd87:0:b0:b9d:766d:f72b with SMTP id d129-20020a25cd87000000b00b9d766df72bmr8912456ybf.31.1684742790738;
        Mon, 22 May 2023 01:06:30 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id h14-20020a056902008e00b00ba8338d7753sm1348154ybs.10.2023.05.22.01.06.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 01:06:30 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-56190515833so49481537b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 01:06:29 -0700 (PDT)
X-Received: by 2002:a81:494c:0:b0:561:1cb6:f3d6 with SMTP id
 w73-20020a81494c000000b005611cb6f3d6mr10072084ywa.0.1684742789707; Mon, 22
 May 2023 01:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKsejKgF5E+veu-G_1ygTF+gkV6uTJrU0AG3ohD2WiiuQ@mail.gmail.com>
In-Reply-To: <CAHCN7xKsejKgF5E+veu-G_1ygTF+gkV6uTJrU0AG3ohD2WiiuQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 May 2023 10:06:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKm6Cf16Rs54DMfD30NvRFcG9JCXTNT2yb-eLN_60eyw@mail.gmail.com>
Message-ID: <CAMuHMdVKm6Cf16Rs54DMfD30NvRFcG9JCXTNT2yb-eLN_60eyw@mail.gmail.com>
Subject: Re: RZ/G2M Power Domain Errors with GPU
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        cstevens@beaconembedded.com,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Ulrich Hecht <uli@fpond.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Sat, May 20, 2023 at 5:13 AM Adam Ford <aford173@gmail.com> wrote:
> I am trying to see if the Open Source PowerVR driver [1]  for the 6250
> can be made to work on the RZ/G2M, and I am having difficulty getting
> the power domain to turn on.
>
> In the GPU node, I set:
> power-domains = <&sysc R8A774A1_PD_3DG_B>;

LGTM...

> Unfortunately,  when it boots, I get the following error message:
>
> [    8.313305] powervr fd000000.gpu: error -ENOENT: failed to add to
> PM domain 3dg-b

That means genpd_add_device() failed (but why?)...

> [    8.320822] powervr: probe of fd000000.gpu failed with error -2
>
> Is there something I need to do in order to use this?  it appears the
> 3DG_B starts 3DG_A if I understand this correctly.
>
> Unfortunately, I don't see the parent child relationship between the
> 3DG_B and the GPU
>
> root@beacon-rzg2m:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children
>             performance
>     /device                                             runtime status
> ----------------------------------------------------------------------------------------------
> clock-controller                on
>             0
> 3dg-b                           off-0
>             0
> 3dg-a                           off-0
>             0
>                                                 3dg-b

... hence the relationship does not show up.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
