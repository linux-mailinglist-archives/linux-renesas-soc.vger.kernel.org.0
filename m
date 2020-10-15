Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C9728FBC4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 01:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732982AbgJOXcs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 19:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732981AbgJOXcs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 19:32:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9159DC061755
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2020 16:32:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id d24so539365ljg.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2020 16:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6DCmnXHlDGFVtfy13jbIZCANYtBdPzLe/1N0g0jB9vk=;
        b=N1EeukD2MLmdyng9Rxpxl3nZ2XC+PNvxOlZrP0iVIqEmvu9yeHwmoMonhxu8z3yPJW
         gAQCavw6GKzNDx1sa5CAMdcJB9eRFhDNWaRCE8sBfOftVAG01WXIpTEccBDKq9pj8ckK
         G0MabuT2YDmKmjFk4HWQ4H+7oif8PAL/00o7ik9xVwRRWiTJpWhMyA5TIBUU8ZQF2KeT
         s1TAqXPszjD/RpkgicXH4f5Q/aNGV/jA1Q3wdPn32EqxDjebyO2Ert6wwluZBgFTaM8P
         od5Ba0JDjfMFRA/spFfL2WyCX1eW8BHCF9G5fgorQuiAqAhmlnpOMQv6yjpIveZFP2j3
         LDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6DCmnXHlDGFVtfy13jbIZCANYtBdPzLe/1N0g0jB9vk=;
        b=AXcyO0nhvi2hqYGRcznrODzmnUy+Ny7/OiuwI/G54ieB4kU3shSoDO7XoIt2UoGwAf
         g81FX1pxqSbBmx7NsiKzdSPEfvwpoubZGubwmXemsajFN+t4KqhM5uaWXKKpFjmLsBfi
         RRR4Srj6RrzSspEDWChLcrEEhz0jF6IhX9cAFAWw9pg+2qTRvQv7VMDllHwQ/SzG7Mig
         S9ZxQUnnubfy7ALUr0bDD0sXL9KuD0MJ9e07xZoR0Y8yhMn6n+BILhTdAF5h38bsfDRO
         KWyb+/y7rb1S3vHmLpq9LAWMa1PfwKDFFKSK+2zzF6Wbbi1CKaOk4i86smNCcT1zkzi/
         EiRw==
X-Gm-Message-State: AOAM5302iGcHw/0Vcp80ZedanLB3p+/0rlqwFG1X+EJXp7dEwcltB/L6
        YIBWYrppE0Q9vLy5Z/yiMUQCMA==
X-Google-Smtp-Source: ABdhPJxONpP7pLWQYnrKix/0lq1u+bF1FXJw/hOlr6FN7wMuq8mCrPfb1YznRJfYvPJdbL/Ipibzmg==
X-Received: by 2002:a2e:8ec8:: with SMTP id e8mr376930ljl.140.1602804764918;
        Thu, 15 Oct 2020 16:32:44 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id e140sm174871lfd.218.2020.10.15.16.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 16:32:44 -0700 (PDT)
Date:   Fri, 16 Oct 2020 01:32:43 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] vin-tests: Add capture script for RDACM21
Message-ID: <20201015233243.wdcv6tyd2huinrek@oden.dyn.berto.se>
References: <20200916155546.160450-1-jacopo@jmondi.org>
 <9202d9ff-b7da-730c-24a2-c4ef39cf0bb1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9202d9ff-b7da-730c-24a2-c4ef39cf0bb1@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo, Kieran,

On 2020-09-18 14:03:51 +0100, Kieran Bingham wrote:
> Hi Jacopo,
> 
> On 16/09/2020 16:55, Jacopo Mondi wrote:
> > Add script to capture from RDACM21 on Eagle V3-M.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Can we make this generic in any way with-in gmsl-yavta.sh?
> 
> Am I right in thinking only the frame size has changed in this script
> against the original?
> 
> Perhaps can we read the configuration of the sensor and just propagate
> it forwards?

It has long been in my list to rewrite this ugly hack (all of vin-tests) 
with something more competent, maybe something in python? I'm not sure 
when I would find the time tho. Maybe we could do it in steps and have 
something generate a configuration.sh file that is sourced instead 
boards.sh to setup the local environment?

If anyone plans to  work on something like this please let me know. I'm 
also fine accumulating on helper scripts like this in vin-tests as I 
think it brings value in documenting our test setups and what needs to 
be considered if/when something more modular is built to replace it.

> 
> --
> Kieran
> 
> 
> > ---
> >  gmsl-rdacm21-yavta.sh | 104 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100755 gmsl-rdacm21-yavta.sh
> > 
> > diff --git a/gmsl-rdacm21-yavta.sh b/gmsl-rdacm21-yavta.sh
> > new file mode 100755
> > index 0000000..36ba024
> > --- /dev/null
> > +++ b/gmsl-rdacm21-yavta.sh
> > @@ -0,0 +1,104 @@
> > +#!/bin/bash
> > +
> > +base=$(dirname $(readlink -f $0))
> > +
> > +source $base/scripts/vin-tests.sh
> > +source $base/scripts/boards.sh
> > +
> > +mdev=$(mc_get_mdev)
> > +
> > +out=$base/output
> > +rm -fr $out
> > +mkdir $out
> > +
> > +function conf() {
> > +    CSI="$1"
> > +    IDX="$2"
> > +    VIN="$3"
> > +
> > +    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:YUYV8_1X16/1280x1080 field:none]"
> > +    mc_set_link "$CSI" $IDX "$VIN" 1
> > +}
> > +
> > +function conf_gmsl() {
> > +	set -x
> > +	MAX9286="max9286 3-0048"
> > +
> > +    for pad in `seq 0 3`; do
> > +		media-ctl -d $mdev -V "'$MAX9286':$pad [fmt:YUYV8_1X16/1280x1080 field:none colorspace:srgb xfer:none ycbcr:601 quantization:full-range]"
> > +	done
> > +
> > +	set +x
> > +}
> > +
> > +function capture() {
> > +    VID="$1"
> > +    vid=$(eval echo \$$VID)
> > +    echo $vid
> > +
> > +    yavta -f YUYV -s 1280x1080 -c10 --skip 7 --file="$out/$VID-#.bin" /dev/$vid &
> > +}
> > +
> > +mc_reset
> > +
> > +# Need to configure all formats going through each MAX9286
> > +conf1234=0
> > +conf5678=0
> > +
> > +for cam in "$@"; do
> > +	case $cam in
> > +        1|2|3|4)
> > +            if [[ $conf1234 -ne 1 ]]; then
> > +                conf  "$csi40name" 1 "$vinname0"
> > +                conf  "$csi40name" 2 "$vinname1"
> > +                conf  "$csi40name" 3 "$vinname2"
> > +                conf  "$csi40name" 4 "$vinname3"
> > +                conf1234=1
> > +            fi
> > +            ;;
> > +        5|6|7|8)
> > +            if [[ $conf5678 -ne 1 ]]; then
> > +                conf  "$csi41name" 1 "$vinname4"
> > +                conf  "$csi41name" 2 "$vinname5"
> > +                conf  "$csi41name" 3 "$vinname6"
> > +                conf  "$csi41name" 4 "$vinname7"
> > +                conf5678=1
> > +            fi
> > +            ;;
> > +	    *)
> > +		echo "Unrecognised camera $cam"
> > +		;;
> > +	esac
> > +done
> > +
> > +conf_gmsl
> > +
> > +for cam in "$@"
> > +do
> > +	echo "Capturing camera $cam"
> > +	case $cam in
> > +	    1)	capture vin0 ;;
> > +	    2)	capture vin1 ;;
> > +	    3)	capture vin2 ;;
> > +	    4)	capture vin3 ;;
> > +
> > +	    5)	capture vin4 ;;
> > +	    6)	capture vin5 ;;
> > +	    7)	capture vin6 ;;
> > +	    8)	capture vin7 ;;
> > +
> > +	    *)
> > +		echo "Unrecognised camera $cam"
> > +		;;
> > +	esac
> > +done;
> > +
> > +wait
> > +
> > +for f in $out/*bin; do
> > +    name=$(basename $f .bin)
> > +    raw2rgbpnm -f YUYV -s 1280x1080 $out/$name.bin $out/$name.ppm
> > +    convert $out/$name.ppm $out/$name.png
> > +done
> > +
> > +convert $out/vin*-000007.png -background white -append $out/collage.png
> > --
> > 2.28.0
> > 
> 

-- 
Regards,
Niklas Söderlund
