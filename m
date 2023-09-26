Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 049A77AE73B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 09:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjIZH75 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 03:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjIZH75 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 03:59:57 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F75C9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 00:59:50 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59f82ad1e09so38638637b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 00:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695715189; x=1696319989;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxGAsJsFeUxU7GTUIerjnlrGxMNscHAi59ttCDxhzkk=;
        b=QK8wsfCq5Cx4Qv6+UqIU5KZN+9GU17f/ljWABFhNi3WpvHDPz2+EKjo91AP6i+y1P2
         gn3g+rNAv4EfhiphGZ4RX94gYfl8bMsuMIoOf5C2avXO9BocOb3eEwpbHC8p027pSGSR
         W8CR0PhVDJsSRXWF7/+T9nCswE3yAEQkKTqZZCbp39FLuvRCbEjpggDktDZ+k/P/hqPl
         6LbWs6BKlxMH+IwIVtbrudMQNJQ76IckKif1SN54xlZKc/BH7FyNT0qJItMLYW4NzWU5
         wSPw65fbgcdKcfjZP6dDxavvRcrdMpmTBbs/dZghtjNus2H5bLDJ0YbDWjtyZHt0pBa6
         fqzA==
X-Gm-Message-State: AOJu0Yyxr0fBjQaeDjQ7KClyz6G0s7SfT7Lv6QJ4MKHqr3IoCSqbuE39
        5DIeX5Nxn0c6xXvvhsg6hfPqSioNNfNvgg==
X-Google-Smtp-Source: AGHT+IFhZZ45pUQ+RB4hlaYVATXTmOIjBB1ej+PD44HIg3MFS7opDDMiBtNWicZ6mMgmqZbpAifwSQ==
X-Received: by 2002:a25:943:0:b0:cfd:58aa:b36e with SMTP id u3-20020a250943000000b00cfd58aab36emr10066539ybm.9.1695715189293;
        Tue, 26 Sep 2023 00:59:49 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id e195-20020a2550cc000000b00d8679407796sm1436823ybb.48.2023.09.26.00.59.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 00:59:48 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59f82ad1e09so38638237b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 00:59:48 -0700 (PDT)
X-Received: by 2002:a0d:df83:0:b0:59a:fa28:2b98 with SMTP id
 i125-20020a0ddf83000000b0059afa282b98mr10540726ywe.17.1695715188377; Tue, 26
 Sep 2023 00:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
 <ZQtY+NHFzFBWhrZj@shikoro> <CAMuHMdU_S7+rgykqtvTVaSSO53zXGHNpiPJ=yzcF1GMf2QXvgg@mail.gmail.com>
 <ZQv4SY8VUXMZ600S@ninjato> <ZRKMww5Lq9L+PDic@shikoro>
In-Reply-To: <ZRKMww5Lq9L+PDic@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Sep 2023 09:59:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqvmKMu9adZ37Qgs2w2mqJ6RWND79TemK-+xbEJyEcGQ@mail.gmail.com>
Message-ID: <CAMuHMdVqvmKMu9adZ37Qgs2w2mqJ6RWND79TemK-+xbEJyEcGQ@mail.gmail.com>
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

On Tue, Sep 26, 2023 at 9:48 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > An alternative would be to let cpg_sdh_clk_register() sanitize the
> > > pre-existing contents of the SD-IFn Clock Frequency Control Register,
> > > so there would be no need to extend cpg_sdh_div_table[].  An advantage
> > > of that approach would be that it can handle all invalid combinations,
> > > not just the few that have been seen in the wild.
> > > (following the old networking mantra: "be strict when sinding, be
> > > liberal when receiving').
> >
> > That sounds very reasonable to me.
>
> Thinking further: Sanitizing a pre-existing value of SDH means also
> sanitizing the value of SD because only specific combinations of these
> are recommended (or even "allowed" as I read it). This is getting a bit
> complicated. What about just applying a default value to SDH and SD
> which is from the recommended set of parameters? That will also help
> when probing the clocks. Once SDHI probes, it will modify clocks anyhow.

Sounds fine to me, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
