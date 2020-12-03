Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBF62CD689
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 14:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730648AbgLCNUB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 08:20:01 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43010 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgLCNUA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 08:20:00 -0500
Received: by mail-ed1-f68.google.com with SMTP id q16so2024273edv.10;
        Thu, 03 Dec 2020 05:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U5ZVC3sunVFHgRKQY/zbvAIFfdPzaZHDRhvSxd0iuCE=;
        b=lueueSHh+Bg5s1vjE8O/WUjU2OP0gWsWUfJEenXlTac5paA/RIQcBgsF4wONpZ9vOf
         M3p9u+RysDblTKVhu9/GbyAmozxM+MJxSGoh5INVIHbAsZ4dmaf5ecnJjCaJx+Ak6zI3
         f21wagsnp04SoQWUeQfgdIHKFW9q0QiouuLwggEB48shkcFjqjWHDlZgaLk35cX13dnb
         5WJ5tLh6eE6c3BXUoqU828ckmQDxhRAJkj6qvmNPNSv6xgaPHJYLIqQZROFPaBvinc7b
         x5zMYftnh9SurvztDOJg8cHFSZG5i7QkIqkJSRilpNXsObMd+udECon68ZXxcuuoscAR
         PixQ==
X-Gm-Message-State: AOAM532sWi0xfPMr2y5CYjHoVGC0QEf30s3EG9qfzQ8bTC9VdE6z47WE
        57FhbXh2bOPZqEbVwP1JwT0=
X-Google-Smtp-Source: ABdhPJz+bQwBKGefuBknu1BjS54iOeA1ob3n67a9OJaj56moVo3v6k92CFDzMUmtkfABm+yw1W2sdQ==
X-Received: by 2002:aa7:c98d:: with SMTP id c13mr2939916edt.188.1607001559171;
        Thu, 03 Dec 2020 05:19:19 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id k3sm824083ejd.36.2020.12.03.05.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:19:18 -0800 (PST)
Date:   Thu, 3 Dec 2020 15:19:16 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] memory: renesas-rpc-if: Trivial fixes
Message-ID: <20201203131916.GA2924@kozik-lap>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vjTQv7wrdJFe6TS3saUE=Sj6ty0JSz0VZUd=TyDVfp4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8vjTQv7wrdJFe6TS3saUE=Sj6ty0JSz0VZUd=TyDVfp4Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 03, 2020 at 10:41:54AM +0000, Lad, Prabhakar wrote:
> Hi Krzysztof,
> 
> On Thu, Nov 26, 2020 at 7:11 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Hi All,
> >
> > This patch series fixes trivial issues in RPC-IF driver.
> >
> > Changes for v2:
> > * Balanced PM in rpcif_disable_rpm
> > * Fixed typo in patch 4/5
> > * Dropped C++ style fixes patch
> > * Included RB tags from Sergei
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (5):
> >   memory: renesas-rpc-if: Return correct value to the caller of
> >     rpcif_manual_xfer()
> >   memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in
> >     rpcif_{enable,disable}_rpm
> >   memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()
> >   memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
> >     inline
> >   memory: renesas-rpc-if: Export symbols as GPL
> >
> As these are fixes to the existing driver will these be part of v5.10 release ?

Quick look with:
	git lg v5.9..v5.10-rc1 -- drivers/memory/
did not show that this driver was added in v5.10-rc1, so the fixes are
not planned to be for v5.10 release never. Why they should be? Maybe I
missed something here?

Best regards,
Krzysztof
