Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EA55A5FAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 11:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiH3Joy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 05:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiH3Jow (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 05:44:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D51F2651
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 02:44:47 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5ACEC481;
        Tue, 30 Aug 2022 11:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661852684;
        bh=SLHvvksjPC16TNhVPKUE0KwzuSWnUnMLvLLhNSf9lgY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=NeHajk3lgl3v9E5bOp94CRBBajfhb2W+imdX6aMMhbxkxRp9o3nsVXMjJviLpzrxO
         M4vh7Z/PK40nE47myOAHNkDFWUlkq6aLw/ma34RR9NVuvsLTVceeqMG9DBsMl32lBF
         8qzXBlHBl2ySLNnJ8/tAOe5vfWb8POFRBwJMbsKQ=
Message-ID: <05b1a68f-9fac-603c-8ce6-18fe1e55f74d@ideasonboard.com>
Date:   Tue, 30 Aug 2022 12:44:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/4] drm/bridge: ti-sn65dsi86: check AUX errors better
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
 <CAD=FV=VD5HugTsQFD-B2goondjR2vD-92mjb9syR2XOD9uBptQ@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAD=FV=VD5HugTsQFD-B2goondjR2vD-92mjb9syR2XOD9uBptQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 29/08/2022 20:15, Doug Anderson wrote:
> Hi,
> 
> On Wed, Aug 24, 2022 at 6:01 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> The driver does not check AUX_IRQ_STATUS_NAT_I2C_FAIL bit at all when
>> sending AUX transfers,
> 
> It doesn't? What about a few lines down from where your patch modifies
> that reads:
> 
>    else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
> 
> That seems like it's checking that bit?

You're right, the patch is obviously broken.

>> which leads to the driver not returning an error.
> 
> Right that it doesn't return an error. I guess the question is: should
> it? Right now it sets the proper reply (DP_AUX_I2C_REPLY_NACK or
> DP_AUX_NATIVE_REPLY_NACK) and returns 0. Is it supposed to be
> returning an error code? What problem are you fixing?

I encountered a problem where the monitor was not replying properly and 
the driver was just getting AUX_IRQ_STATUS_NAT_I2C_FAIL errors, but the 
drm_dp_dpcd_read functions were not returning an error and the driver 
didn't understand that none of the transactions are actually going through.

Of course, now that I try I'm unable to reproduce the situation, I can 
only see AUX_IRQ_STATUS_AUX_RPLY_TOUT when something is not right, never 
AUX_IRQ_STATUS_NAT_I2C_FAIL.

Looking at the code, AUX_IRQ_STATUS_NAT_I2C_FAIL sets the len to 0, so 
that should cause a failure when the driver compares the return value of 
drm_dp_dpcd_read to the expected number of bytes. So I have trouble 
understanding the behavior I saw.

I did have WIP IRQ code in my branch at that time, though, and I'm now 
kind of suspecting that code, as it also somehow triggers the DSI RX 
issues I mention in the other mail.

> In commit 982f589bde7a ("drm/bridge: ti-sn65dsi86: Update reply on aux
> failures"), at least, we thought that returning "0" and setting the
> "reply" was the correct thing to do (though we didn't have any good
> setup to test all the error paths).
> 
> ...and looking through the code at drm_dp_i2c_do_msg(), I see that it
> only ever looks at DP_AUX_I2C_REPLY_NACK if "ret" was 0.
> 
> So I guess I would say:
> 
> 1. Your patch doesn't seem right to me.
> 
> 2. If your patch is actually fixing a problem, you should at least
> modify it so that it doesn't create dead code (the old handling of
> AUX_IRQ_STATUS_NAT_I2C_FAIL is no longer reachable after your patch.
> 
> Naked-by: Douglas Anderson <dianders@chromium.org>

I'll drop this patch.

  Tomi
