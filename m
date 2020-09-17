Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5628826D04A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 02:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgIQA7d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 20:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIQA73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 20:59:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FDEC06178C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 17:59:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A747276;
        Thu, 17 Sep 2020 02:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600304358;
        bh=Gf7Z7BkSgET7C7N0LtmaziVbqkkp53gKZLWUhI+NGIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pW6TVDvROJODaIB1jJN+3/Xyw3AoqXZcc9eMyfFUt3+FX7Evo2h9+BOv0kuYFq/J/
         JJM3DqgdgwAuoV6yK72rEyr1rvrUg60cYMuYLKwjo7xqmVOLXZ5c4bu01vIUBwE0Xj
         mpow0ZJ2rmKEXI3+l2SN1dqJukV5K1WBtQApMLWs=
Date:   Thu, 17 Sep 2020 03:58:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] tests: Provide {un,}bind testing
Message-ID: <20200917005848.GR3853@pendragon.ideasonboard.com>
References: <20200916141815.1481807-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916141815.1481807-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Sep 16, 2020 at 03:18:15PM +0100, Kieran Bingham wrote:
> Perform unbind-bind testing of the VSP devices to validate
> successful removal of the drivers.

This unbinds all VSP instances, including the ones used by the DU and
not exposed through V4L2. What happens to the display ?

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> v2:
>  - Semi-colons removed
>  - duplicated tests removed.
> 
> This is the updated patch, I intend to push to master.
> 
> --
> Kieran
> 
> 
>  tests/vsp-unit-test-0026.sh | 55 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0026.sh
> 
> diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
> new file mode 100755
> index 000000000000..0e013cec881b
> --- /dev/null
> +++ b/tests/vsp-unit-test-0026.sh
> @@ -0,0 +1,55 @@
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
> +	# Unbind and rebind VSPs individually
> +	for v in $vsps; do
> +		unbind_vsp $v
> +		bind_vsp $v
> +	done
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
