Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9936E7E6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Apr 2023 17:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbjDSPhM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Apr 2023 11:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbjDSPhL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2023 11:37:11 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE06C7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2023 08:37:10 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f09b4a1527so34827225e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2023 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681918629; x=1684510629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2zs8Cl3Q/8Nc5DGBq8l177y3eli1Qxa+CVE/yQLN4g=;
        b=V2rjPf29kJuCXvUzej3me+YsbiV6pIc6tMPE7/1/1/wN/ZQj3+wtSovXRvOtKKo7DP
         RLV2TVANVxEu+vCxAAyoFPawQHCC1kKrOTEme2mSj8xs5Ud7AL21PrH8ntRmY132gj9d
         kHUPlUnnZtZN4O/mdIIlk16BcayGAkLsEPVIUMu2QH9G+VP9z6WV8S9h9oOkvo3JhD1z
         i6ikzr8RHWYALMHnEaA5+YAwO+m3x9n/D+W/c587bARmEPsenndCfgKS/9L1Oo0OXaEW
         oyyUMkyQwn6cfu51W7+83fiXsRNDfYfrGGO4hAZ1GNgOa0v4PlL2gl7XfEW+vywl+NU2
         hxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681918629; x=1684510629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2zs8Cl3Q/8Nc5DGBq8l177y3eli1Qxa+CVE/yQLN4g=;
        b=IXpnG61Ltc3FkraCTfHOpH/cWb/D/k+fXE6PEund/p2OSYsefye7Zxx/DXoyUMCvDU
         za5YvH6R+Hf6QexcmPSYr8v58PQd3SYc2/5vregmZhu8ankzR3tW9ORMLgEu6EMHEHfk
         /CzOAjr51jHSK27/Iy0Us9lj7lqok6izxm2W8x8sN6HZGMcjg/sI05Wlzgv8vBVJN1TC
         gg4wHnEzvtijnUJeDN+2LtoCEi2RXXpxGm2ldq6G8IHrFmsleuHnT+a904VHRLZ+Knr7
         TXljP/Rag8rYTQSVWapD2CBzRIeoiMp8QvRqKuVzDl5lKUrQ8YrSGLGnQFj+KDoqrq7k
         xD0w==
X-Gm-Message-State: AAQBX9f9QSAVwRT2Hx7/Gj3f+cYP8YvNBSwvhQtITUK7Wdehehy1ROMO
        XkD0vBQ08BIHcf3jwgd7TqHzQA==
X-Google-Smtp-Source: AKy350a6CZAKMunYQtEIL1vU3cHVUwEzOCejQZ/xdOoo/eBPphluKjYZ7DhVzmK48Qedkc/oVSBG8A==
X-Received: by 2002:adf:dfc3:0:b0:2d1:9ce9:2b8f with SMTP id q3-20020adfdfc3000000b002d19ce92b8fmr5190037wrn.66.1681918629112;
        Wed, 19 Apr 2023 08:37:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c18-20020a056000105200b002fe96f0b3acsm2689880wrx.63.2023.04.19.08.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 08:37:08 -0700 (PDT)
Date:   Wed, 19 Apr 2023 18:37:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] counter: rz-mtu3-cnt: Unlock on error in
 rz_mtu3_count_write()
Message-ID: <0859b9d5-c504-4f46-83ad-dcd7ada6b81b@kili.mountain>
References: <93ec19d1-3b74-4644-9f67-b88c08e79752@kili.mountain>
 <ZD/8gbcin4RQYd+A@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD/8gbcin4RQYd+A@fedora>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 19, 2023 at 10:36:49AM -0400, William Breathitt Gray wrote:
> The lock is acquired by rz_mtu3_lock_if_counter_is_valid(), so that
> function needs a sparse __acquires(&priv->lock) annotation too.

I found this bug using Smatch.  It's a competing static checker which
uses Sparse as a parser.  I am the author of Smatch so I am naturally
biased.

I don't think it's as simple as that.  I don't think Sparse has
annotations for mutexes, only for spinlocks?  Also it's really
complicated to annotate something as taking the lock on the success path
but not on the failure path.  You have to set up a wrapper and use
__cond_lock().

Every other feature in Sparse is awesome, but for locking, it's better
to just use Smatch.

regards,
dan carpenter
