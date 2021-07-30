Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39763DBCE8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 18:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhG3QNi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 12:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhG3QNh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 12:13:37 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0530FC06175F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 09:13:33 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id yk17so10011705ejb.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 09:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SYjaapcq5qfad6hB6l6gu0O8KCQr+dg5Ete0bW6l4xU=;
        b=YmvrwGKtTmvvtYaE/BneRayN5Upvpv+TT+M11phmuOF1feaeUo4Tk1QMSFW0+SsDSS
         +UmfC1j7eNKRk+otKsbRh8PUnhPV6GIzwcpTcdMkdZbAI/78rOu6YADbnfz6jQLwucwF
         IIgqnOUPoPpn+HN9dH3YCfdtz2g601jnBFRSmjzce7CFgByZBgyM1EKR6ONRASGINlUk
         aeGJsfk0NX2FSgDZcRQZ0W9820bvDW7qgncPu+1Ihrsf04kWJEbm7dOMWQ2i6bC0fEpm
         v/STOfSiWFy+ITPrv6Q1T039+nTwd0Gc/qdcnu7gC6Xc0lsoHBd6ne7SHlI4YzJRqsYe
         jXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SYjaapcq5qfad6hB6l6gu0O8KCQr+dg5Ete0bW6l4xU=;
        b=iEZtZGX3upVe7s8LXXSC+8/qphmvUe+ehd9wNaYo9j3E6tgPlQTM3iv5rUi1HaBscX
         QaRAxcb5Jek49OBU+nFsNEiN0tmeNFWewKTrcyYMnLpPYORZIZiGNOVPNMeC74JikNp4
         UjuYAXkCodcyP+9mWbCp8SwFLqBLvyOhy1LCdrC3XLdGU/0VjiONWIq0+ItZSmwjNEbV
         z4xLp5wkSBR/5vn9WuUJRpC0bbEdwAl9XGFHddhT9S8WjKCceZ7fCDtqz/S74z8gj3I0
         eupWtyMtfPoYuQ7WbS04MiIZhcVWbz4R1647mgqdVOAnN7z0gQ11Qs33wLSlBcefxGm+
         iG/A==
X-Gm-Message-State: AOAM530QIx5TyAti1l/tRFip8KnFXVPyUoH9LALLdypKKsmuo6uEdlRF
        VBbm+U9lblbe3PkczCXHidv6GAnY5zzxnn1Bbl2Heg==
X-Google-Smtp-Source: ABdhPJwNJW0PdyN+5T+9RVk/+5tsXMJha8Zyo33SEUdsz042K8KrxdzwZhc5Rj+I3XXT+4mBUwLjUZp9NeOE0bvsLCE=
X-Received: by 2002:a17:906:bc81:: with SMTP id lv1mr3302349ejb.413.1627661611627;
 Fri, 30 Jul 2021 09:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210730001939.30769-1-laurent.pinchart+renesas@ideasonboard.com> <40a1fed8-456e-97c5-9aa7-715a4a4c816b@collabora.com>
In-Reply-To: <40a1fed8-456e-97c5-9aa7-715a4a4c816b@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 30 Jul 2021 13:13:20 -0300
Message-ID: <CAAEAJfAv_yVUFQm7NYas46nXUQpBS1=3iuiJC+-bCTm5+AJCKg@mail.gmail.com>
Subject: Re: [PATCH] media: vimc: Add support for contiguous DMA buffers
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent, Dafna,

On Fri, 30 Jul 2021 at 09:35, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi
>
> On 30.07.21 02:19, Laurent Pinchart wrote:
> > The vimc driver is used for testing purpose, and some test use cases
> > involve sharing buffers with a consumer device. Consumers often require
> > DMA contiguous memory, which vimc doesn't currently support. This leads
> > in the best case to usage of bounce buffers, which is very slow, and in
> > the worst case in a complete failure.
> >
> > Add support for the dma-contig allocator in vimc to support those use
> > cases properly. The allocator is selected through a new "allocator"
> > module parameter, which defaults to vmalloc.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   drivers/media/test-drivers/vimc/vimc-capture.c |  9 +++++++--
> >   drivers/media/test-drivers/vimc/vimc-common.h  |  2 ++
> >   drivers/media/test-drivers/vimc/vimc-core.c    | 10 ++++++++++
> >   3 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> > index 5e9fd902cd37..92b69a6529fb 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> > @@ -7,6 +7,7 @@
> >
> >   #include <media/v4l2-ioctl.h>
> >   #include <media/videobuf2-core.h>
> > +#include <media/videobuf2-dma-contig.h>
> >   #include <media/videobuf2-vmalloc.h>
> >
> >   #include "vimc-common.h"
> > @@ -423,14 +424,18 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
> >       /* Initialize the vb2 queue */
> >       q = &vcap->queue;
> >       q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > -     q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> > +     q->io_modes = VB2_MMAP | VB2_DMABUF;
>
> maybe to be on the safe side VB2_DMABUF should be set only if vimc_allocator==1 ?
>
> > +     if (vimc_allocator != 1)
>
> maybe define a macro instead of `1` ?
>

This is maybe an overkill, but you can make the parameter accept strings
instead of integers, which makes it "modprobe vimc allocator=vmalloc",
and improves a bit user-friendlyness.

See drivers/media/pci/tw686x/tw686x-core.c.

For a test driver, it is worth the trouble, maybe?

Thanks,
Ezequiel
