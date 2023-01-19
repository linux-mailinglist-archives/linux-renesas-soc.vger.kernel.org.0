Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC34E67345E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 10:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjASJ2A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Jan 2023 04:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjASJ17 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 04:27:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4034C0D3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2023 01:27:58 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 634167EC;
        Thu, 19 Jan 2023 10:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674120476;
        bh=zqFSO9XGFqeDiP1z3zfWG793JP/D7D+zoJzSnIe9AVY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZwvNMZaNCL1OrCSQxvhRhl8Gze9BPyLhDX+/NZU6PhVojjlgLVndl1Y+2NhHK5RAt
         UOE56HQJJVrcFe/RM7K9zxsDAgrqtpJdf2tVmRWyOgKsI81PA5VP901Z9FYRrBL2Wq
         /eOw3f9Ow+SCj/1YN7w66TdCAuFPmStI2NWKmlTA=
Message-ID: <cb6100eb-a64f-953e-b62f-e384e634800a@ideasonboard.com>
Date:   Thu, 19 Jan 2023 11:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/6] drm: rcar-du: Stop accessing non-existant registers
 on gen4
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-7-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hqka17Sz8lK/Yq@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8hqka17Sz8lK/Yq@pendragon.ideasonboard.com>
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

On 18/01/2023 23:54, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Jan 17, 2023 at 03:51:54PM +0200, Tomi Valkeinen wrote:
>> The following registers do not exist on gen4, so we should not write
>> them: DEF6Rm, DEF8Rm, ESCRn, OTARn.
> 
> I think DEF7Rm should also be skipped. With that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Yep, makes sense.

  Tomi

