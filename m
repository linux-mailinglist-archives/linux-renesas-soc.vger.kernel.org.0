Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EF94EED75
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 14:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345975AbiDAMuu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 08:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345974AbiDAMut (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 08:50:49 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D8B1A801;
        Fri,  1 Apr 2022 05:48:59 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id jo24so1912472qvb.5;
        Fri, 01 Apr 2022 05:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HcYAa1HY2tt8cvYgc6E+k20RktGnFtvGcofIG2SV7ZQ=;
        b=hu53czHgVaFXl7wOwR5mnnpSqduN8dUeLqHJdHltwfu2QeGEIEVReyPxe4xxTe2HM7
         m4YFjtd2zlUm5FrfuHAgODX3ocpH9/diVPLiUc7pC/YXsXpIY17u9yQWvP8XDzoJ+SbZ
         xhbClUVLsaaeWR9cpAzFDxOuXAjAijQIDLVIbEPDo1rKGZEpayOgi+4UoSP6fafDJ/Uf
         z1xoOwVuBK+Cotkp+o6ezGliPIaOF2ZwqJq8TjX1FHnvxg3LJLpRWEtc3QSqdF5jfmYE
         WJeb8NonVJD0MxML50OMn/BW9g4KOHx/is/JnJltm4FW8NjQFn7d3Ul334hehpxTmr4W
         etBA==
X-Gm-Message-State: AOAM533Ay6kMTfoMLMMD/RHk2Yn62XzHKNwwjHwGliE7652aWJ1a+9Tk
        TnPWc2jDVUVENlCrQTeIupaSDumxVCg4dw==
X-Google-Smtp-Source: ABdhPJzyFTYZGafiXv2W3pxnoGUrYBAmu7TfPnn7vRq7d7vwvvBhU8d8Y6AB3Z9Rb5vVBeuidI5Jww==
X-Received: by 2002:a05:6214:76d:b0:443:6801:6d0f with SMTP id f13-20020a056214076d00b0044368016d0fmr17588164qvz.60.1648817338210;
        Fri, 01 Apr 2022 05:48:58 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id d6-20020ac85d86000000b002e1e20444b6sm1795934qtx.57.2022.04.01.05.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 05:48:58 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id m67so4828509ybm.4;
        Fri, 01 Apr 2022 05:48:57 -0700 (PDT)
X-Received: by 2002:a25:5b88:0:b0:63d:8530:d762 with SMTP id
 p130-20020a255b88000000b0063d8530d762mr461544ybb.546.1648817337586; Fri, 01
 Apr 2022 05:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com> <20220320123016.57991-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320123016.57991-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 14:48:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpfFGVYsKh47paYHW7a-YCvxEBcgVmYtSJDZK+hqTj5Q@mail.gmail.com>
Message-ID: <CAMuHMdWpfFGVYsKh47paYHW7a-YCvxEBcgVmYtSJDZK+hqTj5Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] mmc: renesas_sdhi: remove outdated headers
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Mon, Mar 21, 2022 at 4:20 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We moved quirk handling out of the SDHI core to the individual drivers.
> So, no need to include headers needed for soc_device_match et al.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
