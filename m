Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9898576F3A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 21:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjHCTst (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 15:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjHCTss (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 15:48:48 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D9E273A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Aug 2023 12:48:37 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9a2033978so21532861fa.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Aug 2023 12:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1691092115; x=1691696915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7RavCZaOPDwL16SmZAwND6YT5Gjm/jHSJPLs+Fz01M=;
        b=zCM/TAo7Jx2wU0k+b/XTTp0NzbDDvI3nTi3zkPvW2vP2s8tg5WpZ0zSpHbKDXaOQKp
         Z/Z6POoPyaZq6UqoxCEhUFCMXscPn1LsUztXXukya2gVor7DA5V8QBxs5J9kqXLfcPXN
         q8z3pX3M6Yba5jauyoCL205Y2x9jjYV/uzJaiWY8FkQNP9rnteMNX8FN+aXmyc0u2YN9
         VFDp38L8UOmSyyB3R7nQpFqyGTSs+iX5abHLG6XldBNO/eeUHEZnbjxjoZeTt/IpmVTY
         Ukl4XUF2z/Rgs9/0iKV+SrlgCK1n32QIabJI6hbQBAJ4Rtg3liYEDP2jy7uVQOv3RVpN
         7hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691092115; x=1691696915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7RavCZaOPDwL16SmZAwND6YT5Gjm/jHSJPLs+Fz01M=;
        b=Zf+cYfZ+hHvOxPLmAuXYot2Wv/s8SnhQdsxaFYreqOpFM979fzYgN0Hvc4qyj2rbWJ
         ym6eqgg7UCFHrBz6oxgt2yNDaa/FnrtGvOhF4w5aMMt89UfXwNALbGx8kXOFT+w6eYHb
         mvdpuBEkDlTCwrSnz6N5RjE2Vo8ZbrrfPY0hZjhFREd9o1gTP724KB/H0dL667dRsMpR
         oWhyb6uSqv+5FxJ672ifkDT/WXzjfKmBNVkq7Xd3bsMjO3h0+RbGBwse3GceHaQzi1fY
         QS6wyc+bXALXafwg3Db2YC4yKqRM6a6PHH+sLpry7xXrO9Gcr/MtLc4owfE2D9PmHOo6
         YKwA==
X-Gm-Message-State: ABy/qLZvR2zjzuEuTAVJquzrIpmKDwh5LswGF9jRY2Rj1aSnShIcgdtT
        /QInvTCViWKQRRvnaRNqi7nl+g==
X-Google-Smtp-Source: APBJJlGr+fqW/4srT5C+9tYUdBGhMx4PnovCOePBRG9QiO13v6bQFJ/Jxuc6mvXH7UCglebqCNGGrg==
X-Received: by 2002:a2e:94d0:0:b0:2b9:54e1:6711 with SMTP id r16-20020a2e94d0000000b002b954e16711mr8229168ljh.7.1691092115437;
        Thu, 03 Aug 2023 12:48:35 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id r19-20020a2e9953000000b002b6cdbd9e35sm96138ljj.55.2023.08.03.12.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 12:48:34 -0700 (PDT)
Date:   Thu, 3 Aug 2023 21:48:34 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] media: rcar-csi2: Add support for C-PHY on R-Car V4H
Message-ID: <ZMwEktpQeverQJbK@oden.dyn.berto.se>
References: <20230715201239.29014-1-niklas.soderlund+renesas@ragnatech.se>
 <ZMVwhYmXkubetq8p@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMVwhYmXkubetq8p@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hej Sakari,

On 2023-07-29 20:03:17 +0000, Sakari Ailus wrote:
> Hejssan Niklas,
> 
> On Sat, Jul 15, 2023 at 10:12:39PM +0200, Niklas Söderlund wrote:
> > Add support for C-PHY on R-Car V4H. While the V4H supports both D-PHY
> > and C-PHY this patch only adds support for the C-PHY mode due to lack of
> > documentation and hardware to test on.
> > 
> > The V4H is the first Gen4 device that is enabled in the rcar-csi2
> > driver. There is much overlap with the Gen3 driver, the primary
> > difference is in how the receiver is started. The V4H have a much larger
> > register space and some addresses overlap with Gen3.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> I've made this change to the patch, it won't build otherwise (arm arch):

Super, thanks a bunch! Sorry I did not test this.

> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> index 99d190a9e637..f6326df0b09b 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> @@ -756,7 +756,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  
>  	/* Adjust for C-PHY, divide by 2.8. */
>  	if (priv->cphy)
> -		mbps = (mbps * 5) / 14;
> +		mbps = div_u64(mbps * 5, 14);
>  
>  	return mbps;
>  }
> 
> -- 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund
