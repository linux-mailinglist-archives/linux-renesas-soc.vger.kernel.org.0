Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2EE4E1C25
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Mar 2022 16:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbiCTPG1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Mar 2022 11:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245311AbiCTPGY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Mar 2022 11:06:24 -0400
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BE213DFD
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Mar 2022 08:05:01 -0700 (PDT)
Received: from pro2.mail.ovh.net (unknown [10.108.4.151])
        by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 21AC5EF58359;
        Sun, 20 Mar 2022 16:04:58 +0100 (CET)
Received: from [192.168.1.42] (88.125.132.78) by DAG1EX2.emp2.local
 (172.16.2.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sun, 20 Mar
 2022 16:04:58 +0100
Message-ID: <917d6e61-3163-9f95-132f-5a2267b3e01d@traphandler.com>
Date:   Sun, 20 Mar 2022 16:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND PATCH v3 0/2] ARM: r9a06g032: add support for the
 watchdogs
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        <linux-renesas-soc@vger.kernel.org>, <geert+renesas@glider.be>
References: <20220318182625.16182-1-jjhiblot@traphandler.com>
 <af2c8465-6dc0-f0df-48a5-901c922b5dd2@roeck-us.net>
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <af2c8465-6dc0-f0df-48a5-901c922b5dd2@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.125.132.78]
X-ClientProxiedBy: DAG4EX1.emp2.local (172.16.2.31) To DAG1EX2.emp2.local
 (172.16.2.2)
X-Ovh-Tracer-Id: 4799429828961057098
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeguddgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhephfeitdehtddtgeeugefgtdejgedtieelfedtgeehuedtteejueeihedtvedvfeeinecukfhppedtrddtrddtrddtpdekkedruddvhedrudefvddrjeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehprhhovddrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 18/03/2022 20:38, Guenter Roeck wrote:
> On 3/18/22 11:26, Jean-Jacques Hiblot wrote:
>> Hi,
>>
>> I did not receive any feedback for those 2 patches of the v3 of this
>> series, so resending them. The rest of the patches (dt-stuff) have
>
>
> Well, yes, you didn't send it to linux-watchdog@vger.kernel.org, which

yes I see now that linux-watchdog@vger.kernel.org is missing from the 
send list.

I'll make sure to include it next time. Sorry about that.

> I use as base for reviews, to collect review feedback, and as source
> for applying the patches. On top of that, you didn't provide change logs
> either, meaning I'd have to dig on the web to find older versions of
> your patches (since they won't be in watchdog patchwork either) and
> compare those. All that takes a lot of time, and you really should not
> expect fast turnaround (if any - your v2 got completely lost for me).
>
> Also, FWIW, after doing just that right now I still disagree that it 
> makes
> sense to have a watchdog interrupt do nothing. That is just as good as no
> watchdog.

if it's okay, I can add a call to emergency_restart() in the interrupt 
handler

as it is done in other drivers (sama5d4.c, wdt.c).


Thanks,

Jean-Jacques

>
> Guenter
