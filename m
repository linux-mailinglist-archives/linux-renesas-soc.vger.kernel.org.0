Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA3326E548
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 21:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgIQTRv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 15:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgIQQSG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 12:18:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2995EC06121F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 09:10:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3A7F2DB;
        Thu, 17 Sep 2020 18:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600359044;
        bh=U71hbmSNg5nxaJA/ZDEZx/AiZf+wPfVkUNZvuynS9zU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lUZokbZanOLKvOt0bItG6AabRT8FvBp0tyD0CfpZgpY0k/NIkIfrlhKxrM1OniEdN
         s1wsdoZNqO2OD6z+KNg6qgod0igJjG4izoPJpre9TQOndXcQ1+uiotEzty7g0LVrdN
         Gt/3HTjtSsuRul2XWkj3vsQTVVSRjP5x+Fm5wbMw=
Date:   Thu, 17 Sep 2020 19:10:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] tests: Provide {un,}bind testing
Message-ID: <20200917161013.GE3969@pendragon.ideasonboard.com>
References: <20200916141815.1481807-1-kieran.bingham@ideasonboard.com>
 <20200917005848.GR3853@pendragon.ideasonboard.com>
 <7e0c5c6e-efd7-56d9-47ed-ba6dcb78bc15@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7e0c5c6e-efd7-56d9-47ed-ba6dcb78bc15@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 17, 2020 at 05:07:12PM +0100, Kieran Bingham wrote:
> Hi Laurent,
> 
> On 17/09/2020 01:58, Laurent Pinchart wrote:
> > Hi Kieran,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Sep 16, 2020 at 03:18:15PM +0100, Kieran Bingham wrote:
> >> Perform unbind-bind testing of the VSP devices to validate
> >> successful removal of the drivers.
> > 
> > This unbinds all VSP instances, including the ones used by the DU and
> > not exposed through V4L2. What happens to the display ?
> 
> Bad things :-)
> 
> Is that something that 'can' be fixed?

Only with lots of effort. I wouldn't bother for now to be honest. Could
we however skip unbinding the vspd instances in this test ?

> Or goes into the category of "shouldn't ever happen".
> 
> Although I think the reason for adding this test in the first place was
> because of reports of someone testing bind/unbind and hitting failures.
> 
> After unbind/bind, the display is left blank. There is no 'issue' until
> something tries to use the display again: where we get:
> 
> [  273.468961] vsp1 fea20000.vsp: failed to reset wpf.1
> [  273.474156] vsp1 fea20000.vsp: DRM pipeline stop timeout
> [  273.479595] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
> [  273.488627] Mem abort info:
> [  273.491570]   ESR = 0x96000004
> [  273.495657]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  273.501618]   SET = 0, FnV = 0
> [  273.505093]   EA = 0, S1PTW = 0
> [  273.509022] Data abort info:
> [  273.512213]   ISV = 0, ISS = 0x00000004
> [  273.516685]   CM = 0, WnR = 0
> [  273.519891] user pgtable: 4k pages, 48-bit VAs, pgdp=000000072faf0000
> [  273.527015] [0000000000000038] pgd=0000000000000000, p4d=0000000000000000
> [  273.534399] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [  273.540041] CPU: 0 PID: 1338 Comm: kmstest Not tainted 5.9.0-rc1-arm64-renesas-00264-g939a20a7f8b4 #339
> [  273.549523] Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
> [  273.557517] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
> [  273.563152] pc : vsp1_du_setup_lif+0x3fc/0x4d0
> [  273.567638] lr : vsp1_du_setup_lif+0x4cc/0x4d0
> [  273.572121] sp : ffff80001489b900
> [  273.575465] x29: ffff80001489b900 x28: 000000000000006f
> [  273.580829] x27: ffff0006fa105080 x26: 0000000000000000
> [  273.586192] x25: 0000000000000000 x24: ffff0006f0f896c0
> [  273.591555] x23: 0000000000000378 x22: ffff0006f81c83f8
> [  273.596917] x21: ffff0006f81c8420 x20: 0000000000000001
> [  273.602280] x19: 0000000000000000 x18: 0000000000000010
> [  273.607642] x17: 0000000000000000 x16: 0000000000000000
> [  273.613004] x15: 0000000000aaaaaa x14: 0000000000000020
> [  273.618366] x13: 00000000ffffffff x12: ffff800010b68ac8
> [  273.623728] x11: ffffffffffffffff x10: ffff800010ef8018
> [  273.629090] x9 : 0000000000000001 x8 : 0000000000000000
> [  273.634452] x7 : 0000000000000001 x6 : 0000000000000001
> [  273.639814] x5 : dead000000000100 x4 : dead000000000100
> [  273.645176] x3 : dead000000000122 x2 : b1d0872bc242a400
> [  273.650538] x1 : 0000000000000000 x0 : 0000000000000000
> [  273.655900] Call trace:
> [  273.658371]  vsp1_du_setup_lif+0x3fc/0x4d0
> [  273.662512]  rcar_du_vsp_disable+0x1c/0x28
> [  273.666648]  rcar_du_crtc_atomic_disable+0x2c4/0x3e0
> [  273.671663]  drm_atomic_helper_commit_modeset_disables+0x37c/0x420
> [  273.677902]  rcar_du_atomic_commit_tail+0x90/0xd8
> [  273.684043]  commit_tail+0x9c/0x180
> [  273.688952]  drm_atomic_helper_commit+0x168/0x198
> [  273.695096]  drm_atomic_commit+0x48/0x58
> [  273.700437]  drm_mode_atomic_ioctl+0x9fc/0xb08
> [  273.706278]  drm_ioctl_kernel+0xb8/0x110
> [  273.711563]  drm_ioctl+0x230/0x470
> [  273.716293]  __arm64_sys_ioctl+0x8c/0xd0
> [  273.721520]  el0_svc_common.constprop.0+0x70/0x180
> [  273.727629]  do_el0_svc+0x20/0x80
> [  273.732219]  el0_sync_handler+0x94/0x1b0
> [  273.737386]  el0_sync+0x140/0x180
> [  273.741943] Code: 8b1c0ed6 f9414ec0 b90262df f901b6df (a9438402)
> [  273.749313] ---[ end trace 67e85a6fa8c4fc15 ]---
> 
> We don't actually have any bind/unbind hooks in the vsp1 so I guess
> that's something for me to investigate next to make sure we shut the
> device down correctly...
>
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> ---
> >>
> >> v2:
> >>  - Semi-colons removed
> >>  - duplicated tests removed.
> >>
> >> This is the updated patch, I intend to push to master.
> >>
> >> --
> >> Kieran
> >>
> >>
> >>  tests/vsp-unit-test-0026.sh | 55 +++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 55 insertions(+)
> >>  create mode 100755 tests/vsp-unit-test-0026.sh
> >>
> >> diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
> >> new file mode 100755
> >> index 000000000000..0e013cec881b
> >> --- /dev/null
> >> +++ b/tests/vsp-unit-test-0026.sh
> >> @@ -0,0 +1,55 @@
> >> +#!/bin/sh
> >> +
> >> +#
> >> +# Test unbinding and binding all VSP1 devices, performing a simple
> >> +# copy test to validate the hardware afterwards.
> >> +#
> >> +
> >> +. ./vsp-lib.sh
> >> +
> >> +features="rpf.0 wpf.0"
> >> +
> >> +vsp1_driver=/sys/bus/platform/drivers/vsp1
> >> +vsps=$(cd /sys/bus/platform/devices/; ls | grep vsp)
> >> +
> >> +unbind_vsp() {
> >> +	echo $1 > $vsp1_driver/unbind
> >> +}
> >> +
> >> +bind_vsp() {
> >> +	echo $1 > $vsp1_driver/bind
> >> +}
> >> +
> >> +# Input is directly copied to the output. No change in format or size.
> >> +test_copy() {
> >> +	local format=$1
> >> +	local insize=$2
> >> +
> >> +	test_start "simple hardware validation after unbind/bind cycles"
> >> +
> >> +	pipe_configure rpf-wpf 0 0
> >> +	format_configure rpf-wpf 0 0 $format $insize $format
> >> +
> >> +	vsp_runner rpf.0 &
> >> +	vsp_runner wpf.0
> >> +
> >> +	local result=$(compare_frames)
> >> +
> >> +	test_complete $result
> >> +}
> >> +
> >> +test_main() {
> >> +	local format
> >> +
> >> +	# Unbind and rebind VSPs individually
> >> +	for v in $vsps; do
> >> +		unbind_vsp $v
> >> +		bind_vsp $v
> >> +	done
> >> +
> >> +	# Perform a simple copy test to validate HW is alive
> >> +	test_copy RGB24 128x128
> >> +}
> >> +
> >> +test_init $0 "$features"
> >> +test_run

-- 
Regards,

Laurent Pinchart
