Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF711F50B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 11:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgFJJAg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 05:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgFJJAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 05:00:36 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0077C03E96B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2020 02:00:34 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y11so1484626ljm.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2020 02:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3Xy5FYp2soFgJF6nnVbxCLrmBCUlrALdR15rY+pn3PI=;
        b=SMyYraGTdLcKtomGzhcja//vZGyqisk3nY+VV/zD14VFCWQtumfekcnhuBq+Rv2DDt
         nFICH03bVssMzSGyGbf05DOm//tpS8Hurs0XAF2lMvyYu5WPKaa7WUTqrilGqi+pAQdU
         VFW/Chfsh0+typdG8SUEUu7gI9n+TX7IHDJY5FstpvVyLIuD89NAJnjWTtOWFBY5dtAh
         MMN7ayo5RHYBrPjght1o1WBlylykrjlQLxoNrWOGfqaBrdrDxpoueaO377sDDKhh8uyv
         LSj0YV6xbJJ0cto3U8F6QHdyH9+8g7+MaQKd4WKbADnPeWT3afL1ExkGSKfYL9H6HfK2
         6NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Xy5FYp2soFgJF6nnVbxCLrmBCUlrALdR15rY+pn3PI=;
        b=BluzmZCVfAbbptxOUC4JEwnMljq+t/XvKIyi6ko0UH4L7Bx9ref4CGJFhQh3uFu8uN
         +Jq5KwXLrHRo84lkmjTKHZFxNyPjJ4/WajiEGbXraRwYJkg8r9XkvkyTg7aNhUryR4hC
         +HAo68NiEVNmG7B/yqWT+aR9vpLZgTgq9M3fQyk9yQJb7w5YbPAvW0gNQJY++EDyufI4
         45kFQ/HtaMduERWzpARlJg9R//k+eEGUg23qgn8bLtfJJtBQj3bDAf8jUR97r4HMzUBw
         HSXqHtrWdNOlmWCV/SlqBdJFf97yMy7gjiANnjiVnnr0/v4w9g3HO1z7pcoTj94xFhR+
         Pn/g==
X-Gm-Message-State: AOAM531HbRdv8KGxSj6CWza+agk2kvL1FJN2A7kM04Q8JoNIWP6i2Ytp
        BMf8lFU+ZwSbMUea3FZ/BKVCYw==
X-Google-Smtp-Source: ABdhPJz5MjnnfWmDVh/izTf6DzFOxa3aA+p/p4WuULzzaQDFaso47AUKpZw51XA/g+2bfjZ7YAvxtw==
X-Received: by 2002:a05:651c:508:: with SMTP id o8mr1177157ljp.112.1591779633288;
        Wed, 10 Jun 2020 02:00:33 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8b6:350a:b96f:7066:1c4d:ff8d? ([2a00:1fa0:8b6:350a:b96f:7066:1c4d:ff8d])
        by smtp.gmail.com with ESMTPSA id o4sm5666802lff.78.2020.06.10.02.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 02:00:32 -0700 (PDT)
Subject: Re: [PATCH v2] mm/balloon_compaction: Fix trivial spelling
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        David Hildenbrand <david@redhat.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jiri Kosina <trivial@kernel.org>,
        "open list:VIRTIO CORE AND NET DRIVERS" 
        <virtualization@lists.linux-foundation.org>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200609124610.3445662-16-kieran.bingham+renesas@ideasonboard.com>
 <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6b13243c-db22-ef33-8aed-9b385cc10b58@cogentembedded.com>
Date:   Wed, 10 Jun 2020 12:00:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609143412.3456484-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 09.06.2020 17:34, Kieran Bingham wrote:

> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>      decriptors -> descriptors

       decriptor -> descriptor really. ;-)

> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/balloon_compaction.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 26de020aae7b..907fefde2572 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
>   /**
>    * balloon_page_list_dequeue() - removes pages from balloon's page list and
>    *				 returns a list of the pages.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>    * @pages: pointer to the list of pages that would be returned to the caller.
>    * @n_req_pages: number of requested pages.
>    *
> @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>   /*
>    * balloon_page_dequeue - removes a page from balloon's page list and returns
>    *			  its address to allow the driver to release the page.
> - * @b_dev_info: balloon device decriptor where we will grab a page from.
> + * @b_dev_info: balloon device descriptor where we will grab a page from.
>    *
>    * Driver must call this function to properly dequeue a previously enqueued page
>    * before definitively releasing it back to the guest system.

MBR, Sergei
