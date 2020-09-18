Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A861826FDC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 15:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgIRND5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 09:03:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36428 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgIRND5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 09:03:57 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 870EB2D7;
        Fri, 18 Sep 2020 15:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600434234;
        bh=EjqwCK1P9Sz+F9XyngWp7Jnlxke0XqFINDtA6Mi0UXI=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=KE5EifBFVjMhxjpv2HG0ymKy6mYaa6QqB7hnt4rvCDt1CwMzEBgv9Tas44A6nI/C5
         OUjjsLgQRIT64KKopmQzYHoE2Ji9fLxRghHoOpMU6ADJr1FDHDmWN5aZsaKJa1pe+f
         oXPkH8vbRBFqaBTfO/rLauqx/VMy2+zre6fgTq4U=
Subject: Re: [PATCH] vin-tests: Add capture script for RDACM21
To:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200916155546.160450-1-jacopo@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <9202d9ff-b7da-730c-24a2-c4ef39cf0bb1@ideasonboard.com>
Date:   Fri, 18 Sep 2020 14:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916155546.160450-1-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 16/09/2020 16:55, Jacopo Mondi wrote:
> Add script to capture from RDACM21 on Eagle V3-M.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Can we make this generic in any way with-in gmsl-yavta.sh?

Am I right in thinking only the frame size has changed in this script
against the original?

Perhaps can we read the configuration of the sensor and just propagate
it forwards?

--
Kieran


> ---
>  gmsl-rdacm21-yavta.sh | 104 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100755 gmsl-rdacm21-yavta.sh
> 
> diff --git a/gmsl-rdacm21-yavta.sh b/gmsl-rdacm21-yavta.sh
> new file mode 100755
> index 0000000..36ba024
> --- /dev/null
> +++ b/gmsl-rdacm21-yavta.sh
> @@ -0,0 +1,104 @@
> +#!/bin/bash
> +
> +base=$(dirname $(readlink -f $0))
> +
> +source $base/scripts/vin-tests.sh
> +source $base/scripts/boards.sh
> +
> +mdev=$(mc_get_mdev)
> +
> +out=$base/output
> +rm -fr $out
> +mkdir $out
> +
> +function conf() {
> +    CSI="$1"
> +    IDX="$2"
> +    VIN="$3"
> +
> +    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:YUYV8_1X16/1280x1080 field:none]"
> +    mc_set_link "$CSI" $IDX "$VIN" 1
> +}
> +
> +function conf_gmsl() {
> +	set -x
> +	MAX9286="max9286 3-0048"
> +
> +    for pad in `seq 0 3`; do
> +		media-ctl -d $mdev -V "'$MAX9286':$pad [fmt:YUYV8_1X16/1280x1080 field:none colorspace:srgb xfer:none ycbcr:601 quantization:full-range]"
> +	done
> +
> +	set +x
> +}
> +
> +function capture() {
> +    VID="$1"
> +    vid=$(eval echo \$$VID)
> +    echo $vid
> +
> +    yavta -f YUYV -s 1280x1080 -c10 --skip 7 --file="$out/$VID-#.bin" /dev/$vid &
> +}
> +
> +mc_reset
> +
> +# Need to configure all formats going through each MAX9286
> +conf1234=0
> +conf5678=0
> +
> +for cam in "$@"; do
> +	case $cam in
> +        1|2|3|4)
> +            if [[ $conf1234 -ne 1 ]]; then
> +                conf  "$csi40name" 1 "$vinname0"
> +                conf  "$csi40name" 2 "$vinname1"
> +                conf  "$csi40name" 3 "$vinname2"
> +                conf  "$csi40name" 4 "$vinname3"
> +                conf1234=1
> +            fi
> +            ;;
> +        5|6|7|8)
> +            if [[ $conf5678 -ne 1 ]]; then
> +                conf  "$csi41name" 1 "$vinname4"
> +                conf  "$csi41name" 2 "$vinname5"
> +                conf  "$csi41name" 3 "$vinname6"
> +                conf  "$csi41name" 4 "$vinname7"
> +                conf5678=1
> +            fi
> +            ;;
> +	    *)
> +		echo "Unrecognised camera $cam"
> +		;;
> +	esac
> +done
> +
> +conf_gmsl
> +
> +for cam in "$@"
> +do
> +	echo "Capturing camera $cam"
> +	case $cam in
> +	    1)	capture vin0 ;;
> +	    2)	capture vin1 ;;
> +	    3)	capture vin2 ;;
> +	    4)	capture vin3 ;;
> +
> +	    5)	capture vin4 ;;
> +	    6)	capture vin5 ;;
> +	    7)	capture vin6 ;;
> +	    8)	capture vin7 ;;
> +
> +	    *)
> +		echo "Unrecognised camera $cam"
> +		;;
> +	esac
> +done;
> +
> +wait
> +
> +for f in $out/*bin; do
> +    name=$(basename $f .bin)
> +    raw2rgbpnm -f YUYV -s 1280x1080 $out/$name.bin $out/$name.ppm
> +    convert $out/$name.ppm $out/$name.png
> +done
> +
> +convert $out/vin*-000007.png -background white -append $out/collage.png
> --
> 2.28.0
> 

