Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDA139A229
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 15:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhFCN3P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 09:29:15 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:33705 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhFCN3P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 09:29:15 -0400
Received: by mail-ua1-f44.google.com with SMTP id l12so3323080uai.0;
        Thu, 03 Jun 2021 06:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nrfOmrylxXowFyXcIKu7oqcvEz+vDkg+DdiDg40cfGc=;
        b=AS4ICXWXZE3ty7hLGWqZz/W943S2ri93o7/VDp5IWCHjl7E6Q0XOSf14tJClOGnFJk
         m+uk1sFrROeODzsimhCXXCTK7etk61Thk9O4YA7lUvFw67mk2rdyBiAtG0FAoHxIap3l
         0hicYNvRu9p3kbTJLygT1GT7Ix8Zj/WHR4GKrLxKjLJeDD4f9hco5JPZFRtoIreT9W58
         ziKhPAtTYtjjR4hRqrF6SPWrsSqqGYj4q9w9OC+8+xO2tOW8jST+Hwc32bhAaM+zfmzZ
         fPRAEEdZoinpEOrnbu4PejEvgn1EVqwD07H9VexXyK7M2+0N/n3USjqbrTimzRnrwYZa
         xwSQ==
X-Gm-Message-State: AOAM533AIOLZaZpt2qqGukGHrA2dnhr9dQiO7zAIwR/C5LhoT/SRok9I
        SD4KtKXuQaNCY83ZeqqanxP814P9MkIurNm/GCw=
X-Google-Smtp-Source: ABdhPJzf1KgvXV1hDDtLEC4jgKk1VyATYHPm9VWeUjdDzdNaT4jlc3PuCBnlYC2EIiX9YGZ/TB4JEyYjY/YD+N5YJnE=
X-Received: by 2002:ab0:100f:: with SMTP id f15mr25846649uab.100.1622726835599;
 Thu, 03 Jun 2021 06:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210603125841.27436-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210603125841.27436-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Jun 2021 15:27:04 +0200
Message-ID: <CAMuHMdVLzzK-hsaEO4mEkOeCnzKuXgORanB+GGnHZjonwQAD9w@mail.gmail.com>
Subject: Re: [PATCH] docs: fault-injection: fix non-working usage of negative values
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Jun 3, 2021 at 2:59 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Fault injection uses debugfs in a way that the provided values via sysfs
> are interpreted as u64. Providing negative numbers results in an error:
>
> /sys/kernel/debug/fail_function# echo -1 > times
> sh: write error: Invalid argument

Interesting...

> Update the docs and examples to use "printf %#x <val>" in these cases.
> For "retval", reword the paragraph a little and fix a typo.

Presumably this is something that used to work, but was broken (not
so) recently.  Perhaps the code should be fixed instead?

The code uses debugfs_create_atomic_t(), and atomic_t is signed, so
I'd expect negative numbers to work.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
