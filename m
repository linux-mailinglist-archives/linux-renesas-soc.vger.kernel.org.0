Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02301BBD1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 14:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgD1MJq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Apr 2020 08:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgD1MJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Apr 2020 08:09:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8CBC03C1A9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2020 05:09:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u15so21200170ljd.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2020 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dGh86yHJzHQj1Q9JfV5v+jXns7wPEiXUhEvecwcF/no=;
        b=WUdWK5v1ZvJS76cJcd1tB/dk54DyJwxTguHa/lYgoX1fpw7A4p8/UYLfOmiprSu74g
         uUfnvfywBJOAIvp+Eiyk79D+aKSyYqI5Eu8fdg/UG1xWnNM1S8Z2nE096XxAV2fWcyaB
         kGtdleShrmApUOwufrQFF1sqETV4hIhAS7o+lW4afST1XDBVKjBuAyEg4+LDoYh5toLf
         3jSjoyoz+h+LbKkzXLjnj7I3JzwAxSbnjLIz2Fkk4ezEwDBctu1lNCh5hdi6j1HRekHs
         zXE4SEuUSvDApgN1Ei1ZYhrv9GawwVQNGACBJ3stI2lnFhmLqTnJiOLUHq7ebWAV0ZrR
         n3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dGh86yHJzHQj1Q9JfV5v+jXns7wPEiXUhEvecwcF/no=;
        b=PytHEo0905ushzX9FWKlqcRyRepP7fmI6Ze9Lan62xfkVaQ/aQl8U9MvvY2DnGugFv
         lh4jtCu9/ElFCPyHon41g+Cot21Pl8Nx5sn6MtdFeliaUTV7cCIAS5pwZ6QzOt03Uvo6
         A0YRwpfgKTEhmFZthheCu4HJ8m0ghuBoBoocVCFNAfPU2Pi1E0Ogmb52qu8fTMZC/R1n
         l45KmfUzixRX/qb5JcIKzV/m3pgzV2gbMGp2EJ6IFjYD+dLIFBwrj9tzjB7UGk42f5nC
         e3CYOZofAk28c9/BLGJxCH4EbfaYoV4kCCJSnI1eANT5kiW/g9vxVFzq8OpmOlhQ9zH7
         HOSQ==
X-Gm-Message-State: AGi0PubsEuypc2vwVUfNjdRwtHUv+JYTf6RBOTMOQbsNCMTbSpGkTMsA
        kHrRhIbSqMQmoS/HKl5KBOBvNSR2Qis=
X-Google-Smtp-Source: APiQypJTWg2O9k5BTzh6MOsyI5sbbwLXYKrzduwzg1bod7yNjhrvuH0SGz7fVBBT3wuXlallY66LnA==
X-Received: by 2002:a2e:3e15:: with SMTP id l21mr17395453lja.251.1588075784302;
        Tue, 28 Apr 2020 05:09:44 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j8sm13970024lfk.88.2020.04.28.05.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 05:09:42 -0700 (PDT)
Date:   Tue, 28 Apr 2020 14:09:42 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] v4l2-compliance: zero mbus_code
Message-ID: <20200428120942.GC1372619@oden.dyn.berto.se>
References: <5cf00351-bf5f-b347-0ab5-9ea260a7bc85@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cf00351-bf5f-b347-0ab5-9ea260a7bc85@xs4all.nl>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hans,

Thanks for your work.

On 2020-04-23 12:48:20 +0200, Hans Verkuil wrote:
> The new fmtdesc.mbus_code should be zeroed by applications.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 824769b3..269a5fd9 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -235,6 +235,7 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>  		memset(&fmtdesc, 0xff, sizeof(fmtdesc));
>  		fmtdesc.type = type;
>  		fmtdesc.index = f;
> +		fmtdesc.mbus_code = 0;
> 
>  		ret = doioctl(node, VIDIOC_ENUM_FMT, &fmtdesc);
>  		if (ret == ENOTTY)

-- 
Regards,
Niklas Söderlund
