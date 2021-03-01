Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D5B327DAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 12:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhCALxL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 06:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbhCALwt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 06:52:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B169AC061756
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 03:52:33 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 505E28AF;
        Mon,  1 Mar 2021 12:52:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614599549;
        bh=5rg8vgJJDo04x0ejCMCvhSAcjOkn0AsieQ+bu+5f2Ng=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=g92PFj7GCgpg7Tb5Vj2bkCZPuiaaw8ixaOes3hNVJDTiyfSHQwiK/fbolWsDAK6S1
         NkLLTAAk/FuJJQAYyvO2VWnvrfKDc87F1a7ALe0Y+uj2ZUeERYUv+ZRjL8AGitIp6v
         oND+pBTK4oqwkT/64FlSgH9E/KNgw7xhrSnUpprA=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Use drmm_encoder_alloc() to manage encoder
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdVwjWwcWR45BTAjL5Lp66s5coc_Jp1EcBF1ad7MJpY0Og@mail.gmail.com>
 <CAMuHMdV0fEsDWUok=MaxnTXxngMWa5PCEHHCUoBYrqurUEf=1Q@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <5252aceb-75f9-52d9-cba2-9ecc017698d8@ideasonboard.com>
Date:   Mon, 1 Mar 2021 11:52:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV0fEsDWUok=MaxnTXxngMWa5PCEHHCUoBYrqurUEf=1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Laurent,



On 01/03/2021 10:30, Geert Uytterhoeven wrote:
> On Thu, Jan 14, 2021 at 11:00 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Wed, Jan 13, 2021 at 6:02 PM Kieran Bingham
>> <kieran.bingham+renesas@ideasonboard.com> wrote:
>>> The encoder allocation was converted to a DRM managed resource at the
>>> same time as the addition of a new helper drmm_encoder_alloc() which
>>> simplifies the same process.
>>>
>>> Convert the custom drm managed resource allocation of the encoder
>>> with the helper to simplify the implementation, and prevent hitting a
>>> WARN_ON() due to the handling the drm_encoder_init() call directly
>>> without registering a .destroy() function op.
>>>
>>> Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")
>>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> As in "the WARNING from drm_encoder_init() is gone".
> 
> JFYI, the WARNING is now in v5.12-rc1, the fix isn't.

Does this patch go through you to get into the DRM tree? Or do I need to
re-send it to someone else?

> Gr{oetje,eeting}s,
> 
>                         Geert
> 

