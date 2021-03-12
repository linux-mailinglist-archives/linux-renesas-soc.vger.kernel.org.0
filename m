Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C5C33905B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 15:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhCLOwO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 09:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhCLOwN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 09:52:13 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5BBC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 06:52:13 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id v2so33153615lft.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hlEw1Xot5u2w1fN40js7k7EDbK0sTmplIEEflk8aU0Q=;
        b=cnzCQ/jxU7qf2PPfmYs7LqkhRlFklYmkHiDvmnW4ujY9pSwva+neQVJIo4VEFZS5qB
         U2NIROtas0BzlHEl61CR2cSREwuZ7CPf6twCCEwnX9FYOHn2qv/HMrYiCcML82ISRvm5
         v77/ayZdDB7Ue7t4MffqN3MC4iGoo7B/IG9950nG5qaI+Nu+FHs9vwi1hoD9S/EwUO+/
         zI12OxGpryJPaYVbFKVS7j7DBBVuAD4Xhk2zCGbj+gAXLzHNITDmsEV2U4lnQ3xuMNcO
         aFpoKV6lpAyf4l+3RjtyEb81dF4kBjbN16WPAr47xxDTjiDRGrB2mrmh5cHZqvHF1PYU
         Btrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hlEw1Xot5u2w1fN40js7k7EDbK0sTmplIEEflk8aU0Q=;
        b=gW9FzSpQofxPfjMMJhdGLx7uBrMs38l3XdGR/PBKuej1XVXyKl37i4OEbdotJnI86+
         xkNtxQ2UQBAIxrZ7cUcODzr5WFsdmD1bm0yC2FJnugmSkEQmtiRFt02iQUwtBD5ahJSr
         E7UMeQ6iRrXe4iti0H20hWBSAmZFzbI+5UJoAxrw0lbYZVMGiFDqKGuX6AxoROIrxr75
         O+KruZgOaJSM4yt8E8hFAVRiyJXgeG/O1iO3uPS4dDXpEgXVBQO7APobqKWFIhNS88iP
         3Km37vAQwAvowR6ZJmCsLAX36znM8FXcQmkdh17Q+5QdT3diKydbxtbdTwqDae5zEq9U
         Z5LQ==
X-Gm-Message-State: AOAM5337miIS4LcFF3hl93Qp0kmlLJJbi250C4Y7YUmjvRlQVw2cuAWQ
        1f1JLP+3je0YLgIY02WSf1CqCg==
X-Google-Smtp-Source: ABdhPJwgDGL72PQtOx4n699k2fW6gFapgUeT52bAdk5MIng5cH5PL4LKjVVugwhaH7Mhrq0HZOr74A==
X-Received: by 2002:a05:6512:31c9:: with SMTP id j9mr5706252lfe.185.1615560731604;
        Fri, 12 Mar 2021 06:52:11 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id p21sm1742806lfu.227.2021.03.12.06.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 06:52:11 -0800 (PST)
Date:   Fri, 12 Mar 2021 15:52:10 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>, mani@kernel.org
Subject: Re: Renesas RZ/G2M + Sony IMX290 Camera questions/issues
Message-ID: <YEuAGoeoi0X0KwfH@oden.dyn.berto.se>
References: <CAHCN7xJUnMP-uA03a5x4djp4_RPbiMnSWXMdconpAxV7pwgTGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJUnMP-uA03a5x4djp4_RPbiMnSWXMdconpAxV7pwgTGw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

There are many possibility's that result in an -EPIPE when validating 
formats and unfortunately V4L2 is not always as very helpfull when 
diagnosing the problem. What I usually do is to,

1. Inspect rvin_mc_validate_format() in 
   drivers/media/platform/rcar-vin/rcar-dma.c

   This will give you a clear view of how the format between the CSI-2 
   and VIN is validated.

2. Increase the log level for drivers/media/v4l2-core/v4l2-subdev.c 
   specially for v4l2_subdev_link_validate_default().

   This will give you insight into all formats from the CSI-2 receiver 
   towards the camera.

By doing these two things you will see in the system log which part of 
the format validation that is missmatched.

There is also a wiki page for capture using R-Car VIN that may be 
helpful for you.

    https://elinux.org/R-Car/Tests:rcar-vin

On 2021-03-12 08:28:41 -0600, Adam Ford wrote:
> I have an IMX290 camera connected to an RZ/G2M SoC via the 4-channel CSI.
> 
> &csi40 {
>     status = "okay";
> 
>     ports {
>         port@0 {
>             reg = <0>;
>             csi40_in: endpoint {
>                 clock-lanes = <0>;
>                 data-lanes = <1 2 3 4>;
>                 remote-endpoint = <&imx290_ep>;
>             };
>         };
>     };
> };
> 
> On the I2C bus, I have
> 
> imx290: camera-sensor@1a {
>     compatible = "sony,imx290";
>     reg = <0x1a>;
>     reset-gpios = <&gpio_exp2 0 GPIO_ACTIVE_LOW>;
>     clocks = <&versaclock6_bb 1>;
>     clock-names = "xclk";
>     clock-frequency = <37125000>;
>     vdddo-supply = <&reg_cam0_en0>;
>     vdda-supply = <&reg_cam0_en1>;
>     vddd-supply = <&reg_cam0_en0>;
> 
>     port {
>         imx290_ep: endpoint {
>             data-lanes = <1 2 3 4>;
>             link-frequencies = /bits/ 64 <148500000 222750000>;
>             remote-endpoint = <&csi40_in>;
>         };
>     };
> };
> 
> I configure the pipeline with:
> 
> media-ctl -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN0 output':0[1]"
> 
> I also have tried configuring the video formats in several different ways
> 
> media-ctl --set-v4l2 "'imx290 2-001a':0[fmt:SRGGB12_1X12/1920x1080 field:none]"
> media-ctl --set-v4l2 "'rcar_csi2
> feaa0000.csi2':0[fmt:SRGGB12_1X12/1920x1080 field:none]"
> media-ctl --set-v4l2 "'rcar_csi2
> feaa0000.csi2':1[fmt:SRGGB12_1X12/1920x1080 field:none]"
> 
> or
> 
> media-ctl --set-v4l2 "'rcar_csi2
> feaa0000.csi2':0[fmt:UYVY8_2X8/1920x1080 field:none]"
> media-ctl --set-v4l2 "'rcar_csi2
> feaa0000.csi2':1[fmt:UYVY8_2X8/1920x1080 field:none]"
> media-ctl --set-v4l2 "'imx290 2-001a':0[fmt:UYVY8_2X8/1920x1080 field:non
> 
> but no matter what I do when I attempt to stream, I get a broken pipe,
> even when I use fakesink as the target.
> 
> root@beacon-rzg2h:~# GST_DEBUG=2 gst-launch-1.0 -v v4l2src
> device=/dev/video1 ! video/x-raw,width=1920,height=1080 ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> 0:00:03.727500390   501     0x10efd4f0 ERROR                v4l2src
> gstv4l2src.c:337:gst_v4l2src_get_input_size_info:<v4l2src0> Cropcap
> fail, CROPCAP has not supported
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
> video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
> framerate=(fraction)100/1, interlace-mode=(s1
> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =
> video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
> framerate=(fraction)100/1, interlace-m1
> /GstPipeline:pipeline0/GstFakeSink:fakesink0.GstPad:sink: caps =
> video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
> framerate=(fraction)100/1, interlace-mode1
> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =
> video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
> framerate=(fraction)100/1, interlace-1
> 0:00:03.737388309   501     0x10efd4f0 WARN          v4l2bufferpool
> gstv4l2bufferpool.c:870:gst_v4l2_buffer_pool_start:<v4l2src0:pool:src>
> Uncertain or not enough buffers, enad
> 0:00:03.740266641   501     0x10efd4f0 ERROR         v4l2bufferpool
> gstv4l2bufferpool.c:757:gst_v4l2_buffer_pool_streamon:<v4l2src0:pool:src>
> error with STREAMON 32 (Broken pi)
> 0:00:03.740474842   501     0x10efd4f0 WARN          v4l2bufferpool
> gstv4l2bufferpool.c:1188:gst_v4l2_buffer_pool_poll:<v4l2src0> error:
> poll error 1: Broken pipe (32)
> 0:00:03.740693123   501     0x10efd4f0 WARN                 v4l2src
> gstv4l2src.c:1020:gst_v4l2src_create:<v4l2src0> error: Failed to
> allocate a buffer
> 0:00:03.740791643   501     0x10efd4f0 WARN                 basesrc
> gstbasesrc.c:2939:gst_base_src_loop:<v4l2src0> error: Internal data
> stream error.
> 0:00:03.740822843   501     0x10efd4f0 WARN                 basesrc
> gstbasesrc.c:2939:gst_base_src_loop:<v4l2src0> error: streaming
> stopped, reason error (-5)
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Could
> not read from resource.
> Additional debug info:
> ../../../git/sys/v4l2/gstv4l2bufferpool.c(1188):
> gst_v4l2_buffer_pool_poll ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> poll error 1: Broken pipe (32)
> Execution ended after 0:00:00.013644415
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> 0:00:03.741392965   501     0x10ec96c0 WARN          v4l2bufferpool
> gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> some buffers are still outstanding
> 0:00:03.741428005   501     0x10ec96c0 WARN              bufferpool
> gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> stop failed
> 0:00:03.743868095   501     0x10ec96c0 ERROR         v4l2bufferpool
> gstv4l2bufferpool.c:757:gst_v4l2_buffer_pool_streamon:<v4l2src0:pool:src>
> error with STREAMON 32 (Broken pi)
> 0:00:03.744090576   501     0x10ec96c0 WARN          v4l2bufferpool
> gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> some buffers are still outstanding
> 0:00:03.744123936   501     0x10ec96c0 WARN              bufferpool
> gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> stop failed
> 0:00:03.744152376   501     0x10ec96c0 WARN          v4l2bufferpool
> gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> some buffers are still outstanding
> 0:00:03.744178296   501     0x10ec96c0 WARN              bufferpool
> gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> stop failed
> Setting pipeline to NULL ...
> Total time: 0.013650 seconds
> Freeing pipeline ...
> 
> 
> I was hoping someone might have a suggestion as to what I might be missing.
> Ideally, I'd like to get two IMX290 cameras operational with one in
> 4-lane mode and one in 2-lane mode.
> 
> Might anyone have any suggestions?  According to the media-ctl
> --print-dot, the pipeline appears correct, but there is clearly
> something I am missing.
> 
> thanks for any suggestions,
> 
> adam

-- 
Regards,
Niklas S�derlund
