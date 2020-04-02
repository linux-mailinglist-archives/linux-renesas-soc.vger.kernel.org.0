Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B83019BFB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 12:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387610AbgDBK5H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 06:57:07 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35447 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbgDBK5G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 06:57:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id i19so3160783wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Apr 2020 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vBV0Allu6iOSmBCmW0uF3n1umxXRMetPcUSnAXweDa8=;
        b=ACdefVov4fLCo65LI5CXw33T60GoIon+IEpAvx5obPLg0SKcGSdwykc6Ud8W4Ljx3c
         yCZxIJXRoXtrfNJyB0VFvJQVPmwJ5+nvn2HD9qr1ZRibml4oyQTBhDYMEkqBqH+o9nzr
         nlnBgyycpUZjjTIbmqGpn+/bfvk/0YKd2VuwUuQUhIbElvx0vjkk1XV/B76C4EEz8Ium
         9rAz1d1Pz7+KmK9cpMV8t/GDFxa9M1qhaekZzLjN//+tnNW6d8YFo5MfxN+lBIYMKU05
         hJjO59hDfGKWmqEk2ZhrMgg2F9bXstfFTr4vtTRXmo9buzohrWmJu3GpqFkRHjiX24BM
         7CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vBV0Allu6iOSmBCmW0uF3n1umxXRMetPcUSnAXweDa8=;
        b=Np+YgRueb+xhB2wFd8L//AZci3Of3sQTcqRzLk2++ESQWhmwV9VbyxiryYd70pFati
         mWm/mRYeHZ1er7KMrg3MlMbq8sxrwgahp9wUEkmLTLSZNfpuRP+/ySEYyKt/xowRZugM
         OUazKRO/rQbBWrvK28D3QB+0W5nM6YCzgHS/ziA0yDPrPUGPJYafaf9wqZP+enwQZN15
         mbpiU79I+41WR8c3MvRxKab/aWEehXw/DaYhk9CzFIHJ8lFwq2klGc77cGJQ6+pNrXLT
         Dt/e6EdZeNOXaWalKtAFPQdtD7P8e6d5f3JxVJakMuPM/BbpokSMGH5WpFT0A9UH1y+v
         jZ1g==
X-Gm-Message-State: AGi0PubOeCDBjDqrOrpvO3dXOgFEa83jxxBVGwqK2p2TfJIk1aZcl2iz
        oV7vmrACuglztCSRF+qqtxk0n9buiw0U6LxFdkhYmA==
X-Google-Smtp-Source: APiQypJVohSVs9ODDtnBmhJg7XQtAXvVAtRnokgwil1qw7juc+svxCq/b7AIeTlx7L1lZAvoVZMejcXgxithSmsa5S0=
X-Received: by 2002:a1c:1d17:: with SMTP id d23mr2933273wmd.147.1585825025001;
 Thu, 02 Apr 2020 03:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Thu, 2 Apr 2020 11:56:01 +0100
Message-ID: <CAPj87rMCf0qv0mQxKRZZLzhJ3HBG92MdABKM5JJx8KarG_M3DQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Create immutable zpos property for primary planes
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 2 Apr 2020 at 11:40, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
> all the overlay planes, but leaves the primary plane without a zpos
> property. The DRM/KMS API doesn't clearly specify if this is acceptable,
> of it the property is mandatory for all planes when exposed for some of
> the planes. Nonetheless, weston v8.0 has been reported to have trouble
> handling this situation.

Yeah. It didn't even occur to me/us that someone would do that, to be
honest. We need to have zpos information for all planes that we're
using in order for zpos to be at all meaningful, and we can't exactly
avoid using the primary plane. Without knowing the primary plane's
zpos, we can't know if the overlays are actually overlays or in fact
underlays.

> The DRM core offers support for immutable zpos properties. Creating an
> immutable zpos property set to 0 for the primary planes seems to be a
> good way forward, as it shouldn't introduce any regression, and can fix
> the issue. Do so.

Perfect. We support immutable properties entirely well, we just need
to know about them.

> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
