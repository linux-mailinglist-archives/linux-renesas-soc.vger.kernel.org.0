Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADBFB1F4105
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 18:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbgFIQgO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 12:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgFIQgO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 12:36:14 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39ACC05BD1E;
        Tue,  9 Jun 2020 09:36:13 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w15so12843457lfe.11;
        Tue, 09 Jun 2020 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D4GVUV06S0hWAHhHLNuV2oCZMhRZkgp0I10skQ1Dc94=;
        b=J5CxT4R0bmeW54c/8fhnQipIQ+oqkDgWj19dBafAnZm5CyV8ZtgUQHGp9m5HBB8ecX
         bwWgefQwGv6G7QeomxkuvGsZjovo7EYcL3pq/bdzV9qiG6bM9y5q8VyZhCw1ElUlj7uu
         SKTs6wTfO2CF3k2LtVXnWwFQgJoF96jxJIR0y+865c9LBcKX+zZnnGG+oML7DG0/FHsx
         yT60UooY5vOuAR1ybT0YnkRqKGJJdjqz+kdIaOqcnaBxH4DlhPKnbUmlzMpqDF1P4uHr
         PsiYDATVkNgXOhMcXtBNkOFaejY8IIV/Py/Bo7+7jKcaR4GN4qewodkG+bEIwqaId+a2
         hlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4GVUV06S0hWAHhHLNuV2oCZMhRZkgp0I10skQ1Dc94=;
        b=VoVLbt9fLJ5o6OD0jwdYy/aBF5YxPAt5O6lB4wZrO8JjHJNOEnZwHjnF45yZxTitPT
         Ojh3T8//X4BKrA6f3jPMF6AXKWdAjrUA6X/vvYb1PrFiZyVJfuosi+li4Qle0aqGGwKe
         TNdEe04u2r2YV0UuCbXiu3J73Aah4uZxeeyVPuXHCQkiXFxLC48lRDHv/e1ahN1K81zZ
         YuFR6C8sLE6KjSxrZ6gMvhMSQx3es2ciqt3Dx9CS1nvsVba2prwaKJJcfy5TfAFgVpiF
         8E5XVVr/E0bpbf2De0nHI80Tb3Ollaopqdzn3v8xdSqVVqkizZ/ZY1nqyMdpFBgGENDb
         ki4g==
X-Gm-Message-State: AOAM532Y10OS1E4I34MvuIhn9EqTwxD5PHUZhSBeC0SppD6ZWg8dI022
        USHf8vozR1qnBd+XckVHoYp87ChB99BrAC9RP20=
X-Google-Smtp-Source: ABdhPJw5dLwmKcTFf4zTcXWyFF8kwPcnwZadNs4ncOsN+lCnDR8exfUBYvHCqhpcRfc6dPB9i0/leZv/s9ksygoSf1g=
X-Received: by 2002:ac2:489a:: with SMTP id x26mr15977296lfc.111.1591720571515;
 Tue, 09 Jun 2020 09:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
 <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com> <CAFqt6zYgS2tgapVQn93jpSnNWZna27wRSd+3ts_HoHm7pRmjZw@mail.gmail.com>
In-Reply-To: <CAFqt6zYgS2tgapVQn93jpSnNWZna27wRSd+3ts_HoHm7pRmjZw@mail.gmail.com>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Tue, 9 Jun 2020 22:05:59 +0530
Message-ID: <CAFqt6zbWstsbwEEyLgafBkAaSM0xvPJhngogh64a5rn6EGJypA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/balloon_compaction: Fix trivial spelling
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        David Hildenbrand <david@redhat.com>,
        linux-renesas-soc@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jiri Kosina <trivial@kernel.org>,
        "open list:VIRTIO CORE AND NET DRIVERS" 
        <virtualization@lists.linux-foundation.org>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 9, 2020 at 10:02 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> On Tue, Jun 9, 2020 at 8:04 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > The word 'descriptor' is misspelled throughout the tree.
>
> I think, *throughout the tree* is not appropriate* here. This patch
> has fixed it within the file. With that,

Sorry, I read the mail thread in a wrong way. You are right.

>
> Acked-by: Souptick Joarder <jrdr.linux@gmail.com>
>
> >
> > Fix it up accordingly:
> >     decriptors -> descriptors
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > ---
> >  mm/balloon_compaction.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> > index 26de020aae7b..907fefde2572 100644
> > --- a/mm/balloon_compaction.c
> > +++ b/mm/balloon_compaction.c
> > @@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
> >  /**
> >   * balloon_page_list_dequeue() - removes pages from balloon's page list and
> >   *                              returns a list of the pages.
> > - * @b_dev_info: balloon device decriptor where we will grab a page from.
> > + * @b_dev_info: balloon device descriptor where we will grab a page from.
> >   * @pages: pointer to the list of pages that would be returned to the caller.
> >   * @n_req_pages: number of requested pages.
> >   *
> > @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
> >  /*
> >   * balloon_page_dequeue - removes a page from balloon's page list and returns
> >   *                       its address to allow the driver to release the page.
> > - * @b_dev_info: balloon device decriptor where we will grab a page from.
> > + * @b_dev_info: balloon device descriptor where we will grab a page from.
> >   *
> >   * Driver must call this function to properly dequeue a previously enqueued page
> >   * before definitively releasing it back to the guest system.
> > --
> > 2.25.1
> >
> >
