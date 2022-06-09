Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39828544669
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbiFIIvB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 04:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241991AbiFIIum (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 04:50:42 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3707F149AA0
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 01:48:48 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id l1so16133267qvh.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jun 2022 01:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=paum+hqZGo4LQqQDEJebOvfdhxw+L0Ahtq1lxMIPcGw=;
        b=7Ghd0oToh2TdA90Krwfg+M/yjNP2TMjOAYr7xQbGGHyjvOK54Zxw8vze4zDQNOLLqU
         O4lXk0buITqszF35M0ESI9p1u+Vgb0RRgnow0rwvDV+6nGh71Xd5AYU5qcADkG8KhF04
         aNYn+Muzg7BemyCQh/RHtz0UJjHdgNDYK87I50v+t8T+p5SC30daLTncpN+MjzOLOVON
         g4exM6Ak4fIOMJq5DtIM8VW/tDSwB75QgROJFxK8q8v99qcMD68hZHCRg6EuyjNcdyFk
         EFJtNwTiZDDtzo1u5Y1TXbScvFBDtugfHMtdQpOXPyHzLT55S5R95QSEfbwFgAY4w0Ug
         C6IA==
X-Gm-Message-State: AOAM532mOlS6HAgXrL0bx4jv8+hXvIVwMfW2F9cnw1ClZgd4v33FLl8P
        W0Ugpg8HBdiNX4c+a2+jIE+AilweAaSLWA==
X-Google-Smtp-Source: ABdhPJzBclN60jwC+28nTls5kQKETOCd2XkkmqiQ+KLX8Gmc4bRHvGl6gZj1kNJAz2oCYz2QYpiDjQ==
X-Received: by 2002:a05:6214:c6a:b0:464:68bb:c523 with SMTP id t10-20020a0562140c6a00b0046468bbc523mr33596585qvj.49.1654764527226;
        Thu, 09 Jun 2022 01:48:47 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id f6-20020ac84646000000b00304e9dc0fd5sm8886753qto.12.2022.06.09.01.48.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:48:46 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id v22so40645178ybd.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jun 2022 01:48:46 -0700 (PDT)
X-Received: by 2002:a25:7307:0:b0:65c:b98a:f592 with SMTP id
 o7-20020a257307000000b0065cb98af592mr38368067ybc.380.1654764526724; Thu, 09
 Jun 2022 01:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220603232940.21736-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220603232940.21736-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 10:48:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUn0ukTBYuo-Z=kj1Xy4AN95wTiwjQ0avdc2werfDZMbw@mail.gmail.com>
Message-ID: <CAMuHMdUn0ukTBYuo-Z=kj1Xy4AN95wTiwjQ0avdc2werfDZMbw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: use proper bool operator
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

Hi Wolfram,

On Mon, Jun 6, 2022 at 6:33 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When checking for defined macros, we want the boolean AND not the binary
> one.

Thanks for your patch!

While it works fine in this case (both are either 0 or 1), I agree
it's better to be consistent.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
