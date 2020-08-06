Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04EBB23D882
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 11:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgHFJXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Aug 2020 05:23:00 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40486 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbgHFJWF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 05:22:05 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0769LfU2042349;
        Thu, 6 Aug 2020 04:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596705701;
        bh=c1r59moLiiPI9UgQlvAwJgK8nfwyDLfFQF6l68UArZQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YgkXGxAzF4UEv+fs3w+195mCADPRcmgtzyjmBvjq0VgTvWeUFUp8kvo5AXlWwg6Ma
         o1chD7jNjo84+mVed/W4ZH7qEDgtrGSldawruOiAfPhi+qF5QKPJoE8lZcZRtjksPD
         T2V3fsxVkHq8ArqTv2m6r0d300mEEFcGVOAPhSWo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0769LfwD065345;
        Thu, 6 Aug 2020 04:21:41 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 04:21:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 04:21:40 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0769LeFu090741;
        Thu, 6 Aug 2020 04:21:40 -0500
Subject: Re: [PATCH 4/8] dumbfb: Fix pitch for tri-planar formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-5-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8181b48a-ce19-4083-c96e-493d75a1691f@ti.com>
Date:   Thu, 6 Aug 2020 12:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806021807.21863-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/08/2020 05:18, Laurent Pinchart wrote:
> The BO pitches are unconditionally set to the frame buffer pitch, for
> all planes. This is correct for semiplanar YUV formats, as they
> subsample chroma horizontally by two but combined U and V in a single
> plane, cancelling each other. For fully planar YUV formats, however, the
> horizontal subsampling need to be taken into account to compute the
> pitch. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  kms++/src/dumbframebuffer.cpp | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kms++/src/dumbframebuffer.cpp b/kms++/src/dumbframebuffer.cpp
> index 18f3f152943d..4c3c03164a90 100644
> --- a/kms++/src/dumbframebuffer.cpp
> +++ b/kms++/src/dumbframebuffer.cpp
> @@ -42,6 +42,14 @@ DumbFramebuffer::DumbFramebuffer(Card& card, uint32_t width, uint32_t height, Pi
>  		struct drm_mode_create_dumb creq = drm_mode_create_dumb();
>  		creq.width = width;
>  		creq.height = height / pi.ysub;
> +		/*
> +		 * For fully planar YUV buffers, the chroma planes don't combine
> +		 * U and V components, their width must thus be divided by the
> +		 * horizontal subsampling factor.
> +		 */
> +		if (format_info.type == PixelColorType::YUV &&
> +		    format_info.num_planes == 3)
> +			creq.width /= pi.xsub;

This feels a bit of a hack... I think we should somehow have the relevant information in the
PixelFormatInfo. Having the same plane info, { 8, 2, 2 }, for both NV12 UV plane and YUV420 U and V
planes doesn't sound correct.

Should NV12's UV plane be { 16, 2, 2 }? Subsampled formats are confusing... =)

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
