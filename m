Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848E920AF49
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 11:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgFZJ6n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 05:58:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38643 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgFZJ6m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 05:58:42 -0400
Received: by mail-ot1-f66.google.com with SMTP id 64so8077880oti.5;
        Fri, 26 Jun 2020 02:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2dqcwXTdyOJAFVvkqHrRHyY1o/I4KrR4eUDymmwSkA=;
        b=HLkuc+2j9EcYcjRBflVwOSdSJo0EPSb1rOy2KiiSM6KQNnRENndSASWtaVWINRlovW
         ZErHl+7juS00Xc77/dIirSyU1FDiAO5o7q2SAyucM5+WsfPE/u7evsqWHjRA9k5PDgO9
         C3EGfH9YeVND9jz/WRFkcn9Qmp2WWpzHuAG99JdDqf477plyBXyx91sNsl06VUggHtVV
         6o+7EUFmvYnAysl9ZQxVqJIUw7Ki5epxHbT873DJOEsNhiyc8M/0GzODg7iDhkFvZHGD
         uItxdxnin3O6tbcSM21/ksr5Gs5DriNFUZqJLPljeMR44oBudHpqDuAtGRFY/sbwQQK5
         E7BQ==
X-Gm-Message-State: AOAM530WNjCd65mR5tIiRfkJBXHpwiRudx9T1eTcYYHxCcp9SbAx84OC
        SoP0ILThw0H9durxMXh1+GkS41nIbB/BrHKe7E4=
X-Google-Smtp-Source: ABdhPJy2mJyJ72REVvD0ZwWCNMyRQAYZeawpbyg+bPbm81IWgnDp+gA1PIi22cZ3RKxCTxZSNukTskI2qqvQ2O4VQIQ=
X-Received: by 2002:a4a:db4b:: with SMTP id 11mr1707518oot.11.1593165521783;
 Fri, 26 Jun 2020 02:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1593004330-5039-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Jun 2020 11:58:30 +0200
Message-ID: <CAMuHMdVAnmE6d3cc7ejnOZuFTZbPgavB3rpTZ0R6H-SQjw4COA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Add support for HiHope RZ/G2M[N] Rev.3.0/4.0
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Jun 24, 2020 at 3:12 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch series adds supports for HiHope RZ/G2M[N] Rev.3.0/4.0
> boards.
>
> Patches are based on top of renesas-arm-dt-for-v5.9 branch [1].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
>
> Changes for v2:
> * Added Reviewed-by tag from Geert
> * Renamed hihope-common-rev2.dtsi to hihope-rev2.dtsi
> * Added comment wrt SW43 in r8a774a1-hihope-rzg2m-rev2-ex.dts
> * Renamed hihope-common-rev4.dtsi to hihope-rev4.dtsi
> * LED node names in hihope-common.dtsi are updated according to Rev.4.0
> * Removed extra line from patch 10/11

Thanks, queued in renesas-devel for v5.9, with the old hihope-common-rev*
references updated.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
