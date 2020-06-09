Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D35C1F410B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 18:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgFIQhQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 12:37:16 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33372 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726100AbgFIQhP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 12:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591720633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+II8osbiFfoX/L1u4six/WCUHiqDeOz+O5rD4LfoR2M=;
        b=basv1UjsNNv3EDjOjMxOdIlc3YhnU3WgHNCLKEvI7vH/1+jVrQ2+Q3yooj3in24lLTZUUx
        6Vg/B7crAtYiJBdSSsXggT5Dci0jtUmN0DmwBc6qlFXLHRbaqy6Wi3D/dakiDzI8T8yGIw
        EC+uGAyi9ubPjkKqrQyC+qY1FgY3rsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-309d4oaMPTK2laJxhQPmyg-1; Tue, 09 Jun 2020 12:37:12 -0400
X-MC-Unique: 309d4oaMPTK2laJxhQPmyg-1
Received: by mail-wm1-f72.google.com with SMTP id h6so770393wmb.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2020 09:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+II8osbiFfoX/L1u4six/WCUHiqDeOz+O5rD4LfoR2M=;
        b=HMRoQOO1Sr7YebUeMDDFJphbhTPLEcAFweKyIsvkyg7M6X8tOiZgf8YqGraeXLkzPf
         fsI/4CGy1DsCtOfmyaIq4WdjYjZO+EzuQg+pfCkeaMzJD3Yuqxf3FTGL5cg2tS6hZ42l
         i0aT4EgjRbGSt31HeFM7ZRzWspZviyYuR469U9tr6HVSNGM10KfQKNzH/OXQoIJ5KjMb
         ZRaw7iZ2DQyuAfv+x2wyTIXzwb+JNZZqGrs94bfOGEIZr9YsjygFxvWRNc7Q3Nq0sX7b
         d9LDnCrg3hg+apooqdJnSIj9i8ijqbQs8q71WtIQa2OhtwH35f4PhCT8BUwYWWpeS04a
         DrJA==
X-Gm-Message-State: AOAM532Uf/FVDEZonem42ZM6SzNQvWr094YbRkGKA3oLaOIvdpeUafH1
        i38bN4eRk+ON5Sjb9cDHTEa8C/t9dxeE4jUUd1f0yJsIW3zI7KgmLA5L4hE6vDhUqH66fCumiXG
        xia0fTG8O94yrw9PelqE8xEPYs+OSZb8=
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr5269013wmg.180.1591720629594;
        Tue, 09 Jun 2020 09:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz93L1cNiCH3xWCKNeXmWCa9GZNaquxVlfU7TmLWNCwG1IA511CFoLPu9aXLiiVBHF4IpYnIg==
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr5268995wmg.180.1591720629341;
        Tue, 09 Jun 2020 09:37:09 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
        by smtp.gmail.com with ESMTPSA id a1sm3383430wmj.29.2020.06.09.09.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:37:08 -0700 (PDT)
Date:   Tue, 9 Jun 2020 12:37:06 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        David Hildenbrand <david@redhat.com>,
        linux-renesas-soc@vger.kernel.org,
        Jason Wang <jasowang@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jiri Kosina <trivial@kernel.org>,
        "open list:VIRTIO CORE AND NET DRIVERS" 
        <virtualization@lists.linux-foundation.org>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mm/balloon_compaction: Fix trivial spelling
Message-ID: <20200609123652-mutt-send-email-mst@kernel.org>
References: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
 <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 09, 2020 at 03:34:12PM +0100, Kieran Bingham wrote:
> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>     decriptors -> descriptors
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Trivial tree pls.

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
>   *				 returns a list of the pages.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>   * @pages: pointer to the list of pages that would be returned to the caller.
>   * @n_req_pages: number of requested pages.
>   *
> @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>  /*
>   * balloon_page_dequeue - removes a page from balloon's page list and returns
>   *			  its address to allow the driver to release the page.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>   *
>   * Driver must call this function to properly dequeue a previously enqueued page
>   * before definitively releasing it back to the guest system.
> -- 
> 2.25.1

