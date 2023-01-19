Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930786733D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 09:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjASIhE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Jan 2023 03:37:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjASIhC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 03:37:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1AC4B4BE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2023 00:37:01 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7D967EC;
        Thu, 19 Jan 2023 09:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674117419;
        bh=uiyVKhcyDI6wrIBa+FrRFZD2CVtEYdTskePUNjF2owI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=CcLEw/WqreGOPMvjXKoZ6nU3KkVasafHkMum0oOcEI6jUluDr8gA3grs7T+tGk160
         WGZTjXstZs1G45ahAaN6QUDUj5EFtdvuAlFigR4Zm03BPTExj6jv1xc8M71yV7Mo/h
         WlfSEI+F8aLQ2J57SkjAO9xTTZZ9f/vyhKKbsquk=
Message-ID: <a34ace0f-cd75-006c-a264-2307b1909c92@ideasonboard.com>
Date:   Thu, 19 Jan 2023 10:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/6] drm: rcar-du: lvds: Add reset control
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdUuUV38tVsZ5qoJEq5OF-0RZ6gnCAFvyt=FHTXUy_PybQ@mail.gmail.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CAMuHMdUuUV38tVsZ5qoJEq5OF-0RZ6gnCAFvyt=FHTXUy_PybQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 17/01/2023 18:04, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Tue, Jan 17, 2023 at 2:54 PM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> Reset LVDS using the reset control as CPG reset/release is required in
>> H/W manual sequence.
>>
>> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
>> [tomi.valkeinen: Rewrite the patch description]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> 
>> @@ -844,6 +853,12 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>>          if (ret < 0)
>>                  return ret;
>>
>> +       lvds->rstc = devm_reset_control_get(&pdev->dev, NULL);
> 
> devm_reset_control_get_exclusive()

Ok.

>> +       if (IS_ERR(lvds->rstc)) {
>> +               dev_err(&pdev->dev, "failed to get cpg reset\n");
>> +               return PTR_ERR(lvds->rstc);
> 
> return dev_err_probe(...);

Right.

Thanks!

  Tomi

