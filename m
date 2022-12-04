Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D57E641CF0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Dec 2022 13:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiLDMio (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 4 Dec 2022 07:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiLDMin (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Dec 2022 07:38:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8390715A08
        for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Dec 2022 04:38:41 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3CD832A;
        Sun,  4 Dec 2022 13:38:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670157519;
        bh=BWxghlkNeXSmGtzwuQ/1zjw43aA0qC7aK1MWcjy0UaM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GfuaS3vLosm+1wU59wCJbNOgvT+QgP0fPikoWGakI/NnVpw7paccnz4iDsA0IwUQB
         PtSrGxDPnb3tf+8IwB6CVUKw1p9RTZ5nb4AWYXoLRbd/PZvCKIYJDxBeS8VsCqJgI+
         8u0Rqd1S3cWJLSuvAPJdfrrLMx+DHXJ7I4Oi4gPw=
Message-ID: <91809d16-4466-890d-4a47-7bdaf526ae38@ideasonboard.com>
Date:   Sun, 4 Dec 2022 14:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH kms++ 3/4] kms++util: Add endian.h
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221202131658.434114-4-tomi.valkeinen+renesas@ideasonboard.com>
 <Y4qQo4zT4qw9/myt@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y4qQo4zT4qw9/myt@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 03/12/2022 01:56, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Dec 02, 2022 at 03:16:57PM +0200, Tomi Valkeinen wrote:
>> Add simple endianness supporting write function, and, for now, only one
>> shortcut helper, write16le().
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   kms++util/inc/kms++util/endian.h | 46 ++++++++++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 kms++util/inc/kms++util/endian.h
>>
>> diff --git a/kms++util/inc/kms++util/endian.h b/kms++util/inc/kms++util/endian.h
>> new file mode 100644
>> index 0000000..ea09065
>> --- /dev/null
>> +++ b/kms++util/inc/kms++util/endian.h
>> @@ -0,0 +1,46 @@
>> +#pragma once
>> +
>> +#include <type_traits>
>> +#include <byteswap.h>
>> +#include <stdint.h>
>> +
>> +static_assert((__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__) ||
>> +	      (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__),
>> +	      "Unable to detect endianness");
>> +
>> +enum class endian {
>> +	little = __ORDER_LITTLE_ENDIAN__,
>> +	big = __ORDER_BIG_ENDIAN__,
>> +	native = __BYTE_ORDER__
>> +};
>> +
>> +template<typename T>
>> +constexpr T byteswap(T value) noexcept
>> +{
>> +	static_assert(std::is_integral<T>(), "Type is not integral");
>> +	static_assert(sizeof(T) == 2 ||
>> +		      sizeof(T) == 4 ||
>> +		      sizeof(T) == 8,
>> +		      "Illegal value size");
>> +
>> +	switch (sizeof(T)) {
>> +		case 2: return bswap_16(value);
>> +		case 4: return bswap_32(value);
>> +		case 8: return bswap_64(value);
>> +	}
>> +}
>> +
>> +template<endian E, typename T>
>> +static void write_endian(T val, T* dst)
> 
> I would have swapped the parameters, common APIs have the destination
> first and the source second. Same below, and up to you.

True, I think that makes sense.

>> +{
>> +	if constexpr (E != endian::native)
>> +		val = byteswap(val);
>> +
>> +	*dst = val;
>> +}
>> +
>> +[[maybe_unused]]
>> +static void write16le(uint16_t val, uint16_t* dst)
> 
> I wonder if writing
> 
> using write16le = write_endian<endian::little, uint16_t>;
> 
> would compile.

No, using needs a type.

  Tomi

