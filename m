Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 568A11642BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 11:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgBSK5K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 05:57:10 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46280 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgBSK5J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 05:57:09 -0500
Received: by mail-ot1-f68.google.com with SMTP id g64so22662091otb.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2020 02:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=153qW4tHZt+epjLHed7T9YfWSeCdMzNbOBOdt8RnzTI=;
        b=A3eN7btHHXZsWafpBPsTGy0oWdLfB8zrgTyl9qInVYy3cJ+2YOEdd+m3bNKmuoYgjG
         3xtKF33K6HfO5U0yrvgtbCGZ1H2Ek7Zs300VTO0Fh4N6ll/FM2Kwij8TpZaq9hUdVsm2
         eXXNnh3faEqNwU1aoLTg/VP/K5ARjaJwsOtPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=153qW4tHZt+epjLHed7T9YfWSeCdMzNbOBOdt8RnzTI=;
        b=QEOyCMfoDaifgr+KD/BrlrgBlH1wdSA84k5TkIUyCg0JfMUMJMPHkecqRMDzU5uQIp
         Sa+PRrNk18JLkt0XH9T5nCvWZCdw3TnmNlzQxN8NDYkY0kED2w2o1i78TzUC3gl4lFSV
         kDyvEPAG7x7j+Ibm8UdTj3IRGVnYsKvZeP7uleS/ZFBaBqs2to+Ao4nhHITv2D62mFeX
         0O/avwTWEPNquEc/AO/VIOzd0cIrP5zMBrSZIBMi8AqOCKFfi0b4GUfz3wCt2seGuehU
         P4ykptln/cDB+HkLB+2eF84RwlAMkSAFWG6qdIX1N8yNaEVULgp+El+FxHftPffJxR3N
         6Zhw==
X-Gm-Message-State: APjAAAVEnknFm3fDBaMt3vbMd5bd3pI/5z018vExw7Vd+YfDbq4+u9uv
        QCJKzc5ixPFv/uC7POLuxEozTgLC8HesCGp3ySHPtg==
X-Google-Smtp-Source: APXvYqzhVU/8YU7fOP8XG5w8Fsr1rDNQhQv0DSiGwmuM988lcIbV6mBUUwNcnuKjaYUaalX++tNemL2nkIpPSqU+Rgo=
X-Received: by 2002:a05:6830:2015:: with SMTP id e21mr18501032otp.106.1582109827400;
 Wed, 19 Feb 2020 02:57:07 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-38-daniel.vetter@ffwll.ch> <CAMuHMdXit+F2nK8JSXyzP26epeDA3pxOYyzVMFtKWqaGCNqBxA@mail.gmail.com>
In-Reply-To: <CAMuHMdXit+F2nK8JSXyzP26epeDA3pxOYyzVMFtKWqaGCNqBxA@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 19 Feb 2020 11:56:56 +0100
Message-ID: <CAKMK7uFrzjAOxBK0GBPtHt=VGRjvC3GJcOTvP087gyO1nAEVPQ@mail.gmail.com>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Wed, Feb 19, 2020 at 11:30 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Daniel,
>
> On Wed, Feb 19, 2020 at 11:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > It's right above the drm_dev_put().
> >
> > Aside: Another driver with a bit much devm_kzalloc, which should
> > probably use drmm_kzalloc instead ...
>
> What's drmm_kzalloc()?
> The only references I can find are in this patch series.

Yup, it's all new. Read cover letter for reading instructions for the
entire patch series. I'm afraid the driver patches wont make much
sense without the context. None actually :-/
-Daniel

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
