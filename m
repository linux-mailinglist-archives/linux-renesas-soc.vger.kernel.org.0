Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D7B663FE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 13:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbjAJMIX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 07:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238348AbjAJMHn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 07:07:43 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3414840A5;
        Tue, 10 Jan 2023 04:05:19 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B7446852A0;
        Tue, 10 Jan 2023 13:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673352291;
        bh=iRfYP8K3mdoB4XgbjHqdL1BYgbo6dRFpAq8VhoxdYP4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ozMwBMalJTve9wtY7XbuXGer5orO4s7DXhjsg0leNZTa7hmW3KFKkB7f7pP9WNwKw
         Edy4i9ob/C3qPpbHvbRvsNT4T2ZM6MLbVyAYy/VJ2c8vNE28KJKRdGKfWP4bfJ9y8T
         cGE5Ts+ny8au6ZpK12tOdpf5OW5BkqhjFy1XrzO90nANY2LRlEAc2HeLqShTgPCvZ9
         OmexcS3Y0Kc0BKBO1Br4ZlpzmbECmucWegMdH8GNEs/E9yA23ek9SqsTnZf1cyQIJ1
         Dnr5WX2v4k3AqF+UIsvzQ74ClRv1WIKwt1lBu27b+gya/bom+7t8eADo/AbrJO1GeW
         TXQTFf4uUQc7Q==
Message-ID: <f79fbff1-5217-927b-a2ab-a0e40211b20b@denx.de>
Date:   Tue, 10 Jan 2023 11:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/4] dt-bindings: clk: rs9: Add 9FGV0441
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
 <20230110100003.370917-2-alexander.stein@ew.tq-group.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230110100003.370917-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/10/23 11:00, Alexander Stein wrote:
> This is a 4-channel variant of 9FGV series.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Marek Vasut <marex@denx.de>
