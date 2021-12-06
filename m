Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C45C46970A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 14:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244508AbhLFNeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 08:34:01 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:46606 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244021AbhLFNdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 08:33:55 -0500
Received: by mail-ua1-f53.google.com with SMTP id 30so901487uag.13;
        Mon, 06 Dec 2021 05:30:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gZ7XbAA0e9TFYtAk7l2XzyZx3kK4we/eIgTQkb/6fZc=;
        b=Iv5nUPUDmqsU1lKOj9OxqOthBBuwjxt2OsGwDSLMt93U0xbBHVl1fNw6TqxqBZhSNH
         eAgHZzZdMsMiPLlW1eL1gxbKO5IM+I/1KUkDQNaBnmKDaUxFslfrvg6Vx52wrM8M4h9a
         cALEc2fHRYJbv4kSvOkk9WMuqLacQVlhO8gHRvgh4QMON/UWI2oQycLW1q0WDoxj82jJ
         yLV2EsN7igZU1gEd4Jk3gvdDHllUnMvwz7Dsq5SBHi4jRfIXMNBFTlg0fjmPCeQBIW07
         EpYSGbMo9iAQNxxyyteWzYWMuY13x/btqrpBB8zzAfjlqvhO0xMdkOIcp7RhkiMhFjiu
         AYBg==
X-Gm-Message-State: AOAM530EIWdsSq/r26AHXhtUxVMnztp0QHk5a2lqXlPvMCQudE+009Gc
        Cbn6HQEY35lNkanM0GJHfu30yi9c2++tXw==
X-Google-Smtp-Source: ABdhPJxz0XkPmFCZJQKGEwTosH1zqbln6bqXlrLk1sAoVfuYsaT4gHh0OWuG2YarYTfgU4XbaRDnkg==
X-Received: by 2002:ab0:4868:: with SMTP id c37mr40664941uad.33.1638797425196;
        Mon, 06 Dec 2021 05:30:25 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id j15sm4165454vsp.8.2021.12.06.05.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:30:25 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id i6so19478238uae.6;
        Mon, 06 Dec 2021 05:30:25 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id f9mr35981830vst.68.1638797423928;
 Mon, 06 Dec 2021 05:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com> <20211203115154.31864-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211203115154.31864-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 14:30:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQJ-AtrNZYe2MaOfqL+7RShXRcOXBfwkjuaWkikj3tJg@mail.gmail.com>
Message-ID: <CAMuHMdVQJ-AtrNZYe2MaOfqL+7RShXRcOXBfwkjuaWkikj3tJg@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a07g044: Add Mali-G31 GPU node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 3, 2021 at 12:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add Mali-G31 GPU node to SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
