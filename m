Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46DA44E938
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 15:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235086AbhKLOzE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 09:55:04 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:41844 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbhKLOzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 09:55:03 -0500
Received: by mail-ua1-f51.google.com with SMTP id p37so17629256uae.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Nov 2021 06:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xuhoE7N/U4bYu+0VzWCon6TR70UWXKzTzf28EYhc9p0=;
        b=APTJVuVH+IQ8E8E7LI4IVN/PYZc/9sJzt4OvFO73LsjrgOHduIb9YaxRY84isaNM9K
         M0STmd69JalRR4CzbDxEzjZdQPF8rdV/vylFjHfiqyFisCz+45Jf2ZFF34UQiCFvvQX1
         QSltuMAIVDZCXj9SzCq4zoHcXENNZjx3knlqFNz/Jozuw0q78b/snB8EuFafpjXXhFU7
         w7E5Xwwp7LHUjbKKzYiUmxxAFbblYIcFCIuoSsF+mbli3zTqP239/7s8/unlhTSlOYVS
         UYDrId6XA/0GZbrtT3U+8Zhep2yLez1haugxBKMVFLeUDsYULrf48HH1gIRDsSFIP5DJ
         aA/g==
X-Gm-Message-State: AOAM532H+1f3IvJITQbYNjaZWJqSIhbg/oAzXQLhgkJLn3kkMbHHwp2G
        YnZ3ONjQwH4vRoM9/6cRBFiC4/xMOkkMng==
X-Google-Smtp-Source: ABdhPJz2RoAvybJy/Xso+8NlfjthU5Dfn+qt9HZFyYVFVSot4Ep0+y7Gzo0VikexQXTpKIL5U++jNA==
X-Received: by 2002:a05:6102:cd3:: with SMTP id g19mr11211736vst.14.1636728732341;
        Fri, 12 Nov 2021 06:52:12 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id t20sm4466119vsj.27.2021.11.12.06.52.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:52:12 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id e10so19397827uab.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Nov 2021 06:52:11 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr10802173vsl.35.1636728731721;
 Fri, 12 Nov 2021 06:52:11 -0800 (PST)
MIME-Version: 1.0
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com> <20211110153142.3451-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110153142.3451-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 15:52:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrm6hXaG9eF5g39fVb7j_JJdQCZ2HR_62CatuZLdGasw@mail.gmail.com>
Message-ID: <CAMuHMdWrm6hXaG9eF5g39fVb7j_JJdQCZ2HR_62CatuZLdGasw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] reset: Add of_reset_control_get_optional_exclusive()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 4:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add optional variant of of_reset_control_get_exclusive(). If the
> requested reset is not specified in the device tree, this function
> returns NULL instead of an error.
>
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
