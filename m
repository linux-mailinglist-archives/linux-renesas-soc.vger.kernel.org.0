Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFC0D7865
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 16:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732662AbfJOO0k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 10:26:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55748 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732050AbfJOO0k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 10:26:40 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6066B324;
        Tue, 15 Oct 2019 16:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571149598;
        bh=hSdNGSSn5zc6mkejUmeqIoT8CVOAQ/twmh0YdLHeH+o=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mEDe4FAheoUDNwti7vv8FKUNaowQCfW1YFt/S+SvDJtxZOPsbMHfBKWw3G+DMAI01
         rpFSW2xzRslhHapJtvtGno4nMPinthakiNafukrcXzCkhp65xy2pph3khkkI+rJgS5
         t0nzccfeMmxoU7me05bt9PnE4edElreGkhEmqRaw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v5 3/8] drm: rcar-du: Add support for CMM
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
        seanpaul@chromium.org, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-4-jacopo+renesas@jmondi.org>
 <2aefe646-45db-aafa-b22b-e1cf9616259d@ideasonboard.com>
 <20191015133320.uj4y5twxfkyopqi5@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2e6e5e8d-e502-5957-5708-4e4d7ef84d8e@ideasonboard.com>
Date:   Tue, 15 Oct 2019 15:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015133320.uj4y5twxfkyopqi5@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15/10/2019 14:33, Jacopo Mondi wrote:
> Hi Kieran, thanks for review

<snip>

>>> +config DRM_RCAR_CMM
>>> +	bool "R-Car DU Color Management Module (CMM) Support"
>>> +	depends on DRM && OF
>>> +	depends on DRM_RCAR_DU
>>
>>
>> DRM_RCAR_DU already depends on both DRM && OF, so I wonder if those are
>> needed to be specified explicitly.
>>
>> Doesn't hurt of course, but I see DRM_RCAR_DW_HDMI does the same, and so
>> does DRM_RCAR_LVDS, so I don't think you need to remove it.
>>
> 
> I did the same as it is done for HDMI and LVDS here. The extra
> dependencies could be dropped yes, I chose to be consistent.

Consistent is fine with me.


<snip>

>>> +struct rcar_cmm {
>>> +	void __iomem *base;
>>> +
>>> +	/*
>>> +	 * @lut:		1D-LUT status
>>> +	 * @lut.enabled:	1D-LUT enabled flag
>>> +	 */
>>> +	struct {
>>> +		bool enabled;
>>> +	} lut;
>>
>> This used to be a more complex structure in an earlier version storing a
>> cached version of the table. Now that the cached entry is removed, does
>> this need to be such a complex structure rather than just say, a bool
>> lut_enabled?
>>
>> (We will soon add an equivalent clu_enabled too, but I don't know what
>> other per-table options we'll need.)
>>
>> In fact, we'll potentially have other options specific to the HGO, and
>> CSC at some point in the future - so grouping by entity is indeed a good
>> thing IMO.
> 
> You are right, I pondered a bit it this was worth it, but I assume the
> other CMM functions would have required some more complex fields so I
> chose to keep it separate. I have no problem to make this a
> lut_enabled, but I fear as soon as we support say, double buffering
> for the lut, having a dedicated struct would be nice.
> 
> Is it ok if I keep this the way it is?

Certainly fine for me. (That's what I tried to imply with "so grouping
by entity is indeed a good thing IMO.")

<snip>
--
Kieran
