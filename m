Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0910493C93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 16:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242058AbiASPF6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 10:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344861AbiASPF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 10:05:58 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D60C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 07:05:57 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id h14so8201501ybe.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 07:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cl+ba2diZH9Um9oyjcI0fXoiDNjlLLDjYLyby45qgT4=;
        b=oB9YXj8LKr0x818ikZ1awuUMpXyvLoNVmb/qB2wVWWtV7CKv4a1D3mbwhxn1j4/C7Z
         Epsmacfdl+MVXfkLnfo15YD8X6iDftYPo7J3smFZ3mpK8M8zS3FvO+mQPMbl0Fl+pkB9
         MN3kjTerdntxJTgLzaR7slhGhlLqslztHavnGWoYROCTlK1DOMLNgfDIxnBZDRIotUG2
         MdW4uyfZHC2c1VB9BM3xYi0lphg/AdRHQkiDfChBM42i8EsleDpHjtbTxEXB31RQH2IR
         Vh5hSuKu9vc2ta00y1AyNcVlkzMmj2g0SyTpWMvIhgH55P69Elov34WE5bZF7yT1hKuw
         oIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cl+ba2diZH9Um9oyjcI0fXoiDNjlLLDjYLyby45qgT4=;
        b=VSCb7QWwQbX79o56EYkFok0AcxFNKC4HxaNbkcpgxfqO2FUy9llQzAcZJOAH11yV+o
         A7eaIecIi1RqzFJL8t+rs0AV9CN58cm56hDVx/F/qKtRzZNX//badZy6Blcz812dc0ck
         WfY3j+Vmlo4+vyjUUSr23p7ueuFxLkXaKB5JUQPnycwu0/rY9avdaScNyMzVZnUNaVKH
         bvFBQ87EWDtl6OrFgfxmyvdj1IGmsn3hXaKQCAVhZH8nd2CKF3wpQ0kUbEw8WE+k/mBW
         bO0TmqRgzOwP6flQKmTObO3l3NTp21inbz4fEQjUvQ/qbPsh+O050bPr81Pr1bLAJQi+
         imWw==
X-Gm-Message-State: AOAM5312LfQXyDuXPRNwBdrhwh/PWSeIuPDY8Dzk6KLMFQ35SkR+PbAS
        HrJ9c5ZBa9h5HxSMmLjeTUzDe10CrL0tdF0GeEAIkXU9hYA=
X-Google-Smtp-Source: ABdhPJz6jl+BDDjc3KpRdPZEp9N2m1nUnXU+IS8LCxHi/ibhH2MALAHUcoEOGuXiDETEfHKjeu3TdjEHgKzp6QZtjVc=
X-Received: by 2002:a25:d40c:: with SMTP id m12mr10412441ybf.669.1642604756961;
 Wed, 19 Jan 2022 07:05:56 -0800 (PST)
MIME-Version: 1.0
References: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <c085fb37-23b6-ceb8-422e-7143209ede6d@intel.com>
In-Reply-To: <c085fb37-23b6-ceb8-422e-7143209ede6d@intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 19 Jan 2022 15:05:31 +0000
Message-ID: <CA+V-a8u6HFb26Z5ettHKcFC+76ALuLtkd+M=1mAB-6LHCmBtjA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
To:     Cezary Rojewski <cezary.rojewski@intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Cezary,

On Wed, Jan 19, 2022 at 2:12 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2022-01-15 2:22 AM, Lad Prabhakar wrote:
> > Hi All,
> >
> > This patch series does code cleanup and fixes to the rz-ssi driver.
>
> Hello,
>
> Suggestion for the future contributions below. My input is *not* to be
> treated as a blocker for the series and is not a reason for re-sending it.
>
>
> Cover letter should provide a high-level view of the series. That
> includes but is not limited to the overall layout of the series. Here,
> it would be good to state why the fixes are made. Also, it is preferred
> to have the fixes leading the series, _before_ any cleanups.
>
> This summary suggests that cleanups are leading the series instead.
> Think of cover-letter as of news-paper. Subsystem maintainers such as
> Mark and Takashi start here (read the first page first) to get the
> general idea of what the contributor is sending them. Being transparent
> only helps. Good descriptions also helps reviewers to know which patches
> to look at first. Fixes are obviously of more importance as they usually
> address issues troubling users of the release-builds. Such patches are
> also often backported down the stream, increasing the importance for
> their review.
>
> There's more to it, but for the scope of this cover letter, this should
> suffice. It's just a suggestion but I hope you find it useful.
>
>
Thank you for the valuable input. I'll make a note of it and make sure
to add more information in cover letters too.

Cheers,
Prabhakar
