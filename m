Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497DF20FF6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 23:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgF3Vs4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 17:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728308AbgF3Vs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 17:48:56 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E9BC03E979
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 14:48:55 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id m26so12310870lfo.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Jm1jEr9MLNh0iwu6xOCQxX50sDT2pwTDrdwoFLoZlas=;
        b=EEs4eSixnt3LdF6NEVvLSKXpWpgLxOqtNH7aVll6BMEvkkFF1OwFuq8h7TilXIWtaY
         /Ur/aOVX1b4hk7athFcr0r0A6Lsf/QEiGPWlPmP8fqpixX0zAJ9tm5HDGnN2HjMPd6Bl
         adOtwDKs4bQ38Mtpo8+7YdmViCKOPzTBGcaeRtRrMkqQVXI3BajxnaizeHuwckoWfX7F
         fK9lINPKQrEIeHEq3bRsLMvZbu+nxaBgl9S1IdSh6jqwTJF0aEm1nJuuDZjSbMADTrha
         2rxp+4p7frxpU56LxgIPUVnNPLq7t7PYnnqBrCuAFKBCQ0RDfPYk12F+9oqw/VVUnIua
         vpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Jm1jEr9MLNh0iwu6xOCQxX50sDT2pwTDrdwoFLoZlas=;
        b=oMwuLWq6wJlXZw/Q60FWoUJ+G1YrPWI0jm5IsKzdQr9LUArEdRkutO/amgb953Z2vc
         yWOurZM3umHE+Wm/u0DLbbVh+/xTx+QRVmBkOFXBLV6nYEdsZkI998lyrz/VHzKspKhR
         TRxUeSyRLw5wp+XWkiq5uXR+Az4YAhRir379vawdkJY3rIh5iVQiz3pgX1AqMVH88ZSp
         LP46YjxmZy2+FYu2Vf0kglytfh5Cvqz8pbxE8AG4ni90wnUwTbFPPV4Qh/d8XE92FcWj
         fqNgC5TmcbIanEECTKFmh371sJy5GnKpLnrjkfIDdCdXQVXf0QPHhHvYCs5HZChHF/yV
         B+EA==
X-Gm-Message-State: AOAM532lFKnyuacD9VNlpYSqteOCq+t5oZFnRRcKT1m5pvWX7L4YKyZv
        ewsoGJBCl4z1Ur+ybROEkI30H60Ewrg=
X-Google-Smtp-Source: ABdhPJw7IQehrrrPHyMcohEA5LINdzv8/cxXHnQz/bbQNI1sb+axgmmTHyzAzfloEx+dzLeaOxiPBA==
X-Received: by 2002:ac2:5e29:: with SMTP id o9mr12699995lfg.196.1593553734135;
        Tue, 30 Jun 2020 14:48:54 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id q13sm1243830lfb.55.2020.06.30.14.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:48:53 -0700 (PDT)
Date:   Tue, 30 Jun 2020 23:48:52 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 0/3] media: v4l2-async: Accept endpoints and devices
 for fwnode matching
Message-ID: <20200630214852.GI2365286@oden.dyn.berto.se>
References: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for keep continued work on this.

For the whole series,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

On 2020-06-21 03:00:25 +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series is the third version of fwnode endpoint matching
> support in v4l2-async. The secon version can be found at [1].
> 
> Compared to v2, review comments have been incorporated, patch 4/4 got
> squashed in 1/4 (now 1/3), and the code has been rebased on top of
> v5.8-rc1.
> 
> Sakari, is they way that patch 1/3 determines if a fwnode is an endpoint
> acceptable for you (and for ACPI) ?
> 
> [1] https://lore.kernel.org/linux-media/20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com
> 
> Laurent Pinchart (3):
>   media: v4l2-async: Accept endpoints and devices for fwnode matching
>   media: v4l2-async: Pass notifier pointer to match functions
>   media: v4l2-async: Log message in case of heterogeneous fwnode match
> 
>  drivers/media/v4l2-core/v4l2-async.c | 85 +++++++++++++++++++++++++---
>  1 file changed, 77 insertions(+), 8 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
