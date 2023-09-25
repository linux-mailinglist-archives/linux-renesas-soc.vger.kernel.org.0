Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943657ADDE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 19:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjIYRjI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 13:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjIYRjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 13:39:08 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47D810D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 10:39:01 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-65b179b9baeso8736366d6.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695663541; x=1696268341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hTbKVRUtifK600GcTuB6H5T7Hq7nQwjgpsYUbwhLkRs=;
        b=I4Y8z1B8TwdY5poWjHnCoXf7zaKCfgKCV4w5ZoUi6fs1t2eZjaEwX+sqQN1ez1XWWo
         elUuSLZmz7EcOoFe6CAMbmoaSw/KNIqghLTrqfyNqCfpJQJengNgb7F4vMubg3McHb7G
         rKtsoA9c38K6V2iAXWm6yfRX/fQTqkDD+V8OGwQbpUexI+nGVzTlV6xXZjiFKbB5Vvgk
         UNzTC6+VrPJo0/jCAslOrcEPpeOA+SfRU6U9Ty97HcghVEjLMTWooqFdXnjstRNgywrl
         L7IKYmgmQs55sIXMbYDc2XdC2Nc+Yf+JU4PoSzPcj3oiGJv9OzMYlASYBYamNoEjVCn3
         hsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695663541; x=1696268341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTbKVRUtifK600GcTuB6H5T7Hq7nQwjgpsYUbwhLkRs=;
        b=xGtmtKOjG38UgqsW2ucbfdF22QjDxr3+k8S6xOEicNRXNc8KSQvUs/AvQMno+Wf9sg
         u3O84Mtbe5wNRi3X5qTFihmkkPoNxc4I/lVGf657a5qJO/V1oqZgo4pp6n9zNqYAqC+c
         J+HcOTsicMt+TG7pULfyl/OL7nP+OpgAUCyejNgS3ukuwIGo4t0WWujQZaNDG6XZQSRS
         4a05zvKBpX3UL3oq7Dq9pxyi/kfnE69/U9rLFUTh3naM7oKSWgu5JXWWqEcfTc2M+7pt
         LKgGD6RGyNfFOsvHqawA7Ng2P0Imwcj8ER+TaPTJcBUm2k8QmJSbTEOzH2+cjGoZUPdd
         rDsg==
X-Gm-Message-State: AOJu0YzX/AtcekmEeeFV6SoHmEO//Qfov5UIOqDHIwZxjweDQbaGAXmb
        cTlDm8lEY89gNdLPmsggND106A==
X-Google-Smtp-Source: AGHT+IG+tSQcs5F1udgePekSyNFg4nS/3ON6TuwwuW4o4BqlQE4HXLo3X3tpbTYJLPBv/LJ1Cwr8Wg==
X-Received: by 2002:a05:6214:4307:b0:647:22cc:1784 with SMTP id oe7-20020a056214430700b0064722cc1784mr8149193qvb.15.1695663540981;
        Mon, 25 Sep 2023 10:39:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:75e1:d26a:c179:14a3? ([2600:1700:2000:b002:75e1:d26a:c179:14a3])
        by smtp.gmail.com with ESMTPSA id ph7-20020a0562144a4700b00655ebd053dcsm3167034qvb.82.2023.09.25.10.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 10:39:00 -0700 (PDT)
Message-ID: <a43ef21e-ce26-45ee-be28-526238e3e88f@sifive.com>
Date:   Mon, 25 Sep 2023 12:38:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/6] riscv: dts: sifive: convert isa detection to new
 properties
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-4-conor@kernel.org>
From:   Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230922081351.30239-4-conor@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2023-09-22 3:13 AM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the fu540 and fu740 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 15 +++++++++++++++
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 15 +++++++++++++++
>  2 files changed, 30 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

