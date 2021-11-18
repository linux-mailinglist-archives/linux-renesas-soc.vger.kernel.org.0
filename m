Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D699A455954
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 11:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245743AbhKRKsn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 05:48:43 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:45824 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245739AbhKRKsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 05:48:40 -0500
Received: by mail-ua1-f48.google.com with SMTP id ay21so12549687uab.12;
        Thu, 18 Nov 2021 02:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwyfX5QkyNDSWX36XR0Y1Qjb5iKXqQUatmee83MHCms=;
        b=xZJiZwGcL7/yWrlfivPnjU8toZ5Nsj0/w15QnmFkNT/OEQulw32xYMsathzaWcDoHs
         e4ZTm34uZOzoOiKAnKoZ7YtD1acwYdUm+fdD+pJz6kTbU/6TKsNOtAbbMw90/6eRnoxO
         RMlxzu0YvdSGBf+e4B4X7aE2kSRsj8zksjackbGSynYj8U8/S20Wa8se+3s+buXTkz1U
         VfJMWzY8Cb11syGG8rux/C5LuUSN2c7GuKSHUZkGhfmFvG3CTFsn1PS4vHao4b5ki3A0
         hcbi0laRl7iiHbWjj3QP2ki8ULqWphmwTx6KcspWVILxcYlmM16zzmhbZM5VfawuMLRW
         vw5A==
X-Gm-Message-State: AOAM530L5tL/nLy++Xy3H5FnDCS3yA/0Y4B3i3gnrnyQ+Z/HyS5aSWJr
        q38YWbuQnTtq54YT9rGJOylRORz4BPgJzg==
X-Google-Smtp-Source: ABdhPJxr0zWs9RTMUFw41O4RBBVXHPS0QhFk/ylplmXQJKiGkvOZ78hfi+LwGUitPqHVh3oLGNUsxA==
X-Received: by 2002:ab0:5ad1:: with SMTP id x17mr34702915uae.13.1637232339797;
        Thu, 18 Nov 2021 02:45:39 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id t132sm1393384vkb.19.2021.11.18.02.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 02:45:39 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id t127so3471643vke.13;
        Thu, 18 Nov 2021 02:45:39 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr102191127vko.7.1637232338840;
 Thu, 18 Nov 2021 02:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20211110084232.652-1-biju.das.jz@bp.renesas.com> <20211110084232.652-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110084232.652-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 11:45:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXj5vwo4694v_uPo+J4knhE2oboWs+RG7D2SFCtE8rWmw@mail.gmail.com>
Message-ID: <CAMuHMdXj5vwo4694v_uPo+J4knhE2oboWs+RG7D2SFCtE8rWmw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc-som: Enable OSTM
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Wed, Nov 10, 2021 at 9:42 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable OSTM{1, 2} interfaces on RZ/G2L SMARC EVK.
> OSTM0 is reserved for TF-A.
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
