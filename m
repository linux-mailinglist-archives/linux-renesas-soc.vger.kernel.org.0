Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25BC59C138
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 16:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbiHVOBE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 10:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235489AbiHVOA6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 10:00:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3CF3AB24
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 07:00:57 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BD8D2B3;
        Mon, 22 Aug 2022 16:00:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661176855;
        bh=ehB6oBArJIRiJIaT5OcSBdW2vAMSzSW4+YbDnLUC2hw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ogwhTS/7kYqjV3wSzqgTzLmYbIjoZjk0fDcjoJ6IvcPnzpjML7pKoSNRV/CjvF53M
         UhyttQ4E3Em61bfjErG/iLDp+A4+z2LK1z2mv618daoMfzMbWAhiJsmL3BsZBjQLhU
         u2KUYOYEEUh/wpQh+NWqPNTd2jMkTpiPDzwSwupM=
Message-ID: <058337c0-ff8b-0cb4-b6eb-192e78cbeda3@ideasonboard.com>
Date:   Mon, 22 Aug 2022 17:00:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-2-tomi.valkeinen@ideasonboard.com>
 <OS0PR01MB5922058F5712CA3367AFEAE186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <OS0PR01MB5922058F5712CA3367AFEAE186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On 22/08/2022 16:25, Biju Das wrote:
> Hi Tomi,
> 
> Thanks for the patch.
> 
>> Subject: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
>>
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> The driver does not explicitly stop the video mode transmission when
>> disabling the output. While this doesn't seem to be causing any issues,
>> lets follow the steps described in the documentation and add a
>> rcar_mipi_dsi_stop_video() which stop the video mode transmission. This
>> function will also be used in later patches to stop the video
>> transmission even if the DSI IP is not shut down.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 29 +++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> index 62f7eb84ab01..7f2be490fcf8 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> @@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct
>> rcar_mipi_dsi *dsi)
>>   	return 0;
>>   }
>>
>> +static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi) {
>> +	u32 status;
>> +	int ret;
>> +
>> +	/* Disable transmission in video mode. */
>> +	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
>> +
>> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +				!(status & TXVMSR_ACT),
>> +				2000, 100000, false, dsi, TXVMSR);
>> +	if (ret < 0) {
>> +		dev_err(dsi->dev, "Failed to disable video transmission\n");
>> +		return;
>> +	}
>> +
>> +	/* Assert video FIFO clear. */
>> +	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
>> +
>> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +				!(status & TXVMSR_VFRDY),
>> +				2000, 100000, false, dsi, TXVMSR);
>> +	if (ret < 0) {
>> +		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
>> +		return;
> 
> This return is not required.

That is true, but I'd personally rather keep it there. If the return is 
removed, I can imagine how easily one could add a new piece of code in 
the end of the function, not realizing that one also needs to add a 
return (the one above) so that the code works correctly.

It just feels a bit safer this way.

  Tomi
