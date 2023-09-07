Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B780B79792E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Sep 2023 19:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239023AbjIGRFE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Sep 2023 13:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238554AbjIGRFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2023 13:05:03 -0400
Received: from frontal.iot.bzh (058728349.box.freepro.com [95.178.89.150])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BB01BF2;
        Thu,  7 Sep 2023 10:04:37 -0700 (PDT)
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 011AC2ABE9;
        Thu,  7 Sep 2023 15:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=KoOI913TFgaIOlWsEk/WIX2Ino
        WLJuiODkB1xGFjMrk=; b=io47Vv5FpSX4K5+bG5JyYpJAT9Py2uv2gZ0C0UVcPB
        vOS9ENQwpILEMZUY4QuyYFDXkn9u7FC0if/G43LUGIN0/iF2vMEDX9x2T81Kgaa9
        6ZK/0hrfSoyNnq1y9SWtlz1imm8qhec+wluanhgypUIlwgg4ExXtNdx1vwH7FaI/
        2/c/QS+rpyn0wNIQuDln2KoVXPnz6H1sZkQwuZPwSfYjQpXyi+Ap6IlvwEPWHfuO
        MfV5/QCudw1SIGqCcpwa+GPvXihi+mHiPKno86dbf1gOX62QC+GAXtuudO/2DF2Q
        zYkSOyExgJFG4NJquiP6LeIkWMaZJWdp0wp7ZsJBqxnw==
Message-ID: <f73c91b4-7de5-1139-1fb3-d5a2cd7f6007@iot.bzh>
Date:   Thu, 7 Sep 2023 15:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] clk: renesas: Mark concerned clocks as
 "ignore_unused"
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
References: <20230905140008.136263-1-aymeric.aillet@iot.bzh>
 <CAMuHMdX4-Bd8EvFE2U6YOL01LxAFg+uCjoD-sodXNgWuD9U5rg@mail.gmail.com>
Content-Language: en-US
From:   Aymeric Aillet <aymeric.aillet@iot.bzh>
In-Reply-To: <CAMuHMdX4-Bd8EvFE2U6YOL01LxAFg+uCjoD-sodXNgWuD9U5rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,
Thanks for your quick answer !
> Hi Aymeric,
>
> On Tue, Sep 5, 2023 at 4:00 PM Aymeric Aillet <aymeric.aillet@iot.bzh> wrote:
>> In order to avoid Linux from gating clocks that are used by
>> another OS running at the same time (eg. RTOS), we are adding
>> the "CLK_IGNORE_UNUSED" flag to the concerned clocks.
>>
>> As for now, list of clocks to be flagged have been completed
>> depending of features that are supported by Renesas SoCs/boards
>> port in Zephyr RTOS.
>>
>> Signed-off-by: Aymeric Aillet <aymeric.aillet@iot.bzh>
> Thanks for your patch!
>
>> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
>> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
>> @@ -288,6 +288,18 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>>          DEF_MOD("scu-src0",             1031,   MOD_CLK_ID(1017)),
>>   };
>>
>> +static const unsigned int r8a7795_ignore_unused_mod_clks[] __initconst = {
>> +       MOD_CLK_ID(206),        /* SCIF1 */
>> +       MOD_CLK_ID(303),        /* CMT0 */
>> +       MOD_CLK_ID(310),        /* SCIF2 */
>> +       MOD_CLK_ID(523),        /* PWM */
>> +       MOD_CLK_ID(906),        /* GPIO6 */
>> +       MOD_CLK_ID(907),        /* GPIO5 */
>> +       MOD_CLK_ID(916),        /* CAN0 */
>> +       MOD_CLK_ID(929),        /* I2C2 */
>> +       MOD_CLK_ID(927),        /* I2C4 */
> All of this is board-specific, so it cannot be handled in the SoC
> clock driver.
>
> E.g. scif2 is the main serial console for Linux on the Salvator-X(S)
> and ULCB development
> boards.
> Pwm, gpio6, gpio5, i2c2, and i2c4 are used on Salvator-X(S).
> I2c2 and i2c4 are also used on ULCB.
> Scif1 and can0 are used on the KingFisher extension board for ULCB.

True, my cases were specific boards we are (or will) support in Zephyr OS.

I didn't though about what would happen on other boards with the same 
SoC while testing, my bad.

>
>> --- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
>> +++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
>> @@ -168,6 +168,12 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
>>          DEF_MOD("ufs",          1514,   R8A779F0_CLK_S0D4_HSC),
>>   };
>>
>> +static const unsigned int r8a779f0_ignore_unused_mod_clks[] __initconst = {
>> +       MOD_CLK_ID(702),        /* SCIF0 */
>> +       MOD_CLK_ID(704),        /* SCIF3 */
>> +       MOD_CLK_ID(915),        /* PFC0 */
> E.g. scif0 is available for use by Linux on the Spider development board.
>
>> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
>> @@ -140,6 +140,10 @@ struct cpg_mssr_info {
>>          unsigned int num_mod_clks;
>>          unsigned int num_hw_mod_clks;
>>
>> +       /* Module Clocks that should not be gated */
>> +       const unsigned int *ignore_unused_mod_clks;
>> +       unsigned int num_ignore_unused_mod_clks;
>> +
>>          /* Critical Module Clocks that should not be disabled */
>>          const unsigned int *crit_mod_clks;
>>          unsigned int num_crit_mod_clks;
> Even if this was considered a good solution, why couldn't these be
> added to the existing crit_mod_clks[] array?
When working on this I understood that critical clocks were not only 
preserved but were also managed differently at boot.
My point was only to preserve these form gating so I though that marking 
them as critical was a bit overkill.
My understanding of the difference between critical and unused clocks is 
maybe not the good one !
>
> Fortunately, the Renesas SoC developers thought about this use case:
> R-Car H3 has both System (SMSTPCRn) and Realtime  (RMSTPCRn) Module
> Stop Control Registers, and a module clock is not gated unless it is
> stopped in both sets.  Linux uses the System set, while an RTOS like
> Zephyr running on the Cortex-R CPU core should use the Realtime set.
> Note that that mechanism does not protect against both OSes changing
> e.g. a divider for a parent clock.
>
> R-Car S4-8 only has a single set of Module Stop Control Register
> (MSTPCRn), but it does support multiple domains instead, and has Domain
> x Write Access Control Register (DxWACR_yyy) to control access.
I started working on this for an S4 based board as we are not yet 
supporting multiple domain control on our Zephyr support.

Concerning Gen3 SoCs, you are right, we are already using RMSTPCRn 
module on our H3 SoC implementation so this part of my patch is useless 
anyway !

I'll keep this patch on my side while working on multiple domains 
support on our Gen4 Zephyr support.

>
> Gr{oetje,eeting}s,
>
>                          Geert

Thanks again for your answer.

Regards,

Aymeric

>
-- 
Regards,
Aymeric Aillet - Embedded system engineer - IoT.bzh
aymeric.aillet@iot.bzh - www.iot.bzh


