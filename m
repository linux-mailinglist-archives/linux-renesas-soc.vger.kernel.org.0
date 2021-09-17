Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202B1410188
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Sep 2021 00:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242860AbhIQW7C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Sep 2021 18:59:02 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:50493 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231954AbhIQW7C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Sep 2021 18:59:02 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id A55D82B00BD5;
        Fri, 17 Sep 2021 18:57:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 17 Sep 2021 18:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=WMLpEFBE93jrQXCWdCpO4Ix/sm2
        jroLMl/pxBagZPTo=; b=UucEzm++DdPegc7AIie9vkXls9cdxOuR/tbOhB2OS3c
        yjHTAhpwwSY0t9ERGUGvilcYQB0+9Q0nFmwaCMtbG6psDnd6DyRQ1P+Q5Z/USqDY
        7MUDYAcpYI0bL6tjSfdobTf7eYgVldkdeY7SfLWu6vd1UzBqdkAuaBtSNCeGTeXV
        ztNEY4IuVotlC9QZB3U5DhiYL9IRX+lnAYS1lZcakZaeC8yRqRWlLShiJcuWvq9p
        2Ig66C5G0SgWxaid9PnmP2LQbpQUdxX7PH+mdvo4Jlg/NwpaBvT/ef7a+jZ9wIoj
        EwYlYY4LNAVBguuYxHiVYCTEkz2j4OAQnSk0qC7UQ1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WMLpEF
        BE93jrQXCWdCpO4Ix/sm2jroLMl/pxBagZPTo=; b=KaVrhnyA+J97tyCTA/B8PE
        OpUr6t8TFqt9xWbXvQu6jE4U2fcFTf+RmqDuOmd0KS2+OXe8ht5wZk1Yy30z56eS
        cvRnQcutN1iT33QTKWfcKEJJ6yaqUkIw/6270BOAPNYQI/PHZiKN+tGPb5Py4e+r
        7EbfujsB++dWI+6YumBBTPRIOq1wBVZ/sTB2y1xXC35j/m6FdK8LdYeQOHOOvuQ7
        6qP6H0XtZSlJ7u7Cd39sp1vsne4HuGNaZTf8HC1mQI6iJOipuPX6zg1IqxjtLNyh
        iv4peoPLj45XNiUf5yXyKdybk89V2n5Bdx+Fdqdnbj+XezNDnR7eIQzeCknMcDAg
        ==
X-ME-Sender: <xms:YR1FYWJqrDZl6aQKzXbLt78kWrRnB8L29XBVdH4kIMMf4vt-VW1jKg>
    <xme:YR1FYeJzS4X78Jc9_9vkjvXmq2G1jQH1-zvRbKsUrBUYiQXvM8qakbycDG1Bi3ZmS
    ufcFqpYNjuOxgajUw>
X-ME-Received: <xmr:YR1FYWu79VLy5GCP_Dhc7mdjJ_8NgQP_6avPgVPbHNQnQIXm4tHBUnBoSUJl-Pzps5oqZP_x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehjedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
    nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
    gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
    heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
    gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:YR1FYbZaiu5WV3xy_1zUjmtwLCyuVa8Y3c18cXagVazQx-pFyD-eoA>
    <xmx:YR1FYdbnc477cSnWYRc2L2KUKh2DM-uz7g-ccvLrSaNsIEZ_r-1J4A>
    <xmx:YR1FYXCW0peK2ic7qefI2FgPB6gm97oZaiFrU1FgQA3eBDMDdpkT7w>
    <xmx:Yh1FYfmUYx05lxhx-jq8sjs3zQSdxgM6bGklit2hrg7ivFQsbN715pI_MrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 18:57:34 -0400 (EDT)
Date:   Sat, 18 Sep 2021 00:57:31 +0200
From:   Fernando Ramos <greenfoo@u92.eu>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 12/15] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <YUUdW2fb8wC+ClX0@zacax395.localdomain>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-13-greenfoo@u92.eu>
 <20210917154830.GM2515@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210917154830.GM2515@art_vandelay>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> >  	int i;
> > +	int ret;
> 
> Please move up with i

Done!


> > +	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
> >  
> >  	return 0;
> 
> Return ret here

Done!


> > +	struct drm_modeset_acquire_ctx ctx;
> >  	int i;
> > +	int ret;
> 
> Please move up with i

Done!


> > -	drm_modeset_unlock_all(dev);
> > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> >  
> >  	return 0;
> 
> Return ret

Done!


> > -	drm_modeset_unlock_all(dev);
> > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> >  
> >  	return 0;
> 
> Return ret

Done!


> > -	drm_modeset_unlock_all(dev);
> > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> >  
> 
> Check ret here and return an error if it's != 0

Done!


> > @@ -1194,14 +1195,11 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
> >  	if (ret != 0)
> >  		goto out_unlock;
> >  
> > -	drm_modeset_unlock_all(dev);
> > -	i915_gem_object_put(new_bo);
> > -
> > -	return 0;
> > -
> >  out_unlock:
> > -	drm_modeset_unlock_all(dev);
> > -	i915_gem_object_put(new_bo);
> > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> > +
> > +	if (params->flags & I915_OVERLAY_ENABLE)
> > +		i915_gem_object_put(new_bo);
> 
> This function refactor is a bit more involved than the
> s/drm_modeset_lock_all/DRM_MODESET_LOCK_ALL_*/ changes in the rest of the patch.
> Could you split it out into a separate patch so it's not hidden away?

Sure, no problem.

