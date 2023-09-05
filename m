Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421F9792775
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Sep 2023 18:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbjIEQEH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Sep 2023 12:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353728AbjIEHjE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2023 03:39:04 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3B018D
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Sep 2023 00:39:01 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58c92a2c52dso20438057b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Sep 2023 00:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693899540; x=1694504340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3ucGvAfFYBC5dLQu9Fol4toUGreKlHRzNUAh/tXzQY=;
        b=GViLLZnqvZA0OE7NYO9yhsP97rfqavCL+5hcUhlBToD8s5l6goU8CtF/+g/d9//DGx
         DnER9YKTeYAQsRIWbA+lRj5Fz6g3VHPoQk3aocotQqb2SKSZvV+EZGqls88lmcVtrDpy
         mjhGj/X+30z1zIG6Uj8VoAySnJWRP+QUIWMeluGHnv/PP89ypGIj1Y8jelzSvk9PpuI9
         9h2Sl/I+rbLolXokUcgtEMjg6HPZInK7t8Lg933fDwRJtX6ZkRRufGz7ZtPCGT1zNNu5
         Z7dus+Xpl3JNhks7gnToQFt97ukUVG9gRCN9XG9wpdmjt7jCRA++3mcg8uuJmL6qTccl
         vk4Q==
X-Gm-Message-State: AOJu0YwsP8HKVKkyHay90o6wHq6gsLE3v0pp/VlVhqrmczDyKUavcf7W
        0HMLhWlYvrBFv5FeIq6eKv7lOnC6/PLbsg==
X-Google-Smtp-Source: AGHT+IFhWb4H/9cMoavZ+QARNzLJev3btz07HrPop4wRdHfMXEi9c7w/q357Wumg1CdaEjo2xxgJqg==
X-Received: by 2002:a0d:e6d1:0:b0:589:b3c6:95ff with SMTP id p200-20020a0de6d1000000b00589b3c695ffmr13813349ywe.36.1693899540107;
        Tue, 05 Sep 2023 00:39:00 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id z7-20020a816507000000b00592a065e2a3sm3062542ywb.87.2023.09.05.00.38.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 00:38:59 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d78328bc2abso1858253276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Sep 2023 00:38:58 -0700 (PDT)
X-Received: by 2002:a25:6984:0:b0:d7b:7249:6dbc with SMTP id
 e126-20020a256984000000b00d7b72496dbcmr13293206ybc.16.1693899538743; Tue, 05
 Sep 2023 00:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230905012404.2915246-1-yoshihiro.shimoda.uh@renesas.com> <20230905012404.2915246-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230905012404.2915246-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Sep 2023 09:38:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXW=vg43NxoD5ZGxnEmzs+nXoq+BYD_J14Q6B+PzH-cuA@mail.gmail.com>
Message-ID: <CAMuHMdXW=vg43NxoD5ZGxnEmzs+nXoq+BYD_J14Q6B+PzH-cuA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and
 Endpoint nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com,
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

On Tue, Sep 5, 2023 at 3:24 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PCIe Host and Endpoint nodes for R-Car S4-8 (R8A779F0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.7, together with [PATCH v4 2/2/].

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
