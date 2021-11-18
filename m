Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2E5455912
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 11:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245222AbhKRKeY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 05:34:24 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:41668 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245691AbhKRKdu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 05:33:50 -0500
Received: by mail-vk1-f182.google.com with SMTP id 188so513132vku.8;
        Thu, 18 Nov 2021 02:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJJOUrv2FDSzz/F4qnTuDfi/Fxwt6nD8cIvN15jOU7Y=;
        b=Vj47fRzImh6t5hHx1koImucg2KV3bR74+fBHDloaGsC/Y9pwJ9rCipjdBwddfmtE0i
         I9I+s3QieeL2AmqPBePduDDf1IH7bJYcNlT4g5eRbyWNLTdxv+qzv5smuhpkjo/euSRd
         ll3B0f/dTpcUkz9hf8K1Rklzeh0qvIBf06eyVwFsXZicBnoKNKPXiZIKla3jAT9Dr2sy
         FjKYmTIMV9X3ofBG8ETMB8LJNTeAN7UrB9TGu7msOv6+Oul63tWQ3ZO3UDMNybVqrmZ6
         bSDyPhKFPu7x5wrbkMeFd2RGa9CfYKKe8bHomNfY9ImSxO3OxWTQttNeseiF+y34ODGV
         u5RQ==
X-Gm-Message-State: AOAM533nJ1N/J2ASSc5ozzWabbUcqm3493+jHMfZSXvJlmo9bOtxgBTi
        Mh1aNU04XBje/ELMwQHGBYof8FLUqYirTA==
X-Google-Smtp-Source: ABdhPJx8dsyYayxFiWR/Sz5rb9RV5GETGb9KFssCc42wXLwWa9npANTA89nfGlUEwuZ4UwxO5Yt2Jw==
X-Received: by 2002:a05:6122:d05:: with SMTP id az5mr101499373vkb.9.1637231449891;
        Thu, 18 Nov 2021 02:30:49 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id s16sm1416410uag.14.2021.11.18.02.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 02:30:49 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id b17so12648124uas.0;
        Thu, 18 Nov 2021 02:30:49 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr34178842uaa.78.1637231449248;
 Thu, 18 Nov 2021 02:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20211112081003.15453-1-biju.das.jz@bp.renesas.com> <20211112081003.15453-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211112081003.15453-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 11:30:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9BqxF1_vPby50Cpn+afSirx=wJuN-=m88pp+BejcurQ@mail.gmail.com>
Message-ID: <CAMuHMdW9BqxF1_vPby50Cpn+afSirx=wJuN-=m88pp+BejcurQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clk: renesas: rzg2l: Add CPG_PL1_DDIV macro
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 12, 2021 at 9:10 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Core clock "I" is sourced from  CPG_PL1_DDIV which controls CPU
> frequency. Define CPG_PL1_DDIV, so that we can register it as a
> clock divider in later patch.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
