Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E08DA17C145
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 16:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgCFPJX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 10:09:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:56390 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCFPJX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 10:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=fvkhdfY0DQSguKsTCNP38wagzdN34NuCr9M9vU3oTnU=; b=WAyRSKi+qYYrjTgIPjTwZvpyFO
        znUKSoU3y811UZb05N9lVXvpPZjkL8SaF9J5uI1Fgmk+RVHfd+PXiRBrjbGMmRNxyu5tDn6JFs9r4
        9F72pLUYEoySzbRlBuHiAivIJERjNl2f7NznmUw/PNLS6ySCHrHdvyP750OxOwTcUNivPXX1JP+Vv
        tiBqUF+bCksGtIXhR0YgJoCwKsOD1d7ZPFnRr2AgAzYVcG9DOxT2uDIsTVwI3pCq+U/CdkDOxa7N+
        Lu2jcxlMXY+/Fr4JBBL8KX/RwiNiwhuZXemBPiBsbdlP/Vm+tOhhZmJ0VscEyFjS49lWzwliZJ0fS
        CDXgXTLg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jAEbJ-0005Oc-Pi; Fri, 06 Mar 2020 15:09:21 +0000
Subject: Re: [RFC PATCH] drm: rcar-du: make all sub-symbols depend on
 DRM_RCAR_DU
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        David Airlie <airlied@linux.ie>
References: <4b50cc9f-1434-b78a-d56a-fadfd030f002@infradead.org>
 <20200306142819.GG4878@pendragon.ideasonboard.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <87bcc1d8-d0c6-9c26-c66f-a4e228c64015@infradead.org>
Date:   Fri, 6 Mar 2020 07:09:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306142819.GG4878@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/6/20 6:28 AM, Laurent Pinchart wrote:
> Hi Randy,
> 
> On Thu, Mar 05, 2020 at 07:17:49PM -0800, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
>> symbols do not depend on DRM_RCAR_DU, the menu presentation is
>> broken for these and following non-R-Car Kconfig symbols.
>>
>> Is it safe/appropriate to make all of these symbols depend on
>> DRM_RCAR_DU?  It make the kconfig menu presentation much cleaner.
> 
> As those drivers are useless without DRM_RCAR_DU, I'm fine with this
> change. It however prevents test-compiling those drivers when
> DRM_RCAR_DU is disabled, but I see little reason to do so anyway, I
> expect compile tests to aim for as large coverage as possible, and they
> should thus enable DRM_RCAR_DU.
> 
> Would you like to submit a new version without this question, and
> possibly addressing Geert's concern if you think it's appropriate, or
> should I do so when applying ?
> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> Cc: Dave Airlie <airlied@linux.ie>
>> ---
>>  drivers/gpu/drm/rcar-du/Kconfig |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> --- linux-next-20200305.orig/drivers/gpu/drm/rcar-du/Kconfig
>> +++ linux-next-20200305/drivers/gpu/drm/rcar-du/Kconfig
>> @@ -24,6 +24,7 @@ config DRM_RCAR_CMM
>>  config DRM_RCAR_DW_HDMI
>>  	tristate "R-Car DU Gen3 HDMI Encoder Support"
>>  	depends on DRM && OF
>> +	depends on DRM_RCAR_DU
>>  	select DRM_DW_HDMI
>>  	help
>>  	  Enable support for R-Car Gen3 internal HDMI encoder.
>> @@ -31,6 +32,7 @@ config DRM_RCAR_DW_HDMI
>>  config DRM_RCAR_LVDS
>>  	tristate "R-Car DU LVDS Encoder Support"
>>  	depends on DRM && DRM_BRIDGE && OF
>> +	depends on DRM_RCAR_DU
>>  	select DRM_PANEL
>>  	select OF_FLATTREE
>>  	select OF_OVERLAY
>> @@ -47,4 +49,5 @@ config DRM_RCAR_VSP
>>  
>>  config DRM_RCAR_WRITEBACK
>>  	bool
>> +	depends on DRM_RCAR_DU
>>  	default y if ARM64
> 
> Is this one needed ? The symbol should not be shown in the kconfig menu
> as it has no text.

Hi Laurent,
I tried the patch without that line as my first attempt and there was
still a problem with the menu, so I will resubmit the patch using a block
as Geert suggested.

thanks.
-- 
~Randy

