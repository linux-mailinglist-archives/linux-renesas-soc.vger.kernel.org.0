Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596D8281FE8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Oct 2020 03:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgJCBEK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Oct 2020 21:04:10 -0400
Received: from z5.mailgun.us ([104.130.96.5]:47864 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbgJCBEK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 21:04:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601687049; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uLdRdc6iCqjf3IBwzfBNgoRr8xpJ3Qi3oTyKWutFUaA=; b=MDg/YbDwC02ICpF7FpsHxpzP7RbhvOjZnTxZV610WaRiqMeJBz3S476T9xc0DGiHIMSWwBPa
 5fK5T3DEIHrfQbFsPWhFwfy1b9vnMYYcYxtEHw1hsXc4iqEnatiADiRtmb1HDgF/9M/dxfXB
 6OUYwtFysM+awp1sUuGiO9BQkNc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIyZjFhOCIsICJsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f77ce09aad2c3cd1c2fbd1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 03 Oct 2020 01:04:09
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 558F9C433C8; Sat,  3 Oct 2020 01:04:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.56.245] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2E29C433CA;
        Sat,  3 Oct 2020 01:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2E29C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v3 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to
 json-schema
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
 <20200824141053.5062-2-biju.das.jz@bp.renesas.com>
 <da7b8ea3-8cc1-5590-2200-c495e6c733af@codeaurora.org>
 <TYBPR01MB5309BED73D5BB6243D84C74B863E0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <TYBPR01MB5309C832C9DE7B1B5E5FBCA886360@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <5855e79f-0f97-6f8a-2738-93424d2ed3a0@codeaurora.org>
Date:   Fri, 2 Oct 2020 18:04:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <TYBPR01MB5309C832C9DE7B1B5E5FBCA886360@TYBPR01MB5309.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

>>>
>>> Hi Biju,
>>>
>>> I'm involved in a separate thread[1] and I just wanted to get your
>>> inputs on how you understood the port and endpoint assignments for the
>>> USB type C connectors in different designs.
>>>
>>> Since the hd3ss3220 does the type C lane detect and has an integrated
>>> lane select mux, what is the ss_ep being used for?
>>
>> In our case, Type C Connector --> HS lines directly connected to SoC, where
>> as the SS lines connected  to HD3SS3220 Mux and output of mux is
>> Connected to SoC.
>>
>> This mux driver detects state change on the CC lines, reading the
>> orientation/role and communicating this information to SoC for assigning
>> roles using USB role switch framework.
>>
>> Case 1:-  Model connector node as the child node of the mux.
>>
>> The bindings for this case [1] is not complaint to typec connector bindings,
>> since it is missing port@0 node.
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-
>> next.git/tree/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt?h=n
>> ext-20200917
>>
>> typec Connector bindings requires port@0 should be HS and port@1 should
>> be SS as per the discussion [2],  so I need to remodel connector node as
>> separate one.
>> [2] https://patchwork.kernel.org/patch/11669423/
>>
>> Case 2:-  Model connector node as a separate one based on the hardware
>> design
>>
>> Type c connector port@0  --> SoC  (hs ep) Type c connector  port@1 -->
>> connected to USB3.0 Mux -->  SoC( for usb3 role switch)
>>
>> Here the input of the Mux is connected to TypeC connector and Output of
>> the mux is connected to the SoC, which is inline with hardware design.
>> The full example of this model here [3]
>> [3] https://patchwork.kernel.org/patch/11733263/
>>
>> In both our designs, looks like, type c connector connected to SS MUX and
>> output of SS Mux is Connected to SoC for role switch. Am I missing some
>> thing?
>> So may be we need to update the connector bindings for this use case. What
>> do you think?
> 
> FYI, I have posted v4 with changes in usb connector bindings.
> 
> [1] https://patchwork.kernel.org/patch/11787677/
> [2] https://patchwork.kernel.org/patch/11787679/
> 
Hi Biju,

Great, thanks! Let me take a look :).

Thanks

Regards,
Wesley Cheng


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
