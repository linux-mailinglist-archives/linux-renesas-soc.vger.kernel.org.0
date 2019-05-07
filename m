Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2281715A52
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 07:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbfEGFo4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 01:44:56 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:60134 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbfEGFoz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 01:44:55 -0400
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x475iqxF067337;
        Tue, 7 May 2019 14:44:52 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav106.sakura.ne.jp);
 Tue, 07 May 2019 14:44:52 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav106.sakura.ne.jp)
Received: from [192.168.1.225] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x475ipwV067330
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Tue, 7 May 2019 14:44:51 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r8a7795: Add TPU support
To:     linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        geert+renesas@glider.be, broonie@kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
 <1556155517-5054-3-git-send-email-cv-dong@jinso.co.jp>
From:   Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <e4a80088-90c7-4da1-8453-558692085b90@jinso.co.jp>
Date:   Tue, 7 May 2019 14:44:51 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556155517-5054-3-git-send-email-cv-dong@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2019/04/25 10:25, Cao Van Dong wrote:
> Add tpu device node to dtsi for TPU support on r8a7795 SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>   arch/arm64/boot/dts/renesas/r8a7795.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 55472b2..612761e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1380,6 +1380,17 @@
>   			status = "disabled";
>   		};
>   
> +		tpu: pwm@e6e80000 {
> +			compatible = "renesas,tpu-r8a7795", "renesas,tpu";
> +			reg = <0 0xe6e80000 0 0x148>;
> +			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 304>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			resets = <&cpg 304>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>   		msiof0: spi@e6e90000 {
>   			compatible = "renesas,msiof-r8a7795",
>   				     "renesas,rcar-gen3-msiof";
Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>

Thank you,
Dong
