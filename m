Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4330F1F095A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 04:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbgFGCbp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Jun 2020 22:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728887AbgFGCbp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jun 2020 22:31:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAB4C08C5C2
        for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Jun 2020 19:31:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ED5C2C9;
        Sun,  7 Jun 2020 04:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591497103;
        bh=k6GUkAiVWnx1R+MY998+a9ktYfpmTRgrQ8gsymV4gSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z1Q4WbmaVKgFMpncihwQuMIDAI5cTMn9kc/bOEHYT5oS3hryM4cBmpjMDPTKqn7sR
         MMdg5V84NPR7i1JKM2LkqgrMzJuGl/ZsLdrztUZ+3OfHbyCgMNuw25x3Gzqo0wAF3O
         7L/qruWD024i7uwGTbJrFoFvHjCxYBPqUG9a7FSU=
Date:   Sun, 7 Jun 2020 05:31:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [VSP-Tests PATCH] tests: Provide {un,}bind testing
Message-ID: <20200607023124.GB7339@pendragon.ideasonboard.com>
References: <d4544b1b-a695-bd70-0ccb-e2fb1838f3f8@ideasonboard.com>
 <20200525132148.3454488-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200525132148.3454488-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Mon, May 25, 2020 at 02:21:48PM +0100, Kieran Bingham wrote:
> Perform unbind-bind testing of the VSP devices to validate
> successful removal of the drivers.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  tests/vsp-unit-test-0026.sh | 63 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0026.sh
> 
> diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
> new file mode 100755
> index 000000000000..86c523a65651
> --- /dev/null
> +++ b/tests/vsp-unit-test-0026.sh
> @@ -0,0 +1,63 @@
> +#!/bin/sh
> +
> +#
> +# Test unbinding and binding all VSP1 devices, performing a simple
> +# copy test to validate the hardware afterwards.
> +#
> +
> +. ./vsp-lib.sh
> +
> +features="rpf.0 wpf.0"
> +
> +vsp1_driver=/sys/bus/platform/drivers/vsp1
> +vsps=$(cd /sys/bus/platform/devices/; ls | grep vsp)
> +
> +unbind_vsp() {
> +	echo $1 > $vsp1_driver/unbind
> +}
> +
> +bind_vsp() {
> +	echo $1 > $vsp1_driver/bind
> +}
> +
> +# Input is directly copied to the output. No change in format or size.
> +test_copy() {
> +	local format=$1
> +	local insize=$2
> +
> +	test_start "simple hardware validation after unbind/bind cycles"
> +
> +	pipe_configure rpf-wpf 0 0
> +	format_configure rpf-wpf 0 0 $format $insize $format
> +
> +	vsp_runner rpf.0 &
> +	vsp_runner wpf.0
> +
> +	local result=$(compare_frames)
> +
> +	test_complete $result
> +}
> +
> +test_main() {
> +	local format
> +
> +	# Unbind and rebind individually
> +	for v in $vsps; do
> +		unbind_vsp $v;
> +		bind_vsp $v;

No need for the ; at the end of those two lines.

> +	done
> +
> +	# Unbind, then rebind all VSPs at once
> +	for v in $vsps; do
> +		unbind_vsp $v;

Same here.

> +	done
> +	for v in $vsps; do
> +		bind_vsp $v;
> +	done;

And here, including after 'done'.

Do we need both, isn't the invidual unbind/rebind enough ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Feel free to push after addressing those issues.

> +
> +	# Perform a simple copy test to validate HW is alive
> +	test_copy RGB24 128x128
> +}
> +
> +test_init $0 "$features"
> +test_run

-- 
Regards,

Laurent Pinchart
