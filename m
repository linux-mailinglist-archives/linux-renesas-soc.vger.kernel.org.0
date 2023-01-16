Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF1A266BCBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 12:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjAPLU2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 06:20:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjAPLUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 06:20:14 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BAEC1E9DF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:20:13 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id e8so3398159qts.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9an6fz2/rDlYSlogJiemosT/Tmp+I3iMMQGhJeI6C10=;
        b=Run5yRC230m2ozcbZh6hvhsbwKkGFHkNOQEFRwyKIPGAcns1wEoEzIf5QHhlb7zr9M
         RAdygy5zYCOm5HlKXrWJYi6BlvHl+/pYS0fBAzEhqORnVZO2H/rFNPNMgWoixs9AF1LU
         Ma86ETx7iMZtmnZNoNGOqkHyRxfmGPv7TtMhl00j6yfYjTMC2B869xQN2i2z5xBJbpWX
         MQAovB4MK08GrIhtW7B0MhobcTc/Y2NfX18yenvUHSBa1EON0Avdt+N2TCr8GRDdYIil
         Kbcr7f6/Nqf5WWz+ON+DoV+DsjeaAGU1pp/XuXcbIlAfr6Z9wvcNMXtP3QfwI6onInJ+
         Q0dA==
X-Gm-Message-State: AFqh2kpel8IArHWRZk/dn/Sd9GKE4Xe+HMLO8JpZrpH88FW2RuAxix37
        tolwswjZHP/9ac+CKrtwi9OuxtoT+vU+MA==
X-Google-Smtp-Source: AMrXdXuBL1xe7UOHRL9aAlYU710d++5pyFUJgFmfezc7eJNMVvoGaxes6NhfAxITKQZakQShYLEqYQ==
X-Received: by 2002:ac8:4d99:0:b0:3a8:1f85:3ab5 with SMTP id a25-20020ac84d99000000b003a81f853ab5mr115073298qtw.11.1673868012298;
        Mon, 16 Jan 2023 03:20:12 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a16aa00b006cfc9846594sm8740290qkj.93.2023.01.16.03.20.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:20:12 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-4a263c4ddbaso376750307b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:20:11 -0800 (PST)
X-Received: by 2002:a0d:e8c2:0:b0:4e0:d096:7795 with SMTP id
 r185-20020a0de8c2000000b004e0d0967795mr1419024ywe.358.1673868011621; Mon, 16
 Jan 2023 03:20:11 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com> <878ri7i40u.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878ri7i40u.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:20:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNihsL-vOZim491MgVaE3ksiXtp+J6bdx=FQv5M0mjkw@mail.gmail.com>
Message-ID: <CAMuHMdXNihsL-vOZim491MgVaE3ksiXtp+J6bdx=FQv5M0mjkw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio
 Card dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 13, 2023 at 3:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> ALSA SoC has many type of Generic Audio Card driver (Simple Audio Card,
> Audio Graph Card, Audio Graph Card2), and Renesas/Kuninori Morimoto want
> to test these.
>
> Generic Audio Card driver had been requested on ALSA SoC.
> It has many type of device connection method, and historically,
> requested connection support range of generic driver have been
> upgraded.
>
> Upgrading connection support range itself was possible on generic
> driver, but could not implemented, because we need to keep compatibility
> on Device-Tree. This is one of the reason why we have many type of
> Generic Audio Card driver.
>
> ULCB/KF is good board to test these.
> Kuninori has been testing these Generic Audio Card driver by using his
> local patch to switching drivers. But it is good idea to upstream these
> from information sharing point of view, because DT setting is complex.
> It can be good sample for user. This patch is one of them.
>
> From normal user point of view who don't need to test the driver,
> it should keep as-is, nothing changed.
>
> This patch adds "Simle Audio Card" DT setting file for ULCB/KF.
> We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Link: https://lore.kernel.org/r/877cyupxg2.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
