Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 044A327F88
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 16:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbfEWO0Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 10:26:25 -0400
Received: from www62.your-server.de ([213.133.104.62]:57846 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfEWO0Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 10:26:25 -0400
Received: from [78.46.172.3] (helo=sslproxy06.your-server.de)
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <daniel@iogearbox.net>)
        id 1hTofk-0006tP-O7; Thu, 23 May 2019 16:26:20 +0200
Received: from [178.197.249.12] (helo=linux.home)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <daniel@iogearbox.net>)
        id 1hTofk-000CAr-Gd; Thu, 23 May 2019 16:26:20 +0200
Subject: Re: [PATCH/RFC] arm64: fix build warning from
 __AARCH64_INSN_FUNCS(ldadd, ...)
To:     Will Deacon <will.deacon@arm.com>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, catalin.marinas@arm.com,
        linux-arm-kernel@lists.infradead.org,
        kuninori.morimoto.gx@renesas.com
References: <1558599120-29394-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190523103602.GJ26646@fuggles.cambridge.arm.com>
 <4b35cc15-9e35-eb67-3cfc-3a8eff8c462e@iogearbox.net>
 <1daf0c3e-745b-386b-4a8d-bfb18f987239@arm.com>
 <20190523141639.GA31896@fuggles.cambridge.arm.com>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <e94cb569-3460-8df1-f675-d5a9aae8abdf@iogearbox.net>
Date:   Thu, 23 May 2019 16:26:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190523141639.GA31896@fuggles.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.3/25458/Thu May 23 09:58:32 2019)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/23/2019 04:16 PM, Will Deacon wrote:
> On Thu, May 23, 2019 at 02:54:54PM +0100, Jean-Philippe Brucker wrote:
>> On 23/05/2019 14:02, Daniel Borkmann wrote:
>>> On 05/23/2019 12:36 PM, Will Deacon wrote:
>>>> [+Daniel and Jean-Philippe]
>>>> On Thu, May 23, 2019 at 05:12:00PM +0900, Yoshihiro Shimoda wrote:
>>>>> The following build warning happens on gcc 8.1.0.
>>>>>
>>>>>  linux/arch/arm64/include/asm/insn.h: In function 'aarch64_insn_is_ldadd':
>>>>>  linux/arch/arm64/include/asm/insn.h:280:257: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
>>>>>  __AARCH64_INSN_FUNCS(ldadd, 0x3F20FC00, 0xB8200000)
>>>>>
>>>>> Since the second argument is mask value and compare with the third
>>>>> argument value, the bit 31 is always masked and then this macro is
>>>>> always false. So, this patch fixes the issue.
>>>>>
>>>>> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>>> Fixes: 34b8ab091f9ef57a ("bpf, arm64: use more scalable stadd over ldxr / stxr loop in xadd")
>>>>> Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>>> ---
>>>>>  I'm not sure the second argument "0xBF20FC00" is OK or not (we can set
>>>>>  to 0xFF20FC00 instead). So, I marked RFC on this patch.
>>>>>
>>>>>  arch/arm64/include/asm/insn.h | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
>>>>> index ec894de..c9e3cdc 100644
>>>>> --- a/arch/arm64/include/asm/insn.h
>>>>> +++ b/arch/arm64/include/asm/insn.h
>>>>> @@ -277,7 +277,7 @@ __AARCH64_INSN_FUNCS(adrp,	0x9F000000, 0x90000000)
>>>>>  __AARCH64_INSN_FUNCS(prfm,	0x3FC00000, 0x39800000)
>>>>>  __AARCH64_INSN_FUNCS(prfm_lit,	0xFF000000, 0xD8000000)
>>>>>  __AARCH64_INSN_FUNCS(str_reg,	0x3FE0EC00, 0x38206800)
>>>>> -__AARCH64_INSN_FUNCS(ldadd,	0x3F20FC00, 0xB8200000)
>>>>> +__AARCH64_INSN_FUNCS(ldadd,	0xBF20FC00, 0xB8200000)
>>>>
>>>> Looking at the ISA encoding, I think that top digit should indeed be 'B',
>>>> but I haven't checked the rest of the instruction.
>>>>
>>>> However, I'm fairly sure we tested this so now I'm a bit worried that I'm
>>>> missing something :/
>>>
>>> Hmm, good catch, the mask aka aarch64_insn_is_ldadd() is not used anywhere
>>> in the tree, just the aarch64_insn_get_ldadd_value(). Latter was runtime
>>> tested via BPF JIT as well as through disassembler that it emits ldadd. I
>>> initially had a different mask value than Jean-Philippe, but that was probably
>>> due to confusion on my side. In any case, value should be correct though.
>>
>> I suggested that mask and forgot to change val, sorry about that. My
>> intent was to stay consistent with ldr_reg and str_reg, which mask out
>> the two size bits [31:30]. The proposed fix works but won't take into
>> account ldaddb and ldaddh, so maybe we could change val to 0x38200000
>> instead?
>>
>> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
>> index ec894de0ed4e..f71b84d9f294 100644
>> --- a/arch/arm64/include/asm/insn.h
>> +++ b/arch/arm64/include/asm/insn.h
>> @@ -279,3 +279,3 @@ __AARCH64_INSN_FUNCS(prfm_lit,      0xFF000000,
>> 0xD8000000)
>>  __AARCH64_INSN_FUNCS(str_reg,  0x3FE0EC00, 0x38206800)
>> -__AARCH64_INSN_FUNCS(ldadd,    0x3F20FC00, 0xB8200000)
>> +__AARCH64_INSN_FUNCS(ldadd,    0x3F20FC00, 0x38200000)
> 
> Yes, this is better. I didn't realise we wanted to catch the sub-word
> instructions as well, but that's what we do for other memory access
> instructions so we should be consistent.
> 
> If you post this as a proper patch, I can queue it as a fix in the arm64
> tree.

If you're at it, it might also be good to add a comment to document such
conventions for the mask right above the __AARCH64_INSN_FUNCS() definition
or such. Would definitely be helpful for adding other insns there in future.

Thanks,
Daniel
