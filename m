Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDEE15AD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 07:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbfEGFtK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 01:49:10 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:63518 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbfEGFtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 01:49:08 -0400
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x475mnI0069956;
        Tue, 7 May 2019 14:48:49 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav107.sakura.ne.jp);
 Tue, 07 May 2019 14:48:49 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav107.sakura.ne.jp)
Received: from [192.168.1.225] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x475mm5s069945
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Tue, 7 May 2019 14:48:49 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Subject: Re: [PATCH v2 0/5] Add TPU support for R-Car H3/M3-W/M3-N
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        broonie@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, daniel.lezcano@linaro.org,
        tglx@linutronix.de, robh@kernel.org,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
 <20190426094112.r6nyvpnhcb2j4qv6@verge.net.au>
From:   Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <9a454bb2-2391-22d4-3dc4-5084e0654740@jinso.co.jp>
Date:   Tue, 7 May 2019 14:48:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426094112.r6nyvpnhcb2j4qv6@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Simon-san,

On 2019/04/26 18:41, Simon Horman wrote:
> Hi,
>
> On Thu, Apr 25, 2019 at 10:25:12AM +0900, Cao Van Dong wrote:
>> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
>> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
>> For test, after booting, I found the device was registered in the booting log.
> Could you clarify some details of this test.
>
> Looking at the DTS patches I see 'status = "disabled";' for each
> of the newly added devices. So I would not expect them to be probed
> at run-time without some extra tweaking.
Test procedure:
   - Apply patch series "[PATCH 0/4] pinctrl: sh-pfc: r8a7795/6/65: Add 
TPU pins, groups and functions".
   - Make sure switches { SW29-[1-2] are switched off or SW31-[1-4] are 
switched off(only for Salvator-xs) }.
   - Enable TPU and pin control in DTS (salvator-x/xs.dtsi):

     +
     +&tpu {
     +       pinctrl-0 = <&tpu_pins>;
     +       pinctrl-names = "default";
     +
     +       status = "okay";
     +};
     +
     +&pfc {
     +       tpu_pins: tpu {
     +               groups = "tpu_to2", "tpu_to3";
     +               function = "tpu";
     +       };
     +};

   - Exercise userspace PWM control for pwm[2,3] of 
/sys/class/pwm/pwmchip1/ .
   - Inspect PWM signals on the input side of { CN29-[58,60] or 
SW31-[1,2] (only for Salvator-xs) } using an oscilloscope.

Thank you,
Dong
>> Cao Van Dong (5):
>>    clk: renesas: r8a779{5|6|65}: Add TPU clock
>>    arm64: dts: renesas: r8a7795: Add TPU support
>>    arm64: dts: renesas: r8a7796: Add TPU support
>>    arm64: dts: renesas: r8a77965: Add TPU support
>>    dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings
>>
>>   Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
>>   arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
>>   arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
>>   arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
>>   drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
>>   drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
>>   drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
>>   7 files changed, 39 insertions(+)
>>
>> -- 
>> 2.7.4
>>
