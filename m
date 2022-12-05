Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA8E642458
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbiLEISM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:18:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbiLEIRz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:17:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D1E65BF
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:17:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3540E25B;
        Mon,  5 Dec 2022 09:17:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670228268;
        bh=0KD0x93ziOwp24YCCz8AA9de6yVF6l0GywEtmNZ4KSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Off/ZdDwKYL5ckJtMSfRLTAluxwtGjEyUMv6RQY66dAXELk1B3RwrYbsFLZQDV7EB
         doy7Zh6+CYA29LlBKsjBcQQqnrpHm7Wwun0xRt4M0MoAnkjPo74QrYxopQunsM278A
         EW/oUchRRemmcWs+cl8P6z1g5acJx3SmZx+wZ19I=
Date:   Mon, 5 Dec 2022 10:17:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH kms++ v2 3/4] kms++util: Add endian.h
Message-ID: <Y42pKde1E+FzeL9P@pendragon.ideasonboard.com>
References: <20221205080339.12801-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221205080339.12801-4-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221205080339.12801-4-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Dec 05, 2022 at 10:03:38AM +0200, Tomi Valkeinen wrote:
> Add simple endianness supporting write function, and, for now, only one
> shortcut helper, write16le().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  kms++util/inc/kms++util/endian.h | 46 ++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 kms++util/inc/kms++util/endian.h
> 
> diff --git a/kms++util/inc/kms++util/endian.h b/kms++util/inc/kms++util/endian.h
> new file mode 100644
> index 0000000..0f7aecd
> --- /dev/null
> +++ b/kms++util/inc/kms++util/endian.h
> @@ -0,0 +1,46 @@
> +#pragma once
> +
> +#include <type_traits>
> +#include <byteswap.h>
> +#include <stdint.h>
> +
> +static_assert((__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__) ||
> +	      (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__),
> +	      "Unable to detect endianness");
> +
> +enum class endian {
> +	little = __ORDER_LITTLE_ENDIAN__,
> +	big = __ORDER_BIG_ENDIAN__,
> +	native = __BYTE_ORDER__
> +};
> +
> +template<typename T>
> +constexpr T byteswap(T value) noexcept
> +{
> +	static_assert(std::is_integral<T>(), "Type is not integral");
> +	static_assert(sizeof(T) == 2 ||
> +		      sizeof(T) == 4 ||
> +		      sizeof(T) == 8,
> +		      "Illegal value size");
> +
> +	switch (sizeof(T)) {
> +		case 2: return bswap_16(value);
> +		case 4: return bswap_32(value);
> +		case 8: return bswap_64(value);
> +	}
> +}
> +
> +template<endian E, typename T>
> +static void write_endian(T* dst, T val)
> +{
> +	if constexpr (E != endian::native)
> +		val = byteswap(val);
> +
> +	*dst = val;
> +}
> +
> +[[maybe_unused]]
> +static void write16le(uint16_t* dst, uint16_t val)
> +{
> +	write_endian<endian::little, uint16_t>(dst, val);
> +}

-- 
Regards,

Laurent Pinchart
