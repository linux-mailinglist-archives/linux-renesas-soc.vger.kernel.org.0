Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BC31F40F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 18:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgFIQcq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 12:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgFIQcq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 12:32:46 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD67C05BD1E;
        Tue,  9 Jun 2020 09:32:44 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x27so12853597lfg.9;
        Tue, 09 Jun 2020 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6go56Xq/RaTcO68WpES6+R++GmUHJ81WAyZebs67Wk0=;
        b=qLhEyBBAgr9n7RhT9t8a+uMdszZsW8+Dg02MTl7mAYbm/cmLLAt7T8IEoHH2I8M2JY
         uCvwR4QmEx8zf4yVpzaIpeo4E9XsEG7YNac9sO2H/JxclOWrUsrdF6W7ucUvApbFXlpZ
         9t29u3VwR/1AUZIFsRwJ3WU65f8pUbPbMGCjWMnRYIpeCGaT1pgxuAwZCgZuSVSMKY8h
         yvNe9miWfYGPistvQuUwQ7tTYflvOKeCGG3SqWu/HKHTxFdPBMggetEuKgjftFv35Yag
         KDVZyvPezB/CZ3RjR4dze3XOKAfoHYmqOtHVkyWGIAkayPybhpOLKfe8EmO7YHd5MoyM
         lvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6go56Xq/RaTcO68WpES6+R++GmUHJ81WAyZebs67Wk0=;
        b=FIr/Xpdf+TGmT3RvggCospC4KQu5rBuiVrSh6jPAHfBkBGNAet1E80IPb+JAw6sdQE
         KrxxDNHaANFWuldM8bUdBl+br/A9VKmIJeWk+r5uM4bD5Cjts8HGgt7YppeORId+WrtO
         MsSOcxUG0oYVIxP+1BmN6ArpkyNsO8TeJMDK+b1IK1o+9PaXSG5LXcbVCPsWq2QEM4OD
         sDxv7ItsYAW1XhIrmoVxWEbjTNdfFiQteWJNspk89hlxCZ22aY1qcJXvZiaZsYZtOlEk
         wp8FLT0OeIppEtIhTaur5JRI84QDOewAMjeeydgaqtdumR1spYSY8PjMlkyux3bEeAxn
         1ilQ==
X-Gm-Message-State: AOAM530ngCeota6m9oPGSfkh6NNmHyTHF6zQmUCubau68XSMbrznEnBz
        TMmdbeIIWNX5SxMZVq6bPtRVxWDJnK0Dn8GfCDEw1wqU
X-Google-Smtp-Source: ABdhPJwetwbDhwOaowJM1IHjUeIE7J7rEQPR8y86E24tiPXpi8eNRnGgcRhUUqDsZIa/Gm7jnTwnZMCNoiw+R15qhq8=
X-Received: by 2002:a19:2250:: with SMTP id i77mr16078586lfi.133.1591720363254;
 Tue, 09 Jun 2020 09:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
 <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Tue, 9 Jun 2020 22:02:31 +0530
Message-ID: <CAFqt6zYgS2tgapVQn93jpSnNWZna27wRSd+3ts_HoHm7pRmjZw@mail.gmail.com>
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

On Tue, Jun 9, 2020 at 8:04 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> The word 'descriptor' is misspelled throughout the tree.

I think, *throughout the tree* is not appropriate* here. This patch
has fixed it within the file. With that,

Acked-by: Souptick Joarder <jrdr.linux@gmail.com>

>
> Fix it up accordingly:
>     decriptors -> descriptors
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/balloon_compaction.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 26de020aae7b..907fefde2572 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
>  /**
>   * balloon_page_list_dequeue() - removes pages from balloon's page list and
>   *                              returns a list of the pages.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>   * @pages: pointer to the list of pages that would be returned to the caller.
>   * @n_req_pages: number of requested pages.
>   *
> @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>  /*
>   * balloon_page_dequeue - removes a page from balloon's page list and returns
>   *                       its address to allow the driver to release the page.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>   *
>   * Driver must call this function to properly dequeue a previously enqueued page
>   * before definitively releasing it back to the guest system.
> --
> 2.25.1
>
>
