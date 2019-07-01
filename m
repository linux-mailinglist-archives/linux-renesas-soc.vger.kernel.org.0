Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B862A5B746
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2019 10:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfGAIyt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Jul 2019 04:54:49 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46604 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfGAIys (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Jul 2019 04:54:48 -0400
Received: by mail-oi1-f193.google.com with SMTP id 65so9304414oid.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Jul 2019 01:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urfia8XPAH03RKyF6ZpzMRZ5dod1q1tz1J39BLL7AM4=;
        b=UN58nJxGAhtWQU/W5Op4csqitauDjfbtCxwsaLWBnY37yWmcvcsbla4N9txDkoVhTL
         U5aSVq2l1nXKO5Z7r7Le9BwUMN54SFqXhJZF5YjDw4Kdd8wUncSpCMOuJDw18cpLGcdl
         bHRuM8TrIHhSPTLVF2W6NNqnrvs02A+UCmaqmVadMcGWqgeRKqTJffPF1PdjS4mxM8Rw
         GcLriSJGv5oFsQZ+89j4JBUXwHWs6/FuIP3UjVKZvkgUP9l1LzeKH2CLeikNrjwqJC9K
         YC3wGy0FQrXp4/nLsWGi+rvGMJjTCbf5HpLXiQJUDU/ZIYCuSl6AzyX7XA4ASBfomuat
         fQxA==
X-Gm-Message-State: APjAAAWH4suC/FNEhqBJedWJyJyYGLwW7zxjaqXyxG3xaHbrW1MYr/Fb
        rlV/Zi/Z/7HMG4eRO45KRtKegH5hWR2ySCFQCLU9hqDd
X-Google-Smtp-Source: APXvYqyhyqaElJACtSyUVCUMrJSnTjYc6k2rrsThoaUM5XCLKcay4aH5C7K7K8RyKucLr/qrQjsP4ioLQ9kkgMgCap8=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr6055146oie.102.1561971288091;
 Mon, 01 Jul 2019 01:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190628175144.GA1043@ninjato>
In-Reply-To: <20190628175144.GA1043@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Jul 2019 10:54:36 +0200
Message-ID: <CAMuHMdWLhRwdcvR=Y1TnBuo+zzUJi-iV75_eGO+29wboU2i4Vw@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-manual-calib for renesas drivers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Jun 28, 2019 at 7:52 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> here is a topic branch for renesas-drivers. It was developed against
> mmc/next because there were some patches in there I needed. I know that
> -next branches are not good for renesas-drivers, so rebased to v5.2-rc6

It depends on (a) which subsystem, and (b) how stable it is.
mmc/next is included in renesas-drivers anyway, but Ulf sometimes likes
to rebase that branch.

> and cherry-picked what I needed. Further comments from the cover-letter:
>
> ===
>
> The patches were developed against mmc/next. However, the above branch
> is based on v5.2-rc6 with some cherry-picked patches from mmc/next, so
> Geert can consume it easier for his renesas-drivers branch. There are

Actually you made it more difficult for me, as you changed the mere
possibility of a conflict due to Ulf rebasing mmc/next, into a certainty
of your branch conflicting with mmc/next ;-)

Unfortunately, when merging renesas/topic/sdhi-manual-calib, git is not
smart enough to notice your cherry-picked changes to the files are
identical to the ones in mmc/next until commit 520902bb1ce63518 ("mmc:
tmio: Use dma_max_mapping_size() instead of a workaround"). I can work
around that by merging the aforementioned commit first (git is smart
enough to handle that case), followed by the merge of the remainder of
your topic branch.
Or I can handle the conflict manually...

> The following changes since commit 4b972a01a7da614b4796475f933094751a295a2f:
>
>   Linux 5.2-rc6 (2019-06-22 16:01:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-manual-calib
>
> for you to fetch changes up to a0b577d9d1154c48757da9a09c18056946832bd7:
>
>   DEBUG: mmc: renesas_sdhi: add debug to verify manual calibration fix (2019-06-28 13:44:45 +0200)

[...]

> I rebased the branch to v2 of the series. Diffs are very minor, so I
> hope you can deal with the old pull request for it?

No problem, it's the same branch name, so I will fetch the new version
(and I cannot compare with the old version ^-)

Summary: Thanks for your topic branch, I will include it in tomorrow's
release!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
