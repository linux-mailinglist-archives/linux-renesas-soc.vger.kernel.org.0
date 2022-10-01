Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62C15F1C09
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Oct 2022 13:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJAL5c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Oct 2022 07:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJAL5b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 07:57:31 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2364685A;
        Sat,  1 Oct 2022 04:57:30 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id c19so4285712qkm.7;
        Sat, 01 Oct 2022 04:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=62D0rqi30UQUrcakW1nOwlPhZq9m8nFtqYru3j5v0TE=;
        b=V3f3gB7kGpKzrhvMQcHd535dP7tvRc9aOz+ZoT31BpZN7dq5xPGwBJwtUgBR+woBS2
         zn59EpzXNe/mEg992Bm4LOBZm4ODC+HuHmA6vnlgn7qTDbOhLIaQ1sG3gYPwnfPVRR2o
         E7TA+15l2TXuQ5buqHUqpsaBn5Oku4U/126aT9WJaarAMVf9UtkO+iZc45pQbT+gXBqX
         BnhqV+sy+pN/NXch21bgyqoxznuxMM25rNXCPsSFhLmNfdLQO3mC3Z9U8fyT7eAcm/VG
         SxTiL4zVLa+bdg1PXHra55c5THbDgDV/9CksI6xY1rrzXwv2XYLoK9xbTwQq17+27KM3
         hxAA==
X-Gm-Message-State: ACrzQf1klJ6fC6WK1QiJAUWHdscgXe+2eoVSIrFCQcz082PUBwdWn1g0
        rKuVyH2Yd3JDTcu5BjvP2rjGcdQhF7R6tA==
X-Google-Smtp-Source: AMsMyM6RcqJUoRkAzvyqZ3qCsiQLNEHc+aC7LGW5dyKB/cW9zD2upHlqlhDfEDsRRMn9J1iWU5zA9A==
X-Received: by 2002:a05:620a:254e:b0:6c7:855c:6eb with SMTP id s14-20020a05620a254e00b006c7855c06ebmr9487840qko.39.1664625449169;
        Sat, 01 Oct 2022 04:57:29 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id q25-20020a37f719000000b006cf14cc6740sm1303110qkj.70.2022.10.01.04.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 04:57:28 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3321c2a8d4cso67410697b3.5;
        Sat, 01 Oct 2022 04:57:28 -0700 (PDT)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id n9-20020a819c49000000b0034a00de97b8mr12018686ywa.384.1664625448335;
 Sat, 01 Oct 2022 04:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdX_fQU5khvcOK-fuZoYArJpjT0057WGQ=t1=Ehf8+piqA@mail.gmail.com>
 <YzfhrXt2gj+J+WVw@shikoro>
In-Reply-To: <YzfhrXt2gj+J+WVw@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 1 Oct 2022 13:57:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuZd_9L4=yzjO0tDP_2dM5EcTvp8J1fBtEAWZ16kLVxA@mail.gmail.com>
Message-ID: <CAMuHMdXuZd_9L4=yzjO0tDP_2dM5EcTvp8J1fBtEAWZ16kLVxA@mail.gmail.com>
Subject: Re: sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware
 interrupt (CMD19)
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Sat, Oct 1, 2022 at 8:44 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Fri, Sep 30, 2022 at 10:53:55AM +0200, Geert Uytterhoeven wrote:
> > When an SD-card is inserted on Koelsch (R-Car M2-W), I see:
> >
> >     sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
>
> Is this a regression? If so, since when? I seem to recall this is
> "expected" on Gen2, we ensured that it retries gracefully and
> successfuly.

No, this is not a (recent) regression. I reported it before.

The "EEXIST, overlapping mappings aren't supported" was also
reported before.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
