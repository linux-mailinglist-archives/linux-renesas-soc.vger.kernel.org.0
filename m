Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FA1401EEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 19:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242944AbhIFRLK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 13:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243723AbhIFRLK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 13:11:10 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F21C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Sep 2021 10:10:05 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s12so12376036ljg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Sep 2021 10:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=fCleQtbuJdHg+Nr280Yxdci6j06NCu83yvvFVNDw9ZY=;
        b=Af5MutCHbc6t6izDBTNWd27dgXM0dmNvp9qAzoeuRik8AJL1e7gXuaA/h/a9VU3hq6
         O9ssRGj4t8zgx5v9J6WuO2+/zca5Z9HwGRSfSTy4ygvdAiAFyFIex2bzo/Sw1GMhwd3P
         Z4gMjuPopj7hqESwMhAXK90+0aKlboxEoAIVOGuQyLHdsGYpXkUxdQVYDaWWr9nrwTg6
         d9/Ge4p/wdwSKFZ1WXfszzuIw2tdcjyW+ygW45HB9LvK4UyJZ4nbYAfFy8Of34GRzlGU
         K6dGaZ/5b1Nx3sWnRKx6wl5tBM66lfCMS6UMY9+bZWfYKkvqdo0pH6VB0fLXCYS9RNJr
         AuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=fCleQtbuJdHg+Nr280Yxdci6j06NCu83yvvFVNDw9ZY=;
        b=a7IMsu+J0uBkI0SN/YQtsu3rTePbvlpccqvJEqD1bQA1oXXMegI16GvT0ik5f+VeVE
         gCAhgbaozPiZEN4mYWbnx2SPKHel5RP4aRHSLpInMaEmssaat9n9+zBF3PGxRCHmEUwL
         czs73Ywmj227FT8sDt2gcFcu2SiiwsmZPBLFKKCMHYO9sNecXqFN4ondZqMf5VrW92W6
         CVcIi23wDVEQxyh+kGGT052WnCE0m8rEmDC0MKpArCZk75cKHsTtCenc4afyxmXEwDAR
         OtHe/nsIU+JJgZgW3jaN+nxv0TFqWx08VanzH7Wa3NdXBl+Wwrd1H9Ffi/UbYCOxIggV
         GTgQ==
X-Gm-Message-State: AOAM532YpHq9Z1F2MIbxmAfwW8CXxLFfo3T3jW1MF2pnJHeOw5uzmA6Z
        Ib9PDhjSfPnxiJqxeFji2q095r6CdgD2aibWgZt8OcLmjUY=
X-Google-Smtp-Source: ABdhPJw1iMzSoMUPz/R39/6CtfKDhCXT4P1PDrScVpBH4hduR2Z71WsCF3Cwcm9417fdkuQ9J9wI2gHSUjZPeDyxiSk=
X-Received: by 2002:a2e:9b0b:: with SMTP id u11mr11407330lji.463.1630948203483;
 Mon, 06 Sep 2021 10:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com> <YSelsjPyswWCr7Nu@shikoro>
In-Reply-To: <YSelsjPyswWCr7Nu@shikoro>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 6 Sep 2021 19:09:26 +0200
Message-ID: <CAPDyKFp2Ut4UJoRXPD4t+k1+ZfmT-CQZ3obNA_iPF6OA-t+T7g@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old SDHIs
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 26 Aug 2021 at 16:31, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks a ton for testing, Geert!
>
> Ulf, any chance to get this into 5.14?

Apologize for the delay!

I have applied it for fixes (v5.15) and added a stable tag, hope that's okay.

Thanks and kind regards
Uffe
