Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1368724FEB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 15:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgHXNT1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 09:19:27 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44526 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgHXNTY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 09:19:24 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07ODJLLb072771;
        Mon, 24 Aug 2020 08:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598275161;
        bh=4a32qJVSznNHGHK/3b7uCrrecMuR1bDTWP90fm5vozQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IOdle0M2ImkpaGfFdikmVZGjGCY8g9FDNO4ep3U3TT3whmLdvCzxFZwjX88fIC3Ex
         /8X9r+nIqdijVjAACuvZjDVNqh6oNNz+/SSm6mDw1Fhk9hQ7KhX1IuGqdKxiNSTo1l
         tJpW6Mvkyf3rUy6brRS9pg3orOuX/SMt3Qo6oLZE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07ODJL7E091966
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Aug 2020 08:19:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 24
 Aug 2020 08:19:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 24 Aug 2020 08:19:21 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07ODJKPB090851;
        Mon, 24 Aug 2020 08:19:20 -0500
Subject: Re: [kmsxx] [PATCH 2/2] utils: Add a dump_framebuffer() method
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20200823221152.31978-1-laurent.pinchart@ideasonboard.com>
 <20200823221152.31978-3-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c08adc41-4d3f-4679-3ea8-f742ec47bb44@ti.com>
Date:   Mon, 24 Aug 2020 16:19:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823221152.31978-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 24/08/2020 01:11, Laurent Pinchart wrote:
> Add a new method to write the contents of a framebuffer to a file
> descriptor. This can be used to capture frames from writeback
> connectors.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  kms++util/inc/kms++util/kms++util.h | 2 ++
>  kms++util/src/drawing.cpp           | 7 +++++++
>  py/pykms/pykmsutil.cpp              | 6 +++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/kms++util/inc/kms++util/kms++util.h b/kms++util/inc/kms++util/kms++util.h
> index 8fc6c8b81e48..58ad7e6ef39f 100644
> --- a/kms++util/inc/kms++util/kms++util.h
> +++ b/kms++util/inc/kms++util/kms++util.h
> @@ -29,6 +29,8 @@ void draw_text(IFramebuffer& buf, uint32_t x, uint32_t y, const std::string& str
>  void draw_color_bar(IFramebuffer& buf, int old_xpos, int xpos, int width);
>  
>  void draw_test_pattern(IFramebuffer &fb, YUVType yuvt = YUVType::BT601_Lim);
> +
> +void dump_framebuffer(IFramebuffer &fb, int fd);
>  }
>  
>  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> diff --git a/kms++util/src/drawing.cpp b/kms++util/src/drawing.cpp
> index 3752f94695e0..24a995489a9e 100644
> --- a/kms++util/src/drawing.cpp
> +++ b/kms++util/src/drawing.cpp
> @@ -1,5 +1,6 @@
>  
>  #include <cmath>
> +#include <unistd.h>
>  
>  #include <kms++/kms++.h>
>  #include <kms++util/kms++util.h>
> @@ -569,4 +570,10 @@ void draw_text(IFramebuffer& buf, uint32_t x, uint32_t y, const string& str, RGB
>  		draw_char(buf, (x + 8 * i), y, str[i], color);
>  }
>  
> +void dump_framebuffer(IFramebuffer &fb, int fd)
> +{
> +	for (unsigned int i = 0; i < fb.num_planes(); ++i)
> +		::write(fd, fb.map(i), fb.size(i));
> +}
> +

Well, my first thought was that it's c++, we should use ostream or such. I don't know how that plays
with pybind11, though.

I guess on the py side you need to use os.open & co here, not the normal file operations? Or I guess
you can get the fd with fileno(), but it's still "odd" to do it in python. So using fd here is kind
of not really c++, and not really python.

That said, it's simple and works, so maybe it's fine until someone wants to put more effort to it.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
