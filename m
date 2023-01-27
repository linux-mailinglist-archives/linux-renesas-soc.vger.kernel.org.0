Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1DAF67E6F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 14:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbjA0NmJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 08:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbjA0NmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 08:42:08 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85DDD7BE58
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 05:42:05 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id h10so3888168qvq.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 05:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvkU0p3DsRu20iRZow8EXa4Q+lUB8BPxg75IIQ6tGNA=;
        b=Wx/FlGF6u5ohUWA1KkrlFPqg1a3H9/EAAxgWdDzoYeEXVUkU7nxr/5naqWx99Qs4mr
         jU/0PB8TWjA8qEDXM0wL3C5RTjL0A+UKN3DVpx/vMKJB96J98UBSsLsuGtIQ64bvzlZb
         K1OglLNnFLO6WypjT1fwy15F7gEk0iJqq/Go4VOE9phIIBTiSNeFeKz+JKvAvuNESS7d
         NaLBVEzQf01PWxmPpjcZToaJSwMR3n3rfM1SdBdLWJgVPenWINa6eCUAtLTQkXVxodJh
         tovBUzBz/PnS+q1mrgh5wBVg48xfadOjK51s4AqE7ItNYSUvAuiF/syWb0wZJ/5YTKwZ
         ea1A==
X-Gm-Message-State: AO0yUKU+muJ/PwCroRu7lYMb8qSYt6yWZMRMqtcHe24RtRTTHQTfheVg
        gUGqZtESVXyeBhUF85yIGu3ZGhvmfONYsQ==
X-Google-Smtp-Source: AK7set80Ibwup0uGxNfP4tPbYtHVNGZEgVQAH793n86OiON+Mp4wUysVGupr34P1iyr8XYn0VVU6Rw==
X-Received: by 2002:a05:6214:19c8:b0:538:aa33:e1c5 with SMTP id j8-20020a05621419c800b00538aa33e1c5mr5318550qvc.25.1674826923690;
        Fri, 27 Jan 2023 05:42:03 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id x124-20020a379582000000b006cbc00db595sm2878163qkd.23.2023.01.27.05.42.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:42:03 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 123so5992424ybv.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 05:42:02 -0800 (PST)
X-Received: by 2002:a25:e650:0:b0:80b:8b72:39fc with SMTP id
 d77-20020a25e650000000b0080b8b7239fcmr1103029ybh.202.1674826922754; Fri, 27
 Jan 2023 05:42:02 -0800 (PST)
MIME-Version: 1.0
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com> <87wn5at4v6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wn5at4v6.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Jan 2023 14:41:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU61woG7rer0buo0uLVV9obaDiWdhQ9K9awVLwwLawukw@mail.gmail.com>
Message-ID: <CAMuHMdU61woG7rer0buo0uLVV9obaDiWdhQ9K9awVLwwLawukw@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: renesas: r8a779g0: Add Audio Clock support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 26, 2023 at 3:19 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Linh Phung <linh.phung.jy@renesas.com>
>
> This patch adds Audio Clock pins, groups, and functions
> to r8a779g0 SoC.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
