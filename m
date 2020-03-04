Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D59F8179A44
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 21:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgCDUkl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 15:40:41 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36311 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgCDUkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 15:40:41 -0500
Received: by mail-qt1-f195.google.com with SMTP id t13so2468944qto.3;
        Wed, 04 Mar 2020 12:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kMvb3FkHGy6+3PCd0iRkhP59AmRHfZvsaM4V6wsp0VQ=;
        b=PzoObFoUEkJu99rFUbzKr5EBKJfe+QkFu5d6qGwbv4QP/Y9FDeUg8hydo/LvFKi3wp
         DfYxH3xYDddGVuz1TRUGwObqIjJ/6Kyn3eLGtJjXel+n10O0VL/iIPUkL4NoSc86ShJX
         oTGlDenzEiluPneam+kq7CwG3HKqce6ZghNSZJUFRErP2zuSMGBCAr6T1vx58V725m3h
         V8wwTqymF3vMg+0kdDayxaLofqjlxhfAs490xlVURVEn6yXlHuOXE3womY7ynF97eK6f
         Tg6JBO7pSjHQRGY5UkG0sEEIiflJV4ELXgxBhEaffSaibraRD8T/XJAJB1OMJIANQj4x
         KDTw==
X-Gm-Message-State: ANhLgQ0W8pTQpHM06rL2mp9/ag7tbaF6RL0EEHW2/WjAxX4TKMJ815k9
        L5eWG1fnBeXpyswZwzgiLkQ=
X-Google-Smtp-Source: ADFU+vv/02CvfBCd0uCY7PmzoOMaiUvA+1v27ESLdQ7l4yc5et4cC1jpvow21omkNqgrShpqtJrwIg==
X-Received: by 2002:ac8:47cf:: with SMTP id d15mr4163094qtr.17.1583354439493;
        Wed, 04 Mar 2020 12:40:39 -0800 (PST)
Received: from dennisz-mbp ([2620:10d:c091:500::2:8091])
        by smtp.gmail.com with ESMTPSA id v82sm14655116qka.51.2020.03.04.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 12:40:28 -0800 (PST)
Date:   Wed, 4 Mar 2020 15:40:26 -0500
From:   Dennis Zhou <dennis@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Dennis Zhou <dennis@kernel.org>
Subject: Re: [PATCH 2/2] include/bitmap.h: add new functions to documentation
Message-ID: <20200304204026.GA55400@dennisz-mbp>
References: <20200304140920.6109-1-wsa+renesas@sang-engineering.com>
 <20200304140920.6109-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304140920.6109-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Mar 04, 2020 at 03:09:20PM +0100, Wolfram Sang wrote:
> I found these functions only by chance although I was looking exactly
> for something like them. So, add them to the list of functions to make
> them more visible.
> 
> Fixes: e837dfde15a4 ("bitmap: genericize percpu bitmap region iterators")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Dennis Zhou <dennis@kernel.org>
> ---
>  include/linux/bitmap.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 804600f7dc35..71ba0ffaa22a 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -51,6 +51,12 @@
>   *  bitmap_clear(dst, pos, nbits)               Clear specified bit area
>   *  bitmap_find_next_zero_area(buf, len, pos, n, mask)  Find bit free area
>   *  bitmap_find_next_zero_area_off(buf, len, pos, n, mask, mask_off)  as above
> + *  bitmap_next_clear_region(map, &start, &end, nbits)  Find next cleared region
> + *  bitmap_next_set_region(map, &start, &end, nbits)  Find next set region
> + *  bitmap_for_each_clear_region(map, rs, re, start, end)
> + *  						Iterate over all cleared regions
> + *  bitmap_for_each_set_region(map, rs, re, start, end)
> + *  						Iterate over all set regions
>   *  bitmap_shift_right(dst, src, n, nbits)      *dst = *src >> n
>   *  bitmap_shift_left(dst, src, n, nbits)       *dst = *src << n
>   *  bitmap_cut(dst, src, first, n, nbits)       Cut n bits from first, copy rest
> -- 
> 2.20.1
> 

Ah thanks. That was a miss not adding the documentation. I can pick
these up unless Andrew would rather run them through his tree. I have a
few other miscellaneous documentation cleanups for percpu I need to run
anyway.

Acked-by: Dennis Zhou <dennis@kernel.org>

Thanks,
Dennis
