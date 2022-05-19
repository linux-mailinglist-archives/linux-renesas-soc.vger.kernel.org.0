Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B70952CFCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 11:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbiESJxU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 05:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236362AbiESJxL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 05:53:11 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB667CDE4;
        Thu, 19 May 2022 02:53:10 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id x7so1212025qta.6;
        Thu, 19 May 2022 02:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knURI838kV0gW0T18lbKAQB7YX0AsEWGeq3j/fSxHRc=;
        b=crhu1rRl273Y2eaZZvu28nzZk4ZK/fvom2CxozdLEW2xZnXwGNuXm8MQn4hyQg4eOW
         vl1xx02candE9sFEM4cCJYKVos6GVVhrFBRw8eCaWGG0Hiu8fHSfv2KivukvClpB5C4d
         VNexvdQTpMiw3zh5+N1yOtYPpFaa+QZ0zohK9ZtsmNYjQV/5ARqI310cTeaOpuAy77GK
         6O5cLro91qEfu5/fHpkxHHgaBgEJi2NA6Qd9eAd3uKmcf/JY23Jiz0alsa3tQUDfUW9n
         12q35BFH8sanNNCHnxwh96dyGrgjUoP8qJXiPSPXhyq0QTMZx2t1LdNRLaVMbk9yPAMv
         58yg==
X-Gm-Message-State: AOAM533HUNwUi+cFeM62fT72gsINcp2x+btATLithhZ5nZ6Yi7v3t17X
        WnP9+8kjx2dWIwvGE47Lyz857RCmrwCrOA==
X-Google-Smtp-Source: ABdhPJzPkz6FbOGHatKP+IsBabha81csFF4HbAvZ36f4HP8GOtbJTI/V+s3TT4FQx6mVTLW6zqsYJg==
X-Received: by 2002:a05:622a:15c6:b0:2f9:5a7:cbb8 with SMTP id d6-20020a05622a15c600b002f905a7cbb8mr3077841qty.369.1652953989371;
        Thu, 19 May 2022 02:53:09 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 14-20020a37080e000000b006a32bf19502sm973137qki.60.2022.05.19.02.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:53:08 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2f16645872fso51249097b3.4;
        Thu, 19 May 2022 02:53:08 -0700 (PDT)
X-Received: by 2002:a0d:f002:0:b0:2fe:cfba:d597 with SMTP id
 z2-20020a0df002000000b002fecfbad597mr3695400ywe.502.1652953988137; Thu, 19
 May 2022 02:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220518135208.39885-1-phil.edworthy@renesas.com>
In-Reply-To: <20220518135208.39885-1-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 11:52:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvZfMucwEde-NDL5mxS61kQCjTtQP9cQTC9VmvGOLucw@mail.gmail.com>
Message-ID: <CAMuHMdUvZfMucwEde-NDL5mxS61kQCjTtQP9cQTC9VmvGOLucw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g011: Add PFC clock and reset entries
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 18, 2022 at 3:52 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add PFC clock/reset entries to CPG driver.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
