Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD9426E075
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 18:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgIQQSp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 12:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728399AbgIQQS2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 12:18:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5C5C0612F2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 09:08:25 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC9A92DB;
        Thu, 17 Sep 2020 18:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600358839;
        bh=j92JxqB2j2bjePpYw/72CiU46IhE2eqZ8PF2kYEqNBk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oPO0YdhxqIHcbyGVYiWaScrDyLcxVvfUDUMirai32P+O8C1ICzRIAFRpZxZCkI844
         5edWdDndHJGnJ3J8ZgE3teXfBjvZ9FOS1lCdb2E3/lm8IVwLiLiEirYL/XjJux+liq
         0eXw7od2nhkCOUv+sur+Dt98g2OXjZlE/P/Dui1o=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2] tests: Provide {un,}bind testing
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200916141815.1481807-1-kieran.bingham@ideasonboard.com>
 <20200917005848.GR3853@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 mQINBFYE/WYBEACs1PwjMD9rgCu1hlIiUA1AXR4rv2v+BCLUq//vrX5S5bjzxKAryRf0uHat
 V/zwz6hiDrZuHUACDB7X8OaQcwhLaVlq6byfoBr25+hbZG7G3+5EUl9cQ7dQEdvNj6V6y/SC
 rRanWfelwQThCHckbobWiQJfK9n7rYNcPMq9B8e9F020LFH7Kj6YmO95ewJGgLm+idg1Kb3C
 potzWkXc1xmPzcQ1fvQMOfMwdS+4SNw4rY9f07Xb2K99rjMwZVDgESKIzhsDB5GY465sCsiQ
 cSAZRxqE49RTBq2+EQsbrQpIc8XiffAB8qexh5/QPzCmR4kJgCGeHIXBtgRj+nIkCJPZvZtf
 Kr2EAbc6tgg6DkAEHJb+1okosV09+0+TXywYvtEop/WUOWQ+zo+Y/OBd+8Ptgt1pDRyOBzL8
 RXa8ZqRf0Mwg75D+dKntZeJHzPRJyrlfQokngAAs4PaFt6UfS+ypMAF37T6CeDArQC41V3ko
 lPn1yMsVD0p+6i3DPvA/GPIksDC4owjnzVX9kM8Zc5Cx+XoAN0w5Eqo4t6qEVbuettxx55gq
 8K8FieAjgjMSxngo/HST8TpFeqI5nVeq0/lqtBRQKumuIqDg+Bkr4L1V/PSB6XgQcOdhtd36
 Oe9X9dXB8YSNt7VjOcO7BTmFn/Z8r92mSAfHXpb07YJWJosQOQARAQABtDBLaWVyYW4gQmlu
 Z2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT6JAlcEEwEKAEECGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQLdeYP70o/eNy1HqhHkZyEKRh/QUCXWTtygUJ
 CyJXZAAKCRChHkZyEKRh/f8dEACTDsbLN2nioNZMwyLuQRUAFcXNolDX48xcUXsWS2QjxaPm
 VsJx8Uy8aYkS85mdPBh0C83OovQR/OVbr8AxhGvYqBs3nQvbWuTl/+4od7DfK2VZOoKBAu5S
 QK2FYuUcikDqYcFWJ8DQnubxfE8dvzojHEkXw0sA4igINHDDFX3HJGZtLio+WpEFQtCbfTAG
 YZslasz1YZRbwEdSsmO3/kqy5eMnczlm8a21A3fKUo3g8oAZEFM+f4DUNzqIltg31OAB/kZS
 enKZQ/SWC8PmLg/ZXBrReYakxXtkP6w3FwMlzOlhGxqhIRNiAJfXJBaRhuUWzPOpEDE9q5YJ
 BmqQL2WJm1VSNNVxbXJHpaWMH1sA2R00vmvRrPXGwyIO0IPYeUYQa3gsy6k+En/aMQJd27dp
 aScf9am9PFICPY5T4ppneeJLif2lyLojo0mcHOV+uyrds9XkLpp14GfTkeKPdPMrLLTsHRfH
 fA4I4OBpRrEPiGIZB/0im98MkGY/Mu6qxeZmYLCcgD6qz4idOvfgVOrNh+aA8HzIVR+RMW8H
 QGBN9f0E3kfwxuhl3omo6V7lDw8XOdmuWZNC9zPq1UfryVHANYbLGz9KJ4Aw6M+OgBC2JpkD
 hXMdHUkC+d20dwXrwHTlrJi1YNp6rBc+xald3wsUPOZ5z8moTHUX/uPA/qhGsbkCDQRWBP1m
 ARAAzijkb+Sau4hAncr1JjOY+KyFEdUNxRy+hqTJdJfaYihxyaj0Ee0P0zEi35CbE6lgU0Uz
 tih9fiUbSV3wfsWqg1Ut3/5rTKu7kLFp15kF7eqvV4uezXRD3Qu4yjv/rMmEJbbD4cTvGCYI
 d6MDC417f7vK3hCbCVIZSp3GXxyC1LU+UQr3fFcOyCwmP9vDUR9JV0BSqHHxRDdpUXE26Dk6
 mhf0V1YkspE5St814ETXpEus2urZE5yJIUROlWPIL+hm3NEWfAP06vsQUyLvr/GtbOT79vXl
 En1aulcYyu20dRRxhkQ6iILaURcxIAVJJKPi8dsoMnS8pB0QW12AHWuirPF0g6DiuUfPmrA5
 PKe56IGlpkjc8cO51lIxHkWTpCMWigRdPDexKX+Sb+W9QWK/0JjIc4t3KBaiG8O4yRX8ml2R
 +rxfAVKM6V769P/hWoRGdgUMgYHFpHGSgEt80OKK5HeUPy2cngDUXzwrqiM5Sz6Od0qw5pCk
 NlXqI0W/who0iSVM+8+RmyY0OEkxEcci7rRLsGnM15B5PjLJjh1f2ULYkv8s4SnDwMZ/kE04
 /UqCMK/KnX8pwXEMCjz0h6qWNpGwJ0/tYIgQJZh6bqkvBrDogAvuhf60Sogw+mH8b+PBlx1L
 oeTK396wc+4c3BfiC6pNtUS5GpsPMMjYMk7kVvEAEQEAAYkCPAQYAQoAJgIbDBYhBJAt15g/
 vSj943LUeqEeRnIQpGH9BQJdizzIBQkLSKZiAAoJEKEeRnIQpGH9eYgQAJpjaWNgqNOnMTmD
 MJggbwjIotypzIXfhHNCeTkG7+qCDlSaBPclcPGYrTwCt0YWPU2TgGgJrVhYT20ierN8LUvj
 6qOPTd+Uk7NFzL65qkh80ZKNBFddx1AabQpSVQKbdcLb8OFs85kuSvFdgqZwgxA1vl4TFhNz
 PZ79NAmXLackAx3sOVFhk4WQaKRshCB7cSl+RIng5S/ThOBlwNlcKG7j7W2MC06BlTbdEkUp
 ECzuuRBv8wX4OQl+hbWbB/VKIx5HKlLu1eypen/5lNVzSqMMIYkkZcjV2SWQyUGxSwq0O/sx
 S0A8/atCHUXOboUsn54qdxrVDaK+6jIAuo8JiRWctP16KjzUM7MO0/+4zllM8EY57rXrj48j
 sbEYX0YQnzaj+jO6kJtoZsIaYR7rMMq9aUAjyiaEZpmP1qF/2sYenDx0Fg2BSlLvLvXM0vU8
 pQk3kgDu7kb/7PRYrZvBsr21EIQoIjXbZxDz/o7z95frkP71EaICttZ6k9q5oxxA5WC6sTXc
 MW8zs8avFNuA9VpXt0YupJd2ijtZy2mpZNG02fFVXhIn4G807G7+9mhuC4XG5rKlBBUXTvPU
 AfYnB4JBDLmLzBFavQfvonSfbitgXwCG3vS+9HEwAjU30Bar1PEOmIbiAoMzuKeRm2LVpmq4
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <7e0c5c6e-efd7-56d9-47ed-ba6dcb78bc15@ideasonboard.com>
Date:   Thu, 17 Sep 2020 17:07:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917005848.GR3853@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 17/09/2020 01:58, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Wed, Sep 16, 2020 at 03:18:15PM +0100, Kieran Bingham wrote:
>> Perform unbind-bind testing of the VSP devices to validate
>> successful removal of the drivers.
> 
> This unbinds all VSP instances, including the ones used by the DU and
> not exposed through V4L2. What happens to the display ?

Bad things :-)

Is that something that 'can' be fixed?
Or goes into the category of "shouldn't ever happen".

Although I think the reason for adding this test in the first place was
because of reports of someone testing bind/unbind and hitting failures.


After unbind/bind, the display is left blank. There is no 'issue' until
something tries to use the display again: where we get:

[  273.468961] vsp1 fea20000.vsp: failed to reset wpf.1
[  273.474156] vsp1 fea20000.vsp: DRM pipeline stop timeout
[  273.479595] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000038
[  273.488627] Mem abort info:
[  273.491570]   ESR = 0x96000004
[  273.495657]   EC = 0x25: DABT (current EL), IL = 32 bits
[  273.501618]   SET = 0, FnV = 0
[  273.505093]   EA = 0, S1PTW = 0
[  273.509022] Data abort info:
[  273.512213]   ISV = 0, ISS = 0x00000004
[  273.516685]   CM = 0, WnR = 0
[  273.519891] user pgtable: 4k pages, 48-bit VAs, pgdp=000000072faf0000
[  273.527015] [0000000000000038] pgd=0000000000000000, p4d=0000000000000000
[  273.534399] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[  273.540041] CPU: 0 PID: 1338 Comm: kmstest Not tainted
5.9.0-rc1-arm64-renesas-00264-g939a20a7f8b4 #339
[  273.549523] Hardware name: Renesas Salvator-X 2nd version board based
on r8a77951 (DT)
[  273.557517] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[  273.563152] pc : vsp1_du_setup_lif+0x3fc/0x4d0
[  273.567638] lr : vsp1_du_setup_lif+0x4cc/0x4d0
[  273.572121] sp : ffff80001489b900
[  273.575465] x29: ffff80001489b900 x28: 000000000000006f
[  273.580829] x27: ffff0006fa105080 x26: 0000000000000000
[  273.586192] x25: 0000000000000000 x24: ffff0006f0f896c0
[  273.591555] x23: 0000000000000378 x22: ffff0006f81c83f8
[  273.596917] x21: ffff0006f81c8420 x20: 0000000000000001
[  273.602280] x19: 0000000000000000 x18: 0000000000000010
[  273.607642] x17: 0000000000000000 x16: 0000000000000000
[  273.613004] x15: 0000000000aaaaaa x14: 0000000000000020
[  273.618366] x13: 00000000ffffffff x12: ffff800010b68ac8
[  273.623728] x11: ffffffffffffffff x10: ffff800010ef8018
[  273.629090] x9 : 0000000000000001 x8 : 0000000000000000
[  273.634452] x7 : 0000000000000001 x6 : 0000000000000001
[  273.639814] x5 : dead000000000100 x4 : dead000000000100
[  273.645176] x3 : dead000000000122 x2 : b1d0872bc242a400
[  273.650538] x1 : 0000000000000000 x0 : 0000000000000000
[  273.655900] Call trace:
[  273.658371]  vsp1_du_setup_lif+0x3fc/0x4d0
[  273.662512]  rcar_du_vsp_disable+0x1c/0x28
[  273.666648]  rcar_du_crtc_atomic_disable+0x2c4/0x3e0
[  273.671663]  drm_atomic_helper_commit_modeset_disables+0x37c/0x420
[  273.677902]  rcar_du_atomic_commit_tail+0x90/0xd8
[  273.684043]  commit_tail+0x9c/0x180
[  273.688952]  drm_atomic_helper_commit+0x168/0x198
[  273.695096]  drm_atomic_commit+0x48/0x58
[  273.700437]  drm_mode_atomic_ioctl+0x9fc/0xb08
[  273.706278]  drm_ioctl_kernel+0xb8/0x110
[  273.711563]  drm_ioctl+0x230/0x470
[  273.716293]  __arm64_sys_ioctl+0x8c/0xd0
[  273.721520]  el0_svc_common.constprop.0+0x70/0x180
[  273.727629]  do_el0_svc+0x20/0x80
[  273.732219]  el0_sync_handler+0x94/0x1b0
[  273.737386]  el0_sync+0x140/0x180
[  273.741943] Code: 8b1c0ed6 f9414ec0 b90262df f901b6df (a9438402)
[  273.749313] ---[ end trace 67e85a6fa8c4fc15 ]---

We don't actually have any bind/unbind hooks in the vsp1 so I guess
that's something for me to investigate next to make sure we shut the
device down correctly...

--
Kieran


> 
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>
>> v2:
>>  - Semi-colons removed
>>  - duplicated tests removed.
>>
>> This is the updated patch, I intend to push to master.
>>
>> --
>> Kieran
>>
>>
>>  tests/vsp-unit-test-0026.sh | 55 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100755 tests/vsp-unit-test-0026.sh
>>
>> diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
>> new file mode 100755
>> index 000000000000..0e013cec881b
>> --- /dev/null
>> +++ b/tests/vsp-unit-test-0026.sh
>> @@ -0,0 +1,55 @@
>> +#!/bin/sh
>> +
>> +#
>> +# Test unbinding and binding all VSP1 devices, performing a simple
>> +# copy test to validate the hardware afterwards.
>> +#
>> +
>> +. ./vsp-lib.sh
>> +
>> +features="rpf.0 wpf.0"
>> +
>> +vsp1_driver=/sys/bus/platform/drivers/vsp1
>> +vsps=$(cd /sys/bus/platform/devices/; ls | grep vsp)
>> +
>> +unbind_vsp() {
>> +	echo $1 > $vsp1_driver/unbind
>> +}
>> +
>> +bind_vsp() {
>> +	echo $1 > $vsp1_driver/bind
>> +}
>> +
>> +# Input is directly copied to the output. No change in format or size.
>> +test_copy() {
>> +	local format=$1
>> +	local insize=$2
>> +
>> +	test_start "simple hardware validation after unbind/bind cycles"
>> +
>> +	pipe_configure rpf-wpf 0 0
>> +	format_configure rpf-wpf 0 0 $format $insize $format
>> +
>> +	vsp_runner rpf.0 &
>> +	vsp_runner wpf.0
>> +
>> +	local result=$(compare_frames)
>> +
>> +	test_complete $result
>> +}
>> +
>> +test_main() {
>> +	local format
>> +
>> +	# Unbind and rebind VSPs individually
>> +	for v in $vsps; do
>> +		unbind_vsp $v
>> +		bind_vsp $v
>> +	done
>> +
>> +	# Perform a simple copy test to validate HW is alive
>> +	test_copy RGB24 128x128
>> +}
>> +
>> +test_init $0 "$features"
>> +test_run
> 

-- 
Regards
--
Kieran
