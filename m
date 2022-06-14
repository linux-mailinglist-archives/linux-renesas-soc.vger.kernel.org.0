Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739DD54B4E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jun 2022 17:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356937AbiFNPjB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jun 2022 11:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235793AbiFNPjA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jun 2022 11:39:00 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DD13584A;
        Tue, 14 Jun 2022 08:38:59 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id o73so6644393qke.7;
        Tue, 14 Jun 2022 08:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gWkjio64HLTn0FlN5EkGUWjaDjlbrlEM+HvPB5I3j9E=;
        b=sylXMzY9Zbu7NqvGwOD4iakjZEjAwZNxyJcuurhUPW3ZiS4Sg7/hv+xGGN93sAj5dh
         myyHf6JMo6AfaxcbWE59tNjRCOXVw1ZpEuNxYxPp+crpxYMEImaHdvrA+5Bgh12ZxL3+
         3PKBLcZ4S6UeUr1YqapVA7p/PBrfpaAna+RmALgtSBnuyWlKROOG6+E5qTrZ5CG/+pui
         HB8DQNsj8dejxOtqx+vEqoCacSnHpk8FKxAriMyymM7MfqC1b7WsrdfB7/HfJSiprCOW
         S4xw1jqoVBQguOWUgGtX7F43bAs14ocl6xIDzQMBGFDoLhadxAHti8OYyKhTPbyuQIMI
         fAgA==
X-Gm-Message-State: AOAM532pYEu4t84IqQvdFBnEOtEh4s+Gy/5V5OolSn01P/IUsZZvI6fp
        +HFLel4Jintpn/pmLQ0sXgmeCJL9I6nQTA==
X-Google-Smtp-Source: ABdhPJxvKFHxcioMbwZjyA2gRSp9NSKOOfJQxmukKa+6g6nz7KpWom5tHXpB6cOFkf0Qxv8+FBxuLA==
X-Received: by 2002:a05:620a:24c7:b0:6a7:2d03:2de3 with SMTP id m7-20020a05620a24c700b006a72d032de3mr4569133qkn.134.1655221138486;
        Tue, 14 Jun 2022 08:38:58 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id n7-20020a05620a294700b006a708baa069sm10119944qkp.101.2022.06.14.08.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 08:38:58 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-313a8a8b95aso33885307b3.5;
        Tue, 14 Jun 2022 08:38:58 -0700 (PDT)
X-Received: by 2002:a81:f41:0:b0:313:4d6c:49db with SMTP id
 62-20020a810f41000000b003134d6c49dbmr6307027ywp.384.1655221137793; Tue, 14
 Jun 2022 08:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115627.2831257-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220613115627.2831257-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jun 2022 17:38:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMCCwh_QEt+uPX1cg2KiaWbFbN6VLC535bkOAwxumP4A@mail.gmail.com>
Message-ID: <CAMuHMdWMCCwh_QEt+uPX1cg2KiaWbFbN6VLC535bkOAwxumP4A@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779f0: Add PCIe clocks
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
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

On Mon, Jun 13, 2022 at 1:56 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add the module clocks used by the PCIe controllers on the Renesas
> R-Car S4-8 (R8A779F0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
