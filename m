Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A079D5F9D51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 13:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbiJJLJs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 07:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbiJJLJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 07:09:46 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF976DFAE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 04:09:44 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id s7so2481125qkj.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 04:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aIPRi7WPOuxRNIA8AqPDtN9TwH1w4pPbJITKzf2WWDc=;
        b=nvZq8XOWGPTN82N78ttMvtHHMkj68RzklNXk/82MiDMM3Sp9xpdbhTe0GDW+lxs4dQ
         B/vLsICWWFcbywWpWn0kQ84uiX5SwoC45khJJO2gDj7tg0L5v+p2Xl0UPebJm9tezuC1
         hnDJEOEMBmX4ukMQz24v94EUbhPVYzxFznIhmTn6qLwt28g32nG9cI1rGS/Ou2vO8OVl
         hrGcw3UpyF2T5Y4mkxG1D2GIVXLOWyX7cwAWIIgj67VGiRVBjzlC/Ne3DMRFymUwZORn
         0WstZ2OXYwGegpwoiYXVF/xSP2T6SUKtbQOMaa5XmVWib7RYFN2Zfbs/KV0fMxMReCCl
         oAeQ==
X-Gm-Message-State: ACrzQf2yXs/kIX/QiPooC+M6b+6Hbf0E1b9elPNDNBpDG0IjOCwCLRAv
        FoXBQcizCnOMXJUOdzPuURQ4O0el+XE5NA==
X-Google-Smtp-Source: AMsMyM6KyQdm7JLDcTxc7JGU4gMdvazGbfKVNFnB/jA824X5tA3zIO9K/4ZIJHAn2dB177EuY/gScg==
X-Received: by 2002:a05:620a:6013:b0:6e0:6a88:2940 with SMTP id dw19-20020a05620a601300b006e06a882940mr12079307qkb.163.1665400183117;
        Mon, 10 Oct 2022 04:09:43 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id az20-20020a05620a171400b006ec62032d3dsm3462237qkb.30.2022.10.10.04.09.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:09:42 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id t186so7096261yba.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 04:09:42 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr15944365ybp.365.1665400182080; Mon, 10
 Oct 2022 04:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665156023.git.geert+renesas@glider.be> <20dc2d1985fef5fb432cd2ef0fbaaecb33743473.1665156023.git.geert+renesas@glider.be>
 <Y0PVaG6OW3wQLQGc@shikoro>
In-Reply-To: <Y0PVaG6OW3wQLQGc@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Oct 2022 13:09:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFRVTjyjEqc7GP2WZS3ioavmsOCoU=aZE7zqZC0k6Cyw@mail.gmail.com>
Message-ID: <CAMuHMdXFRVTjyjEqc7GP2WZS3ioavmsOCoU=aZE7zqZC0k6Cyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779g0: Add SCIF nodes
To:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
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

Hi Wolfram,

On Mon, Oct 10, 2022 at 10:18 AM Wolfram Sang <wsa@kernel.org> wrote:
> > +                     reg = <0 0xe6e60000 0 0x64>;
>
> "64" not "0x64", I think. Or we convert all Gen3+ to "0x40"?

Thanks, will go for 64.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
