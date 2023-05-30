Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E92C9715997
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 11:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjE3JL7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 05:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjE3JL6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 05:11:58 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA849BE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:11:56 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-568ba7abc11so12452177b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685437916; x=1688029916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBFk39ySgkQeFFuuQhVektz36jOk9oVo63yATv3qwoQ=;
        b=hue9yTGP8qGlPvUKKS7YJzPYf9bBrEfVvgTIK09HZKJ3RvvNhY2mVpR265h7NbwfDo
         2HsZv24lt1TO8JKxTgKNjyz1fmbvoZOyan+wiyQfKFk3WD5QIvBEUp6zlR+vOPn5v7x4
         ZJvajgzehrPa7PE3PsFnDRrp2P8F4VI6uzP0i6saqwaB6fMRtnJH7bbuiEyoaVSrAThD
         kF7AuuwM8H7EtYe1iCl7mZYeYj85krGs/5lRcTscsI5O8j8jXJOxCLADjRmybCuGsPvJ
         mVpA3ovcPFCDCfauaM3oUx6J18UYeHLggsPIaSnt4svvt0PtCla/lP+V/g/B70nbTQeZ
         schg==
X-Gm-Message-State: AC+VfDyWx11P4FoClfTLp0EdB2aQ+crZnKuAEksAQR+imOOWgYbtMq7w
        jq22iT3/SXfuOqGDQsjDetfa00Yx0pfOKA==
X-Google-Smtp-Source: ACHHUZ6cigMxhsckA1ip07bshW4c5xORoTPKG3Btb1s86gUQi9E/d8eu9t2sXJseRWhBWp16oKKMdg==
X-Received: by 2002:a81:720a:0:b0:565:de67:1584 with SMTP id n10-20020a81720a000000b00565de671584mr1346035ywc.40.1685437915916;
        Tue, 30 May 2023 02:11:55 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id h63-20020a0df742000000b005612fc707bfsm4314818ywf.120.2023.05.30.02.11.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:11:55 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-561c1436c75so61220747b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:11:55 -0700 (PDT)
X-Received: by 2002:a0d:d64e:0:b0:565:c966:60dd with SMTP id
 y75-20020a0dd64e000000b00565c96660ddmr1450118ywd.48.1685437915599; Tue, 30
 May 2023 02:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230525084823.4195-1-wsa+renesas@sang-engineering.com> <20230525084823.4195-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230525084823.4195-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 May 2023 11:11:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMOG-PtZtstOLZU9LWJ8v3Rh9QSdKWZVa7iFs54Lha8A@mail.gmail.com>
Message-ID: <CAMuHMdVMOG-PtZtstOLZU9LWJ8v3Rh9QSdKWZVa7iFs54Lha8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: ulcb-kf: remove flow control
 for SCIF1
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
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

On Thu, May 25, 2023 at 10:48 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The schematics are misleading, the flow control is for HSCIF1. We need
> SCIF1 for GNSS/GPS which does not use flow control.
>
> Fixes: c6c816e22bc8 ("arm64: dts: ulcb-kf: enable SCIF1")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
