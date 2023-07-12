Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA0E7505DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jul 2023 13:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbjGLLTH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jul 2023 07:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbjGLLTG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2023 07:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177C71BCB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2023 04:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689160698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mGmoSdcAtbAnvFmDIfmKNE01xrI5yfsr2LA1G6eD+Js=;
        b=f2fWtkj1LtrxD+IttWyX5MCLcC3bszR/WsYFmF7AD6zqZLTsXXiFqojcdJQPtW5LEtLVuu
        y/wdn8BhEcN24SZEdygkwLGIu4gC+RUQgWckR1pjXbw8mo8NpjV59yYpRyL3T815/rv4HB
        Oh9B6AqYpdqMXT9deBue06e65OuHnTc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-lRJBPHcLMI-dQjSVnbOAug-1; Wed, 12 Jul 2023 07:18:17 -0400
X-MC-Unique: lRJBPHcLMI-dQjSVnbOAug-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fb416d7731so39683225e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2023 04:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689160696; x=1691752696;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGmoSdcAtbAnvFmDIfmKNE01xrI5yfsr2LA1G6eD+Js=;
        b=lRgiMND7uPHJKf/CVtFNBpzdgWFVD87C21h+LH1tjyg+9YgWsDfA+dJb05yMKEtcOt
         Wn5XpKFSWshvDTVOXHtb9mmiBe/+3bFFO9E2hAAmDhTJ+CzPSWtHBtwfvPXTOm/w+ZUQ
         wQwizE7I8fC0vo1vTuccfwjPENW+dcjC54H289cLat4VHOQd3GQSB21EbgP+pPck2Atl
         3EK1oCfWCgidJsDMBXCK3hTncj/t3AsH4L4oUF8Yalf778ytvJU1XbB3RXCLFESd3Z2/
         TWog6MZn1ro7kEjFmGhle/gU2psvHlKFKBCTzCirtmSjzqrk/VDhhYEDw3LJBX+CxPYd
         35jA==
X-Gm-Message-State: ABy/qLZDCAPjJIb3ZmlcjZYxpWZTpgVLXFExqeXmQqVsrH3XKw1+TC89
        vZawsNtwzqJzKCJkOP/8bd23QoqQ10DeaxMTDUM3yp7yhWhW6UqZmTWg3a6pxG5skE8VuJmRVPv
        gXzNGCyRoVY2EBQ02DcTVOosN6YHhCdY=
X-Received: by 2002:a05:600c:3644:b0:3fc:627:ea31 with SMTP id y4-20020a05600c364400b003fc0627ea31mr12056774wmq.38.1689160695901;
        Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHe6rz0BytbzD5//h/wnxrk0jp/oOEOt3AbTKSXStRClYkvIUVNGHa0orOjttguAlZUCgSKTg==
X-Received: by 2002:a05:600c:3644:b0:3fc:627:ea31 with SMTP id y4-20020a05600c364400b003fc0627ea31mr12056740wmq.38.1689160695625;
        Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm14151776wmr.46.2023.07.12.04.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-rockchip@lists.infradead.org,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        VMware Graphics Reviewers 
        <linux-graphics-maintainer@vmware.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andrew Jeffery <andrew@aj.id.au>, linux-mips@vger.kernel.org,
        Chia-I Wu <olvaffe@gmail.com>,
        linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de,
        John Stultz <jstultz@google.com>,
        freedreno@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
In-Reply-To: <20230712105432.urgwb4zzwgsyfbwq@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <abf26a82-4f17-51f2-5753-785f8516a81a@suse.de>
 <20230712105432.urgwb4zzwgsyfbwq@pengutronix.de>
Date:   Wed, 12 Jul 2023 13:18:14 +0200
Message-ID: <87r0pdgyyx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

[dropping some recipients since my SMTP server was complaining about the si=
ze]

> Hello Thomas,
>
> On Wed, Jul 12, 2023 at 12:19:37PM +0200, Thomas Zimmermann wrote:
>> Am 12.07.23 um 11:46 schrieb Uwe Kleine-K=C3=B6nig:
>> > Hello,
>> >=20
>> > while I debugged an issue in the imx-lcdc driver I was constantly
>> > irritated about struct drm_device pointer variables being named "dev"
>> > because with that name I usually expect a struct device pointer.
>> >=20
>> > I think there is a big benefit when these are all renamed to "drm_dev".
>>=20
>> If you rename drm_crtc.dev, you should also address *all* other data
>> structures.
>
> Yes. Changing drm_crtc::dev was some effort, so I thought to send that
> one out before doing the same to
>
> 	drm_dp_mst_topology_mgr
> 	drm_atomic_state
> 	drm_master
> 	drm_bridge
> 	drm_client_dev
> 	drm_connector
> 	drm_debugfs_entry
> 	drm_encoder
> 	drm_fb_helper
> 	drm_minor
> 	drm_framebuffer
> 	drm_gem_object
> 	drm_plane
> 	drm_property
> 	drm_property_blob
> 	drm_vblank_crtc
>
> when in the end the intention isn't welcome.
>
>> > I have no strong preference here though, so "drmdev" or "drm" are fine
>> > for me, too. Let the bikesheding begin!
>>=20
>> We've discussed this to death. IIRC 'drm' would be the prefered choice.
>
> "drm" at least has the advantage to be the 2nd most common name. With
> Paul Kocialkowski prefering "drm_dev" there is no clear favourite yet.

I think that either "drm" or "drm_dev" would be more clear than "dev",
which I also found it confusing and thinking about a "struct device".

Probably leaning to "drm", since as you said is the second most used name
in drivers that assign crtc->dev to a local variable.

> Maybe all the other people with strong opinions are dead if this was
> "discussed to death" before? :-)
>
> Best regards
> Uwe
>
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

