Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB155164305
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 12:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgBSLKb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 06:10:31 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38407 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgBSLKb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 06:10:31 -0500
Received: by mail-ot1-f65.google.com with SMTP id z9so22728494oth.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2020 03:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/NX5ceDqIV7WVNc3pBnsDW/m3e7ZJ2oxuTCXQrMyW8s=;
        b=ra4dYAVk6pWxQhElpSJR0wJZdSrnUMnz3jLVMyU9fThy5Sx7lHnrtdTyYrQFAsnqn7
         u7YSyjv2u4mc0cjVR/KBok1eJVOO+0NUWPCpAumsqUZjlD0dOM9dQznVBDvH/fcAMLCY
         Z2SCIlY2fEtJQAFkIjcpqrGeHOa78VYVrJpGBvb+4lv9fCEyHf3AI5wKDqRYdtPPLjev
         Qp1qE3ILTJf2SKF0yJmkva9ceCOcClMB5yehRCPGXfVhsCMYLCLqGzbjaWG09wafszqS
         MMM8pmey4cc4iiTW6bQd1SfYsuDx2ybt/AtvEUOfEtH8fz7v5KPWfMTSR0iXHPxeCJQ3
         Dm3Q==
X-Gm-Message-State: APjAAAWWMvdTIMBwS9hfOcvsJZnJVxpgFJmogqH0pzKoWm5UgpLa6q+2
        Q3jMEGy0azLbsm3F2Ph4QYj3phRro3WbvOd8luQ=
X-Google-Smtp-Source: APXvYqxql6BAhwRUVZRPJrS4LrG01VTwbHIl62kTaJTecfK6ByLjkHKBo+ODe9FhQtwenBzg75scXAlzuss3vvgpcKo=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr19334928ots.250.1582110630329;
 Wed, 19 Feb 2020 03:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-38-daniel.vetter@ffwll.ch> <CAMuHMdXit+F2nK8JSXyzP26epeDA3pxOYyzVMFtKWqaGCNqBxA@mail.gmail.com>
 <CAKMK7uFrzjAOxBK0GBPtHt=VGRjvC3GJcOTvP087gyO1nAEVPQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFrzjAOxBK0GBPtHt=VGRjvC3GJcOTvP087gyO1nAEVPQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Feb 2020 12:10:18 +0100
Message-ID: <CAMuHMdUBKJTcPg8GB_c52p8jXWqdn8JX3tiPxsQkRRW2EA3+yA@mail.gmail.com>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

On Wed, Feb 19, 2020 at 11:57 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Wed, Feb 19, 2020 at 11:30 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, Feb 19, 2020 at 11:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > It's right above the drm_dev_put().
> > >
> > > Aside: Another driver with a bit much devm_kzalloc, which should
> > > probably use drmm_kzalloc instead ...
> >
> > What's drmm_kzalloc()?
> > The only references I can find are in this patch series.
>
> Yup, it's all new. Read cover letter for reading instructions for the
> entire patch series. I'm afraid the driver patches wont make much
> sense without the context. None actually :-/

IC, as the cover letter was sent only to dri-devel and intel-gfx, many
recipients of the patches won't have received it...
https://lore.kernel.org/dri-devel/20200219102122.1607365-1-daniel.vetter@ffwll.ch/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
