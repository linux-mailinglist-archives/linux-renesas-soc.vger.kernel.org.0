Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3272678F1FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 19:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240198AbjHaRcy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 13:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjHaRcv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 13:32:51 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBCDE5F;
        Thu, 31 Aug 2023 10:32:48 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-58dce1f42d6so31023507b3.0;
        Thu, 31 Aug 2023 10:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693503167; x=1694107967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euRoGwF/bHtDRN49l+2MpHP1k9U7h0kuDLoOSY2LpqY=;
        b=BuiGCwF2JMijqg1zMcNncELXj6Wsx0wTMMPDfYnI5QBOzx26e1sIi2TBnedS1Dq8/O
         XIIaQCV4l37GEUtBJRae2w6lk8p5XW1k/A/BzdbljPPyKnFKOGqfbMm5qmXSi0tpIPKV
         tLx9rQM/14VALMwuOMsRQK0kor4R2HAU7XuAkv7PZWbg/ix+gdzFSh4HbQSYmG1TPaEw
         7i2LZsBSk/KCuMXZWV0MXh7itEmne2V+EJDGmOetNwNytw9LbZHoZc3fIb43V/75xXJ/
         qCPR812p29zf6bV7MueGhaX2AMXmbOyd0AA/dc5jAxDvcLIHSlh5xNOMuS81nkNQwIpa
         W3Mw==
X-Gm-Message-State: AOJu0Ywee9dEGVgaTQUGEFtdE3/NQH/KTY5i9el0e1pHOgUt/wsX1W5+
        iEZTcxedZRijlNmXfdetL4mIzESdSnFVXw==
X-Google-Smtp-Source: AGHT+IFdBAowU8HMXWMvouNMB5+63SOU6ZEcNevuslHb4qSEZYbrMBUDfdrsfysWvJxDM2PzojTQGQ==
X-Received: by 2002:a81:920d:0:b0:56d:4d1e:74ab with SMTP id j13-20020a81920d000000b0056d4d1e74abmr441840ywg.23.1693503167202;
        Thu, 31 Aug 2023 10:32:47 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id n6-20020a0de406000000b00573898fb12bsm552079ywe.82.2023.08.31.10.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 10:32:46 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d7830c5b20aso1416146276.0;
        Thu, 31 Aug 2023 10:32:46 -0700 (PDT)
X-Received: by 2002:a25:b389:0:b0:d7a:c85c:7254 with SMTP id
 m9-20020a25b389000000b00d7ac85c7254mr232645ybj.21.1693503166129; Thu, 31 Aug
 2023 10:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230831063635.2816-1-biju.das.jz@bp.renesas.com> <20230831063635.2816-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230831063635.2816-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Aug 2023 19:32:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhCSjKFF90xYPLtN08cm3EqCZA+K=+rjN=4EBKykiZRg@mail.gmail.com>
Message-ID: <CAMuHMdUhCSjKFF90xYPLtN08cm3EqCZA+K=+rjN=4EBKykiZRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit
 tx support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Thu, Aug 31, 2023 at 8:36 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable 4-bit tx support for sbc node.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
