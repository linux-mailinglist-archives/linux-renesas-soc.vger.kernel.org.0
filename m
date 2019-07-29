Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6F29788D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 11:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfG2JuO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 05:50:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46869 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfG2JuN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 05:50:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id z1so61064824wru.13;
        Mon, 29 Jul 2019 02:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ybJ7P05K53NX7FKc/5oYAFDyVwoukuxNSWJd3L/Xwdo=;
        b=Z03/+5Sty5w8S9pmwS1pjVOvaits+8IcnlnVX8jWUElzugjZNrgSm2sEQgt6K1XSUF
         wbHz2q6oQBb9k74+v6Mq1MBH7K075SVqTgMnZes1c1z1FC27AUrGvMMePZwHWRyxnZaL
         DmKf+uVxNp6GIaNGbhK2QF1CPM/ULw8f6ug9PEfNxgPaLVxIWdF3bFqCCuV1LiwQyjCH
         t2CgbZtD58faimjQ9/2bodIej8QwYrHlur89gA/fYUxaNzGMa2U5tIJq/lcy3EQaHPPT
         aUpc5Z0IWanf+5dlYdjvNHxBCBn5G0gVnXH90YrBt4+RwZFolwxpzCaM0tJKTRouatqC
         jy/Q==
X-Gm-Message-State: APjAAAUqYfAi9mrwc+c0g1453qg54aRDmOniAzgbSceaaVytP+tY5j9G
        NUh9GnGxzVCWj5Tmb2XtryfpTJ/MCS4GR5vQ70s=
X-Google-Smtp-Source: APXvYqydWdciQhxcH+vguMadU3e/QMGpFs8E7ayB0642ju9nV7ioyOwZXklB1RPcn6w20A+8P+fjCDuTdw6IfWso4Cg=
X-Received: by 2002:a5d:630c:: with SMTP id i12mr31548467wru.312.1564393811759;
 Mon, 29 Jul 2019 02:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561723979.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1561723979.git.mchehab+samsung@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 11:50:00 +0200
Message-ID: <CAMuHMdVRaaU-r48uhLH6-KH8yYnCSY8X_XJLuPuUTWGuy4_82g@mail.gmail.com>
Subject: Re: [PATCH 00/43] Convert doc files to ReST
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mauro,

On Fri, Jun 28, 2019 at 2:25 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> This patchset contains the patches that weren't merged yet from
> part 2 and 3 of the previous ReST conversion patchset.
>
> This is based aganst linux-next (next-20190627), so they may not
> apply cleanly at docs-next.
>
> It does contain file renames, but, except for a few exceptions, the files
> are kept where they are.
>
> The first patches on this series were agreed to be merged via subsystem's
> tree, but, as they didn't appear at -next, I'm recending as a gentile
> ping.

[...]

>  .../arm/{SH-Mobile => sh-mobile}/.gitignore   |    0

I guess that should have been "shmobile^H^H^H^H^H^H^H^Hrenesas",
for consistency with modern naming?
For whatever it's worth keeping empty subdirectories, of course,
containing just an obsolete .gitignore file...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
