Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8978D484FFF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 10:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238871AbiAEJZH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 04:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238860AbiAEJZF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 04:25:05 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF6FC061785
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jan 2022 01:25:05 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id o6so159451736edc.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jan 2022 01:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3J6/rFE8yGmn8Upj/1+Ijsbc1W85sYxHOJQK0JBFVzo=;
        b=KlGjdMr0VPON2oWLDLdkbXp0tPbWPiD1poU2xLiIMv/hRoDwGrRcWv4UJiSFEQZ75V
         ABJbXRvEE8bwzc2qO4ClJb9J37Patzq9NRvWS8Py9NII6z/PzRtuZ9nCcTQZSw4gLkn4
         fwscgrNhkdqCPEndMzMTRueke2TktGuCiafUTbG3eU6OWpGyzZTHOv2eXY5jQHK/XgVb
         kU7PuRLRCULEtmvHhUEa78QkNZcSf+JExzidA9yR8UrCeI8EaTNPJaidPqKKlpmuE8uA
         lgprYLE8Y9JkfM/m0gxApOGY84Jhf1fimx8GRtFSF90m1AEVb8Zd+IdqMuSbV0aE8tUg
         ysCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3J6/rFE8yGmn8Upj/1+Ijsbc1W85sYxHOJQK0JBFVzo=;
        b=tufVUdeP53pyO+cqU25ssNZJ/Mw8LxoY0Tv++EPnZafAEShtRCWY70aVIFiWov0B9I
         zt6QOjbUK5PHwk6NWD0MetkzpQk4igNKWvnqqSR46lkInCRCVAEOr+E/G+8VcUW4UGdU
         Y0VwMpTa0yMcB6LDPXX4fLdbY57jB6l0w227ipa+KKKSevoAqI+lVNRe56Sj0obGMr7D
         pGqWzp0fHicsxDSzxO271un2d9hOix6jeyfRiXZu7wJqVCF6xAgzLeBIULF9Svuh2svT
         MxEz+wYgJI+JqbLIF7mqO2heHiFGVyLW+6Ysd/7wQI2M2f6X9PaSD895oGAXlMeVkWCX
         H8JA==
X-Gm-Message-State: AOAM530rGs5mLJlfwLKgEc4Z8vPxA8SWhvskVzlCzF3x3LKP/DhaE7p7
        lUTz7f+eHDCXZ9hcG7UOzHN4AJakbeUN+E9JL7BnGQ==
X-Google-Smtp-Source: ABdhPJxdBg6eB2+NNIWd3yrK/JL4s+i6VfsMStaQuG/O5Xm/e7PG0+gyycuKLjFO5GFQerXEEbRl+IgYLXZa3dXSSzg=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr41279420ejj.636.1641374704211;
 Wed, 05 Jan 2022 01:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20220104153615.13393-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220104153615.13393-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 5 Jan 2022 10:24:53 +0100
Message-ID: <CAMRc=MciRJDeLMMKQ=Rg0VdApWtu4oQ=7Xe-DsaHLEqK7x6B+w@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Propagate errors from devm_request_irq()
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 4, 2022 at 4:36 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> The driver overrides the error code returned by devm_request_irq() to
> -ENOENT. Switch to propagating the error code upstream.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Applied, thanks!

Bart
