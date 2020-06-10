Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFF61F510B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 11:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgFJJYi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 05:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgFJJYi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 05:24:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5637C03E96B;
        Wed, 10 Jun 2020 02:24:37 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E886329E;
        Wed, 10 Jun 2020 11:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591781076;
        bh=d7/Z3a/cNXkRgco/e+DWGswAhTOHqw7Q8TykDvLriX8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LMAKZMUapn0fLuAWidUbhBH38o8aScAIFM4BG6euiZ8or5w/1QY1TP0uo+Wc2O8yY
         EWvalSfx2HB+GpIFSASFCpM/gIg7hzL/He47JjlZ6o3h98fOeU6+9NN9L+Dy71g85k
         3KQKaX/4TVxBytCf6iiw1LaFAmyQts+Z+LCHBTvE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
To:     Qian Cai <cai@lca.pw>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200608031622.GQ22208@pendragon.ideasonboard.com>
 <1DA4E5B7-BB3A-476B-B09A-24EC89583C3D@lca.pw>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ed5d28ac-3168-b331-bb9e-63fd8c043ae2@ideasonboard.com>
Date:   Wed, 10 Jun 2020 10:24:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1DA4E5B7-BB3A-476B-B09A-24EC89583C3D@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Qian, Laurent,

On 08/06/2020 05:30, Qian Cai wrote:
> 
> 
>> On Jun 7, 2020, at 11:16 PM, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>>
>> I forgot to mention, I think the subject line should be
>>
>> drm/rcar-du: Make DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU
>>
>> Could you please let me know if you're OK with these two small changes ?
> 
> Yes, I am fine with those.
> 

With the fixups,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

--
Kieran
