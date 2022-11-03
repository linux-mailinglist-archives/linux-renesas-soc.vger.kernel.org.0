Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86688618090
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 16:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbiKCPHh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 11:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiKCPHN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 11:07:13 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351831ADAB
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 08:04:45 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id q9so1864924pfg.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Nov 2022 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5SX8S1GoqbnGutA7INzRoyQfzD7Efc9HM+BPmRWtUQ=;
        b=jJiOqWM0NMptNv3BNBY/lAWtQ+JFPO0Uf71TRdXOIwP4IjjTYrClPkItlaG+o1Dpkc
         oU7/Toemr8NflzwrL5RLcweQqEupjnzTvXnGV/Gre/Zb9Ku7QK8hOt4P9T2JxH5KymWo
         O2ZdAmF6IoZc1ZaD5sIcaPHWn05dVAMXmsTLq+hrJwHSW161GEBn6utiy/DwBJY/g10P
         ETHtG7Ls+eI7r4Ag/d7ugMwBI4eQZllss0CaXjOiUco+LF3itDZAi/u/eF9+AO+/5Av9
         qXjuIXYpoaALQDBKXLD/z31PltwvsrcRv1YxIPK3PtRCi1jPcApLL4oDGALyFHGHkDuu
         7UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5SX8S1GoqbnGutA7INzRoyQfzD7Efc9HM+BPmRWtUQ=;
        b=yxe1zlmrvqCYJqpxmDDuMu/QiYchLBXC2AdDuiSCGloaaUVjx/OvGVUGetN1fzIjgP
         r1dkimjHLfs1WnfsSQveqCE4cT4dtktXnNnkBD6ry8wjhmBNgRSizqr6eWFMUYwIQ4tW
         HGyTwtalZEP+C7M8v4JKGuL7bQhhq5jlBilPlGDbZ7qV5IvJRwsXIj5ZE5SOgtDjzoTe
         W3c6qkcOfPQ5qjJCSzMI9ySFS4d36Px5Zy5yIW4S+kFbMdcapjyHeNFgsRQ+HRBGPqxG
         ogT+FuC3NAvLkQSHVMgWECdnHJoGIp/7HdtecTxNdvlCar314LZ0Q8219qH+3vVXUPSW
         049A==
X-Gm-Message-State: ACrzQf1jBrDyDqC2aiLMPJiDWcUnejjvtkwak5jIq/ArKt84cOgXcLop
        RCp59EemwLpXcLZZHxM9JbhKadaykgbqy9emDnCuP/wpyn8=
X-Google-Smtp-Source: AMsMyM4cbJucyEqLbWDZpIyLnaLE+WJJU1EjZS+YPC+DzcUIWaiTUDs71Ng+lyG577vLJRbeIcvD+n9TMaqO/rQIAbE=
X-Received: by 2002:a63:1345:0:b0:470:30c2:8b0b with SMTP id
 5-20020a631345000000b0047030c28b0bmr973457pgt.434.1667487884662; Thu, 03 Nov
 2022 08:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqA1RtcaGMCQgDsKKju4izHWJRAD12SqqirNm+TWLt_hA@mail.gmail.com> <Y2LBiOqomYJ2E/Gd@shikoro>
In-Reply-To: <Y2LBiOqomYJ2E/Gd@shikoro>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Nov 2022 16:04:08 +0100
Message-ID: <CAPDyKFr1UR3QX4X45TmShADDpOEuxnadcvyTGaXLhcxKrAxbow@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] mmc: renesas_sdhi: add support for DMA end irqs
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 2 Nov 2022 at 20:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> > The tmio/sdhi core still relies on using tasklets. I think we should
> > strive to move away from tasklets for all mmc host drivers and to use
> > threaded irqs instead.
>
> Ooookay, noted. I'll put it on my todo-list. But frankly, I can't give
> this priority for a while :/ SDHI is used on a lot of platforms, even on
> different architectures. Regression testing will be a big one here.
>
> > That said, I am worried that it might be harder to move away from
> > tasklets beyond $subject series, for tmio/sdhi, but I might be wrong?
> > So, I am wondering if it perhaps would be better to make that
> > modernization/conversion as the first step instead?
>
> As said above, I can't do this in the foreseeable future. However, this
> series fixes an issue we see. So, my vote goes for applying this now.
> Even if it costs some extra cycles on the tasklet-removal-work.
>
> D'accord?

Sure, I am fine with applying this. I just wanted to point out my long
term thoughts around using the tasklets.

Do you intend to send a new version to drop the RFC? Or can I apply as is?

Kind regards
Uffe
