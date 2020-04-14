Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1351A8B1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2020 21:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505028AbgDNTkD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 15:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505033AbgDNTjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 15:39:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDF2C0610D5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2020 12:39:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id m19so688808lfq.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2020 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qRs5i4iVAKA4TTRujU3GhWk99mVzfuZXxL+8IzLaq00=;
        b=HP4M9PaOeDZ5Rjcv9V2eDLSMU9Szdx7xY7b2n7tP7awEgqgz0TeBMaAZDXXw5N1MV+
         hmsV+bZUVJAXt+2gd5lV3+jiG1SW/bbEl8TzRqf68raINWJVdyvtFGThXpgC1p+Ltyi6
         +AGpE1Kkqct7VoUWSG4Rjk/ONitbFKHLBgHZWdvSsGFi1YJGExzK/gw1EdWCBhndMWOq
         6Av4TdtSr5NKtYFuVm9faWi3WZvh+7DgA3PKD69Q+cCA1sK5hkmUX9B2UlcO4NlSXFaq
         C8FyPMiO21Q+jGqFKDOZ6Gc0IJJX9toSqlxac4rzoxD2aMEiiincaZUqKyinoWN+Mycy
         Y88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qRs5i4iVAKA4TTRujU3GhWk99mVzfuZXxL+8IzLaq00=;
        b=HgRK6WcVNBx84edHdK9oDctyNnnkXYAE6lL31IkDnpcf1NSRIXqLYTfOuXxieh2oYE
         YXXmQLKwFTmKzrnPu46QXd6p3+lVEsDVayt+D1soYKVcBdt6CpGvaJUGcmBXLYUhBPdJ
         wUgoVR9G4av8GqLQ2Pxm6NN1UtUVbtPooeMoq1W7TecNnmXnlwmS2eZHcnrIeG9tTRBR
         y4Grepy/6iTCknbIF6Fk7t38Z6Ey06ORG0PD8JYYgIOBExZsYjXKDu4o9YAdCO+Qh28u
         UnH4ESsHCx93sliJrX8G0I2cWW+oZ49gg+8SVRtMm5XeNVzqEvJG6nBIxyS3ORsL8wGH
         hj7Q==
X-Gm-Message-State: AGi0PuZVf316+5SWzlDvuxmK/z9R5L4N1qOGhBU8yae+RE+4aMEuucGj
        F2KvzO1X3YFv4vFmVVS5xGGtcQ==
X-Google-Smtp-Source: APiQypI+s5n9rB+qwjmjZHIypmy+J644bf/a7w1c+pOeelNxSUe1AtB3mEv6uQTT+cLbbQwbQY9Crg==
X-Received: by 2002:a19:6b03:: with SMTP id d3mr798341lfa.209.1586893189426;
        Tue, 14 Apr 2020 12:39:49 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 6sm10989254lfy.97.2020.04.14.12.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 12:39:48 -0700 (PDT)
Date:   Tue, 14 Apr 2020 21:39:48 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Message-ID: <20200414193948.GA350588@oden.dyn.berto.se>
References: <1583838364-12932-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200310124605.GO2975348@oden.dyn.berto.se>
 <OSBPR01MB35905FFB621C2F4222692832AAFF0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200310140625.GA88560@oden.dyn.berto.se>
 <CA+V-a8vsYGdx6AtgqwS0LXREn4hu-EjVh2D5Dp_rHmpazBYG5A@mail.gmail.com>
 <20200319150329.GB3192108@oden.dyn.berto.se>
 <CA+V-a8u8=H-6WfaYMLWH73zo5ehP8cu9D-tdGULk=Hkvq4KuAQ@mail.gmail.com>
 <20200330120745.GA3213219@oden.dyn.berto.se>
 <CA+V-a8vbTc0DZ15y0zZ97PH6khwQVxz=M-8_kgx1AiKkdg5QaA@mail.gmail.com>
 <20200407095620.GA1716317@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200407095620.GA1716317@oden.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

I spent all day playing with different solutions to how to move forward 
with this. My main problem is I have no setup where I can produce RAW 
image formats to test. But reading the datasheet I see the problem you 
are trying to solve.

I think for now the best solution might be to in rvin_crop_scale_comp() 
add a check for if the pixelformat is RAW and cut the value written to 
VNIS_REG in half. The bpp for the format shall still be set to 1.


    fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
    stride = vin->format.bytesperline / fmt->bpp;

    if (vin->format.pixelformat == V4L2_PIX_FMT_SRGGB8)
        stride /= 2;

    rvin_write(vin, stride, VNIS_REG);

I would also add a nice big comment above the if () that explains why 
the stride is cut in half for raw.

On 2020-04-07 11:56:23 +0200, Niklas wrote:
> Hi Lad,
> 
> On 2020-04-06 18:20:33 +0100, Lad, Prabhakar wrote:
> > Did you manage to get the required information on this ?
> 
> I'm still working on it, sorry for not completing it last week. I will 
> let you know as soon as I can.
> 
> -- 
> Regards,
> Niklas Söderlund

-- 
Regards,
Niklas Söderlund
