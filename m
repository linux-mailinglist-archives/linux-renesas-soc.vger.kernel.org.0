Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FB449B4CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 14:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383735AbiAYNTH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 08:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1576139AbiAYNQ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 08:16:58 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EA4C061744
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 05:16:54 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id g14so61492951ybs.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 05:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dxDIleSdPjMpBpJXvMKmY50lGGT3wpsRBxESNq54YNc=;
        b=ZmGzS4P1j3E0P0teX4rYGr+O8/ol16n0HDJFBkPrTEI9UCFoa6IowESp9LbdF3+hVs
         RAeMeSIGWmvuBVAIB/PPCAsxnVj2tkZeBQyooBP0xCiJWY5s79Vj93bQVv1ue+SxLaFC
         nvcIRDmcOyZbjp2Hb3uIjf6/Q8QvNZRT9nqCe5I23tptZwIWNPqnsk4YmSf6Bc5hYfof
         60X0OCbpmeL+YRAmc4Ul5zpK6gpSXU9Xb5om7xpMO9dxFk3Gi48+YaxzyIqR0rLGVkHf
         F7VynZNliF2WM2OPaTBoIUEn93jxwPuVfUuo9ZiYN0s5RBUSP7y+Mwv8nTb+F4xcaAUY
         BaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dxDIleSdPjMpBpJXvMKmY50lGGT3wpsRBxESNq54YNc=;
        b=Amfopcf9S/kDDUiHMl9mp9R307+wIwIZb4NN2xvFisXYHWudHczRtIB7YBTitP0GXG
         pt+Na42aY7t3Ew6xQT30IeE5WP+WquIuwndYBIOeQYNNxJrKy/hdugQ5JDRoUznjU1SB
         Pja/8XZ4UvBU1dONzQb6RI7GAbCh+LhiErUaKYGUcDDv8dO31LUXcDdsaP8I85tajuky
         d1Q+1t2mjrbi2M5DsNHdaLWX53lfUsMXlYf2EAKLpjTMGbPVExT5WbjOtETiT+/gGyoz
         MuIpf1KnWJMKkANOYq+M/lUStouJyOaWjlgoEoqjEq1qw2Fkl+u2k/3v1j+Sb+hcS8T8
         eOMQ==
X-Gm-Message-State: AOAM530rJy94+SZkseSTQ32VkuYTWQv7ENUPsT97LJU+VU7C7X8xu6A9
        A+8Xqz1SPrubiiOWoVTanzQLgVSODsykjdsFthVDpQKY3Q4=
X-Google-Smtp-Source: ABdhPJx4fKXwpFfJBJvCsE9hVDM7PkEAN6XxTUwNmJIG01bR4d9MYvM/9qY3WC5WEsMS/X9CIFvUgj4mNwmD3iXpJ/k=
X-Received: by 2002:a25:d40c:: with SMTP id m12mr29118072ybf.669.1643116614040;
 Tue, 25 Jan 2022 05:16:54 -0800 (PST)
MIME-Version: 1.0
References: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <164310602822.74844.12177586903406990983.b4-ty@kernel.org>
 <CA+V-a8vooHnZqTvuq+qq5u+JLrSirj0vOYnfWXVFB19UhhRdAw@mail.gmail.com> <Ye/tS4CQe0FIl6/k@sirena.org.uk>
In-Reply-To: <Ye/tS4CQe0FIl6/k@sirena.org.uk>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 25 Jan 2022 13:16:28 +0000
Message-ID: <CA+V-a8vofffq7z2b2tbcBZMfRa6aX0V4soqg1h54r9qGMJMm=A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
To:     Mark Brown <broonie@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 25, 2022 at 12:30 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jan 25, 2022 at 12:25:32PM +0000, Lad, Prabhakar wrote:
>
> > It looks like you have applied v1 series instead of v2 to your next
> > [0] (v2 series [1]). And your comment on your patch 1/5 of not being
> > applying isn't true as you have already applied it ;).
> > You haven't applied patch 5/5 (this applies cleanly to your -next)
>
> Like I said, please resend.

Will do.

Cheers,
Prabhakar
