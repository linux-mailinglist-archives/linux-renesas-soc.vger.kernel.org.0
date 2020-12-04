Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C522CEB4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 10:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgLDJrq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 04:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgLDJrq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 04:47:46 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8961C061A4F;
        Fri,  4 Dec 2020 01:47:05 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id r127so4801197yba.10;
        Fri, 04 Dec 2020 01:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=has9z/+YolIQnceI0ZR4EwEEHuS5+aPy5Dek6RVuYA0=;
        b=HhHUNB5KOPHJhQjg6pF2/j+lGhnmZ2g4xwR+wkctXTtR7G2QFKYP+a09U9n8Er8d59
         jmnkckHhcfjlFDgGndLx78wuVstSXg7Mo6Kd+P/Xq0sluwVth1VjEmTmB/fNIzodXZOv
         gwipiVq/puWkLznqU07I3sr/1RBJAsP4m6YY2B+MXd+5NlW2F6a96pTH/p9jw3edGqTU
         fy4KL/miekw/BkIAHoR5hA3sCnPOV+Xe1gErhB6HL15msJrY0/joYJUuJwB4IoFVmjfP
         ZvfWFdhmMWs4sRIYj1DSAb6hnHPYpQO+zdXPt/xbIzC8OW6gtn5PQ5wYRfS7XQBwIs/s
         sNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=has9z/+YolIQnceI0ZR4EwEEHuS5+aPy5Dek6RVuYA0=;
        b=kPcDLT1HtC7cNuClpmSzGI5xjeimiW87gKr0VN7ABADAntyJMduz6jrk2hO+pLJoav
         xBRugMp5FzVasiQA/CJkehOTir1gtEScAm1AN92ZJ2zm529/XMfPCnsT+EAPZQNtEERK
         IqaX/VXWEAiXYSBlEIw+iVIq2IYrm9Gb8MW58NNAbIQclQu3ZUFYt/A0SH0QZrBrKldl
         zD/33cAq9RfHkJ+iYRM1EN+RX0LIlo9Bk6w0ggzCIKO3HzR4Du4VtK7gLcT3LcgGQkRn
         ck7/mDl7apc10pcrLoTfJjOpsgo90OtW9N7XG7vqVW0MFefXj20gnRkpWldiWbujsZE0
         azsg==
X-Gm-Message-State: AOAM530d1ULJtVq3Vf+y89N+UoaFzrYxbcB8T2mOkdIS1eY99nOkMh4K
        ZRIFfPbQpEtxrpMNTqJrC5/FfY0JUOmVAVrHYwVgB9IZY5Q=
X-Google-Smtp-Source: ABdhPJzqHuUEn/wunVBeEWv/E1wmjDBjcCAxgHj2csSbjd7/ViXN+BESDwpcIp2ZLBmZ6TDOJ6gExng8Qavvl1ACHg4=
X-Received: by 2002:a25:3a86:: with SMTP id h128mr4457187yba.401.1607075225072;
 Fri, 04 Dec 2020 01:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vjTQv7wrdJFe6TS3saUE=Sj6ty0JSz0VZUd=TyDVfp4Q@mail.gmail.com> <20201203131916.GA2924@kozik-lap>
In-Reply-To: <20201203131916.GA2924@kozik-lap>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 4 Dec 2020 09:46:39 +0000
Message-ID: <CA+V-a8t_451_g0j2D8FK=aJ76VCSyJ4WLxmakTLAX7nt097vOw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] memory: renesas-rpc-if: Trivial fixes
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

On Thu, Dec 3, 2020 at 1:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, Dec 03, 2020 at 10:41:54AM +0000, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > On Thu, Nov 26, 2020 at 7:11 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Hi All,
> > >
> > > This patch series fixes trivial issues in RPC-IF driver.
> > >
> > > Changes for v2:
> > > * Balanced PM in rpcif_disable_rpm
> > > * Fixed typo in patch 4/5
> > > * Dropped C++ style fixes patch
> > > * Included RB tags from Sergei
> > >
> > > Cheers,
> > > Prabhakar
> > >
> > > Lad Prabhakar (5):
> > >   memory: renesas-rpc-if: Return correct value to the caller of
> > >     rpcif_manual_xfer()
> > >   memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in
> > >     rpcif_{enable,disable}_rpm
> > >   memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()
> > >   memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
> > >     inline
> > >   memory: renesas-rpc-if: Export symbols as GPL
> > >
> > As these are fixes to the existing driver will these be part of v5.10 release ?
>
> Quick look with:
>         git lg v5.9..v5.10-rc1 -- drivers/memory/
> did not show that this driver was added in v5.10-rc1, so the fixes are
> not planned to be for v5.10 release never. Why they should be? Maybe I
> missed something here?
>
My bad the fixes can go into v5.11.

Cheers,
Prabhakar
