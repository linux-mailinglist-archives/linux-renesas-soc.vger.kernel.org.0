Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A03D7742
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 15:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfJONRo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 09:17:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55328 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729551AbfJONRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 09:17:44 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A81A324;
        Tue, 15 Oct 2019 15:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571145462;
        bh=OGe73LjqajbcudlitAMvXu0BZp8hvWsmr33UvUWk+Zg=;
        h=Reply-To:Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=luQ+FPeyeNVCv5hr4rd5zjNDri+A8NvWV0MfQLtzRmautNAcLsHYFCUeMp8Tr48J2
         D4X6kTWkcEmh5iM7A2FJFTQLj7W4dVKxD53p4YgbQSx6frlM+nXkSlwuBxxmvZ+14V
         LeK/Rhudg6Z+iBa6p6vsXQ7pOQfQh2MbZ/mwhsCc=
Reply-To: kieran.bingham+renesas@ideasonboard.com,
          kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v5 3/8] drm: rcar-du: Add support for CMM
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com,
        muroya@ksk.co.jp, Harsha.ManjulaMallikarjun@in.bosch.com,
        ezequiel@collabora.com, seanpaul@chromium.org,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-4-jacopo+renesas@jmondi.org>
 <2aefe646-45db-aafa-b22b-e1cf9616259d@ideasonboard.com>
Openpgp: preference=signencrypt
Organization: Ideas on Board
Message-ID: <f0c787a4-9267-b75b-047f-de5142ea437e@ideasonboard.com>
Date:   Tue, 15 Oct 2019 14:17:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2aefe646-45db-aafa-b22b-e1cf9616259d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

One minor additional catch here:

On 15/10/2019 12:53, Kieran Bingham wrote:
> Hi Jacopo,

<snipped>

>> +
>> +/*
>> + * rcar_cmm_lut_write() - Scale the DRM LUT table entries to hardware precision
>> + *			  and write to the CMM registers.
>> + * @rcmm: Pointer to the CMM device
>> + * @drm_lut: Pointer to the DRM LUT table
>> + */
>> +static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
>> +			       const struct drm_color_lut *drm_lut)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < CM2_LUT_SIZE; ++i) {
>> +		u32 entry =  drm_color_lut_extract(drm_lut[i].red, 8) << 16

There's an extra space between = and 'drm_color...' here.

<snipped>

--
Kieran
