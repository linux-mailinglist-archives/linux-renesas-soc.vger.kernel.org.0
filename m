Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E575F2B89
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 10:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbiJCIS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 04:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiJCISI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 04:18:08 -0400
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA56785AD
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 00:52:58 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id b2so4459818lfp.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 00:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=X5nggWCkh2ZL3B2u2GEj39NOMK0SD5iWr83lhiiDEg8=;
        b=zzXakDfztj+GL4YMVodcxszXT7xyiEHoBAKWLBSdw8eNr8RQBeDHVgt2E41bLol4xY
         92eReLQb1dI/zEve+aaALoHIJLX8W6ZRIXl/2BGlpW83veNFrDlns8WQq29poBJJk0Me
         Z20CwihHXJkOzNRBhNPldtwmAFIUoAeqoTQl0Y8HoqqgjXnXonTKvFimQSdehu/tCF5J
         KQGredgSD+2ifMiS1nesognX85OpYtAqoq23qMf4LUTvgPpaSYcqTByqjJ/D4177tyua
         hEqk3SQvSD6o1ex++uBzMWuYlKzw1ncvOCCLLYlEDwi0m2DFw2P15EplY915C5DOiEgR
         AErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=X5nggWCkh2ZL3B2u2GEj39NOMK0SD5iWr83lhiiDEg8=;
        b=4n3jcgYTTFZjAY42LF3X43xC5PaQUSDPYqPrQTQ0U0DTyMXR1xJhRhyk+Z/xuSiao7
         wOWZWngSFnh+84M93I0YAStjMlKKtSI1Hazr3XOWjLqN/csDt4QRp6w1nE57t4ZUIt3d
         K0PWs6XbDAAovFO1CGePfw88P+M+egyxmArKhTbEAJLH/IgwQKWAt8P9qsC+6ngpqTB0
         MK2uiqvsbxjX3opWSZ1+7tQvH4zbzP6lHmyE7qGnSp+qYYO1tRKEG9PDmH0EELGeKM6E
         jJMMPJ0GxZ9Kbip7zMwwwftGw5bRW7HYSkSLTNOg/TXtd18c85UiupNplGKOvAJc5+hc
         iOBA==
X-Gm-Message-State: ACrzQf2wpjUPtw6Fh83b7xrLB9coMRIcE1lgrGBiR8Ban0PXMhnVdKLe
        S7Jkl0h67f3krgVh8fP71OPxGA==
X-Google-Smtp-Source: AMsMyM5uuG241K7rHjGeTlGM42HXmW0TeyyYXRbtk2EBLXXxE3cWw90qLx613FAPVIefeFGx9XM/nw==
X-Received: by 2002:a05:6512:3184:b0:4a2:4c2f:ffed with SMTP id i4-20020a056512318400b004a24c2fffedmr113175lfe.488.1664783416855;
        Mon, 03 Oct 2022 00:50:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x4-20020ac25dc4000000b00494716e4f23sm1356566lfq.111.2022.10.03.00.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:50:16 -0700 (PDT)
Message-ID: <e44abdb3-b099-bfe6-4b5d-95dec0d4388c@linaro.org>
Date:   Mon, 3 Oct 2022 09:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH RFC 2/8] dt-bindings: mfd: Document RZ/G2L MTU3a bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
 <20220926132114.60396-3-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926132114.60396-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26/09/2022 15:21, Biju Das wrote:
> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
> channels and one 32-bit timer channel. It supports the following
> functions
>  - Counter
>  - Timer
>  - PWM
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/mfd/renesas,rzg2l-mtu3.yaml      | 275 ++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> new file mode 100644
> index 000000000000..c1fae8e8d9f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> @@ -0,0 +1,275 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/renesas,rzg2l-mtu3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Multi-Function Timer Pulse Unit 3 (MTU3a) bindings

Drop "bindings"

Since this is RFC, not a ready patch, the review is fast and not
thorough. Please send final patch for review (when ready).

> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  This hardware block pconsisting of eight 16-bit timer channels and one
> +  32- bit timer channel. It supports the following specifications:
> +    - Pulse input/output: 28 lines max.
> +    - Pulse input 3 lines
> +    - Count clock 11 clocks for each channel (14 clocks for MTU0, 12 clocks
> +      for MTU2, and 10 clocks for MTU5, four clocks for MTU1-MTU2 combination
> +      (when LWA = 1))
> +    - Operating frequency Up to 100 MHz
> +    - Available operations [MTU0 to MTU4, MTU6, MTU7, and MTU8]
> +        - Waveform output on compare match
> +        - Input capture function (noise filter setting available)
> +        - Counter-clearing operation
> +        - Simultaneous writing to multiple timer counters (TCNT)
> +          (excluding MTU8).
> +        - Simultaneous clearing on compare match or input capture
> +          (excluding MTU8).
> +        - Simultaneous input and output to registers in synchronization with
> +          counter operations           (excluding MTU8).
> +        - Up to 12-phase PWM output in combination with synchronous operation
> +          (excluding MTU8)
> +    - [MTU0 MTU3, MTU4, MTU6, MTU7, and MTU8]
> +        - Buffer operation specifiable
> +    - [MTU1, MTU2]
> +        - Phase counting mode can be specified independently
> +        - 32-bit phase counting mode can be specified for interlocked operation
> +          of MTU1 and MTU2 (when TMDR3.LWA = 1)
> +        - Cascade connection operation available
> +    - [MTU3, MTU4, MTU6, and MTU7]
> +        - Through interlocked operation of MTU3/4 and MTU6/7, the positive and
> +          negative signals in six phases (12 phases in total) can be output in
> +          complementary PWM and reset-synchronized PWM operation.
> +        - In complementary PWM mode, values can be transferred from buffer
> +          registers to temporary registers at crests and troughs of the timer-
> +          counter values or when the buffer registers (TGRD registers in MTU4
> +          and MTU7) are written to.
> +        - Double-buffering selectable in complementary PWM mode.
> +    - [MTU3 and MTU4]
> +        - Through interlocking with MTU0, a mode for driving AC synchronous
> +          motors (brushless DC motors) by using complementary PWM output and
> +          reset-synchronized PWM output is settable and allows the selection
> +          of two types of waveform output (chopping or level).
> +    - [MTU5]
> +        - Capable of operation as a dead-time compensation counter.
> +    - [MTU0/MTU5, MTU1, MTU2, and MTU8]
> +        - 32-bit phase counting mode specifiable by combining MTU1 and MTU2 and
> +          through interlocked operation with MTU0/MTU5 and MTU8.
> +    - Interrupt-skipping function
> +        - In complementary PWM mode, interrupts on crests and troughs of counter
> +          values and triggers to start conversion by the A/D converter can be
> +          skipped.
> +    - Interrupt sources: 43 sources.
> +    - Buffer operation:
> +        - Automatic transfer of register data (transfer from the buffer
> +          register to the timer register).
> +    - Trigger generation
> +        - A/D converter start triggers can be generated
> +        - A/D converter start request delaying function enables A/D converter
> +          to be started with any desired timing and to be synchronized with
> +          PWM output.
> +    - Low power consumption function
> +        - The MTU3a can be placed in the module-stop state.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a07g044-mtu3  # RZ/G2{L,LC}
> +          - renesas,r9a07g054-mtu3  # RZ/V2L
> +      - const: renesas,rzg2l-mtu3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: MTU0.TGRA input capture/compare match
> +      - description: MTU0.TGRB input capture/compare match
> +      - description: MTU0.TGRC input capture/compare match
> +      - description: MTU0.TGRD input capture/compare match
> +      - description: MTU0.TCNT overflow
> +      - description: MTU0.TGRE compare match
> +      - description: MTU0.TGRF compare match
> +      - description: MTU1.TGRA input capture/compare match
> +      - description: MTU1.TGRB input capture/compare match
> +      - description: MTU1.TCNT overflow
> +      - description: MTU1.TCNT underflow
> +      - description: MTU2.TGRA input capture/compare match
> +      - description: MTU2.TGRB input capture/compare match
> +      - description: MTU2.TCNT overflow
> +      - description: MTU2.TCNT underflow
> +      - description: MTU3.TGRA input capture/compare match
> +      - description: MTU3.TGRB input capture/compare match
> +      - description: MTU3.TGRC input capture/compare match
> +      - description: MTU3.TGRD input capture/compare match
> +      - description: MTU3.TCNT overflow
> +      - description: MTU4.TGRA input capture/compare match
> +      - description: MTU4.TGRB input capture/compare match
> +      - description: MTU4.TGRC input capture/compare match
> +      - description: MTU4.TGRD input capture/compare match
> +      - description: MTU4.TCNT overflow/underflow
> +      - description: MTU5.TGRU input capture/compare match
> +      - description: MTU5.TGRV input capture/compare match
> +      - description: MTU5.TGRW input capture/compare match
> +      - description: MTU6.TGRA input capture/compare match
> +      - description: MTU6.TGRB input capture/compare match
> +      - description: MTU6.TGRC input capture/compare match
> +      - description: MTU6.TGRD input capture/compare match
> +      - description: MTU6.TCNT overflow
> +      - description: MTU7.TGRA input capture/compare match
> +      - description: MTU7.TGRB input capture/compare match
> +      - description: MTU7.TGRC input capture/compare match
> +      - description: MTU7.TGRD input capture/compare match
> +      - description: MTU7.TCNT overflow/underflow
> +      - description: MTU8.TGRA input capture/compare match
> +      - description: MTU8.TGRB input capture/compare match
> +      - description: MTU8.TGRC input capture/compare match
> +      - description: MTU8.TGRD input capture/compare match
> +      - description: MTU8.TCNT overflow
> +      - description: MTU8.TCNT underflow
> +
> +  interrupt-names:
> +    items:
> +      - const: tgia0
> +      - const: tgib0
> +      - const: tgic0
> +      - const: tgid0
> +      - const: tgiv0
> +      - const: tgie0
> +      - const: tgif0
> +      - const: tgia1
> +      - const: tgib1
> +      - const: tgiv1
> +      - const: tgiu1
> +      - const: tgia2
> +      - const: tgib2
> +      - const: tgiv2
> +      - const: tgiu2
> +      - const: tgia3
> +      - const: tgib3
> +      - const: tgic3
> +      - const: tgid3
> +      - const: tgiv3
> +      - const: tgia4
> +      - const: tgib4
> +      - const: tgic4
> +      - const: tgid4
> +      - const: tgiv4
> +      - const: tgiu5
> +      - const: tgiv5
> +      - const: tgiw5
> +      - const: tgia6
> +      - const: tgib6
> +      - const: tgic6
> +      - const: tgid6
> +      - const: tgiv6
> +      - const: tgia7
> +      - const: tgib7
> +      - const: tgic7
> +      - const: tgid7
> +      - const: tgiv7
> +      - const: tgia8
> +      - const: tgib8
> +      - const: tgic8
> +      - const: tgid8
> +      - const: tgiv8
> +      - const: tgiu8
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

Why do you need these two? There are no children here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mtu3: timer@10001200 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "renesas,r9a07g044-mtu3", "renesas,rzg2l-mtu3";
> +      reg = <0x10001200 0xb00>;

Order of properties: compatible, reg, then the rest.

> +      interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>,

Best regards,
Krzysztof

