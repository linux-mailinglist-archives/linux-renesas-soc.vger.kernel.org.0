Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D88768149
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jul 2023 21:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjG2TT0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 29 Jul 2023 15:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjG2TTZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jul 2023 15:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201A4119
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jul 2023 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690658320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ojrCzz5wYGS/I4ma6JQZlj8trsaVvDQ8Es+pMaAigF0=;
        b=IqXM/SoIaKb/LdNcyxv/7sJzV8ESe8jbYXuIntj4V00doOyXHfrAyI/57LZJ/ct8QH9PPp
        UL8s3qmjCbKt41iPi32i8oAdRZNt0uyaucvMjiXxtcncFkmKpV+NnuNJ9aE9+3B9p+kOGi
        oVR6Yn7XD4Udd1Tu8mxYhHDzUy5Co+E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-KBNdHyJIOWuvspoaSauoBw-1; Sat, 29 Jul 2023 15:18:35 -0400
X-MC-Unique: KBNdHyJIOWuvspoaSauoBw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31797adfe97so193031f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jul 2023 12:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690658314; x=1691263114;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojrCzz5wYGS/I4ma6JQZlj8trsaVvDQ8Es+pMaAigF0=;
        b=W9VsZdzdJzZbQd7YAS1EClb2tzh6vypkajHS5Gbv/3qRaf4HWrmxq8SAMtsIEHfDSg
         HepJQPeMPKbU/ezYSOp7hQQLNynketnv/R1gK60LC/plpcm379QfMnrY3YsP/ww/tgx0
         FfUz4FCTL4D0XHEPGI+VBSJP8bVLt3F3PsOMBrqoT9dX1SJmnvYHzL7XVqp+EBRZYcFI
         wx0jNmc309rPhkBLMrHCi/3OK/kX3boeMRqFv9g98xEVBO9zVst/LaD0s/zb95Zrz1os
         K+Hwlk8GzlFn/wzuQCXIIZLZPvklGnX/GjHNWRRtBWiWGHUhiqyhouW3uhO6TL9OZWOR
         iq2g==
X-Gm-Message-State: ABy/qLZF1W0yHGvevIk+f03ulRrr/jIWGjQA4tZzcFsoMeFa6tK7dJ5n
        0nQEYi4Epn996YvBR7K8qSUUh5/TBxv9wysqS4d5YM4jro4/DqPLW8bv43rV5/Mwnp2Ql8boLo6
        JD4qWFdDxgXepwhUF8EojuxkDJEPYpY0=
X-Received: by 2002:adf:e743:0:b0:317:6cc7:6b21 with SMTP id c3-20020adfe743000000b003176cc76b21mr3846707wrn.69.1690658314141;
        Sat, 29 Jul 2023 12:18:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMLsHO2EpY96ESRcSjZaJGCQAF4FMTewpjygCkWri2whqJzjkk8u4900Qu5vniN18Ue1k5Gg==
X-Received: by 2002:adf:e743:0:b0:317:6cc7:6b21 with SMTP id c3-20020adfe743000000b003176cc76b21mr3846696wrn.69.1690658313885;
        Sat, 29 Jul 2023 12:18:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y18-20020adff152000000b0031779a6b451sm8128412wro.83.2023.07.29.12.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 12:18:33 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ville =?utf-8?B?U3ly?= =?utf-8?B?asOkbMOk?= 
        <ville.syrjala@linux.intel.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drm/todo: Convert list of fbconv links to footnotes
In-Reply-To: <0761f98d3b6f8df9eea977eae063e35b450fda9e.1689779916.git.geert+renesas@glider.be>
References: <cover.1689779916.git.geert+renesas@glider.be>
 <0761f98d3b6f8df9eea977eae063e35b450fda9e.1689779916.git.geert+renesas@glider.be>
Date:   Sat, 29 Jul 2023 21:18:32 +0200
Message-ID: <87y1iywmpj.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> Convert the references to fbconv links to footnotes, so they can be
> navigated.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Make main text read correctly when ignoring the footnotes,
>
> v2:
>   - New.
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

