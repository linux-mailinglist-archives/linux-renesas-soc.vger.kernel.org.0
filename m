Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEF82401FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 08:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgHJG2g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 02:28:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55620 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgHJG2g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 02:28:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07A6SXjg067620;
        Mon, 10 Aug 2020 01:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597040913;
        bh=CYgFDt+4VyZAR4QLN9wWMpxpbPz8e6ZscDWI4LoQ4TI=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=bLk1Ag4xnoXTtILTEBovT3ji8LYCdFxebuYrfI9sHv++AWWkJxWlDQJzB1nn4BPLm
         w7rhr9YNSn7ipN9sscdcoKR7cjLGBBLwMcaS3+DFUJZ40vvHOcIwDGtVRFdk7w7kI/
         xkeWDxYQQX84ZhXmvhiyT1RY5z1WYw2OTiY28I/g=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07A6SXVC004501;
        Mon, 10 Aug 2020 01:28:33 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 10
 Aug 2020 01:28:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 10 Aug 2020 01:28:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07A6SW9i060701;
        Mon, 10 Aug 2020 01:28:33 -0500
Subject: Re: [PATCH 4/8] dumbfb: Fix pitch for tri-planar formats
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-5-laurent.pinchart@ideasonboard.com>
 <8181b48a-ce19-4083-c96e-493d75a1691f@ti.com>
 <20200808221439.GA6186@pendragon.ideasonboard.com>
 <2f9bd1a5-b1bb-5fb7-1255-2e55598e9e59@ti.com>
Message-ID: <22e5b7fc-65b5-10f1-9dd6-7eaf74c2ad6a@ti.com>
Date:   Mon, 10 Aug 2020 09:28:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2f9bd1a5-b1bb-5fb7-1255-2e55598e9e59@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/08/2020 09:16, Tomi Valkeinen wrote:

> To be honest, I don't even quite know how subsampled formats are supposed to be handled in DRM.
> Above we pass width as it is, but divide height by ysub. And then we tune the bpp adjust to the fact
> that we didn't divide the width.
> 
> For e.g. YUYV, the bpp tells the container size. But for NV12's second plane, bpp is not the
> container size.

Ah, no it isn't... Not enough coffee yet.

So the bpp for YUYV and NV12 is the "effective bpp", how many bits are consumed on that plane for
each real pixel. Then, shouldn't bpp for YUV420's second and third plane be 4?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
