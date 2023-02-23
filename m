Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51E86A0B5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Feb 2023 14:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbjBWN7E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Feb 2023 08:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234154AbjBWN7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Feb 2023 08:59:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066EB497EA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Feb 2023 05:58:47 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 886BC496;
        Thu, 23 Feb 2023 14:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677160725;
        bh=gBXGYHXhEytxkHfNGZN1xmGc9Z/trKuM5hcQ+0W8LUc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TD/XnR1//v9VChL78qIRNoOkW2nyS8VuQkRBBZWdHLIuHx0qRd0dznbcQzQTdqWhR
         xQIVvlVeuc+L3pyr7Y54ePsS9g4Vjc3Z8AkcyUMcr0kzXV1xGTVW+Imy2vldFHGUF3
         I2iDLFLrAUNq/3N25SmGq9csCAxbMw3rA3BCZhqw=
Message-ID: <78629f03-4e2e-a3bc-c9d4-7a4b73ad4551@ideasonboard.com>
Date:   Thu, 23 Feb 2023 15:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] drm: rcar-du: Write correct values in DORCR
 reserved fields
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230222234212.5461-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230222234212.5461-3-laurent.pinchart+renesas@ideasonboard.com>
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

On 23/02/2023 01:42, Laurent Pinchart wrote:
> The DORCR register controls the routing of clocks and data between DU
> channels within a group. For groups that contain a single channel,
> there's no routing option to control, and some fields of the register
> are then reserved. On Gen2 those reserved fields are documented as
> required to be set to 0, while on Gen3 and newer the PG1T, DK1S and PG1D
> reserved fields must be set to 1.
> 
> The DU driver initializes the DORCR register in rcar_du_group_setup(),
> where it ignores the PG1T, DK1S and PG1D, and then configures those
> fields to the correct value in rcar_du_group_set_routing(). This hasn't
> been shown to cause any issue, but prevents certifying that the driver
> complies with the documentation in safety-critical use cases.
> 
> As there is no reasonable change that the documentation will be updated
> to clarify that those reserved fields can be written to 0 temporarily
> before starting the hardware, make sure that the registers are always
> set to valid values.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_group.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

