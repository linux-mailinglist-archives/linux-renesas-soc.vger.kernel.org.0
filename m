Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF3E5A5DD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 10:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbiH3IQF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 04:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbiH3IQF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 04:16:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F31076765
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 01:16:03 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42EFD481;
        Tue, 30 Aug 2022 10:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661847360;
        bh=ApBwk4f3KoSc9NbmtbDrFXaF6qmqL8hvYhHNyNP1PU8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=tY3FmSX476zW18wzvioGrYJZv99JEAuPO1sE5b5UrxzU0Hn9fap29g64NbGV/3C7O
         XsvV0/dxAVIJmF8tQd2f8BMjJlbCTYh7y2XmUwKwPjqFQV2YcjZNNkEww5TrGNEsTA
         +++1cGt0O5UdB3pTOas143+zSsFXTnZ7F+7d0Dy0=
Message-ID: <e77bbe3c-c6dd-56e0-5a04-de7c9313620d@ideasonboard.com>
Date:   Tue, 30 Aug 2022 11:15:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/4] drm/bridge: ti-sn65dsi86: Reject modes with too
 large blanking
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
 <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
 <CAD=FV=WUirzYMcHe_XxnJoom7N7RkuyQ8xDp03k+NNTR5F50JQ@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAD=FV=WUirzYMcHe_XxnJoom7N7RkuyQ8xDp03k+NNTR5F50JQ@mail.gmail.com>
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

Hi Doug,

On 29/08/2022 20:23, Doug Anderson wrote:
> Hi,
> 
> On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> The blanking related registers are 8 bits, so reject any modes
>> with larger blanking periods.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index ba84215c1511..f085a037ff5b 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -752,6 +752,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>>          if (mode->clock > 594000)
>>                  return MODE_CLOCK_HIGH;
>>
>> +       /*
>> +        * The blanking related registers are 8 bits, so reject any modes
>> +        * with larger blanking periods.
>> +        */
>> +
>> +       if ((mode->hsync_start - mode->hdisplay) > 0xff)
>> +               return MODE_HBLANK_WIDE;
>> +
>> +       if ((mode->vsync_start - mode->vdisplay) > 0xff)
>> +               return MODE_VBLANK_WIDE;
>> +
>> +       if ((mode->hsync_end - mode->hsync_start) > 0xff)
>> +               return MODE_HSYNC_WIDE;
> 
> Please double-check your patch. Reading through
> ti_sn_bridge_set_video_timings(), I see "mode->hsync_end -
> mode->hsync_start" is allowed to be up to 0x7fff. The datasheet seems
> to confirm. If I got that right it means you're rejecting valid modes.
> 
> I didn't validate any of your other checks, but at least that one seems wrong.

Indeed, I misread the spec. The pulse width registers are 15 bits. The 
front and back porch are 8 bits.

Thanks!

  Tomi
