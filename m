Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9524B0DFD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Feb 2022 13:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241861AbiBJM7X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Feb 2022 07:59:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbiBJM7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Feb 2022 07:59:23 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811811015;
        Thu, 10 Feb 2022 04:59:24 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id g15so2939290uap.11;
        Thu, 10 Feb 2022 04:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4zb7o5Y7Pcwv8ufIfE7tm64mnQ1yV0mw8jO1XtBhS78=;
        b=EmfAvWSTqOmiv9Lrzfa766JgCdijk4ZqDZeUxuZHGal00/nQCHx73BnUg5rr76kAgP
         043pSfoDan3RmqrqMu2InIK+SMnQfTalrUVmAfQzDPjKwApFPbvSoej2vCACBZQfRd7u
         /MtjzjWqD2Ne7lmxKQS591eo4yiMHDwk0AbkbLFbNyPGoqdVuGG0wjcV2rI465woEW0J
         jIsz+xG2jddIYsZ2ZXQY0ykMpBwqmtpk8sYtC4zaew3wwq4uX8/ecTIoU60xzzVvg5Bp
         g7p8VDcHXGTYmTlEwJQch9UQExav4bFoYrFlZbZqDSZ175uabL+wQwVVkPFdZFO87JOA
         3y2w==
X-Gm-Message-State: AOAM533QrgjjaICZNm6qmlR2y0IrE/IPRvzS9ozVdbBa0iji32CdZjjJ
        4tb28gUahnqA2wy1MzQcrR9ZaSRIYQeW1Q==
X-Google-Smtp-Source: ABdhPJxLVtQbO2gTHdJd3FfGhIUdXKXck8wBiDgPutdQR8cW++vvcVYt8UQngy2lFaWwYRYn3o98Vw==
X-Received: by 2002:ab0:3045:: with SMTP id x5mr2418945ual.17.1644497963534;
        Thu, 10 Feb 2022 04:59:23 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id r26sm1625555uaw.12.2022.02.10.04.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 04:59:23 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id u77so2946493uau.6;
        Thu, 10 Feb 2022 04:59:23 -0800 (PST)
X-Received: by 2002:ab0:384c:: with SMTP id h12mr2370963uaw.122.1644497962858;
 Thu, 10 Feb 2022 04:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20220209203411.22332-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220209203411.22332-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Feb 2022 13:59:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv0-Dr6BMyBZTai-SPumQW6iEGzM8qtO-3_=ECmU6gOA@mail.gmail.com>
Message-ID: <CAMuHMdVv0-Dr6BMyBZTai-SPumQW6iEGzM8qtO-3_=ECmU6gOA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Use shared array for resets
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

On Wed, Feb 9, 2022 at 9:34 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Instead of split resets in common and drp, but using a shared array,
> we can still separate RZ/G2L and RZ/V2L by setting .num_resets to
> the 'highest reset number + 1' for the specific SoC.
>
> This patch uses shared array and sets .num_resets to the
> 'highest reset number + 1' for RZ/G2L and RZ/V2L SoC.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will fold into commit 9b90413c0524fc40 ("clk: renesas: rzg2l-cpg:
Add support for RZ/V2L SoC") in renesas-clk-for-v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
