Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599914FE52C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 17:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243106AbiDLPzX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 11:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235086AbiDLPzW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 11:55:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9022C5F8F3;
        Tue, 12 Apr 2022 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=sdMxRKC7g2xwH9SumLE9xAEvXKx1mjNHvAlvUMvX6aA=; b=DQ5qgG7+24m/Do8CVMepiBekPz
        YAW5X8q8NsE4IecqvxyI3a7vc0ON2TTbqShrZ696uctI7I5eF5bIJKwPz+1torsxTTT4xqAdl8IKZ
        zkS92uPtdJnO3Pi9q0Msgo/cYg7CGuNSPRpAMMF58WFoSka7fEBi6jT05TIY/trFxkZ9u2bpF1X2l
        TwMug4wtanFBuCyi5D01c/9MwlrEGAbl+JFsK9HijivBqWZAYwgvEYqjqNOrbsGoJnk3EKn/tWtTv
        Zwih7L5z1/mknTF9fZwlJuu2ReSxy1m5mKwL948wrzNrE2U4ewVZ1A1AfffHcV7Rf0IIK6AXd9q5W
        U8mLVJhQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1neIoq-00DUD2-De; Tue, 12 Apr 2022 15:52:40 +0000
Message-ID: <4a90c2f4-2a49-5e70-2454-aca8313ab068@infradead.org>
Date:   Tue, 12 Apr 2022 08:52:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/7] treewide: scsi: ufs: Add support for Renesas R-Car
 UFS controller
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
 <23baab5b-722e-bdcd-be2c-62e38b2ff6a5@linaro.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <23baab5b-722e-bdcd-be2c-62e38b2ff6a5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 4/12/22 02:19, Krzysztof Kozlowski wrote:
> On 12/04/2022 09:36, Yoshihiro Shimoda wrote:
>> This patch series adds support Renesas R-Car S4-8 UFS controller.
>> This controller has some restrictions so adds some quirks for it.
>> Before using this driver, we have to initialize a clock generator
>> on the environment board (named "Spider") by using the commands of
>> U-Boot like below:
>>  => i2c dev 0
>>  => i2c mw 0x6c 0x26 0x05
>>  => i2c olen 0x6c 2
>>  => i2c mw 0x6c 0x26c 0x2e
>>
>> To use the UFS controller, we need the following patch too:
>> https://lore.kernel.org/all/20220411124932.3765571-1-yoshihiro.shimoda.uh@renesas.com/
>>
> 
> Thanks for the patches. Somehow I did not got entire set (bindings
> missing) and I cannot find any of them on lore.kernel.org. Did you have
> some bounces or sending troubles?

Hi,

They are all here:
  https://lore.kernel.org/linux-scsi/23baab5b-722e-bdcd-be2c-62e38b2ff6a5@linaro.org/T/#t

-- 
~Randy
