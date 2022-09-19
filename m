Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC895BCB5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 14:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiISMBO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 08:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiISMBM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 08:01:12 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C3010552
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 05:01:11 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id g4so21628105qvo.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 05:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rEStmRzF49avqMXM1F7W3//GaywvKI6gab2nuNA1tJI=;
        b=gcHBc4mgmo0YSFkmIO4oP60+uqh3UY4tjAQbS6o9xSz0vpD+dxGctwM+QjDZMVnYM+
         4d/yOm8nwQR6F4qV0w3pfY+rsswaXJmQ8B9vZSsz4eo0MUQnSUiKTLsrZabc5MLZISY3
         MWA9e4zdzpKnJbPWS84lwPZKxNAxe7HPCcyRiE1207m4CZ2QzSomBJ2+8wiCidRx2E3N
         a2AqNxSRANLoMa6m/9Dj11T0Bvifa71kGSlInLoXFyBHhHc6YVCy4eaKaUN9l+L1Sg1y
         qF7rsaw/x0bNUCBjPIIqAVUu5wTX+SCMApnUepy9yRMJagXJCMyQ+e41geaIL6oTPnN6
         WKwA==
X-Gm-Message-State: ACrzQf2RBnPNAyjBk70SUJDZubKv9dZLX8JRDZPT1w03nRWk6I+Jq4MK
        vNxKA4TcoH5QLMXeYwDS2z2SdEsqThCBaA==
X-Google-Smtp-Source: AMsMyM6A+0XbB3j4RXtqJmvgbEcd/fPe7iImfaPqSso01mc0ECx5k6tyuli7mhBNNgIw8Oy5/pft5A==
X-Received: by 2002:a05:6214:2a84:b0:4ac:b81a:53f5 with SMTP id jr4-20020a0562142a8400b004acb81a53f5mr14326564qvb.33.1663588870891;
        Mon, 19 Sep 2022 05:01:10 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id bi4-20020a05620a318400b006ceda7a9283sm5457394qkb.48.2022.09.19.05.01.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 05:01:10 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3454e58fe53so336775247b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 05:01:10 -0700 (PDT)
X-Received: by 2002:a81:8d3:0:b0:34d:1215:fb4b with SMTP id
 202-20020a8108d3000000b0034d1215fb4bmr1412754ywi.383.1663588870158; Mon, 19
 Sep 2022 05:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662715538.git.geert+renesas@glider.be> <81176a5e12a5828cdcdd4b107d0b2e5970232c31.1662715538.git.geert+renesas@glider.be>
In-Reply-To: <81176a5e12a5828cdcdd4b107d0b2e5970232c31.1662715538.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Sep 2022 14:00:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhVNqbKUiKt4aYpDhHaG-XMOi3rXSkJO7Ggjy6FY=OTQ@mail.gmail.com>
Message-ID: <CAMuHMdWhVNqbKUiKt4aYpDhHaG-XMOi3rXSkJO7Ggjy6FY=OTQ@mail.gmail.com>
Subject: Re: [PATCH 09/14] arm64: dts: renesas: r8a779f0: Add GPIO nodes
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
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

s/r8a779f0/r8a779g0/ in the online summary, obviously.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
