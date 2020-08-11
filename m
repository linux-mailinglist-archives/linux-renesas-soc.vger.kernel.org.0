Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6302418CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 11:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbgHKJWj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 05:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbgHKJWj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 05:22:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5100C061787
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2020 02:22:38 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a14so10791132wra.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2020 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w64oVDD5gdf7Qw0VtBt9S+2PP1vnTe6g0uPYYCqYgyE=;
        b=PNWhmOLKV7K6Fo7G0zQe2MW7DlRtBjrIF20cAwk8+IDodtpdQZBhq0E7+2wR1Gj45Y
         lpLkj2VXumRbfPixy4WehOgocK3LVetgkauMWBTLO/ErgzGT6yqi5jkIfR7N+z1OMZs9
         eG26M9dUUewJ39DaBm6onl2Jbinnt9waqwTJH+4F0VX9wuJN8r3DfUKyg3+i7cy7XE/c
         uq+ScJIgOFda7Eq90zf/grOPArgS7yLfDCsUJKDRc7my2urYuQrRVJVL6Co49+B+b9vY
         DnjQ1JdG5ww1Lf2Ryt7jBFaicMHYh3zYjyxuRJRy7NKelHSKs3rmUOkywe5Dyc+VfERx
         Qsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w64oVDD5gdf7Qw0VtBt9S+2PP1vnTe6g0uPYYCqYgyE=;
        b=h4heS4oO8Qu+YuEKk+FqX9YZKR+hwnz1Vk4iZqLnJjsEoMKtJtWkQUXJJbQmDkroPr
         XfQCch7c71wqNxmD7E1F2+4UTD2WJlugieixZB6lUyBu/hO4RAo1XXYNA4Edl/AMUpYZ
         JdRJAEU6/Al5P6tBAJiLAb05tf41pytHSMHaUc9kSn7v4+CNCI3ATj8yh0Foa2s+woHH
         jZqYCcQlTNUVH6tf5gWyThMmu4o+N5ZEl7/loEIDxG7DDIcLfvSttFAQQAMRVUPDP8Kj
         hbawgaFJTM4HORljwb514DsDWW2oRIvjh44rzUHev77qRiZsabQhnhXZH5V5C0H7RLWZ
         fCHA==
X-Gm-Message-State: AOAM532fUS8+aVt6mTKdmi2tV3/7eyjujTAfZqlYQ7ab8FKxDqL3Z4Yv
        Puv9mSI4D25gMU7YAm55T+5a7YvCqxNpfbOD5h88+w==
X-Google-Smtp-Source: ABdhPJxaiIP5JzOlZwg7fT24TWAQ4pFHHAZdvKBm+k8d3C7DP4bFD6gpNXC+E72Yewf4zubx1kzQJQ2c1ZI6KwRJQ88=
X-Received: by 2002:a5d:5383:: with SMTP id d3mr5274204wrv.42.1597137757402;
 Tue, 11 Aug 2020 02:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200810215543.113206-1-jacopo+renesas@jmondi.org> <20200810215543.113206-5-jacopo+renesas@jmondi.org>
In-Reply-To: <20200810215543.113206-5-jacopo+renesas@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 11 Aug 2020 10:22:21 +0100
Message-ID: <CAPY8ntAX+W2Hpv4tVouWe2WR9d=5ob-cyjbzfGiWiN5GH_Z8Fg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] media: MAINTAINERS: ov5647: Replace maintainer
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 10 Aug 2020 at 22:52, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>
> Since the current maintainer email address bounces back, replace
> the entry and make myself and Dave Stevenson maintainers of the driver.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21e6c3120152..6a9d87282578 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12625,7 +12625,8 @@ T:      git git://linuxtv.org/media_tree.git
>  F:     drivers/media/i2c/ov5640.c
>
>  OMNIVISION OV5647 SENSOR DRIVER
> -M:     Luis Oliveira <lolivei@synopsys.com>
> +M:     Dave Stevenson <dave.stevenson@raspberrypi.com>
> +M:     Jacopo Mondi <jacopo@jmondi.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git
> --
> 2.27.0
>
