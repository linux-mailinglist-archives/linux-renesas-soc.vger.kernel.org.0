Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94902C4127
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 14:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgKYNcM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 08:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKYNcL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 08:32:11 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D59C0613D4;
        Wed, 25 Nov 2020 05:32:11 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id y197so4369245qkb.7;
        Wed, 25 Nov 2020 05:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4bZsdhn7SQQg2YyIuDumss+hUTJbkU+0PCGD/wxinKw=;
        b=d2ZLZt7lxUzQpltq5qn85M/VHDeJaKsiIlfwqnc/K4CuJ9di/yhGSUI0jgSDsFUMwg
         oClWVUMAu6alJ5NBfROaEOso9QetfZ3sprRpvchV6xSmJMsGZviLxdgCGF1fCEtdDwlj
         sq5WpWrFTFlhCUtX1iPMRG5vlckrd2mOBwAEHebreueazhVdu/zGUGbz6TR5FZ9SaCQL
         VYvSK7LDZNHsl7SpWA5GKYi4IaPFsix2TG55vo1xPJ5hdeUCO+ZjwxxqAjX4fH4iC3F1
         acjPlcvTJmLcumnYptgj1KPkvLfqzZBghjfjse/2b6dVLrAJuviaESFMx3hlT7FnW6Wd
         mCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bZsdhn7SQQg2YyIuDumss+hUTJbkU+0PCGD/wxinKw=;
        b=fYfpqhrpuYaWPg8O17FTx3fdtj4I7j/cyHFYkFgrETIwo2kR8ON2FkcutzUhWuEd5X
         37J/dhWAQoBG/S3iinHacVj88OoEhOSev1wbYQWjyKTAmZshbJpUSPWZ0IH3/YQKg0U7
         F2T8m70+tO2myBXfNOBu+ocVNP66VQ4t07bESG/aPtOgMxa8BpdEuRuUZrgsro6Kk8Us
         fi8aoBMkbmimKCDenHH0Sl7mbd3Ogb3MY5FUjkbUOJaoGvbG3IwAxic78a9uuprIGHnP
         1o8Kpr6QE6h1lS51vgdGkdAfRXJ+Mbug4rXrsCF8BqXyeHe5oioDbTqiGWbuzJvh2sJl
         +2jw==
X-Gm-Message-State: AOAM530YGI6F7mJsF46nLjQ/5BJMIqLkY6N4d5dywjMYsOV/qPDs4IHi
        uYZpn0HFfbmyRy5Ppb6ad4OfTo2HM4Lsu2KPPJwYaLCfvJM=
X-Google-Smtp-Source: ABdhPJwsAQcSzRRItdNy9wHYuvo5UgZ6tyKawN3CGwAVYIblp0M9EiRZDNALJHPK//RtPtjwI2TtmjTyOqNmXx1eIFE=
X-Received: by 2002:a25:3a86:: with SMTP id h128mr3427345yba.401.1606311131173;
 Wed, 25 Nov 2020 05:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8v5iUcK6Hh=3rPiWbFs32U1TjPqT4AuwQniSFguk9-9bQ@mail.gmail.com> <b66509aa-e4fe-1e1f-6261-0f0064db6518@gmail.com>
In-Reply-To: <b66509aa-e4fe-1e1f-6261-0f0064db6518@gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 25 Nov 2020 13:31:44 +0000
Message-ID: <CA+V-a8vXp6ZJZ+J157rMwYeebZheUffna3s1zVB6A39ju8hH1g@mail.gmail.com>
Subject: Re: [PATCH 0/5] memory: renesas-rpc-if: Trivial fixes
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 24, 2020 at 6:25 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> On 11/24/20 2:34 PM, Lad, Prabhakar wrote:
>
> [...]
> >> This patch series fixes trivial issues in RPC-IF driver.
> >>
> >> Cheers,
> >> Prabhakar
> >>
> >> Lad Prabhakar (5):
> >>   memory: renesas-rpc-if: Return correct value to the caller of
> >>     rpcif_manual_xfer()
> >>   memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
> >>     inline
> >>   memory: renesas-rpc-if: Export symbols as GPL
> >>   memory: renesas-rpc-if: Avoid use of C++ style comments
> >>   memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()
> >>
> > Patches sent to sergei.shtylyov@cogentembedded.com have bounced back
> > so including gmail address (patchwork [1]).
>
>    Sorry, I got laid off by Cogent last May. Thanks for CCing my gmail address...
>
Sorry to hear that.

Thank you for the review. I'll fix the review comments for patch 2/2
and post a v2.

Cheers,
Prabhakar
