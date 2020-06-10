Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8149E1F50CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 11:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgFJJG0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 05:06:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJJG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 05:06:26 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEBCA29E;
        Wed, 10 Jun 2020 11:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591779983;
        bh=jDahtic4X/hGHdvUIUQ4poL1ADmSmvhjqpE/zX70PGE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ESqqyDvXadCuJ/5DhuogFj+9nhJ3DYr6jXzQxi/YaQMldGP+LuS1pyEQwt1Sa1cto
         jxwC62SWsTHQjWCidDleNwcwmXRRBKe625Tu2BhfSmNsmGvUgRMvORTQ9Mmra8Zz/5
         zJvB6DLBCFmx+gonkYuhV07BxIg4L7gOC+vP03pw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] mm/balloon_compaction: Fix trivial spelling
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
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
 <6b13243c-db22-ef33-8aed-9b385cc10b58@cogentembedded.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <731a9af2-57eb-3b4e-458e-b652df446d04@ideasonboard.com>
Date:   Wed, 10 Jun 2020 10:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6b13243c-db22-ef33-8aed-9b385cc10b58@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On 10/06/2020 10:00, Sergei Shtylyov wrote:
> Hello!
> 
> On 09.06.2020 17:34, Kieran Bingham wrote:
> 
>> The word 'descriptor' is misspelled throughout the tree.
>>
>> Fix it up accordingly:
>>      decriptors -> descriptors
> 
>       decriptor -> descriptor really. ;-)

Ayeee ... that's what I get for doing a batch fixup ...

Which - I believe I probably actually did a sed conversion on decriptor,
anyway, so I'm not even sure why the commit messages ended up all
pluralised ;-)

Thanks for the highlight, I'll fix up in any resends.
--
Kieran



>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/balloon_compaction.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
>> index 26de020aae7b..907fefde2572 100644
>> --- a/mm/balloon_compaction.c
>> +++ b/mm/balloon_compaction.c
>> @@ -58,7 +58,7 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
>>   /**
>>    * balloon_page_list_dequeue() - removes pages from balloon's page
>> list and
>>    *                 returns a list of the pages.
>> - * @b_dev_info: balloon device decriptor where we will grab a page from.
>> + * @b_dev_info: balloon device descriptor where we will grab a page
>> from.
>>    * @pages: pointer to the list of pages that would be returned to
>> the caller.
>>    * @n_req_pages: number of requested pages.
>>    *
>> @@ -157,7 +157,7 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>>   /*
>>    * balloon_page_dequeue - removes a page from balloon's page list
>> and returns
>>    *              its address to allow the driver to release the page.
>> - * @b_dev_info: balloon device decriptor where we will grab a page from.
>> + * @b_dev_info: balloon device descriptor where we will grab a page
>> from.
>>    *
>>    * Driver must call this function to properly dequeue a previously
>> enqueued page
>>    * before definitively releasing it back to the guest system.
> 
> MBR, Sergei

