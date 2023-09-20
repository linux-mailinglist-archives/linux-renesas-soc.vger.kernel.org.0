Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBCF77A7320
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 08:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbjITGt7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Sep 2023 02:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbjITGt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2023 02:49:57 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42EDC9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Sep 2023 23:49:49 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d818d65f23cso5458061276.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Sep 2023 23:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695192589; x=1695797389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc90avGqwJXQkC7wKKWHTWmb6sDiQQPd/JTDFVEt3jk=;
        b=s/eEyPgukxdxtuPy2AniyDT1AvA6ogDIOtb/1QNFeeNA7za8zpq0JVobXE2SJ9PurZ
         5rx6AbDqKaMpRPiP2XUqi/BgqRNmJ8sIEa8GMjH22HpTA7bhRiHhyolvMJXAq4A+Xsl1
         MEupDlY8FpCT9Ows4nvLCsOFVW8srMawAMPxMBjnT+xGftAVQMkI2IgNoeWHpRWiGZOI
         cQV5+8W0/t+/L2h2B2Sbb/LM1rXMDpnJdrFoWRfgDtVk0BcC1DpF4GcW466TiqrY+FlQ
         XHYuZRARR478kHDjwRcGPV3M0MBN2YRUY+YVpGFjYjPC1W9Qqk0m8yLD3UuZ8N+Ml0SN
         18/A==
X-Gm-Message-State: AOJu0YyxEugb6E/bJIGjxMsr0pAj4Ver1Nu4d/kVggLSTdVDlbYzt0L2
        FURp6b0y2UppL3njR6DyE6oWJYfDN7LWzg==
X-Google-Smtp-Source: AGHT+IEd/mt+uswo3JMjDiiM2pTcvzTewxE+zsOOHCEAa7yZjHKStulG6aORBs0MtN9/3u1uJubfXA==
X-Received: by 2002:a25:764a:0:b0:d80:14a0:6b0 with SMTP id r71-20020a25764a000000b00d8014a006b0mr1803220ybc.19.1695192588824;
        Tue, 19 Sep 2023 23:49:48 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id b13-20020a25340d000000b00d81c86f121esm2759923yba.11.2023.09.19.23.49.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 23:49:48 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59bebd5bdadso67261237b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Sep 2023 23:49:48 -0700 (PDT)
X-Received: by 2002:a0d:d8d7:0:b0:58f:9696:842d with SMTP id
 a206-20020a0dd8d7000000b0058f9696842dmr1576758ywe.15.1695192588333; Tue, 19
 Sep 2023 23:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <87o7hxxv6o.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o7hxxv6o.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Sep 2023 08:49:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjW-bwJzLizL6XoJkq_SNUwrPQW7imA8VD2yX5-q+mjg@mail.gmail.com>
Message-ID: <CAMuHMdVjW-bwJzLizL6XoJkq_SNUwrPQW7imA8VD2yX5-q+mjg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: spider: fixup memory address
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Wed, Sep 20, 2023 at 7:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> It is using 0x80000000 instead of 0x480000000
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> @@ -28,7 +28,7 @@ memory@48000000 {
>                 reg = <0x0 0x48000000 0x0 0x78000000>;
>         };
>
> -       memory@480000000 {
> +       memory@80000000 {
>                 device_type = "memory";
>                 reg = <0x4 0x80000000 0x0 0x80000000>;
>         };

Unit address 4_8000_0000 is correct though, as it matches the
(36-bit!) address 0x4_8000_0000 in the reg property.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
